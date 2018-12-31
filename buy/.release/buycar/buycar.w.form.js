define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/row/row');
require('$model/UI2/system/components/justep/list/list');
require('$model/UI2/system/components/justep/smartContainer/smartContainer');
require('$model/UI2/system/components/justep/titleBar/titleBar');
require('$model/UI2/system/components/justep/panel/child');
require('$model/UI2/system/components/justep/data/data');
require('$model/UI2/system/components/justep/window/window');
require('$model/UI2/system/components/justep/panel/panel');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/flowerfront/buy/buycar'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cbUfAVz';
	this._flag_='c64979cb4a2c564c27fe3f2e04fee438';
	this._wCfg_={};
	this._appCfg_={};
	this.callParent(contextUrl);
 require('css!$UI/flowerfront/icon/my.icons').load();
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"cost":{"define":"cost","name":"cost","relation":"cost","type":"String"},"cover":{"define":"cover","name":"cover","relation":"cover","type":"String"},"discount":{"define":"discount","name":"discount","relation":"discount","type":"String"},"firstprofit":{"define":"firstprofit","name":"firstprofit","relation":"firstprofit","type":"String"},"hasoptional":{"define":"hasoptional","name":"hasoptional","relation":"hasoptional","type":"String"},"id":{"define":"id","name":"id","relation":"id","type":"String"},"name":{"define":"name","name":"name","relation":"name","type":"String"},"number":{"define":"number","name":"number","relation":"number","type":"String"},"openid":{"define":"openid","name":"openid","relation":"openid","type":"String"},"owerprofit":{"define":"owerprofit","name":"owerprofit","relation":"owerprofit","type":"String"},"price":{"define":"price","name":"price","relation":"price","type":"String"},"product_id":{"define":"product_id","name":"product_id","relation":"product_id","type":"String"},"producttype":{"define":"producttype","name":"producttype","relation":"producttype","type":"String"},"secondprofit":{"define":"secondprofit","name":"secondprofit","relation":"secondprofit","type":"String"},"subtitle":{"define":"subtitle","name":"subtitle","relation":"subtitle","type":"String"},"user_id":{"define":"user_id","name":"user_id","relation":"user_id","type":"String"}},"directDelete":false,"events":{},"idColumn":"id","isMain":false,"limit":20,"xid":"buycarData"});
 new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"buycar_id":{"define":"buycar_id","name":"buycar_id","relation":"buycar_id","type":"String"},"id":{"define":"id","name":"id","relation":"id","type":"String"},"selectcondition_id":{"define":"selectcondition_id","name":"selectcondition_id","relation":"selectcondition_id","type":"String"},"selectcondition_name":{"define":"selectcondition_name","name":"selectcondition_name","relation":"selectcondition_name","type":"String"}},"directDelete":false,"events":{},"idColumn":"id","isMain":false,"limit":20,"xid":"optionalData"});
 new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"active":{"define":"active","name":"active","relation":"active","type":"String"},"buycar_id":{"define":"buycar_id","name":"buycar_id","relation":"buycar_id","type":"String"},"id":{"define":"id","name":"id","relation":"id","type":"String"},"keywords":{"define":"keywords","name":"keywords","relation":"keywords","type":"String"},"showlable":{"define":"showlable","name":"showlable","relation":"showlable","type":"String"},"summary":{"define":"summary","name":"summary","relation":"summary","type":"String"}},"directDelete":false,"events":{},"idColumn":"id","isMain":false,"limit":20,"xid":"activeData"});
}}); 
return __result;});