# Alpha-Layer
Ethereum Alpha Layer

For an Augmented Ethereum

Alpha Layer is the first contract of a serie of OPEN CONTRACTS on the Ethereum Platform.
The meaning of Alpha Layer is to have an open central repository for all possible public metadata and informations regarding a wallet, a dapp, or a token.

AlphaLayer is an Ethereum Augmentor contract (it augments Ethereum!)

AlphLayer introduces the concept of ETHEREUM ENTITY.

A perfect Ethereum Entity is a wallet/contract whose owner is known.
The owner of a wallet can be easy recognized by the fact he has the password of the wallet.
A contract, instead, must contain the variable address public owner; in order to recognize its owner.

If you control a wallet (or you are the "address public owner;" of a smart contract) you can control the associated informations on the Alpha Layer.

Example: 

A wallet is just a wallet, you can only store ETH and transfer it.
Thanks to AlphaLayer dapps/users now can add augmented variables to that wallet.
A name? An Image? A standard link to a private chat channel? A teleport to an Augmented 3D world?
You can really augment a wallet/contract with anything.
The resulting Augmented OPEN DATA BASE is the product of the efforts of multiple dapps, coworking in the creation of a central Augmenting Layers System.

AlphaLayer is composed by many layers.

Example:

Layer 1 - Name.
Layer 2 - Associated web address.
Layer 4 - Description.
Layer 6 - Logo 256*256.
etc.

All informations are public.
This is a privacy oriented concept (in the meaning you don't have to declare yourself).
All informations deposited on AlphaLayer are public and meant to be shared by any dapp.

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

[ { "constant": true, "inputs": [ { "name": "group", "type": "uint256" }, { "name": "target", "type": "address" }, { "name": "control", "type": "address" }, { "name": "index", "type": "uint256" } ], "name": "permissionsList", "outputs": [ { "name": "", "type": "uint256", "value": "0" }, { "name": "", "type": "address", "value": "0x" }, { "name": "", "type": "bool", "value": false } ], "payable": false, "type": "function" }, { "constant": false, "inputs": [ { "name": "d", "type": "address" }, { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" }, { "name": "quant", "type": "uint256" } ], "name": "addUint", "outputs": [ { "name": "", "type": "bool" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" } ], "name": "readBool", "outputs": [ { "name": "", "type": "bool", "value": false }, { "name": "", "type": "string", "value": "" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "bool", "value": false } ], "payable": false, "type": "function" }, { "constant": false, "inputs": [ { "name": "group", "type": "uint256" }, { "name": "target", "type": "address" }, { "name": "contr", "type": "address" }, { "name": "layer", "type": "uint256" }, { "name": "b", "type": "bool" } ], "name": "allow", "outputs": [ { "name": "", "type": "bool" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "group", "type": "uint256" }, { "name": "target", "type": "address" }, { "name": "control", "type": "address" }, { "name": "targetIndex", "type": "uint256" } ], "name": "readPermissions", "outputs": [ { "name": "", "type": "uint256", "value": "0" }, { "name": "", "type": "uint256", "value": "0" } ], "payable": false, "type": "function" }, { "constant": false, "inputs": [ { "name": "d", "type": "address" }, { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" }, { "name": "info", "type": "string" } ], "name": "addString", "outputs": [ { "name": "", "type": "bool" } ], "payable": false, "type": "function" }, { "constant": false, "inputs": [ { "name": "d", "type": "address" }, { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" }, { "name": "info", "type": "bytes" } ], "name": "addByte", "outputs": [ { "name": "", "type": "bool" } ], "payable": false, "type": "function" }, { "constant": false, "inputs": [ { "name": "d", "type": "address" }, { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" }, { "name": "addr2", "type": "address" } ], "name": "addAddress", "outputs": [ { "name": "", "type": "bool" } ], "payable": false, "type": "function" }, { "constant": false, "inputs": [ { "name": "group", "type": "uint256" }, { "name": "layer", "type": "uint256" }, { "name": "lab", "type": "string" }, { "name": "creator", "type": "address" }, { "name": "exp", "type": "bool" }, { "name": "own", "type": "bool" } ], "name": "createLayer", "outputs": [ { "name": "", "type": "bool" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [], "name": "logInterface", "outputs": [ { "name": "", "type": "string", "value": "a-User|s-Layer Type|u-Layer|s-Action|u-Block" } ], "payable": false, "type": "function" }, { "constant": false, "inputs": [ { "name": "d", "type": "address" }, { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" }, { "name": "check", "type": "bool" } ], "name": "addBool", "outputs": [ { "name": "", "type": "bool" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [], "name": "owner", "outputs": [ { "name": "", "type": "address", "value": "0x15ce734b641b6c968244aec8b69f4a1a633706a4" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "groupORindex", "type": "uint256" }, { "name": "layerIndex", "type": "uint256" } ], "name": "exposedLayers", "outputs": [ { "name": "", "type": "uint256", "value": "10" }, { "name": "", "type": "uint256", "value": "11" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [], "name": "records", "outputs": [ { "name": "", "type": "uint256", "value": "0" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" } ], "name": "readUint", "outputs": [ { "name": "", "type": "uint256", "value": "0" }, { "name": "", "type": "string", "value": "" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "bool", "value": false } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "i", "type": "uint256" } ], "name": "readLog", "outputs": [ { "name": "", "type": "uint256", "value": "11" }, { "name": "", "type": "address", "value": "0x45096a8aaeb8d779e0252ec32263c18f010bfd1f" }, { "name": "", "type": "uint256", "value": "1" }, { "name": "", "type": "uint256", "value": "1" }, { "name": "", "type": "string", "value": "Name" }, { "name": "", "type": "uint256", "value": "3153879" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" } ], "name": "readAddress", "outputs": [ { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "string", "value": "" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "bool", "value": false } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" } ], "name": "readString", "outputs": [ { "name": "", "type": "string", "value": "" }, { "name": "", "type": "string", "value": "" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "bool", "value": false } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "group", "type": "uint256" }, { "name": "creator", "type": "address" }, { "name": "index", "type": "uint256" } ], "name": "findMyLayers", "outputs": [ { "name": "", "type": "uint256", "value": "0" }, { "name": "", "type": "uint256", "value": "0" }, { "name": "", "type": "address", "value": "0x" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "addr", "type": "address" }, { "name": "index", "type": "uint256" } ], "name": "readByte", "outputs": [ { "name": "", "type": "bytes", "value": "0x" }, { "name": "", "type": "string", "value": "" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "bool", "value": false } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [ { "name": "groupORindex", "type": "uint256" }, { "name": "layerIndex", "type": "uint256" }, { "name": "addr", "type": "address" } ], "name": "layerInfo", "outputs": [ { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" }, { "name": "", "type": "string", "value": "" }, { "name": "", "type": "bool", "value": false }, { "name": "", "type": "uint256", "value": "0" } ], "payable": false, "type": "function" }, { "constant": false, "inputs": [ { "name": "o", "type": "address" }, { "name": "g", "type": "uint256" }, { "name": "u", "type": "uint256" }, { "name": "exp", "type": "bool" } ], "name": "manager", "outputs": [ { "name": "", "type": "bool" } ], "payable": false, "type": "function" }, { "constant": true, "inputs": [], "name": "controller", "outputs": [ { "name": "", "type": "address", "value": "0x0000000000000000000000000000000000000000" } ], "payable": false, "type": "function" }, { "inputs": [], "payable": false, "type": "constructor" } ]

Beta Layer (graph theory?) and Omega Layer (opposite functions of Alpha Layer that is individual, Omega Layer is collective) are coming soon. Stay tuned.
