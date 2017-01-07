pragma solidity ^0.4.6;

contract LayerPlaceholder{function createLayerPlaceHolder(address c,uint type,uint layer)public returns(address){}}
contract Dapp{address public owner;}

contract AlphaLayer{
LayerPlaceholder placeholder;
//standard for all Alpha Layer enabled Dapps
//if your contract contains this variable, the owner can control the related informations on the Alpha Layer
address public owner;

//an external interface we can substitute in the future, allowed to create new sub-layers
address public controller;

//A basic counter to track all records (necessary?)
uint public records;

//used to point to external dapps/contracts (in order to find dapp owner, and to check if you have the permission to write on that location in behalf of the dapp)
Dapp dapp;

mapping(uint => mapping(uint => address))layers;
mapping(address => mapping(uint => uint))address2layers;

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

//the container for bytes
//the labels for "the container for bytes"
//the creator of that layer
mapping(address => mapping(uint => bytes))socialByte;
mapping(uint => string)byteLabels;
mapping(uint => address)byteLayerCreator;

//personal container for permissioned dapps
mapping(address => address[])permissions;
//the list of layers a given dapp has the permission to write in behalf of an address
mapping(uint => mapping(address => mapping(address => uint[])))permissionsTarget;
//a simple "oracle" where you can check if a guy gave permission to a dapp for a specific layer
mapping(uint => mapping(address => mapping(address => mapping(uint => bool))))allowed;

//once a layer is created it is also locked, no one can take it or overwrite its label
mapping(uint => bool)stringtaken;
mapping(uint => bool)addresstaken;
mapping(uint => bool)booltaken;
mapping(uint => bool)uinttaken;
mapping(uint => bool)bytetaken;

//some layers are exposed and indexed, the others are "inner functional layers" used by dapps for internal procedures
uint[] stringexposed;
uint[] addressexposed;
uint[] boolexposed;
uint[] uintexposed;
uint[] byteexposed;

mapping(uint => bool)stringowned;
mapping(uint => bool)addressowned;
mapping(uint => bool)boolowned;
mapping(uint => bool)uintowned;
mapping(uint => bool)byteowned;



function AlphaLayer(address control){
owner=msg.sender;
records=0;
controller=control;

//not strictly necessary
//init();
}

//creation of new layers

function setLabel(uint labeltype,uint labelindex,string label,address creator,bool exposed,bool owned)returns(bool){
if((msg.sender!=owner)&&(msg.sender!=controller))throw;
if(labelindex==0)throw;
if(labeltype==100)if(!stringtaken[labelindex]){layers[1][labelindex]=placeholder.createLayerPlaceHolder(creator);address2layers[layers[1][labelindex]][1]=labelindex;stringLabels[labelindex]=label;stringLayerCreator[labelindex]=creator;stringtaken[labelindex]=true;if(exposed)stringexposed.push(labelindex);stringowned[labelindex]=true;}
if(labeltype==101)if(!uinttaken[labelindex]){layers[2][labelindex]=placeholder.createLayerPlaceHolder(creator);address2layers[layers[2][labelindex]][2]=labelindex;uintLabels[labelindex]=label;uintLayerCreator[labelindex]=creator;uinttaken[labelindex]=true;if(exposed)uintexposed.push(labelindex);uintowned[labelindex]=true;}
if(labeltype==102)if(!booltaken[labelindex]){layers[3][labelindex]=placeholder.createLayerPlaceHolder(creator);address2layers[layers[3][labelindex]][3]=labelindex;boolLabels[labelindex]=label;boolLayerCreator[labelindex]=creator;booltaken[labelindex]=true;if(exposed)boolexposed.push(labelindex);boolowned[labelindex]=true;}
if(labeltype==103)if(!addresstaken[labelindex]){layers[4][labelindex]=placeholder.createLayerPlaceHolder(creator);address2layers[layers[4][labelindex]][4]=labelindex;addressLabels[labelindex]=label;addressLayerCreator[labelindex]=creator;addresstaken[labelindex]=true;if(exposed)addressexposed.push(labelindex);addressowned[labelindex]=true;}
if(labeltype==104)if(!bytetaken[labelindex]){layers[5][labelindex]=placeholder.createLayerPlaceHolder(creator);address2layers[layers[5][labelindex]][5]=labelindex;byteLabels[labelindex]=label;byteLayerCreator[labelindex]=creator;bytetaken[labelindex]=true;if(exposed)byteexposed.push(labelindex);byteowned[labelindex]=true;}
logs.push(log(creator,labeltype,));
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

function setPlaceholder(address p)returns(bool){
if(msg.sender!=owner)throw;
logs.push(log(owner,"setPlaceHolder Generator",p,2));
placeholder=LayerPlaceholder(p);
return true;
}

//WRITE FUNCTIONS

function addString(address d,address addr,uint index,string info) returns(bool){
if(!stringowned[index]){
dapp=Dapp(d);
if((!stringowned[index])&&(msg.sender!=addr)&&(msg.sender!=dapp.owner())&&(msg.sender!=controller)&&(!allowed[1][addr][msg.sender][index]))throw;
socialString[addr][index]=info;
}else{
if(msg.sender!=stringowner[index])throw;
socialString[uintowner[index]][index]=info;
}
records++;
return true;
}

function addUint(address d,address addr,uint index,uint quant) returns(bool){
if(!uintowned[index]){
dapp=Dapp(d);
if((msg.sender!=addr)&&(msg.sender!=dapp.owner())&&(msg.sender!=controller)&&(!allowed[2][addr][msg.sender][index]))throw;
socialUint[addr][index]=quant;
}else{
if(msg.sender!=uintLayerCreator[index])throw;
socialUint[uintLayerCreator[index]][index]=quant;
}
records++;
return true;
}

function addBool(address d,address addr,uint index,bool check) returns(bool){
if(!boolowned[index]){
dapp=Dapp(d);
if((!stringowned[index])&&(msg.sender!=addr)&&(msg.sender!=dapp.owner())&&(msg.sender!=controller)&&(!allowed[3][addr][msg.sender][index]))throw;
socialBool[addr][index]=check;
}else{
if(msg.sender!=boolLayerCreator[index])throw;
socialBool[boolLayerCreator[index]][index]=quant;
}
records++;
return true;
}

function addAddress(address d,address addr,uint index,address addr2) returns(bool){
if(!addressowned[index]){
dapp=Dapp(d);
if((!stringowned[index])&&(msg.sender!=addr)&&(msg.sender!=dapp.owner())&&(msg.sender!=controller)&&(!allowed[4][addr][msg.sender][index]))throw;
socialAddress[addr][index]=addr2;
}else{
if(msg.sender!=addressLayerCreator[index])throw;
socialAddress[addressLayerCreator[index]][index]=quant;
}
records++;
return true;
}

function addByte(address d,address addr,uint index,bytes info) returns(bool){
if(!byteowned[index]){
dapp=Dapp(d);
if((!stringowned[index])&&(msg.sender!=addr)&&(msg.sender!=dapp.owner())&&(msg.sender!=controller)&&(!allowed[5][addr][msg.sender][index]))throw;
socialByte[addr][index]=info;
}else{
if(msg.sender!=byteLayerCreator[index])throw;
socialByte[byteLayerCreator[index]][index]=quant;
}
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
if(t==5){uu=byteexposed[u];ll=byteexposed.length;}
return(uu,ll);
}


function readString(address addr,uint index)constant returns (string,string,address,address,bool){
return (socialString[addr][index],stringLabels[index],stringLayerCreator[index],layers[1][index],stringowned[index]);
}

function readUint(address addr,uint index)constant returns (uint,string,address,address,bool){
return (socialUint[addr][index],uintLabels[index],uintLayerCreator[index],layers[2][index],uintowned[index]);
}

function readBool(address addr,uint index)constant returns (bool,string,address,address,bool){
return (socialBool[addr][index],boolLabels[index],boolLayerCreator[index],layers[3][index],boolowned[index]);
}

function readAddress(address addr,uint index)constant returns (address,string,address,address,bool){
return (socialAddress[addr][index],addressLabels[index],addressLayerCreator[index],layers[4][index],addressowned[index]);
}

function readByte(address addr,uint index)constant returns (bytes,string,address,address,bool){
return (socialByte[addr][index],byteLabels[index],byteLayerCreator[index],layers[5][index],byteowned[index]);
}



//PERMISSIONS

function allow(uint group,address a,uint u,bool b)returns (bool){
if(b){
if(!allowed[group][msg.sender][a][u]){
permissions[msg.sender].push(a);
permissionsTarget[group][msg.sender][a].push(u);
allowed[group][msg.sender][a][u]=true;}
}else{
for( uint i=0;i<permissionsTarget[group][msg.sender][a].length;i++){
//find and remove layer
   if(permissionsTarget[group][msg.sender][a][i]==u){

      if(i<permissionsTarget[group][msg.sender][a].length-1){
          permissionsTarget[group][msg.sender][a][i]=permissionsTarget[group][msg.sender][a][permissionsTarget[group][msg.sender][a].length-1];
          permissionsTarget[group][msg.sender][a][permissionsTarget[group][msg.sender][a].length-1]=0;
      }else{
          permissionsTarget[group][msg.sender][a][i]=0;
      }

      permissionsTarget[group][msg.sender][a].length--;
   }
}
allowed[group][msg.sender][a][u]=false;
}
return true;
}

function readPermissions(uint group,address a,address d,uint u)constant returns (address,uint,uint,uint,bool){
return (permissions[a][u],permissions[a].length,permissionsTarget[group][a][d][u],permissionsTarget[group][a][d].length,allowed[group][a][d][u]);
}


//DLog code

log[] logs;
public bytes logABI="a-User|u-Layer Type|u-Layer|s-Label";

    struct log{
    address creator;
    address layer;
    string action;
   }

function readLog(uint i)constant returns(address,uint,string){
log l=logs[i];
return(l.creator,l.group,l.index);
}


}
