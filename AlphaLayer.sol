pragma solidity ^0.4.6;

contract LayerPlaceHolder{address public owner;uint public group; uint public index; function LayerPlaceHolder(address creator,uint layertype,uint layer){owner=creator;group=layertype;index=layer;}}
contract Dapp{address public owner;}

contract AlphaLayer{

//if your contract contains this variable, the owner can control the related informations on the Alpha Layer
//standard for all Alpha Layer enabled Dapps (always put this variable in your contract if you want to associate public informations to it, using Alpha Layer!)
address public owner;

//an external interface we can substitute in the future, allowed to create new sub-layers
address public controller;

//A basic counter to track all records (necessary?)
uint public records;

//used to point to external dapps/contracts (in order to find dapp owner, and to check if you have the permission to write on that location in behalf of the dapp)
Dapp dapp;


//GROUPS: layer pointers
uint TEXT=1;
uint INTEGER=2;
uint BOOLEAN=3;
uint HASH=4;
uint BYTEx=5;


//by group, a list of layers and their address
mapping(uint => mapping(uint => address))layers;

//given an address you can find, by group, the index of the layer (if true result > 0)
mapping(address => mapping(uint => uint))address2index;

//by creator, and by group, the list of layer indexes
mapping(address => mapping(uint => uint[]))createdLayers;

//by wallet, by layer, the item
mapping(address => mapping(uint => string))stringitem;
mapping(address => mapping(uint => uint))uintitem;
mapping(address => mapping(uint => bool))boolitem;
mapping(address => mapping(uint => address))addressitem;
mapping(address => mapping(uint => bytes))bytesitem;

//by group, by layer, the label
mapping(uint => mapping(uint => string))label;


//by group, by layer, the creator
mapping(uint => mapping(uint => address))layerCreator;


//personal container for permissioned dapps
mapping(address => address[])permissions;
//the list of layers a given dapp has the permission to write in behalf of an address
mapping(uint => mapping(address => mapping(address => uint[])))permissionsTarget;
//a simple "oracle" where you can check if a guy gave permission to a dapp for a specific layer
mapping(uint => mapping(address => mapping(address => mapping(uint => bool))))allowed;

//once a layer is created it is also locked, no one can take it or overwrite its label
mapping(uint => mapping(uint => bool))taken;

//some layers are exposed and indexed, the others are "inner functional layers" used by dapps for internal procedures
mapping(uint => uint[])exposed;

//some layers are private, created by dapps, and rewriteable only by the creator
mapping(uint => mapping(uint => bool))owned;


function AlphaLayer(address control){
owner=msg.sender;
records=0;
controller=control;
logs.push(log(msg.sender,0,0,"Created AlphaLayer 1.0",block.number));
}

// set owner, controller and unexpose layer

function manager(address o,uint g,uint u,bool exp)returns(bool){
if((msg.sender!=owner)&&(msg.sender!=controller))throw;
if(u==97){
logs.push(log(o,97,0,"",block.number));
owner=o;}
if(u==98){
logs.push(log(o,98,0,"",block.number));
controller=o;}
if(u<=6){
logs.push(log(o,g,u,"exposed",block.number));
if(!exp){exposed[g][u]=0;}else{exposed[g].push(u);}}
return true;
}

//just a bunch of basic layers to star from

function init(){
//the very basic layers needed so far
createLayer(100,1,"name",this,true,false);
createLayer(100,2,"address",this,true,false);
createLayer(100,3,"email",this,true,false);
createLayer(100,4,"description",this,true,false);
createLayer(100,5,"logo512*512",this,true,false);
createLayer(100,6,"logo256*256",this,true,false);
createLayer(100,7,"logo128*128",this,true,false);
createLayer(100,8,"logo64*64",this,true,false);
createLayer(100,9,"logo32*32",this,true,false);
createLayer(100,10,"logo16*16",this,true,false);
createLayer(100,11,"owner",this,true,false);
createLayer(100,12,"Github",this,true,false);
createLayer(100,13,"Twitter Account",this,true,false);
createLayer(100,14,"Twitter Widget",this,true,false);
createLayer(100,15,"Twitter Widget@",this,true,false);
createLayer(100,16,"Facebook",this,true,false);
createLayer(100,17,"Google",this,true,false);
}


//creation of new layers

function createLayer(uint group,uint layer,string lab,address creator,bool exp,bool own)returns(bool){
if((msg.sender!=owner)&&(msg.sender!=controller))throw;
if(layer==0)throw;

if(!taken[group][layer]){
   label[group][layer]=lab;
   layerCreator[group][layer]=creator;
   logs.push(log(creator,group,layer,lab,block.number));
   layers[group][layer]=new LayerPlaceHolder(creator,group,layer);
   address2index[layers[group][layer]][group]=layer;
   taken[group][layer]=true;
   if(exp)exposed[group].push(layer);
   owned[group][layer]=own;
   createdLayers[creator][group].push(layer);
 }

return true;
}


//PERMISSIONS

function allow(uint group,address target,address contr,uint layer,bool b)returns (bool){


if(b){
 if(msg.sender==target){
   if(!allowed[group][target][contr][layer]){
      permissions[target].push(contr);
      permissionsTarget[group][target][contr].push(layer);
      allowed[group][target][contr][layer]=true;
   }else{throw;}
 }else{
   dapp=Dapp(target);
   if(msg.sender==dapp.owner()){
      permissions[target].push(contr);
      permissionsTarget[group][target][contr].push(layer);
      allowed[group][target][contr][layer]=true;
   }else{throw;}
 }
}else{
 if(msg.sender==target){allowed[group][target][contr][layer]=false;}else{
   dapp=Dapp(target);
   if(msg.sender==dapp.owner()){allowed[group][target][contr][layer]=false;}else{throw;}
 }
}
return true;
}

function permissionsList(uint group,address target,address control,uint index)constant returns (uint,address,bool){
return (permissions[target].length,permissions[target][index],allowed[group][target][control][layerIndex]);
}

function readPermissions(uint group,address target,address control,uint targetIndex)constant returns (uint,uint){
return (permissionsTarget[group][target][control].length,permissionsTarget[group][target][control][targetIndex]);
}



//WRITE FUNCTIONS


function addString(address d,address addr,uint index,string info) returns(bool){
   if(!owned[1][index]){
      if((msg.sender==addr)||(allowed[1][addr][msg.sender][index])||(allowed[0][addr][msg.sender][1])||(msg.sender==controller)){
         stringitem[addr][index]=info;
      }else{
         dapp=Dapp(addr);
         if(msg.sender==dapp.owner())stringitem[addr][index]=info;
      }
   }else{
      if(msg.sender!=layerCreator[TEXT][index])throw;
      stringitem[addr][index]=info;
   }
   records++;
   return true;
}

function addUint(address d,address addr,uint index,uint quant) returns(bool){
   if(!owned[2][index]){
      if((msg.sender==addr)||(allowed[2][addr][msg.sender][index])||(allowed[0][addr][msg.sender][1])||(msg.sender==controller)){
         uintitem[addr][index]=quant;
      }else{
         dapp=Dapp(addr);
         if(msg.sender==dapp.owner())uintitem[addr][index]=quant;
      }
   }else{
      if(msg.sender!=layerCreator[INTEGER][index])throw;
      uintitem[addr][index]=quant;
   }
   records++;
   return true;
}

function addBool(address d,address addr,uint index,bool check) returns(bool){
   if(!owned[3][index]){
      if((msg.sender==addr)||(allowed[3][addr][msg.sender][index])||(allowed[0][addr][msg.sender][1])||(msg.sender==controller)){
         boolitem[addr][index]=check;
      }else{
         dapp=Dapp(addr);
         if(msg.sender==dapp.owner())boolitem[addr][index]=check;
      }
   }else{
      if(msg.sender!=layerCreator[BOOLEAN][index])throw;
      boolitem[addr][index]=check;
   }
   records++;
   return true;
}

function addAddress(address d,address addr,uint index,address addr2) returns(bool){
   if(!owned[4][index]){
      if((msg.sender==addr)||(allowed[4][addr][msg.sender][index])||(allowed[0][addr][msg.sender][1])||(msg.sender==controller)){
         addressitem[addr][index]=addr2;
      }else{
         dapp=Dapp(addr);
         if(msg.sender==dapp.owner())addressitem[addr][index]=addr2;
      }
   }else{
      if(msg.sender!=layerCreator[HASH][index])throw;
      addressitem[addr][index]=addr2;
   }
   records++;
   return true;
}

function addByte(address d,address addr,uint index,bytes info) returns(bool){
   if(!owned[5][index]){
      if((msg.sender==addr)||(allowed[5][addr][msg.sender][index])||(allowed[0][addr][msg.sender][1])||(msg.sender==controller)){
         bytesitem[addr][index]=info;
      }else{
         dapp=Dapp(addr);
         if(msg.sender==dapp.owner())bytesitem[addr][index]=info;
      }
   }else{
      if(msg.sender!=layerCreator[BYTEx][index])throw;
      bytesitem[addr][index]=info;
   }
   records++;
   return true;
}


//READ FUNCTIONS


//some layers are exposed and visible and can be listed

function exposedLayers(uint groupORindex,uint layerIndex)constant returns(uint,uint){
return(exposed[groupORindex][layerIndex],exposed[groupORindex].length);
}

//get layer

function layerInfo(uint groupORindex,uint layerIndex,address addr)constant returns(address,address,string,bool,uint){
return(layers[groupORindex][layerIndex],layerCreator[groupORindex][layerIndex],label[groupORindex][layerIndex],owned[groupORindex][layerIndex],address2index[addr][groupORindex]);
}

//list layers created by someone

function findMyLayers(uint group,address creator,uint index)constant returns (uint,uint,address){
return (createdLayers[creator][group].length,createdLayers[creator][group][index],layers[group][createdLayers[creator][group][index]]);
}

//read Layers


function readString(address addr,uint index)constant returns (string,string,address,address,bool){
return (stringitem[addr][index],label[TEXT][index],layerCreator[TEXT][index],layers[1][index],owned[1][index]);
}

function readUint(address addr,uint index)constant returns (uint,string,address,address,bool){
return (uintitem[addr][index],label[INTEGER][index],layerCreator[INTEGER][index],layers[2][index],owned[2][index]);
}

function readBool(address addr,uint index)constant returns (bool,string,address,address,bool){
return (boolitem[addr][index],label[BOOLEAN][index],layerCreator[BOOLEAN][index],layers[3][index],owned[3][index]);
}

function readAddress(address addr,uint index)constant returns (address,string,address,address,bool){
return (addressitem[addr][index],label[HASH][index],layerCreator[HASH][index],layers[4][index],owned[4][index]);
}

function readByte(address addr,uint index)constant returns (bytes,string,address,address,bool){
return (bytesitem[addr][index],label[BYTEx][index],layerCreator[BYTEx][index],layers[5][index],owned[5][index]);
}





//BLOCKLOG code

log[] logs;
string public logABI="a-User|s-Layer Type|u-Layer|s-Action";

    struct log{
    address creator;
    uint layertype;
    uint layer;
    string action;
    uint blocknumber;
   }

function readLog(uint i)constant returns(uint,address,uint,uint,string,uint){
log l=logs[i];
uint u=logs.length;
return(u,l.creator,l.layertype,l.layer,l.action,l.blocknumber);
}


}
