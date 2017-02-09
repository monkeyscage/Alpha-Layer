# Alpha-Layer
Ethereum Alpha Layer

Alpha Layer is the first contract of a serie of OPEN CONTRACTS on the Ethereum Platform.
The meaning of Alpha Layer is to have an open central repository for all possible public informations regarding a wallet, a dapp, or a token.

If you control a wallet (or you are the "address public owner;" of a smart contract) you can control the relative informations on the Alpha Layer.

It is possible to add custom layers and extend Alpha Layer.
Please refer to the wiki (under construction) https://github.com/monkeyscage/Alpha-Layer/wiki.

Find an introductory post article here:
https://www.reddit.com/r/ethereum/comments/5kq4uw/the_war_of_dapps_has_begun/

Basic temporary ROPSTEN interface:
http://alphalayer.xyz

Contract:
mainnet: 0x45096a8AAeB8d779E0252Ec32263c18F010bFd1F
testnet: 0x8005f6dAc2482cB5bd5860c3D99fD0c7Ee883c60

Interface :
[ { "constant": true, "inputs": [ { "name": "group", "type": "uint256" }, { "name": "target", "type": "address" }, { "name": "control", "type": "address" }, { "name": "index", "type": "uint256" } ], "name": "permissionsList", "outputs": [ { "name": "", "type": "uint256", "value": "0" }, { "name": "", "type": "address", "value": "0x" }, { "name": "", "type": "bool", "value": false } ], "payable": false, "type": "function" }, { "constant": false, "inputs": [ { "name": "d", "type": "address" }, { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" }, { "name": "quant", "type": "uint256" } ], "name": "addUint", "outputs": [ { "name": "", "type": "bool" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" } ], "name": "readBool", "outputs": [ { "name": "", "type": "bool", "value": false }, { "name": "", "type": "string", "value": "" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "bool", "value": false } ], "payable": false, "type": "function" }, { "constant": false, "inputs": [ { "name": "group", "type": "uint256" }, { "name": "target", "type": "address" }, { "name": "contr", "type": "address" }, { "name": "layer", "type": "uint256" }, { "name": "b", "type": "bool" } ], "name": "allow", "outputs": [ { "name": "", "type": "bool" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "group", "type": "uint256" }, { "name": "target", "type": "address" }, { "name": "control", "type": "address" }, { "name": "targetIndex", "type": "uint256" } ], "name": "readPermissions", "outputs": [ { "name": "", "type": "uint256", "value": "0" }, { "name": "", "type": "uint256", "value": "0" } ], "payable": false, "type": "function" }, { "constant": false, "inputs": [ { "name": "d", "type": "address" }, { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" }, { "name": "info", "type": "string" } ], "name": "addString", "outputs": [ { "name": "", "type": "bool" } ], "payable": false, "type": "function" }, { "constant": false, "inputs": [ { "name": "d", "type": "address" }, { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" }, { "name": "info", "type": "bytes" } ], "name": "addByte", "outputs": [ { "name": "", "type": "bool" } ], "payable": false, "type": "function" }, { "constant": false, "inputs": [ { "name": "d", "type": "address" }, { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" }, { "name": "addr2", "type": "address" } ], "name": "addAddress", "outputs": [ { "name": "", "type": "bool" } ], "payable": false, "type": "function" }, { "constant": false, "inputs": [ { "name": "group", "type": "uint256" }, { "name": "layer", "type": "uint256" }, { "name": "lab", "type": "string" }, { "name": "creator", "type": "address" }, { "name": "exp", "type": "bool" }, { "name": "own", "type": "bool" } ], "name": "createLayer", "outputs": [ { "name": "", "type": "bool" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [], "name": "logInterface", "outputs": [ { "name": "", "type": "string", "value": "a-User|s-Layer Type|u-Layer|s-Action|u-Block" } ], "payable": false, "type": "function" }, { "constant": false, "inputs": [ { "name": "d", "type": "address" }, { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" }, { "name": "check", "type": "bool" } ], "name": "addBool", "outputs": [ { "name": "", "type": "bool" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [], "name": "owner", "outputs": [ { "name": "", "type": "address", "value": "0x15ce734b641b6c968244aec8b69f4a1a633706a4" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "groupORindex", "type": "uint256" }, { "name": "layerIndex", "type": "uint256" } ], "name": "exposedLayers", "outputs": [ { "name": "", "type": "uint256", "value": "0" }, { "name": "", "type": "uint256", "value": "0" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [], "name": "records", "outputs": [ { "name": "", "type": "uint256", "value": "0" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" } ], "name": "readUint", "outputs": [ { "name": "", "type": "uint256", "value": "0" }, { "name": "", "type": "string", "value": "" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "bool", "value": false } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "i", "type": "uint256" } ], "name": "readLog", "outputs": [ { "name": "", "type": "uint256" }, { "name": "", "type": "address" }, { "name": "", "type": "uint256" }, { "name": "", "type": "uint256" }, { "name": "", "type": "string" }, { "name": "", "type": "uint256" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" } ], "name": "readAddress", "outputs": [ { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "string", "value": "" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "bool", "value": false } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" } ], "name": "readString", "outputs": [ { "name": "", "type": "string", "value": "" }, { "name": "", "type": "string", "value": "" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "bool", "value": false } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "group", "type": "uint256" }, { "name": "creator", "type": "address" }, { "name": "index", "type": "uint256" } ], "name": "findMyLayers", "outputs": [ { "name": "", "type": "uint256", "value": "0" }, { "name": "", "type": "uint256", "value": "0" }, { "name": "", "type": "address", "value": "0x" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" } ], "name": "readByte", "outputs": [ { "name": "", "type": "bytes", "value": "0x" }, { "name": "", "type": "string", "value": "" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "bool", "value": false } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "groupORindex", "type": "uint256" }, { "name": "layerIndex", "type": "uint256" }, { "name": "addr", "type": "address" } ], "name": "layerInfo", "outputs": [ { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "string", "value": "" }, { "name": "", "type": "bool", "value": false }, { "name": "", "type": "uint256", "value": "0" } ], "payable": false, "type": "function" }, { "constant": false, "inputs": [ { "name": "o", "type": "address" }, { "name": "g", "type": "uint256" }, { "name": "u", "type": "uint256" }, { "name": "exp", "type": "bool" } ], "name": "manager", "outputs": [ { "name": "", "type": "bool" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [], "name": "controller", "outputs": [ { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" } ], "payable": false, "type": "function" }, { "inputs": [], "payable": false, "type": "constructor" } ]

[ { "constant": true, "inputs": [ { "name": "group", "type": "uint256" }, { "name": "target", "type": "address" }, { "name": "control", "type": "address" }, { "name": "index", "type": "uint256" } ], "name": "permissionsList", "outputs": [ { "name": "", "type": "uint256", "value": "0" }, { "name": "", "type": "address", "value": "0x" }, { "name": "", "type": "bool", "value": false } ], "payable": false, "type": "function" }, { "constant": false, "inputs": [ { "name": "d", "type": "address" }, { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" }, { "name": "quant", "type": "uint256" } ], "name": "addUint", "outputs": [ { "name": "", "type": "bool" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" } ], "name": "readBool", "outputs": [ { "name": "", "type": "bool", "value": false }, { "name": "", "type": "string", "value": "" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "bool", "value": false } ], "payable": false, "type": "function" }, { "constant": false, "inputs": [ { "name": "group", "type": "uint256" }, { "name": "target", "type": "address" }, { "name": "contr", "type": "address" }, { "name": "layer", "type": "uint256" }, { "name": "b", "type": "bool" } ], "name": "allow", "outputs": [ { "name": "", "type": "bool" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "group", "type": "uint256" }, { "name": "target", "type": "address" }, { "name": "control", "type": "address" }, { "name": "targetIndex", "type": "uint256" } ], "name": "readPermissions", "outputs": [ { "name": "", "type": "uint256", "value": "0" }, { "name": "", "type": "uint256", "value": "0" } ], "payable": false, "type": "function" }, { "constant": false, "inputs": [ { "name": "d", "type": "address" }, { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" }, { "name": "info", "type": "string" } ], "name": "addString", "outputs": [ { "name": "", "type": "bool" } ], "payable": false, "type": "function" }, { "constant": false, "inputs": [ { "name": "d", "type": "address" }, { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" }, { "name": "info", "type": "bytes" } ], "name": "addByte", "outputs": [ { "name": "", "type": "bool" } ], "payable": false, "type": "function" }, { "constant": false, "inputs": [ { "name": "d", "type": "address" }, { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" }, { "name": "addr2", "type": "address" } ], "name": "addAddress", "outputs": [ { "name": "", "type": "bool" } ], "payable": false, "type": "function" }, { "constant": false, "inputs": [ { "name": "group", "type": "uint256" }, { "name": "layer", "type": "uint256" }, { "name": "lab", "type": "string" }, { "name": "creator", "type": "address" }, { "name": "exp", "type": "bool" }, { "name": "own", "type": "bool" } ], "name": "createLayer", "outputs": [ { "name": "", "type": "bool" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [], "name": "logInterface", "outputs": [ { "name": "", "type": "string", "value": "a-User|s-Layer Type|u-Layer|s-Action|u-Block" } ], "payable": false, "type": "function" }, { "constant": false, "inputs": [ { "name": "d", "type": "address" }, { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" }, { "name": "check", "type": "bool" } ], "name": "addBool", "outputs": [ { "name": "", "type": "bool" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [], "name": "owner", "outputs": [ { "name": "", "type": "address", "value": "0x05065ccbf3084c3feb291f9f116b4185154c203b" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "groupORindex", "type": "uint256" }, { "name": "layerIndex", "type": "uint256" } ], "name": "exposedLayers", "outputs": [ { "name": "", "type": "uint256", "value": "0" }, { "name": "", "type": "uint256", "value": "0" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [], "name": "records", "outputs": [ { "name": "", "type": "uint256", "value": "0" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" } ], "name": "readUint", "outputs": [ { "name": "", "type": "uint256", "value": "0" }, { "name": "", "type": "string", "value": "" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "bool", "value": false } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "i", "type": "uint256" } ], "name": "readLog", "outputs": [ { "name": "", "type": "uint256", "value": "1" }, { "name": "", "type": "address", "value": "0x05065ccbf3084c3feb291f9f116b4185154c203b" }, { "name": "", "type": "uint256", "value": "0" }, { "name": "", "type": "uint256", "value": "0" }, { "name": "", "type": "string", "value": "Created AlphaLayer 1.0" }, { "name": "", "type": "uint256", "value": "411727" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" } ], "name": "readAddress", "outputs": [ { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "string", "value": "" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "bool", "value": false } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" } ], "name": "readString", "outputs": [ { "name": "", "type": "string", "value": "" }, { "name": "", "type": "string", "value": "" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "bool", "value": false } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "group", "type": "uint256" }, { "name": "creator", "type": "address" }, { "name": "index", "type": "uint256" } ], "name": "findMyLayers", "outputs": [ { "name": "", "type": "uint256", "value": "0" }, { "name": "", "type": "uint256", "value": "0" }, { "name": "", "type": "address", "value": "0x" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" } ], "name": "readByte", "outputs": [ { "name": "", "type": "bytes", "value": "0x" }, { "name": "", "type": "string", "value": "" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "bool", "value": false } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "groupORindex", "type": "uint256" }, { "name": "layerIndex", "type": "uint256" }, { "name": "addr", "type": "address" } ], "name": "layerInfo", "outputs": [ { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "string", "value": "" }, { "name": "", "type": "bool", "value": false }, { "name": "", "type": "uint256", "value": "0" } ], "payable": false, "type": "function" }, { "constant": false, "inputs": [ { "name": "o", "type": "address" }, { "name": "g", "type": "uint256" }, { "name": "u", "type": "uint256" }, { "name": "exp", "type": "bool" } ], "name": "manager", "outputs": [ { "name": "", "type": "bool" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [], "name": "controller", "outputs": [ { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" } ], "payable": false, "type": "function" }, { "inputs": [ { "name": "control", "type": "address", "index": 0, "typeShort": "address", "bits": "", "displayName": "control", "template": "elements_input_address", "value": "" } ], "payable": false, "type": "constructor" } ]

Beta Layer (graph theory?) and Omega Layer (opposite functions of Alpha Layer that is individual, Omega Layer is collective) are coming soon. Stay tuned.
