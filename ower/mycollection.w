<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onLoad="modelLoad"> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="productData" idColumn="id">
   <column name="id" type="String" xid="xid1"></column>
  <column name="name" type="String" xid="xid2"></column>
  <column name="price" type="String" xid="xid3"></column>
  <column name="unit" type="String" xid="xid4"></column>
  <column name="spec" type="String" xid="xid5"></column>
  <column name="pinyin" type="String" xid="xid6"></column>
  <column name="fullpinyin" type="String" xid="xid7"></column>
  <column name="subtitle" type="String" xid="xid8"></column>
  <column name="cover" type="String" xid="xid9"></column>
  <column name="odd" type="String" xid="xid10"></column>
  <column name="discount" type="String" xid="xid11"></column>
  <column name="collection" type="String" xid="xid12"></column>
  <column name="displaysale" type="String" xid="xid13"></column>
  <column name="salecount" type="String" xid="xid14"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="我的收藏"
          class="x-titlebar" style="background-color:white;">
          <div class="x-titlebar-left" style="color:#333333;"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title" style="font-weight:normal;color:#333333;">我的收藏</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content x-cards" xid="content1"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="productData" style="margin-top:-10px;" onAfterRender="list1AfterRender">
   <ul class="x-list-template" xid="listTemplateUl1">
    <div xid="div25" class="col-xs-6 col-sm-4" bind-css="val(&quot;odd&quot;) == 0 ? 'ev' : 'od'" style="padding-top:5px;padding-bottom:5px;" bind-click="div25Click">
     <div xid="div24" style="border-radius:5px 5px 0px 0px;overflow: hidden;background-color:#eaeaea;" class="imagediv">
      
      <img src=" " alt="" xid="image13" bind-attr-src=' val("cover")' style="width:100%;"></img><i xid="i5" style="position:relative;font-size:x-large;margin-top:-30px;margin-right:10px;" bind-click="i5Click" bind-css='val("collection") == 1 ? "my my-xinxingshi" : "my my-xinxingxian"' class="follow pull-right btnclass"></i></div> 
     <div xid="div28" style="background-color:white;padding-bottom:5px;border-radius: 0 0 5px 5px;">
      <div xid="div26" style="padding-top:10px;padding-left:10px;">
       <span xid="span21" bind-text='val("name")' style="font-size:medium;"></span></div> 
      <div xid="div27" style="padding-left:10px;">
       <span xid="span22" bind-text='val("subtitle")' style="background-color:white;font-size:small;" class="text-muted"></span></div> 
      <div xid="div29" style="padding-left:10px;padding-right:5px;">
       <span xid="span23" bind-text="'￥' + val(&quot;price&quot;)" style="font-size:large;color:#fe2e23;"></span>
       <span xid="span24" style="font-size:x-small;background-color:#ffeae9;color:#fe2e23;font-weight:lighter;padding:1px;border-radius:3px;" bind-text="'省' + val(&quot;discount&quot;) + '元'" bind-visible=' val("discount") &gt; 0'></span>
       <span xid="span25" class="pull-right text-muted" style="font-size:x-small;font-weight:lighter;margin-top:9px;" bind-visible=' val("displaysale") == 1' bind-text="'已售' +  val(&quot;salecount&quot;) + '件'">已售100件</span></div> </div> </div> </ul> </div></div>
  </div> 
</div>