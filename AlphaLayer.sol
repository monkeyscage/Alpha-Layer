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

uint TEXT=1;
uint INTEGER=2;
uint BOOLEAN=3;
uint HASH=4;
uint BYTEx=5;

mapping(uint => mapping(uint => address))layers;
mapping(address => mapping(uint => uint))address2index;
mapping(address => mapping(uint => uint[]))createdLayers;

mapping(uint => mapping(address => mapping(uint => string))item;
mapping(uint => mapping(uint => string)label;
mapping(uint => mapping(uint => address)layerCreator;


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

//creation of new layers

function createLayer(uint group,uint layer,string lab,address creator,bool exp,bool own)returns(bool){
if((msg.sender!=owner)&&(msg.sender!=controller))throw;
if(layer==0)throw;

if(!taken[group][layer]){
   label[group][layer]=lab;
   layerCreator[group][layer]=creator;
   logs.push(log(creator,group,layer,label,block.number));
   layers[group][layer]=new LayerPlaceHolder(creator,group,layer);
   address2index[layers[group][layer]][group]=layer;
   taken[group][layer]=true;
   if(exp)exposed[group].push(layer);
   owned[group][layer]=own;
   createdLayers[creator][group].push(layer);
 }

return true;
}


//just a bunch of basic layers to star from

function init(){
//the very basic layers needed so far
setLabel(100,1,"name",this,true,false);
setLabel(100,2,"address",this,true,false);
setLabel(100,3,"email",this,true,false);
setLabel(100,4,"disclaimer",this,true,false);
setLabel(100,5,"logo512*512",this,true,false);
setLabel(100,6,"logo256*256",this,true,false);
setLabel(100,7,"logo128*128",this,true,false);
setLabel(100,8,"logo64*64",this,true,false);
setLabel(100,9,"logo32*32",this,true,false);
setLabel(100,10,"logo16*16",this,true,false);
setLabel(100,11,"owner",this,true,false);
setLabel(100,12,"Github",this,true,false);
setLabel(100,13,"Twitter Account",this,true,false);
setLabel(100,14,"Twitter Widget",this,true,false);
setLabel(100,15,"Twitter Widget@",this,true,false);
setLabel(100,16,"Facebook",this,true,false);
setLabel(100,17,"Google",this,true,false);
}

function manager(address o,uint g,uint u,bool exp)returns(bool){
if(msg.sender!=owner)throw;
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

//WRITE FUNCTIONS


function addString(address d,address addr,uint index,string info) returns(bool){
   if(!owned[1][index]){
      if((msg.sender==addr)||(allowed[1][addr][msg.sender][index])||(msg.sender==controller)){
         item[TEXT][addr][index]=info;
      }else{
         dapp=Dapp(addr);
         if(msg.sender==dapp.owner())item[TEXT][addr][index]=info;
      }
   }else{
      if(msg.sender!=layerCreator[TEXT][index])throw;
      item[TEXT][addr][index]=info;
   }
   records++;
   return true;
}


function addUint(address d,address addr,uint index,uint quant) returns(bool){
   if(!owned[2][index]){
      if((msg.sender==addr)||(allowed[2][addr][msg.sender][index])||(msg.sender==controller)){
         item[INTEGER][addr][index]=quant;
      }else{
         dapp=Dapp(addr);
         if(msg.sender==dapp.owner())item[INTEGER][addr][index]=quant;
      }
   }else{
      if(msg.sender!=layerCreator[INTEGER][index])throw;
      item[INTEGER][addr][index]=quant;
   }
   records++;
   return true;
}

function addBool(address d,address addr,uint index,bool check) returns(bool){
   if(!owned[3][index]){
      if((msg.sender==addr)||(allowed[3][addr][msg.sender][index])||(msg.sender==controller)){
         item[BOOLEAN][addr][index]=check;
      }else{
         dapp=Dapp(addr);
         if(msg.sender==dapp.owner())item[BOOLEAN][addr][index]=check;
      }
   }else{
      if(msg.sender!=layerCreator[BOOLEAN][index])throw;
      item[BOOLEAN][addr][index]=check;
   }
   records++;
   return true;
}



function addAddress(address d,address addr,uint index,address addr2) returns(bool){
   if(!owned[4][index]){
      if((msg.sender==addr)||(allowed[4][addr][msg.sender][index])||(msg.sender==controller)){
         item[HASH][addr][index]=addr2;
      }else{
         dapp=Dapp(addr);
         if(msg.sender==dapp.owner())item[HASH][addr][index]=addr2;
      }
   }else{
      if(msg.sender!=layerCreator[HASH][index])throw;
      item[HASH][addr][index]=addr2;
   }
   records++;
   return true;
}

function addByte(address d,address addr,uint index,bytes info) returns(bool){
   if(!owned[5][index]){
      if((msg.sender==addr)||(allowed[5][addr][msg.sender][index])||(msg.sender==controller)){
         item[BYTEx][addr][index]=info;
      }else{
         dapp=Dapp(addr);
         if(msg.sender==dapp.owner())item[BYTEx][addr][index]=info;
      }
   }else{
      if(msg.sender!=layerCreator[BYTEx][index])throw;
      item[BYTEx][addr][index]=info;
   }
   records++;
   return true;
}


//READ FUNCTIONS


//some layers are exposed and visible and can be listed

function exposedLayers(uint g,uint u,address a)constant returns(uint,uint,address,uint){
uint uu;uint ll;
uu=exposed[g][u];ll=exposed[g].length;
return(uu,ll,layers[g][u],address2index[a][g]);
}

//read Layers


function readString(address addr,uint index)constant returns (string,string,address,address,bool){
return (item[TEXT][addr][index],label[TEXT][index],layerCreator[TEXT][index],layers[1][index],owned[1][index]);
}

function readUint(address addr,uint index)constant returns (uint,string,address,address,bool){
return (item[INTEGER][addr][index],label[INTEGER][index],layerCreator[INTEGER][index],layers[2][index],owned[2][index]);
}

function readBool(address addr,uint index)constant returns (bool,string,address,address,bool){
return (item[BOOLEAN][addr][index],label[BOOLEAN][index],layerCreator[BOOLEAN][index],layers[3][index],owned[3][index]);
}

function readAddress(address addr,uint index)constant returns (address,string,address,address,bool){
return (item[HASH][addr][index],label[HASH][index],layerCreator[HASH][index],layers[4][index],owned[4][index]);
}

function readByte(address addr,uint index)constant returns (bytes,string,address,address,bool){
return (item[BYTEx][addr][index],label[BYTEx][index],layerCreator[BYTEx][index],layers[5][index],owned[5][index]);
}



//PERMISSIONS

function allow(uint group,address a,uint u,bool b)returns (bool){
if(b){
   if(!allowed[group][msg.sender][a][u]){
      permissions[msg.sender].push(a);
      permissionsTarget[group][msg.sender][a].push(u);
      allowed[group][msg.sender][a][u]=true;
   }
}else{
   allowed[group][msg.sender][a][u]=false;
}
return true;
}

function readPermissions(uint group,address own,address control,uint layerIndex)constant returns (uint,address,uint,uint,bool){
return (permissions[own].length,permissions[own][layerIndex],permissionsTarget[group][own][control].length,permissionsTarget[group][own][control][layerIndex],allowed[group][own][control][layerIndex]);
}

function created(uint group,address creator,uint layerIndex)constant returns (uint,uint){
return (createdLayers[creator][group].length,createdLayers[creator][group][layerIndex]);
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
