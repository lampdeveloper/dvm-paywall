//
//PAYWALL Smart Contract in DVM-BASIC
//Version: 0.4 FINAL
//DERO Smart Contract Contest contribution

Function Initialize() Uint64
10 STORE("owner", SIGNER())
20 STORE("count", 0) //Total members, can be obfuscated with OverrideCount() or deletet in Signup()
30 STORE("factor", 10000000000) //1 Dero = 100 Blocks
50 STORE("freeze", 0) //Freeze Signup
60 RETURN 0
End Function

//Signup to the memberarea
Function Signup(hash String, value Uint64) Uint64
10 IF LOAD("freeze") == 1 THEN GOTO 40 //Signup freezed
20 IF value == 0 THEN GOTO 40 //No funds
30 IF EXISTS("status_" + SIGNER()) == 0 THEN GOTO 50 //User not in DB, proceed
40 RETURN 1
50 DIM count, topo as Uint64
60 LET count = LOAD("count") + 1
70 LET topo = calcTopo(value)
80 STORE("hash_" + SIGNER(), hash)
90 STORE("topo_" + SIGNER(), topo)
100 STORE("status_" + SIGNER(), 1)
110 STORE("count", count) //Delete this line to avoid counting the members
120 RETURN 0
End Function

//Extends membership
Function Extend(value Uint64) Uint64
10 IF EXISTS("status_" + SIGNER()) == 1 THEN GOTO 30
20 RETURN 1 //User not found, exit
30 DIM topo as Uint64
40 LET topo = calcTopo(value)
50 STORE("topo_" + SIGNER(), topo)
60 RETURN 0
End Function

//Changes password hash
Function ChangeHash(hash String) Uint64
10 IF EXISTS("status_" + SIGNER()) == 1 THEN GOTO 30
20 RETURN 1 //User not found, exit
30 STORE("hash_" + SIGNER(), hash)
40 RETURN 0
End Function

//Withdraw deposits from SC, CONTRACT-OWNER ONLY
Function Withdraw(amount Uint64) Uint64
10 IF ADDRESS_RAW(LOAD("owner")) == ADDRESS_RAW(SIGNER()) THEN GOTO 30
20 RETURN 1 //Not Owner, exit
30 SEND_DERO_TO_ADDRESS(LOAD("owner"), amount)
40 RETURN 0
End Function

//Deactivates a userid, CONTRACT-OWNER ONLY
Function Deactivate(userid String) Uint64
10 IF ADDRESS_RAW(LOAD("owner")) == ADDRESS_RAW(SIGNER()) THEN GOTO 30
20 RETURN 1 //Not Owner, exit
30 IF EXISTS("status_" + userid) == 1 THEN GOTO 50
40 RETURN 1 //User not found, exit
50 STORE("status_" + userid, 0)
60 RETURN 0
End Function

//Reactivates a userid, CONTRACT-OWNER ONLY
Function Reactivate(userid String) Uint64
10 IF ADDRESS_RAW(LOAD("owner")) == ADDRESS_RAW(SIGNER()) THEN GOTO 30
20 RETURN 1 //Not Owner, exit
30 IF EXISTS("status_" + userid) == 1 THEN GOTO 50
40 RETURN 1 //User not found, exit
50 STORE("status_" + userid, 1)
60 RETURN 0
End Function

//Changes the status of freeze, CONTRACT-OWNER ONLY
Function ChangeFreeze() Uint64
10 IF ADDRESS_RAW(LOAD("owner")) == ADDRESS_RAW(SIGNER()) THEN GOTO 30
20 RETURN 1 //Not Owner, exit
30 IF LOAD("freeze") == 0 THEN GOTO 40 ELSE GOTO 60
40 STORE("freeze", 1)
50 RETURN 0
60 STORE("freeze", 0)
70 RETURN 0
End Function

//Changes the factor, CONTRACT-OWNER ONLY
Function OverrideFactor(factor Uint64) Uint64
10 IF ADDRESS_RAW(LOAD("owner")) == ADDRESS_RAW(SIGNER()) THEN GOTO 30
20 RETURN 1 //Not Owner, exit
30 STORE("factor", factor)
40 RETURN 0
End Function

//Overrides Count, CONTRACT-OWNER ONLY
Function OverrideCount(count Uint64) Uint64
10 IF ADDRESS_RAW(LOAD("owner")) == ADDRESS_RAW(SIGNER()) THEN GOTO 30
20 RETURN 1 //Not Owner, exit
30 STORE("count", count)
40 RETURN 0
End Function

//Overrides Hash, CONTRACT-OWNER ONLY
Function OverrideHash(userid String, hash String) Uint64
10 IF ADDRESS_RAW(LOAD("owner")) == ADDRESS_RAW(SIGNER()) THEN GOTO 30
20 RETURN 1 //Not Owner, exit
30 IF EXISTS("status_" + userid) == 1 THEN GOTO 50
40 RETURN 1 //User not found, exit
50 STORE("hash_" + userid, hash)
60 RETURN 0
End Function

//Overrides Topo, CONTRACT-OWNER ONLY
Function OverrideTopo(userid String, topo Uint64) Uint64
10 IF ADDRESS_RAW(LOAD("owner")) == ADDRESS_RAW(SIGNER()) THEN GOTO 30
20 RETURN 1 //Not Owner, exit
30 IF EXISTS("status_" + userid) == 1 THEN GOTO 50
40 RETURN 1 //User not found, exit
50 STORE("topo_" + userid, topo)
60 RETURN 0
End Function

//Overrides Status, CONTRACT-OWNER ONLY
//Can be used to manually grant premium access e.g. status = 2 and so on
Function OverrideStatus(userid String, status Uint64) Uint64
10 IF ADDRESS_RAW(LOAD("owner")) == ADDRESS_RAW(SIGNER()) THEN GOTO 30
20 RETURN 1 //Not Owner, exit
30 IF EXISTS("status_" + userid) == 1 THEN GOTO 50
40 RETURN 1 //User not found, exit
50 STORE("status_" + userid, status)
60 RETURN 0
End Function

//Transfers ownership to tmpowner, CONTRACT-OWNER ONLY
Function TransferOwnership(newowner String) Uint64 
10 IF ADDRESS_RAW(LOAD("owner")) == ADDRESS_RAW(SIGNER()) THEN GOTO 30 
20 RETURN 1
30 STORE("tmpowner", newowner)
40 RETURN 0
End Function
	
//Make sure tmpowner has access to his address then transfer ownership, TMPOWNER ONLY
Function ClaimOwnership() Uint64 
10 IF ADDRESS_RAW(LOAD("tmpowner")) == ADDRESS_RAW(SIGNER()) THEN GOTO 30 
20 RETURN 1
30 STORE("owner", SIGNER())
40 STORE("tmpowner", "")
50 RETURN 0
End Function

//Subfunction to calculate how long access is granted based on BLOCK_TOPOHEIGHT()
Function calcTopo(value Uint64) Uint64
10 DIM factor, topo, old as Uint64
20 LET factor = LOAD("factor")
30 IF EXISTS("topo_" + SIGNER()) == 0 THEN GOTO 80
40 LET old = LOAD("topo_" + SIGNER())
50 IF old < BLOCK_TOPOHEIGHT() THEN GOTO 80
60 LET topo = BLOCK_TOPOHEIGHT() + ( value / factor ) + ( old - BLOCK_TOPOHEIGHT() ) //Add new and old credits
70 GOTO 90
80 LET topo = BLOCK_TOPOHEIGHT() + ( value / factor ) //Add new credits
90 RETURN topo
End Function

