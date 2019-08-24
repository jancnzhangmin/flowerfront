<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onLoad="modelLoad"> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="claData" idColumn="id"><column name="id" type="String" xid="xid1"></column>
  <column name="name" type="String" xid="xid2"></column>
  <column name="keyword" type="String" xid="xid3"></column>
  <column name="isselect" type="String" xid="xid4"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="productData" idColumn="id">
   <column name="id" type="String" xid="column1"></column>
  <column name="name" type="String" xid="column2"></column>
  <column name="price" type="String" xid="column3"></column>
  <column name="unit" type="String" xid="column4"></column>
  <column name="spec" type="String" xid="xid5"></column>
  <column name="pinyin" type="String" xid="xid6"></column>
  <column name="fullpinyin" type="String" xid="xid7"></column>
  <column name="subtitle" type="String" xid="xid8"></column>
  <column name="cover" type="String" xid="xid9"></column>
  <column name="odd" type="String" xid="xid10"></column>
  <column name="discount" type="String" xid="xid11"></column>
  <column name="collection" type="String" xid="xid12"></column>
  <column name="agentprice" type="String" xid="xid14"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="agentstatusData" idColumn="status"><column name="status" type="String" xid="xid13"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="searchData" idColumn="id">
   <column name="id" type="String" xid="column5"></column>
  <column name="name" type="String" xid="column6"></column>
  <column name="price" type="String" xid="xid15"></column>
  <column name="unit" type="String" xid="xid16"></column>
  <column name="spec" type="String" xid="xid17"></column>
  <column name="pinyin" type="String" xid="xid18"></column>
  <column name="fullpinyin" type="String" xid="xid19"></column>
  <column name="subtitle" type="String" xid="xid20"></column>
  <column name="cover" type="String" xid="xid21"></column>
  <column name="agentprice" type="String" xid="xid22"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="activetypeData" idColumn="id">
   <column name="id" type="String" xid="xid31"></column>
   <column name="product_id" type="String" xid="xid32"></column>
   <column name="active" type="String" xid="xid33"></column>
   <column name="showlable" type="String" xid="xid34"></column>
   <column name="summary" type="String" xid="xid35"></column>
   <column name="keywords" type="String" xid="xid36"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="全部商品"
          class="x-titlebar" style="background-color:white;">
          <div class="x-titlebar-left"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title" style="font-weight:normal;color:#333333;">全部商品</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content x-cards" xid="content1" style="padding-top:0px;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row5" style="padding-top:0px;padding-bottom:0px;">
   <div class="x-col" xid="col17">
    <div class="form-group has-feedback text-muted" xid="formGroup1" style="margin-bottom:0px;">
     <i class="icon-ios7-search-strong form-control-feedback" xid="col1" style="left:0;font-size:large;"></i>
     <input component="$UI/system/components/justep/input/input" class="form-control x-inputText" xid="key" bind-click="keyClick"></input></div> </div> 
   </div>
  <div component="$UI/system/components/bootstrap/row/row" class="row tb-box" xid="row1" style="height:100%;">
   <div class="col col-xs-3 text-center" xid="col2" style="background-color:#ff5b7a;padding-right:0px;"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="claData">
   <ul class="x-list-template" xid="listTemplateUl1">
    <li xid="li1" style="padding-top:15px;padding-bottom:15px;" bind-css=" val(&quot;isselect&quot;) == 1 ? 'hasselect' : 'noselect'" bind-click="li1Click"><span xid="span1" bind-text='val("name")'></span></li></ul> </div></div>
   <div class="col col-xs-9" xid="col3"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row2" style="padding-top:0px;">
   <div class="x-col" xid="col4" style="padding-top:0px;"><img src="$UI/flowerfront/image/product_top.png" alt="" xid="image1" style="width:100%;"></img></div>
   </div><div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row3" style="padding-bottom:0px;">
   <div class="x-col text-right" xid="col7"><label xid="label1" style="width:70%;height:1px;border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#C0C0C0;"><![CDATA[]]></label></div>
   <div class="x-col text-center" xid="col8"><span xid="span2" class="text-muted"></span></div>
   <div class="x-col" xid="col9"><label xid="label2" style="width:70%;height:1px;border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#C0C0C0;"></label></div></div><div component="$UI/system/components/justep/list/list" class="x-list" xid="list2" data="productData" style="margin-top:-10px;" onAfterRender="list1AfterRender">
   <ul class="x-list-template" xid="listTemplateUl2" style="padding-right:5px;">
    <div xid="div25" class="col-xs-6 col-sm-4" bind-css="val(&quot;odd&quot;) == 0 ? 'ev' : 'od'" style="padding-top:5px;padding-bottom:5px;" bind-click="div25Click">
     <div xid="div24" style="border-radius:5px 5px 0px 0px;overflow: hidden;background-color:#eaeaea;" class="imagediv">
      <img src=" " alt="" xid="image13" bind-attr-src=' val("cover")' style="width:100%;"></img>
      <i xid="i5" style="position:relative;font-size:x-large;margin-top:-30px;margin-right:10px;" bind-click="i5Click" bind-css='val("collection") == 1 ? "my my-xinxingshi" : "my my-xinxingxian"' class="follow pull-right btnclass"></i>
  <div xid="ribbondiv" class="wrap" style="display:none;" bind-visible=' $model.active_showlable( val("id"))'>
   <span xid="ribbonspan" class="ribbon ribbon-ef" bind-text=' $model.active_text( val("id"))'>预售</span></div></div> 
     <div xid="div28" style="background-color:white;padding-bottom:5px;border-radius: 0 0 5px 5px;">
      <div xid="div26" style="padding-top:10px;padding-left:10px;">
       <span xid="span21" bind-text='val("name")' style="font-size:medium;"></span></div> 
      <div xid="div27" style="padding-left:10px;">
       <span xid="span22" bind-text='val("subtitle")' style="background-color:white;font-size:small;" class="text-muted" bind-visible="false"></span></div> 
      <div xid="div29" style="padding-left:10px;padding-right:5px;">
       <span xid="span23" bind-text="'￥' + val(&quot;price&quot;)" style="font-size:large;color:#fe2e23;"></span>
       <span xid="span24" style="font-size:small;background-color:#ffeae9;color:#fe2e23;font-weight:lighter;padding:1px;border-radius:3px;" bind-text="'代理 ￥' + val(&quot;agentprice&quot;)" bind-visible=' $model.agentstatusData.val("status") == 1'></span>
       </div> </div> </div> </ul> </div>
  </div>
   </div></div>
  </div> 
