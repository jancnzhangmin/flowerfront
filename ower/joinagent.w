<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onLoad="modelLoad"> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="agentlevelData" idColumn="id"><column name="id" type="String" xid="xid1"></column>
  <column name="name" type="String" xid="xid2"></column>
  <column name="amount" type="String" xid="xid3"></column>
  <column name="task" type="String" xid="xid4"></column>
  <column name="deposit" type="String" xid="xid5"></column>
  <column name="low" type="String" xid="xid7"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="colorData" idColumn="color"><column name="color" type="String" xid="xid6"></column>
  <data xid="default1">[{&quot;color&quot;:&quot;#69aa46&quot;},{&quot;color&quot;:&quot;#a069c3&quot;},{&quot;color&quot;:&quot;#478fca&quot;}]</data></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="成为代理"
          class="x-titlebar" style="background-color:white;">
          <div class="x-titlebar-left" style="color:#333333;"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title" style="font-weight:normal;color:#333333;">成为代理</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content x-cards" xid="content1"><div component="$UI/system/components/justep/row/row" class="x-row text-muted" xid="row1">
   <div class="x-col" xid="col1"><div xid="div1" bind-html="'成为遇见玫好代理，享受相应代理等级提货价，代理提货一件包邮（东三省等偏远地区需要加收邮费），详见招商政策'"></div></div>
   </div>
  <div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="agentlevelData">
   <ul class="x-list-template" xid="listTemplateUl1">
    <li xid="li1" style="padding:10px;"><div component="$UI/system/components/justep/row/row" class="x-row x-row-center flower-row" xid="row2" style="padding:0px;">
   <div class="x-col x-col-fixed" xid="col16" style="background-color:#ff4256;height:90px;padding:0px;width:5px;"></div><div class="x-col x-col-fixed text-center" xid="col4" style="padding:0px;width:40px;"><div component="$UI/system/components/justep/row/row" class="x-row x-row-center text-center" xid="row5" style="padding:0px;">
   <div class="x-col" xid="col13" style="padding:0px;"><i xid="i1" class="my2 my2-meigui" style="font-size:xx-large;color:#ff4256;"></i></div>
   </div></div>
   <div class="x-col" xid="col5"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row3" style="padding-top:0px;padding-bottom:0px;">
   <div class="x-col" xid="col7" style="padding-top:0px;padding-bottom:0px;"><label xid="label2" style="font-size:large;font-weight:normal;" bind-text='val("name")'>label</label></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4" style="padding-top:0px;padding-bottom:0px;">
   <div class="x-col" xid="col10"><span xid="span2" bind-text="'首次预存款达到' +  val(&quot;amount&quot;) + '元' +  val(&quot;name&quot;) + '价格(支持混批，包邮)'" class="text-muted"></span></div>
   </div></div>
   </div></li></ul> </div></div>
  </div> 
<resource xid="resource2"><require xid="require1" url="css!$UI/flowerfront/icon2/my2.icons"></require></resource></div>