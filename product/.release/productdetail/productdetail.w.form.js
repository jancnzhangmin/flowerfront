define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/list/list');
require('$model/UI2/system/components/justep/smartContainer/smartContainer');
require('$model/UI2/system/components/justep/menu/menu');
require('$model/UI2/system/components/justep/panel/child');
require('$model/UI2/system/components/justep/panel/panel');
require('$model/UI2/system/components/justep/popOver/popOver');
require('$model/UI2/system/components/justep/row/row');
require('$model/UI2/system/components/justep/popMenu/popMenu');
require('$model/UI2/system/components/justep/data/data');
require('$model/UI2/system/components/justep/window/window');
require('$model/UI2/system/components/justep/button/buttonGroup');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/flowerfront/product/productdetail'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cf2iuye';
	this._flag_='31c7f78a1c73f856818b6fc26f08c377';
	this._wCfg_={};
	this._appCfg_={};
	this.callParent(contextUrl);
 require('css!$UI/flowerfront/icon/my.icons').load();
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"baseprice":{"define":"baseprice","name":"baseprice","relation":"baseprice","type":"String"},"brand":{"define":"brand","name":"brand","relation":"brand","type":"String"},"content":{"define":"content","name":"content","relation":"content","type":"String"},"cover":{"define":"cover","name":"cover","relation":"cover","type":"String"},"discount":{"define":"discount","name":"discount","relation":"discount","type":"String"},"id":{"define":"id","name":"id","relation":"id","type":"String"},"images":{"define":"images","name":"images","relation":"images","type":"String"},"name":{"define":"name","name":"name","relation":"name","type":"String"},"pack":{"define":"pack","name":"pack","relation":"pack","type":"String"},"price":{"define":"price","name":"price","relation":"price","type":"String"},"season":{"define":"season","name":"season","relation":"season","type":"String"},"spec":{"define":"spec","name":"spec","relation":"spec","type":"String"},"subtitle":{"define":"subtitle","name":"subtitle","relation":"subtitle","type":"String"},"unit":{"define":"unit","name":"unit","relation":"unit","type":"String"},"weight":{"define":"weight","name":"weight","relation":"weight","type":"String"}},"directDelete":false,"events":{},"idColumn":"id","isMain":false,"limit":20,"xid":"productData"});
 new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"active":{"define":"active","name":"active","relation":"active","type":"String"},"icon":{"define":"icon","name":"icon","relation":"icon","type":"String"},"id":{"define":"id","name":"id","relation":"id","type":"String"},"keywords":{"define":"keywords","name":"keywords","relation":"keywords","type":"String"},"showlable":{"define":"showlable","name":"showlable","relation":"showlable","type":"String"},"summary":{"define":"summary","name":"summary","relation":"summary","type":"String"}},"directDelete":false,"events":{},"idColumn":"id","isMain":false,"limit":20,"xid":"activetypeData"});
 new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"id":{"define":"id","name":"id","relation":"id","type":"String"},"name":{"define":"name","name":"name","relation":"name","type":"String"},"selectcondition_id":{"define":"selectcondition_id","name":"selectcondition_id","relation":"selectcondition_id","type":"String"},"selectcondition_name":{"define":"selectcondition_name","name":"selectcondition_name","relation":"selectcondition_name","type":"String"}},"directDelete":false,"events":{},"idColumn":"id","isMain":false,"limit":20,"xid":"optionalData"});
 new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"id":{"define":"id","name":"id","relation":"id","type":"String"},"isselect":{"define":"isselect","name":"isselect","relation":"isselect","type":"String"},"name":{"define":"name","name":"name","relation":"name","type":"String"},"optional_id":{"define":"optional_id","name":"optional_id","relation":"optional_id","type":"String"},"weighting":{"define":"weighting","name":"weighting","relation":"weighting","type":"String"}},"directDelete":false,"events":{},"idColumn":"id","isMain":false,"limit":20,"xid":"conditionData"});
 new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"explain":{"define":"explain","name":"explain","relation":"explain","type":"String"},"id":{"define":"id","name":"id","relation":"id","type":"String"},"name":{"define":"name","name":"name","relation":"name","type":"String"}},"directDelete":false,"events":{},"idColumn":"id","isMain":false,"limit":20,"xid":"explainData"});
}}); 
return __result;});