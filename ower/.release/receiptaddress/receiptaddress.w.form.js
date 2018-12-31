define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/windowContainer/windowContainer');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/row/row');
require('$model/UI2/system/components/justep/list/list');
require('$model/UI2/system/components/justep/titleBar/titleBar');
require('$model/UI2/system/components/justep/panel/child');
require('$model/UI2/system/components/justep/data/data');
require('$model/UI2/system/components/justep/window/window');
require('$model/UI2/system/components/justep/panel/panel');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/flowerfront/ower/receiptaddress'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cFrMFzm';
	this._flag_='6c7c245b56a4b3982efd2e9bea5c9778';
	this._wCfg_={};
	this._appCfg_={};
	this.callParent(contextUrl);
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"adcode":{"define":"adcode","name":"adcode","relation":"adcode","type":"String"},"address":{"define":"address","name":"address","relation":"address","type":"String"},"city":{"define":"city","name":"city","relation":"city","type":"String"},"contact":{"define":"contact","name":"contact","relation":"contact","type":"String"},"contactphone":{"define":"contactphone","name":"contactphone","relation":"contactphone","type":"String"},"district":{"define":"district","name":"district","relation":"district","type":"String"},"id":{"define":"id","name":"id","relation":"id","type":"String"},"isdefault":{"define":"isdefault","name":"isdefault","relation":"isdefault","type":"String"},"province":{"define":"province","name":"province","relation":"province","type":"String"},"street":{"define":"street","name":"street","relation":"street","type":"String"}},"directDelete":false,"events":{},"idColumn":"id","isMain":false,"limit":20,"xid":"receiptData"});
}}); 
return __result;});