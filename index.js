//var publicurl = 'http://192.168.0.151:3000/';
var publicurl = 'http://flower.ysdsoft.com/';
var openid = '1';
//var openid = 'o_L1a1F_7rOT0RxFXBc5Ki4W5Cuk';
var buycar = new Array();
//buycar{id,product_id,user_id,number,price,cost,discount,cover,firstprofit,secondprofit,owerprofit,
//producttype,buycaroptional[id,buycar_id,select_optional,select_condition],activetype[id,buycar_id,active,showlable,summary,keywords],openid,agentuserid,destock}
define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var ShellImpl = require('$UI/system/lib/portal/shellImpl');

	var Model = function() {
		this.callParent();
		var shellImpl = new ShellImpl(this, {
			"contentsXid" : "pages",
			"pageMappings" : {
				"main" : {
					url : require.toUrl('./main.w')
				}
			}
		})
	};

	Model.prototype.modelLoad = function(event){
		justep.Shell.showPage("main");
	};

	return Model;
});