# DVM Paywall

## CURL Samples Signer
Signup:
```
curl -X POST http://127.0.0.1:30309/json_rpc -H 'Content-Type: application/json' -d '{"jsonrpc":"2.0","id":"0","method":"transfer_split","params":{"mixin":5,"get_tx_key": true , "sc_tx":{"entrypoint":"Signup","scid":"tof924e5897da796e1412135f760cabc565qxc21ecb3682b1c086549e995540e", "value":1230000000000, "params":{ "hash":"3cca0bdd4ca98e2fbc66f656eda765fw7815fce804b9b04a573dfaa5eebe70d9" }}}}' 
```
Extend Membership:
```
curl -X POST http://127.0.0.1:30309/json_rpc -H 'Content-Type: application/json' -d '{"jsonrpc":"2.0","id":"0","method":"transfer_split","params":{"mixin":5,"get_tx_key": true , "sc_tx":{"entrypoint":"Extend","scid":"tof924e5897da796e1412135f72seabc5654af21ecb3682b1c086549e995540e", "value":1230000000000}}}' 
```
Change Password:
```
curl -X POST http://127.0.0.1:30309/json_rpc -H 'Content-Type: application/json' -d '{"jsonrpc":"2.0","id":"0","method":"transfer_split","params":{"mixin":5,"get_tx_key": true , "sc_tx":{"entrypoint":"ChangeHash","scid":"tof924e5897da796e1412135f760cabc5654pln1ecb3682b1c086549e995540e", "params":{ "hash":"3cca0bdd4ca981dfsbc66f656eda765fd5a15fce804b9b04a573dfaa5eebe70d9" }}}}' 
```
## CURL Samples Owner
Deactivate Account:
```
curl -X POST http://127.0.0.1:30309/json_rpc -H 'Content-Type: application/json' -d '{"jsonrpc":"2.0","id":"0","method":"transfer_split","params":{"mixin":5,"get_tx_key": true , "sc_tx":{"entrypoint":"Deactivate","scid":"tof924e5897da796e1412135f760cabc5654af21ecb3682b1c086549e995540e", "params":{ "userid":"dERoUQMpeqgTNGKfBooQdwTbaYwR7sZVggfdBut8DmkmZ97aYi8h3NH3ZwxsKtbYomwswEgRpB4kvWsvyazbxVk91o5KJ6McZ4" }}}}' 
```
Reactive Account:
```
curl -X POST http://127.0.0.1:30309/json_rpc -H 'Content-Type: application/json' -d '{"jsonrpc":"2.0","id":"0","method":"transfer_split","params":{"mixin":5,"get_tx_key": true , "sc_tx":{"entrypoint":"Reactivate","scid":"tof924e5897da796e1412135f760cabc5654af21ecb3682b1c086549e995540e", "params":{ "userid":"dERoUQMpeqgTNGKfBooQdwTbaYwR7sZVggfdBut8DmkmZ97aYi8h3NH3ZexsKtbY4pHrwE9qaB4kvWsvyazbxVk91o5KJ6McZ4" }}}}' 
```
Withdraw:
```
curl -X POST http://127.0.0.1:30309/json_rpc -H 'Content-Type: application/json' -d '{"jsonrpc":"2.0","id":"0","method":"transfer_split","params":{"mixin":5,"get_tx_key": true , "sc_tx":{"entrypoint":"Withdraw","scid":"tof924e5897da796e1412135f760cabc5654af21e0mn682b1c086549e995540e", "params":{ "amount":"1230000000000" }}}}' 
```
Transfer Ownership:
```
curl -X POST http://127.0.0.1:30309/json_rpc -H 'Content-Type: application/json' -d '{"jsonrpc":"2.0","id":"0","method":"transfer_split","params":{"mixin":5,"get_tx_key": true , "sc_tx":{"entrypoint":"TransferOwnership","scid":"baf924e5897da796e1412135f760cabc5654af21ecb3682b1c086549e995540e", "params":{ "newowner":"dERoUQMpeqgTNGKfB0oQdwTAaYwR7sZVggfdBut8DmkmZ97aYi8h3NH3ZexsKthddphswEgRpB4kvWsvyazbxVk91o5KJ6McZ4" }}}}' 
```
Claim Ownership:
```
curl -X POST http://127.0.0.1:30309/json_rpc -H 'Content-Type: application/json' -d '{"jsonrpc":"2.0","id":"0","method":"transfer_split","params":{"mixin":5,"get_tx_key": true , "sc_tx":{"entrypoint":"ClaimOwnership","scid":"tof924e5897da796e1412135f760ca098654af21ecb3682b1c086549e995540e"}}}' 
```
Change Factor:
```
curl -X POST http://127.0.0.1:30309/json_rpc -H 'Content-Type: application/json' -d '{"jsonrpc":"2.0","id":"0","method":"transfer_split","params":{"mixin":5,"get_tx_key": true , "sc_tx":{"entrypoint":"OverrideFactor","scid":"tof924e5897da796e1412135f760cabijn54af21ecb3682b1c086549e995540e", "params":{ "factor":"10000000000" }}}}' 
```
Set Counter:
```
curl -X POST http://127.0.0.1:30309/json_rpc -H 'Content-Type: application/json' -d '{"jsonrpc":"2.0","id":"0","method":"transfer_split","params":{"mixin":5,"get_tx_key": true , "sc_tx":{"entrypoint":"OverrideCount","scid":"tof924e5897da796e1412135f760cabc5654akiuecb3682b1c086549e995540e", "params":{ "count":"123" }}}}' 
```
Freeze/Unfreeze Signup:
```
curl -X POST http://127.0.0.1:30309/json_rpc -H 'Content-Type: application/json' -d '{"jsonrpc":"2.0","id":"0","method":"transfer_split","params":{"mixin":5,"get_tx_key": true , "sc_tx":{"entrypoint":"ChangeFreeze","scid":"tof924e5897da796e1412135f76098bc5654af21ecb3682b1c086549e995540e"}}}' 
```
Override Hash:
```
curl -X POST http://127.0.0.1:30309/json_rpc -H 'Content-Type: application/json' -d '{"jsonrpc":"2.0","id":"0","method":"transfer_split","params":{"mixin":5,"get_tx_key": true , "sc_tx":{"entrypoint":"OverrideHash","scid":"tof924e5897da569e1412135f760cabc5654af21ecb3682b1c086549e995540e", "params":{ "userid":"dERoUQMpeqgTNGKfBooQdwTAaYwR7sZVggfdBut8DmkmZ97aYi8h3NH3ZexsKtbY4pHswEgRpB4kvWsvyazbxVk91o5KJ6McZ4","hash":"3cca0bdd4c345e2fbc66f656eda765fd5a15fce804b9b04a573dfaa5eebe70d9" }}}}' 
```
Override Topo:
```
curl -X POST http://127.0.0.1:30309/json_rpc -H 'Content-Type: application/json' -d '{"jsonrpc":"2.0","id":"0","method":"transfer_split","params":{"mixin":5,"get_tx_key": true , "sc_tx":{"entrypoint":"OverrideTopo","scid":"tof924e5897da796e1412135f760c1575654af21ecb3682b1c086549e995540e", "params":{ "userid":"dERoUQMpeqgTNGKfBooQdwTAaYwR7sZVgwrfdut8DmkmZ97aYi8h3NH3ZexsKtbY4pHswEgRpB4kvWsvyazbxVk91o5KJ6McZ4","topo":"12345" }}}}' 
```
Override Status:
```
curl -X POST http://127.0.0.1:30309/json_rpc -H 'Content-Type: application/json' -d '{"jsonrpc":"2.0","id":"0","method":"transfer_split","params":{"mixin":5,"get_tx_key": true , "sc_tx":{"entrypoint":"OverrideStatus","scid":"tof924e5897da796e1412135f760cabc5654af21e347682b1c086549e995540e", "params":{ "userid":"dERoUQMpeqgTNGKfBooQdwTAaYwR7sZVggfdBut8tzpmZ97aYi8h3NH3ZexsKtbY4pHswEgRpB4kvWsvyazbxVk91o5KJ6McZ4","status":"3" }}}}' 
```
