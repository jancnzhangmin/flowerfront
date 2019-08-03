<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onLoad="modelLoad"> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-content x-cards" xid="content1" style="padding-top:0px;padding-bottom:10px;">
  <div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer topimg" xid="smartContainer1" style="position:relative;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row1" style="z-index:1;">
   <div class="x-col" xid="col1"></div>
   <div class="x-col text-center" xid="col2"><span xid="span1" style="font-size:large;color:#FFFFFF;"><![CDATA[　]]></span></div>
   <div class="x-col" xid="col3"></div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row2">
   <div class="x-col x-col-20 text-center" xid="col4">
  <div xid="div1" class="backhead" bind-click="div1Click"><img src="$UI/flowerfront/image/user-192.png" alt="" xid="image1" class="fronthead"></img></div></div>
   <div class="x-col" xid="col5" style="padding:0px;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row3" style="padding:0px;">
   <div class="x-col" xid="col6"><span xid="span2" style="font-size:x-large;color:#FFFFFF;"><![CDATA[]]></span></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4" style="padding:0px;display:none;">
   <div class="x-col" xid="col9"><span xid="span3" style="color:#FFFFFF;"><![CDATA[会员号：]]></span>
  <span xid="span4" style="color:#FFFFFF;"><![CDATA[10001]]></span></div>
   </div></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5" style="bottom:0px;position:absolute;">
   <div class="x-col text-center" xid="col12" style="padding-right:0px;"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="未入账" xid="button1" icon="my my-wodeleijishouyi" style="color:#FFFFFF;">
   <i xid="i1" class="my my-wodeleijishouyi" style="font-size:xx-large;"></i>
   <span xid="span5">未入账</span><div xid="div2" class="text-center">
   <label xid="label3" class="angle"><![CDATA[2]]></label></div></a>
  <label xid="label1" style="height:40px;border-right-style:solid;border-right-width:1px;border-right-color:#f6f6f6;margin-top:15px;" class="pull-right"></label>
  </div>
   <div class="x-col text-center" xid="col13" style="padding-left:0px;padding-right:0px;"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="收益" xid="incomebtn" icon="my my-shouyi1" style="color:#FFFFFF;" onClick="incomebtnClick">
   <i xid="i2" class="my my-shouyi1" style="font-size:xx-large;"></i>
   <span xid="span6">收益</span></a>
  <label xid="label2" style="height:40px;border-right-style:solid;border-right-width:1px;border-right-color:#f6f6f6;margin-top:15px;" class="pull-right"></label></div>
   <div class="x-col text-center" xid="col14" style="padding-left:0px;"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="提现" xid="withdrawbtn" icon="my my-tixian2" style="color:#FFFFFF;" onClick="withdrawbtnClick">
   <i xid="i3" class="my my-tixian2" style="font-size:xx-large;"></i>
   <span xid="span7">提现</span></a></div></div>
  </div>
  <div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="smartContainer2" style="margin-top:10px;background-color:white;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row6">
   <div class="x-col" xid="col15" style="border-bottom-style:solid;border-bottom-color:#f6f6f6;border-bottom-width:1px;"><span xid="span8" style="font-size:medium;"><![CDATA[我的订单]]></span></div>
   <div class="x-col text-right" xid="col16" style="border-bottom-style:solid;border-bottom-color:#f6f6f6;border-bottom-width:1px;"><span xid="span9" class="text-muted" style="display:none;"><![CDATA[查看全部订单]]></span>
  <i xid="i4" class="linear linear-chevronright text-muted" style="display:none;"></i></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row7">
   <div class="x-col text-center" xid="col18">
  <div xid="unpaydiv" class="text-center btnangleBox" bind-click="unpaydivClick">
   <label xid="unpay_count_lable" class="btnangle" style="display:none;"><![CDATA[0]]></label><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="待侍款" xid="unpaybtn" icon="my my-tixian1">
   <i xid="i5" class="btnclass my2 my2-dingshixiaoshou my my-tixian1" style="font-size:xx-large;"></i>
   <span xid="span10" class="text-muted">待侍款</span></a></div></div>
   <div class="x-col text-center" xid="col19"><div xid="undeliverdiv" class="text-center btnangleBox" bind-click="undeliverdivClick">
   <label xid="undeliver_count_lable" class="btnangle"><![CDATA[0]]></label>
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="待发货" xid="button5" icon="my2 my2-daifahuo">
    <i xid="i6" class="btnclass my2 my2-daifahuo" style="font-size:xx-large;"></i>
    <span xid="span11" class="text-muted">待发货</span></a> </div></div>
   <div class="x-col text-center" xid="col20"><div xid="unreceiptdiv" class="text-center btnangleBox" bind-click="unreceiptdivClick">
   <label xid="unreceipt_count_lable" class="btnangle"><![CDATA[0]]></label>
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="待收货" xid="button6" icon="my2 my2-urbantubiao-">
    <i xid="i7" class="btnclass my2 my2-urbantubiao-" style="font-size:xx-large;"></i>
    <span xid="span12" class="text-muted">待收货</span></a> </div></div>
  <div class="x-col text-center" xid="col21"><div xid="uncommentdiv" class="text-center btnangleBox" bind-click="uncommentdivClick">
   <label xid="uncomment_count_lable" class="btnangle"><![CDATA[0]]></label>
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="待评价" xid="button7" icon="my2 my2-daipingjia">
    <i xid="i8" class="btnclass my2 my2-daipingjia" style="font-size:xx-large;"></i>
    <span xid="span13" class="text-muted">待评价</span></a> </div></div>
  <div class="x-col text-center" xid="col22"><div xid="div7" class="text-center btnangleBox">
   <label xid="label8" class="btnangle" style="display:none;">12</label>
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="售后" xid="button8" icon="my2 my2-shouhou">
    <i xid="i9" class="btnclass my2 my2-shouhou" style="font-size:xx-large;"></i>
    <span xid="span14" class="text-muted">售后</span></a> </div></div></div></div>
  <div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="agent_smartContainer" style="margin-top:10px;background-color:white;display:none;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row11">
   <div class="x-col" xid="col27" style="border-bottom-style:solid;border-bottom-color:#f6f6f6;border-bottom-width:1px;"><span xid="span19" style="font-size:medium;"><![CDATA[代理]]></span></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row12">
   <div class="x-col text-center" xid="agentcol" bind-click="agentcolClick"><div xid="div3" class="text-center btnangleBox"><label xid="label4" class="btnangle" style="display:none;">0</label>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="我" xid="button4" icon="my2 my2-dailiguanli">
   <i xid="i16" class="btnclass my2 my2-dailiguanli" style="font-size:xx-large;"></i>
   <span xid="span20" class="text-muted">我</span></a></div></div>
   <div class="x-col text-center" xid="directagentcol" bind-click="directagentcolClick"><div xid="div4" class="text-center btnangleBox">
   <label xid="directagent_label" class="btnangle" style="display:none;">0</label>
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="直属" xid="button9" icon="my2 my2-daili1">
    <i xid="i17" class="btnclass my2 my2-daili1" style="font-size:xx-large;"></i>
    <span xid="span21" class="text-muted">直属</span></a> </div></div>
   <div class="x-col text-center" xid="taskcol" bind-click="taskcolClick"><div xid="div5" class="text-center btnangleBox">
   <label xid="label6" class="btnangle" style="display:none;">0</label>
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="任务" xid="button10" icon="my2 my2-renwu">
    <i xid="i18" class="btnclass my2 my2-renwu" style="font-size:xx-large;"></i>
    <span xid="span22" class="text-muted">任务</span></a> </div></div>
  <div class="x-col text-center" xid="customercol" bind-click="customercolClick"><div xid="div6" class="text-center btnangleBox">
   <label xid="customer_label" class="btnangle" style="display:none;">0</label>
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="客户" xid="button11" icon="my2 my2-dailishang2">
    <i xid="i19" class="btnclass my2 my2-dailishang2" style="font-size:xx-large;"></i>
    <span xid="span23" class="text-muted">客户</span></a> </div></div>
  <div class="x-col text-center" xid="salescol" bind-click="salescolClick"><div xid="div8" class="text-center btnangleBox">
   <label xid="label9" class="btnangle" style="display:none;">0</label>
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="销售" xid="button12" icon="my2 my2-xiaoshou">
    <i xid="i20" class="btnclass my2 my2-xiaoshou" style="font-size:xx-large;"></i>
    <span xid="span24" class="text-muted">销售</span></a> </div></div></div></div><div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="smartContainer3" style="background-color:white;margin-top:10px;"><div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row9" bind-click="row9Click" style="height:55px;padding-top:12px;">
   <div class="x-col x-col-fixed" xid="col23" style="width:40px;">
    <i xid="i13" class="my my-xinxingshi btnclass" style="font-size:x-large;"></i></div> 
   <div class="x-col" xid="col11">
    <span xid="span16" style="font-size:medium;"><![CDATA[我的收藏]]></span></div> 
   <div class="x-col text-right" xid="col17">
    <span xid="span18" style="color:#ff4256;"><![CDATA[0]]></span><i xid="i12" class="linear linear-chevronright text-muted"></i>
  </div> </div>
  <hr xid="hr2" style="margin:0px;margin-left:50px;border-top: 1px solid #f6f6f6;"></hr><div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row10" style="height:55px;" bind-click="row10Click">
   <div class="x-col x-col-fixed" xid="col25" style="width:40px;">
    <i xid="i14" class="my my-shouhuodizhi1 btnclass" style="font-size:x-large;"></i></div> 
   <div class="x-col" xid="col26">
    <span xid="span17" style="font-size:medium;"><![CDATA[收货地址]]></span></div> 
   <div class="x-col text-right" xid="col24">
    <i xid="i15" class="linear linear-chevronright text-muted"></i></div> </div>
  </div>
  <div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row13" style="margin-top:10px;background-color:white;height:55px;" bind-click="row13Click">
   <div class="x-col x-col-fixed" xid="col36" style="width:40px;">
    <i xid="i22" class="my2 my2-dengji2 btnclass" style="font-size:x-large;"></i></div> 
   <div class="x-col" xid="col35">
    <span xid="span25" style="font-size:medium;"><![CDATA[成为代理]]></span></div> 
   <div class="x-col text-right" xid="col37">
    <i xid="i21" class="linear linear-chevronright text-muted"></i></div> </div></div>
  </div> 
<resource xid="resource2"><require xid="require1" url="css!$UI/flowerfront/icon/my.icons"></require>
  <require xid="require2" url="css!$UI/flowerfront/icon2/my2.icons"></require></resource></div>