<div component="$UI/system/components/justep/popOver/popOver" class="x-popOver" direction="auto" xid="serachpopOver" opacity="1" position="bottom">
   <div class="x-popOver-overlay" xid="div30" style="background-color:#f6f6f6;"></div>
   <div class="x-popOver-content" xid="div31" style="width:100%;height:100%;">
    <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel2">
     <div class="x-panel-top" xid="top2">
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row7" style="position:absolute;">
       <div class="x-col" xid="col21">
        <div class="form-group has-feedback text-muted" xid="formGroup2">
         <i class="icon-ios7-search-strong form-control-feedback" xid="col22" style="left:0;font-size:large;"></i>
         <input component="$UI/system/components/justep/input/input" class="form-control x-inputText" xid="searchinput" bind-keyup="searchinputKeyup"></input></div> </div> 
       <div class="x-col x-col-fixed" xid="col20" style="padding-left:0px;width:60px;">
        <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="取消" xid="cancelsearchBtn" style="color:#333333;" onClick="cancelsearchBtnClick">
         <i xid="i7"></i>
         <span xid="span27">取消</span></a> </div> </div> </div> 
     <div class="x-panel-content x-cards" xid="content2">
      <div component="$UI/system/components/justep/list/list" class="x-list" xid="list3" data="searchData">
       <ul class="x-list-template" xid="listTemplateUl3">
        <div xid="div33" style="border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#f6f6f6;" bind-click="div33Click">
         <div component="$UI/system/components/justep/row/row" class="x-row" xid="row8" style="background-color:white;">
          <div class="x-col x-col-25" xid="col23">
           <div xid="div32" style="border-radius:5px;    overflow: hidden;">
            <img src=" " alt="" xid="image14" bind-attr-src=' val("cover")' style="width:100%;"></img></div> </div> 
          <div class="x-col" xid="col24" style="padding:0px;">
           <div component="$UI/system/components/justep/row/row" class="x-row" xid="row9">
            <div class="x-col" xid="col26">
             <span xid="span26" bind-text='val("name")'></span>
             <span xid="span28" bind-text='val("subtitle")'></span></div> </div> 
           <div component="$UI/system/components/justep/row/row" class="x-row" xid="row11" style="padding-top:0px;padding-bottom:0px;">
   <div class="x-col" xid="col5">
    <div component="$UI/system/components/justep/list/list" class="x-list" xid="list4" data="activetypeData" filter=' $row.val("product_id") == val("id")'>
     <ul class="x-list-template" xid="listTemplateUl4">
      <span xid="span14" style="font-size:x-small;background-color:#ffeae9;color:#fe2e23;font-weight:lighter;padding:1px;border-radius:3px;" bind-text='val("active")'></span></ul> </div> </div> </div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row10">
            <div class="x-col" xid="col29">
             <span xid="span29" bind-text="'￥' + val(&quot;price&quot;)" style="font-size:large;color: #fe2e23;"></span>
  <span xid="span30" style="font-size:small;background-color:#ffeae9;color:#fe2e23;font-weight:lighter;padding:1px;border-radius:3px;" bind-visible=' $model.agentstatusData.val("status") == 1' bind-text="'代理 ￥' + val(&quot;agentprice&quot;)"></span></div> </div> 
  </div> </div> </div> </ul> </div> </div> </div> </div> </div></div>