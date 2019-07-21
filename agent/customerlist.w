<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onLoad="modelLoad"> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="customerData" idColumn="id" confirmRefresh="false"><column name="id" type="String" xid="xid1"></column>
  <column name="name" type="String" xid="xid2"></column>
  <column name="headurl" type="String" xid="xid3"></column>
  <column name="sale" type="String" xid="xid4"></column>
  <column name="ordercount" type="String" xid="xid5"></column>
  <column name="follow" type="String" xid="xid6"></column>
  <column name="created_at" type="String" xid="xid7"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="客户"
          class="x-titlebar" style="background-color:white;">
          <div class="x-titlebar-left" style="color:#333333;"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title" style="font-weight:normal;color:#333333;">客户</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content x-cards  x-scroll-view" xid="content1" _xid="C885EFC820F0000116FBEDC017D01346"><div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView" xid="scrollView1">
   <div class="x-content-center x-pull-down container" xid="div1">
    <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i1"></i>
    <span class="x-pull-down-label" xid="span1">下拉刷新...</span></div> 
   <div class="x-scroll-content" xid="div2" style="padding-top:10px;"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="customerData">
   <ul class="x-list-template" xid="listTemplateUl1">
    <li xid="li1" style="background-color:white;padding-top:5px;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
   <div class="x-col x-col-fixed" xid="col1" style="width:70px;"><div xid="div4"><img src=" " alt="" xid="image1" style="width:60px;border-radius:5px;" bind-attr-src=' val("headurl")' height="60px"></img></div>
  <div xid="div5"><span xid="span3" style="background-color:#dddddd;font-size:x-small;" class="text-muted" bind-visible=' val("follow") == 0'><![CDATA[未关注公众号]]></span></div></div>
   <div class="x-col" xid="col2" style="padding-top:0px;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row2" style="padding-top:0px;padding-bottom:0px;">
   <div class="x-col" xid="col4"><span xid="span4" bind-text='val("name")' style="font-size:large;"></span></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3" style="padding-top:0px;padding-bottom:0px;">
   <div class="x-col" xid="col7"><span xid="span5" style="color:#ff4256;"><![CDATA[成单：0]]></span><label xid="label1" style="width:20px;"><![CDATA[]]></label><span xid="span6" style="color:#ff4256;"><![CDATA[消费：￥0.00]]></span>
  </div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4">
   <div class="x-col" xid="col10"><span xid="span7" bind-text="'加入时间：' +  val(&quot;created_at&quot;)" class="text-muted"><![CDATA[加入时间：]]></span></div>
   </div></div>
   </div>
  <hr xid="hr3" style="margin:0px;margin-left:80px;border-top: 1px solid #f6f6f6;"></hr></li></ul> </div></div>
   <div class="x-content-center x-pull-up" xid="div3">
    <span class="x-pull-up-label" xid="span2">加载更多...</span></div> </div>
  </div>
  </div> 
</div>