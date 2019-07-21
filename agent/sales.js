define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.button1Click = function(event){
		var params = {
			keyword : 'week'
		};
		this.comp('windowContainer1').load(require.toUrl('./sales_echars.w'), params);
	};

	Model.prototype.button2Click = function(event){
		var params = {
			keyword : 'month'
		};
		this.comp('windowContainer2').load(require.toUrl('./sales_echars.w'), params);
	};

	Model.prototype.button3Click = function(event){
		var params = {
			keyword : 'threemonth'
		};
		this.comp('windowContainer3').load(require.toUrl('./sales_echars.w'), params);
	};

	Model.prototype.button4Click = function(event){
		var params = {
			keyword : 'year'
		};
		this.comp('windowContainer4').load(require.toUrl('./sales_echars.w'), params);
	};

	Model.prototype.modelLoad = function(event){
		var params = {
			keyword : 'week'
		};
		this.comp('windowContainer1').load(require.toUrl('./sales_echars.w'), params);
	};

	return Model;
});