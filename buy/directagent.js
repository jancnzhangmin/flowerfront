define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelParamsReceive = function(event) {
	
		var self = this;
		if (event.params) {

			var agentuseriddata = self.comp('agentuseridData');
			agentuseriddata.clear();
			var options = {
				defaultValues : [ {
					agentuserid : event.params.agentuserid
				} ]
			};
			agentuseriddata.newData(options);

			$.ajax({
				async : true,
				url : publicurl + "api/get_directagent_list",
				type : "GET",
				dataType : 'jsonp',
				jsonp : 'callback',
				timeout : 5000,
				data : {
					openid : openid
				},
				success : function(data) {
					// 成功
					var directagentdata = self.comp('directagentData');
					directagentdata.clear();
					var options = {
						defaultValues : [ {
							id : 0,
							name : '无'
						} ]
					};
					directagentdata.newData(options);
					$.each(data.directagents, function(i, item) {
						var options = {
							defaultValues : [ {
								id : item.id,
								name : item.nickname + '(' + item.name + ')',
								headurl : item.headurl,
								agentlevel : item.agentlevel
							} ]
						};
						directagentdata.newData(options);
					});

				},
				error : function() {

					// 错误
				}
			});
		}
	};

	Model.prototype.agentlistrowClick = function(event) {
		var row = event.bindingContext.$object;
		var params={
		agentuserid:row.val('id'),
		name:row.val('name')
		}
		//justep.Shell.fireEvent("buycar_change_directagent", params);
		this.owner.send(params);
		this.close();
	};

	return Model;
});