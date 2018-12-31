<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onParamsReceive="modelParamsReceive" onLoad="modelLoad"> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="mainData" idColumn="id"><column name="id" type="String" xid="xid1"></column>
  <column name="address" type="String" xid="xid2"></column>
  <column name="adcode" type="String" xid="xid3"></column>
  <column name="level" type="String" xid="xid4"></column>
  <column name="isselect" type="String" xid="xid9"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="districtData" idColumn="id"><column name="id" type="String" xid="xid5"></column>
  <column name="adcode" type="String" xid="xid6"></column>
  <column name="level" type="String" xid="xid7"></column>
  <column name="name" type="String" xid="xid8"></column>
  <column name="myorder" type="String" xid="xid10"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="添加收货地址"
          class="x-titlebar" style="background-color:white;" xid="title">
          <div class="x-titlebar-left"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn" style="color:#333333;"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title" style="color:#333333;font-weight:normal;">添加收货地址</div>  
          <div class="x-titlebar-right reverse"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="保存" xid="savebtn" style="color:#ff4665;" onClick="savebtnClick">
   <i xid="i1"></i>
   <span xid="span1" style="font-size:16px;">保存</span></a></div>
        </div> 
      </div>  
    <div class="x-panel-content x-cards" xid="content1">
  
  <div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="smartContainer1" style="background-color:white;"><div component="$UI/system/components/justep/row/row" class="x-row row-class" xid="row1">
   <div class="x-col" xid="col1"><input component="$UI/system/components/justep/input/input" class="form-control input-class" xid="input1" placeHolder="收货人" style="font-size:medium;"></input></div>
   </div><div component="$UI/system/components/justep/row/row" class="x-row row-class" xid="row2">
   <div class="x-col" xid="col4">
    <input component="$UI/system/components/justep/input/input" class="form-control input-class" xid="input2" placeHolder="收货人电话" style="font-size:medium;"></input></div> </div>
  <div component="$UI/system/components/justep/row/row" class="x-row x-row-center row-class" xid="row3" bind-click="row3Click" style="margin-top:0px;margin-bottom:0px;">
   <div class="x-col" xid="col5">
    <div component="$UI/system/components/justep/list/list" class="x-list" xid="list3" data="mainData" filter="$row.val(&quot;address&quot;) != ''  &amp;&amp; $row.val(&quot;address&quot;) != '暂不选择'">
   <ul class="x-list-template" xid="listTemplateUl3">
    <li xid="li3" style="padding-left:12px;padding-top:5px;"><span xid="span7" bind-text='val("address")' bind-css=" val(&quot;address&quot;) == '收货地址' ? 'notext' : ''" style="font-size:medium;"></span></li></ul> </div></div> 
  <div class="x-col x-col-fixed text-right" xid="col6" style="width:20px;"><i xid="i2" class="linear linear-chevronright text-muted"></i></div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row row-class" xid="row4">
   <div class="x-col" xid="col7">
    <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control input-class" xid="textarea1" placeHolder="详细地址：如道路、门牌号、小区、楼栋号，单元室等" style="font-size:medium;"></textarea></div> </div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row row-class" xid="row5" style="background-color:white;padding-top:10px;margin-top:10px;">
   <div class="x-col" xid="col8"><span xid="span2" style="font-size:medium;"><![CDATA[设为默认地址]]></span></div>
   <div class="x-col text-right" xid="col9"><span component="$UI/system/components/justep/button/toggle" class="x-toggle" xid="toggle1" style="display: inline-block;padding:0px;" ON="　" OFF="　"></span></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row row-class" xid="row6" style="background-color:white;margin-top:10px;display:none;">
   <div class="x-col" xid="col11">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-block" label="删除收货地址" xid="delbtn" style="color:#ff4665;font-size:medium;" onClick="delbtnClick">
   <i xid="i3"></i>
   <span xid="span3">删除收货地址</span></a></div> </div></div>
  </div> 
<div component="$UI/system/components/justep/popOver/popOver" class="x-popOver" direction="auto" xid="popOver1" position="bottom">
   <div class="x-popOver-overlay" xid="div1"></div>
   <div class="x-popOver-content" xid="div2" style="width:100%;height:80%;"><div xid="div3" style="width:100%;background-color:white;height:100%;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row7">
   <div class="x-col" xid="col12"></div>
   <div class="x-col text-center" xid="col13"><span xid="span4" style="font-size:medium;"><![CDATA[请选择]]></span></div>
   <div class="x-col text-right" xid="col14"><i xid="i4" class="linear linear-cross text-muted" bind-click="i4Click"></i></div></div>
  <div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="mainData" style="border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#f6f6f6;">
   <ul class="x-list-template" xid="listTemplateUl1">
    <li xid="li1">
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row8" bind-click="row8Click">
   <div class="x-col" xid="col2"><span xid="span5" bind-text='val("address")' bind-css=" val(&quot;isselect&quot;) == 1 ? 'spancolor' : ''" style="font-size:medium;"></span></div>
   </div></li></ul> </div>
  
  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel2" style="margin-top:240px;">
   <div class="x-panel-content" xid="content2"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list2" data="districtData">
   <ul class="x-list-template" xid="listTemplateUl2">
    <li xid="li2">
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row9" bind-click="row9Click">
   <div class="x-col x-col-fixed text-center" xid="col15" style="width:25px;"><span xid="span8" bind-text='val("myorder")' style="font-size:medium;"></span></div>
   <div class="x-col" xid="col16"><span xid="span6" bind-text='val("name")' bind-click="span6Click" style="font-size:medium;" bind-css="$model.contrastdata( val(&quot;name&quot;)) ? 'spancolor' : ''"></span></div>
   </div></li></ul> </div></div>
   </div></div></div></div></div>