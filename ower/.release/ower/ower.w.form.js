define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/row/row');
require('$model/UI2/system/components/justep/smartContainer/smartContainer');
require('$model/UI2/system/components/justep/panel/child');
require('$model/UI2/system/components/justep/window/window');
require('$model/UI2/system/components/justep/panel/panel');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/flowerfront/ower/ower'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cY7NN7z';
	this._flag_='70b499755b597f93e245023993b5b1fb';
	this._wCfg_={};
	this._appCfg_={};
	this.callParent(contextUrl);
 require('css!$UI/flowerfront/icon/my.icons').load();
 require('css!$UI/flowerfront/icon2/my2.icons').load();
}}); 
return __result;});