define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/row/row');
require('$model/UI2/system/components/justep/input/input');
require('$model/UI2/system/components/justep/list/list');
require('$model/UI2/system/components/justep/panel/child');
require('$model/UI2/system/components/justep/data/data');
require('$model/UI2/system/components/justep/window/window');
require('$model/UI2/system/components/justep/panel/panel');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/flowerfront/topsale/topsale'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='ciMZr6b';
	this._flag_='3b441e99dcdb1f19a58a487c8de27159';
	this._wCfg_={};
	this._appCfg_={};
	this.callParent(contextUrl);
 require('css!$UI/flowerfront/icon/my.icons').load();
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"collection":{"define":"collection","name":"collection","relation":"collection","type":"String"},"cover":{"define":"cover","name":"cover","relation":"cover","type":"String"},"discount":{"define":"discount","name":"discount","relation":"discount","type":"String"},"fullpinyin":{"define":"fullpinyin","name":"fullpinyin","relation":"fullpinyin","type":"String"},"id":{"define":"id","name":"id","relation":"id","type":"String"},"name":{"define":"name","name":"name","relation":"name","type":"String"},"odd":{"define":"odd","name":"odd","relation":"odd","type":"String"},"pinyin":{"define":"pinyin","name":"pinyin","relation":"pinyin","type":"String"},"price":{"define":"price","name":"price","relation":"price","type":"String"},"spec":{"define":"spec","name":"spec","relation":"spec","type":"String"},"subtitle":{"define":"subtitle","name":"subtitle","relation":"subtitle","type":"String"},"unit":{"define":"unit","name":"unit","relation":"unit","type":"String"}},"directDelete":false,"events":{},"idColumn":"id","isMain":false,"limit":20,"xid":"productData"});
}}); 
return __result;});