<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onLoad="modelLoad"> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="directagentData" idColumn="id" confirmRefresh="false"><column name="id" type="String" xid="xid1"></column>
  <column name="nickname" type="String" xid="xid2"></column>
  <column name="agentpayment" type="String" xid="xid3"></column>
  <column name="examination" type="String" xid="xid4"></column>
  <column name="headurl" type="String" xid="xid5"></column>
  <column name="name" type="String" xid="xid6"></column>
  <column name="agentlevel" type="String" xid="xid7"></column>
  <column name="phone" type="String" xid="xid8"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="直属代理"
          class="x-titlebar" style="background-color:white;">
          <div class="x-titlebar-left" style="color:#333333;"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title" style="font-weight:normal;color:#333333;">直属代理</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content x-cards  x-scroll-view" xid="content1" _xid="C87A828CB8C00001A739528AF2BC1D00"><div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView" xid="scrollView1">
   <div class="x-content-center x-pull-down container" xid="div1">
    <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i1"></i>
    <span class="x-pull-down-label" xid="span1">下拉刷新...</span></div> 
   <div class="x-scroll-content" xid="div2"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="directagentData">
   <ul class="x-list-template" xid="listTemplateUl1" style="padding-top:10px;">
    <li xid="li1" style="background-color:white;border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#f6f6f6;" bind-click="li1Click"><div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row1">
   <div class="x-col x-col-fixed" xid="col1" style="width:50px;"><img src=" " alt="" xid="image1" bind-attr-src=' val("headurl")' style="width:40px;border-radius:50%;"></img></div>
   <div class="x-col" xid="col2"><span xid="span3" bind-text=' val("nickname") + "(" +  val("name") + ")"'></span></div>
   <div class="x-col text-right" xid="col3"><a xid="a1" bind-text=' val("phone")' href='tel:{val("phone")}' bind-click="a1Click">link</a></div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row3">
   <div class="x-col x-col-fixed" xid="col7" style="width:50px;"></div>
   <div class="x-col" xid="col8"><span xid="span7"><![CDATA[代理等级]]></span></div>
   <div class="x-col text-right" xid="col9"><span xid="span8" bind-text='val("agentlevel")'></span></div></div><div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row2">
   <div class="x-col x-col-fixed" xid="col4" style="width:50px;"></div>
   <div class="x-col" xid="col5"><span xid="span5"><![CDATA[货款]]></span></div>
   <div class="x-col text-right" xid="col6"><span xid="span6" bind-text='"￥" + val("agentpayment")'></span></div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4">
   <div class="x-col x-col-fixed" xid="col10" style="width:50px;"></div>
   <div class="x-col" xid="col11"><span xid="span9"><![CDATA[已完成任务]]></span></div>
   <div class="x-col text-right" xid="col12"><span xid="span10" bind-text='"￥" + val("examination")'></span></div></div></li></ul> </div></div>
   <div class="x-content-center x-pull-up" xid="div3">
    <span class="x-pull-up-label" xid="span2">加载更多...</span></div> </div>
  </div>
  </div> 
</div>