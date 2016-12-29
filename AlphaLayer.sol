pragma solidity ^0.4.2;


contract Dapp{address public owner;}

contract AlphaLayer{

//standard for all Alpha Layer enabled Dapps
//if your contract contains this variable, the owner can control the related informations on the Alpha Layer
address public owner;

//an external interface we can substitute in the future, allowed to create new sub-layers
address public controller;

//A basic counter to track all records (necessary?)
uint public records;

//used to point to external dapps/contracts (in order to find dapp owner, and to check if you have the permission to write on that location in behalf of the dapp)
Dapp dapp;

//the container for labels
//the labels for "the container for labels"
//the creator of that layer
mapping(address => mapping(uint => string))socialString;
mapping(uint => string)stringLabels;
mapping(uint => address)stringLayerCreator;

//the container for numbers
//the labels for "the container for numbers"
//the creator of that layer
mapping(address => mapping(uint => uint))socialUint; 
mapping(uint => string)uintLabels;
mapping(uint => address)uintLayerCreator;

//the container for true/false
//the labels for "the container for true/false"
//the creator of that layer
mapping(address => mapping(uint => bool))socialBool;
mapping(uint => string)boolLabels;
mapping(uint => address)boolLayerCreator;

//the container for addresses
//the labels for "the container for addresses"
//the creator of that layer
mapping(address => mapping(uint => address))socialAddress;
mapping(uint => string)addressLabels;
mapping(uint => address)addressLayerCreator;

//personal container for permissioned dapps
mapping(address => address[])permissions;
//the list of layers a given dapp has the permission to write in behalf of an address
mapping(address => mapping(address => uint[]))permissionsTarget;
//a simple "oracle" where you can check if a guy gave permission to a dapp for a specific layer
mapping(address => mapping(address => mapping(uint => bool)))allowed;

//once a layer is created it is also locked, no one can take it or overwrite its label
mapping(uint => bool)stringtaken;
mapping(uint => bool)addresstaken;
mapping(uint => bool)booltaken;
mapping(uint => bool)uinttaken;

//some layers are exposed and indexed, the others are "inner functional layers" used by dapps for internal procedures
uint[] stringexposed;
uint[] addressexposed;
uint[] boolexposed;
uint[] uintexposed;


function AlphaLayer(address a){
owner=msg.sender;
records=0;
controller=a;

//not strictly necessary
//init();
}

//creation of new layers

function setLabel(uint labeltype,uint labelindex,uint listitem,string label,address creator,bool exposed)returns(bool){
if((msg.sender!=owner)&&(msg.sender!=controller))throw;
if(labeltype==100)if(!stringtaken[labelindex]){stringLabels[labelindex]=label;stringLayerCreator[labelindex]=creator;stringtaken[labelindex]=true;if(exposed)stringexposed.push(labelindex);}
if(labeltype==101)if(!uinttaken[labelindex]){uintLabels[labelindex]=label;uintLayerCreator[labelindex]=creator;uinttaken[labelindex]=true;if(exposed)uintexposed.push(labelindex);}
if(labeltype==102)if(!booltaken[labelindex]){boolLabels[labelindex]=label;boolLayerCreator[labelindex]=creator;booltaken[labelindex]=true;if(exposed)boolexposed.push(labelindex);}
if(labeltype==103)if(!addresstaken[labelindex]){addressLabels[labelindex]=label;addressLayerCreator[labelindex]=creator;addresstaken[labelindex]=true;if(exposed)addressexposed.push(labelindex);}
logs.push(log(msg.sender,label,0x0,labeltype));
return true;
}


//just a bunch of basic layers to star from

function init(){
//the very basic layers needed so far
setLabel(100,1,0,"name",this,true);
setLabel(100,2,0,"address",this,true);
setLabel(100,3,0,"email",this,true);
setLabel(100,4,0,"disclaimer",this,true);
setLabel(100,5,0,"logo512*512",this,true);
setLabel(100,6,0,"logo256*256",this,true);
setLabel(100,7,0,"logo128*128",this,true);
setLabel(100,8,0,"logo64*64",this,true);
setLabel(100,9,0,"logo32*32",this,true);
setLabel(100,10,0,"logo16*16",this,true);
setLabel(100,11,0,"owner",this,true);
setLabel(100,12,0,"Github",this,true);
setLabel(100,13,0,"Twitter Account",this,true);
setLabel(100,14,0,"Twitter Widget",this,true);
setLabel(100,15,0,"Twitter Widget@",this,true);
setLabel(100,16,0,"Facebook",this,true);
setLabel(100,17,0,"Google",this,true);
}

function setOwner(address o)returns(bool){
if(msg.sender!=owner)throw;
logs.push(log(owner,"setOwner",o,0));
owner=o;
return true;
}

function setController(address c)returns(bool){
if(msg.sender!=owner)throw;
logs.push(log(owner,"setController",c,1));
controller=c;
return true;
}


//WRITE FUNCTIONS

function addString(address d,address addr,uint index,string info) returns(bool){
dapp=Dapp(d);
if((msg.sender!=addr)&&(msg.sender!=dapp.owner())&&(msg.sender!=controller)&&(!allowed[addr][msg.sender][index]))throw;
socialString[addr][index]=info;
records++;
return true;
}

function addUint(address d,address addr,uint index,uint quant) returns(bool){
dapp=Dapp(d);
if((msg.sender!=addr)&&(msg.sender!=dapp.owner())&&(msg.sender!=controller)&&(!allowed[addr][msg.sender][index]))throw;
socialUint[addr][index]=quant;
records++;
return true;
}

function addBool(address d,address addr,uint index,bool check) returns(bool){
dapp=Dapp(d);
if((msg.sender!=addr)&&(msg.sender!=dapp.owner())&&(msg.sender!=controller)&&(!allowed[addr][msg.sender][index]))throw;
socialBool[addr][index]=check;
records++;
return true;
}

function addAddress(address d,address addr,uint index,address addr2) returns(bool){
dapp=Dapp(d);
if((msg.sender!=addr)&&(msg.sender!=dapp.owner())&&(msg.sender!=controller)&&(!allowed[addr][msg.sender][index]))throw;
socialAddress[addr][index]=addr2;
records++;
return true;
}


//READ FUNCTIONS


function exposed(uint t,uint u)constant returns(uint,uint){
uint uu;uint ll;
if(t==1){uu=stringexposed[u];ll=stringexposed.length;}
if(t==2){uu=addressexposed[u];ll=addressexposed.length;}
if(t==3){uu=boolexposed[u];ll=boolexposed.length;}
if(t==4){uu=uintexposed[u];ll=uintexposed.length;}
return(uu,ll);
}

function readString(address addr,uint index)constant returns (string,string,address){
return (socialString[addr][index],stringLabels[index],stringLayerCreator[index]);
}

function readUint(address addr,uint index)constant returns (uint,string,address){
return (socialUint[addr][index],uintLabels[index],uintLayerCreator[index]);
}

function readBool(address addr,uint index)constant returns (bool,string,address){
return (socialBool[addr][index],boolLabels[index],boolLayerCreator[index]);
}

function readAddress(address addr,uint index)constant returns (address,string,address){
return (socialAddress[addr][index],addressLabels[index],addressLayerCreator[index]);
}

function readString(address addr,uint t,uint index)constant returns (string,string,address){
if()
return (socialString[addr][index],stringLabels[index],stringLayerCreator[index]);
}


//PERMISSIONS

function allow(address a,uint u,bool b)returns (bool){
if(b){
if(!allowed[msg.sender][a][u]){
permissions[msg.sender].push(a);
permissionsTarget[msg.sender][a].push(u);
allowed[msg.sender][a][u]=true;}
}else{
for( uint i=0;i<permissionsTarget[msg.sender][a].length;i++){
//find and remove layer
   if(permissionsTarget[msg.sender][a][i]==u){

      if(i<permissionsTarget[msg.sender][a].length-1){
          permissionsTarget[msg.sender][a][i]=permissionsTarget[msg.sender][a][permissionsTarget[msg.sender][a].length-1];
          permissionsTarget[msg.sender][a][permissionsTarget[msg.sender][a].length-1]=0;
      }else{
          permissionsTarget[msg.sender][a][i]=0;
      }

      permissionsTarget[msg.sender][a].length--;
   }
}
allowed[msg.sender][a][u]=false;
}
return true;
}

function readPermissions(address a,address d,uint u)constant returns (address,uint,uint,uint,bool){
return (permissions[a][u],permissions[a].length,permissionsTarget[a][d][u],permissionsTarget[a][d].length,allowed[a][d][u]);
}


//DLog code

log[] logs;

    struct log{
    address admin;
    string action;
    address addr;
    uint code;
   }

function readLog(uint i)constant returns(address,string,address,uint){
log l=logs[i];
return(l.admin,l.action,l.addr,l.code);
}


}
