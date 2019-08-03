<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onLoad="modelLoad" onParamsReceive="modelParamsReceive"> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="productData" idColumn="id"><column name="id" type="String" xid="xid1"></column>
  <column name="name" type="String" xid="xid2"></column>
  <column name="price" type="String" xid="xid3"></column>
  <column name="discount" type="String" xid="xid4"></column>
  <column name="unit" type="String" xid="xid5"></column>
  <column name="spec" type="String" xid="xid6"></column>
  <column name="images" type="String" xid="xid7"></column>
  <column name="subtitle" type="String" xid="xid14"></column>
  <column name="weight" type="String" xid="xid15"></column>
  <column name="brand" type="String" xid="xid16"></column>
  <column name="pack" type="String" xid="xid17"></column>
  <column name="season" type="String" xid="xid18"></column>
  <column name="cover" type="String" xid="xid25"></column>
  <column name="baseprice" type="String" xid="xid29"></column>
  <column name="content" type="String" xid="xid30"></column>
  <column name="agentprice" type="String" xid="xid42"></column>
  <column name="baseagentprice" type="String" xid="xid43"></column>
  <column name="shelflife" type="String" xid="xid44"></column>
  <column name="displaysale" type="String" xid="xid45"></column>
  <column name="salecount" type="String" xid="xid46"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="activetypeData" idColumn="id"><column name="id" type="String" xid="xid12"></column>
  <column name="active" type="String" xid="xid8"></column>
  <column name="showlable" type="String" xid="xid9"></column>
  <column name="summary" type="String" xid="xid10"></column>
  <column name="keywords" type="String" xid="xid11"></column>
  <column name="icon" type="String" xid="xid13"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="optionalData" idColumn="id"><column name="id" type="String" xid="xid19"></column>
  <column name="name" type="String" xid="xid20"></column>
  <column name="selectcondition_id" type="String" xid="xid26"></column>
  <column name="selectcondition_name" type="String" xid="xid27"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="conditionData" idColumn="id"><column name="id" type="String" xid="xid21"></column>
  <column name="optional_id" type="String" xid="xid22"></column>
  <column name="name" type="String" xid="xid23"></column>
  <column name="weighting" type="String" xid="xid24"></column>
  <column name="isselect" type="String" xid="xid28"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="explainData" idColumn="id"><column name="id" type="String" xid="xid31"></column>
  <column name="name" type="String" xid="xid32"></column>
  <column name="explain" type="String" xid="xid33"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="commentimgData" idColumn="id"><column name="id" type="String" xid="xid34"></column>
  <column name="commentimg" type="String" xid="xid35"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="usercommentData" idColumn="id"><column name="id" type="String" xid="xid36"></column>
  <column name="nickname" type="String" xid="xid37"></column>
  <column name="headurl" type="String" xid="xid38"></column>
  <column name="comment" type="String" xid="xid39"></column>
  <column name="anonymous" type="String" xid="xid40"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="product_tuijian_Data" idColumn="id">
   <column name="id" type="String" xid="column1"></column>
  <column name="name" type="String" xid="column2"></column>
  <column name="price" type="String" xid="column3"></column>
  <column name="unit" type="String" xid="column4"></column>
  <column name="spec" type="String" xid="column2"></column>
  <column name="pinyin" type="String" xid="column3"></column>
  <column name="fullpinyin" type="String" xid="column4"></column>
  <column name="subtitle" type="String" xid="column5"></column>
  <column name="cover" type="String" xid="column6"></column>
  <column name="odd" type="String" xid="column7"></column>
  <column name="discount" type="String" xid="column8"></column>
  <column name="collection" type="String" xid="column9"></column>
  <column name="displaysale" type="String" xid="xid47"></column>
  <column name="salecount" type="String" xid="xid48"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="agentstatusData" idColumn="status"><column name="status" type="String" xid="xid41"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1" bind-touchend="panel1Touchend"> 
      <div class="x-panel-top" xid="top1" height="45" style="z-index:10;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1" style="padding:0px;background-color:white;opacity:0;">
   <div class="x-col x-col-fixed" xid="col1" style="padding:0px;width:50px;padding-top:5px;"></div>
   <div class="x-col" xid="col2" style="padding:0px;"><div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified x-flower" tabbed="true" xid="buttonGroup1">
   <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="产品" xid="button2" onClick="button2Click">
    <i xid="i2"></i>
    <span xid="span2">产品</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="详情" xid="button3" onClick="button3Click">
    <i xid="i3"></i>
    <span xid="span3">详情</span></a> 
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="评价" xid="button5" onClick="button5Click">
   <i xid="i5"></i>
   <span xid="span5">评价</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="推荐" xid="button6" onClick="button6Click">
   <i xid="i6"></i>
   <span xid="span6">推荐</span></a></div></div>
   <div class="x-col x-col-fixed" xid="col3" style="width:50px;padding-top:6px;"></div></div>
  <div xid="div15" class="moveback" style="margin-left:8px;" bind-click="{operation:'window.close'}"><i xid="i16" class="icon-chevron-left" style="color:#f0f0f0;font-size:medium;" bind-click="{operation:'window.close'}"></i></div>
  <div xid="div12" class="moveback pull-right" style="margin-top:-34px;margin-right:8px;padding-left:8px;"><i xid="i1" class="my my-ziyuan" style="color:#f0f0f0;font-size:medium;" bind-click="i1Click"></i></div></div>  
    <div class="x-panel-content x-cards" xid="content1" style="padding-top:0px;margin-top:-45px;" bind-touchmove="content1Touchmove" bind-touchend="content1Touchend"><a xid="a1" name="product"><![CDATA[]]></a><div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="productSmartContainer" style="background-color:white;"><div xid="productdetailswiper" class="swiper-container"><div xid="productdetailswiperwrapper" class="swiper-wrapper"></div><div xid="div1" class="swiper-pagination swiper-pagination-pink"></div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2">
   <div class="x-col x-col-fixed" xid="col4" style="width:110px;">
  <div xid="div3" style="margin-left:-5px;"><span xid="span7" bind-text="'￥' + $model.productData.val(&quot;price&quot;)" style="color:#fe2e23;font-size:x-large;" bind-visible=' $model.productData.val("price") != undefined'><![CDATA[]]></span></div>
  <div xid="div4" style="margin-top:-5px;"><span xid="span10" bind-text="'代理 ￥'+  $model.productData.val(&quot;agentprice&quot;)" style="background-color:#ffeae9;color:#fe2e23;font-weight:lighter;padding:1px;border-radius:3px;" bind-visible=' $model.agentstatusData.val("status") == 1'><![CDATA[]]></span></div></div>
   <div class="x-col" xid="col6" style="padding-top:12px;"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="activetypeData">
   <ul class="x-list-template" xid="listTemplateUl1">
    <span xid="span24" style="font-size:x-small;background-color:#ffeae9;color:#fe2e23;font-weight:lighter;padding:1px;border-radius:3px;" bind-text='val("active")'></span></ul> </div></div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3">
   <div class="x-col" xid="col9"><span xid="span11" bind-text='$model.productData.val("name")' style="font-size:medium;"></span></div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4">
   <div class="x-col" xid="col10"><span xid="span12" bind-text="'品牌：' +  $model.productData.val(&quot;brand&quot;)" class="text-muted"></span></div>
   <div class="x-col text-center" xid="col11" bind-click="col11Click"><span xid="span13" class="text-muted"><![CDATA[快递：免邮]]></span>
  <i xid="i7" class="icon-ios7-help-outline text-muted" style="font-size:medium;"></i></div>
   <div class="x-col text-right" xid="col12"><span xid="span14" class="text-muted" bind-visible=' $model.productData.val("displaysale")  == 1' bind-text="'已售：' +  $model.productData.val(&quot;salecount&quot;) + '件'"><![CDATA[]]></span></div></div>
  <div xid="div5" style="border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#f6f6f6;margin-left:10px;"></div><div component="$UI/system/components/justep/list/list" class="x-list" xid="list2" data="activetypeData">
   <ul class="x-list-template" xid="listTemplateUl2">
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5" style="padding-top:0px;padding-bottom:0px;">
   <div class="x-col x-col-fixed" xid="col13" style="width:20px;"><i xid="i8" style="color:#ff4256;" bind-css='val("icon")'></i></div>
   <div class="x-col" xid="col15"><span xid="span15" bind-text='val("summary")'></span></div></div></ul> 
  </div>
  <div xid="div6" style="border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#f6f6f6;margin-left:10px;display:none;"></div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row6">
   <div class="x-col" xid="col5"><span xid="span16" class="text-muted"><![CDATA[规格：]]></span><span xid="span8" bind-text='$model.productData.val("spec")'></span>
  </div>
   <div class="x-col text-right" xid="col7"><span xid="span17" class="text-muted"><![CDATA[净含量：]]></span>
  <span xid="span18" bind-text='$model.productData.val("weight")'></span></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row7">
   <div class="x-col" xid="col16">
    <span xid="span22" class="text-muted"><![CDATA[单位：]]></span>
    <span xid="span21" bind-text='$model.productData.val("unit")'></span></div> 
   <div class="x-col text-right" xid="col14">
    <span xid="span20" class="text-muted"><![CDATA[保质期：]]></span>
    <span xid="span19" bind-text='$model.productData.val("shelflife")'></span></div> </div>
  </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="chooserow" style="margin-top:10px;background-color:white;padding-top:10px;padding-bottom:0px;display:none;" bind-click="chooserowClick">
   <div class="x-col x-col-fixed" xid="col17" style="width:45px;"><span xid="span23" class="text-muted"><![CDATA[选择]]></span></div>
   <div class="x-col" xid="col19"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list3" data="optionalData">
   <ul class="x-list-template" xid="listTemplateUl3">
    <span xid="span25" bind-text='val("selectcondition_name")'></span></ul> 
  </div></div>
  <div class="x-col x-col-fixed text-right" xid="col20" style="width:20px;"><i xid="i9" class="linear linear-chevronright text-muted"></i></div></div>
  <div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="smartContainer2" style="background-color:white;margin-top:10px;padding-bottom:10px;" bind-click="smartContainer2Click"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row11">
   <div class="x-col" xid="col29"><![CDATA[]]>
  <span xid="span36"><![CDATA[买家相册(0)]]></span></div>
   <div class="x-col" xid="col30"></div>
   <div class="x-col text-right" xid="col31" style="padding-right:0px;"><span xid="span38" style="color:#ff4256;"><![CDATA[查看全部]]></span>
  <i xid="i14" class="linear linear-chevronright" style="color:#ff4256;"></i></div></div>
  <div component="$UI/system/components/justep/list/list" class="x-list" xid="list8" data="commentimgData" onAfterRender="list8AfterRender">
   <ul class="x-list-template" xid="listTemplateUl8" style="margin-left:10px;margin-right:10px;border-radius: 10px;overflow: hidden;">
    <div xid="div21" class="col-xs-3 col-sm-3 commentimgdiv" style="padding:1px;overflow: hidden;"><img src=" " alt="" xid="image6" bind-attr-src=' val("commentimg")' style="width:100%;" align="middle" bind-load="image6Load"></img></div></ul> 
  </div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row13">
   <div class="x-col" xid="col36"><span xid="span40"></span></div>
   <div class="x-col text-center" xid="col37"><span xid="span39" class="text-muted"><![CDATA[商品详情]]></span></div>
   <div class="x-col" xid="col38"></div></div>
  <div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="smartContainer3" style="background-color:white;padding:10px;"><div xid="contentdiv"></div></div>
  <div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="comment_smartContainer" style="background-color:white;margin-top:10px;padding-bottom:10px;" bind-click="comment_smartContainerClick"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row12">
   <div class="x-col" xid="col32">
    <span xid="span47"><![CDATA[评价(0)]]></span></div> 
   <div class="x-col" xid="col34"></div>
   <div class="x-col text-right" xid="col33" style="padding-right:0px;">
    <span xid="span48" style="color:#ff4256;">查看全部</span>
    <i xid="i19" class="linear linear-chevronright" style="color:#ff4256;"></i></div> </div>
  <div component="$UI/system/components/justep/list/list" class="x-list" xid="list10" data="usercommentData">
   <ul class="x-list-template" xid="listTemplateUl9">
    <div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row19">
   <div class="x-col x-col-fixed" xid="col35" style="width:30px;"><img src=" " alt="" xid="image2" style="border-radius: 50%;width:25px;" bind-attr-src=' val("headurl")' bind-visible=' val("anonymous") != 1'></img>
  <i xid="i20" class="my2 my2-niming text-muted" style="font-size:large;" bind-visible=' val("anonymous") == 1'></i></div>
   <div class="x-col" xid="col43"><span xid="span49" bind-text=" val(&quot;anonymous&quot;) == 1 ? '匿名' :  val(&quot;nickname&quot;)" class="text-muted"></span></div>
   </div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row20" style="padding-top:0px;">
   <div class="x-col" xid="col47" style="padding-top:0px;"><span xid="span50" bind-text='val("comment")' class="textout"></span></div>
   </div></ul> 
  </div></div><div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="explain_smartContainer" style="background-color:white;margin-top:10px;"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list7" data="explainData">
   <ul class="x-list-template" xid="listTemplateUl7">
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row14">
   <div class="x-col" xid="col27"><span xid="span1" bind-text='val("name")'></span></div>
   </div><div xid="explain_div" bind-html=' val("explain")' style="padding:10px;"></div></ul> 
  </div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row21" style="padding-bottom:0px;">
   <div class="x-col" xid="col49">
    <span xid="span51"></span></div> 
   <div class="x-col text-center" xid="col48">
    <span xid="span52" class="text-muted"><![CDATA[推荐商品]]></span></div> 
   <div class="x-col" xid="col44"></div></div>
  <div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="tuijian_smartContainer"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list9" data="product_tuijian_Data" style="margin-top:-10px;">
   <ul class="x-list-template" xid="listTemplateUl10">
    <div xid="div25" class="col-xs-4 col-sm-4" style="padding:5px;padding-top:5px;padding-bottom:5px;" bind-click="div25Click">
     <div xid="div24" style="border-radius:5px 5px 0px 0px;overflow: hidden;background-color:#eaeaea;" class="imagediv">
      <img src=" " alt="" xid="image13" bind-attr-src=' val("cover")' style="width:100%;"></img>
      </div> 
     <div xid="div28" style="background-color:white;padding-bottom:5px;border-radius: 0 0 5px 5px;">
      <div xid="div26" style="padding-top:10px;padding-left:10px;">
       <span xid="span55" bind-text='val("name")' style="font-size:small;"></span></div> 
      <div xid="div27" style="padding-left:10px;">
       <span xid="span57" bind-text='val("subtitle")' style="background-color:white;font-size:small;" class="text-muted" bind-visible="false"></span></div> 
      <div xid="div29" style="padding-left:10px;padding-right:5px;">
       <span xid="span56" bind-text="'￥' + val(&quot;price&quot;)" style="font-size:large;color:#fe2e23;"></span>
       <span xid="span54" style="font-size:x-small;background-color:#ffeae9;color:#fe2e23;font-weight:lighter;padding:1px;border-radius:3px;" bind-text="'省' + val(&quot;discount&quot;) + '元'" bind-visible=' val("discount") &gt; 0'></span>
       <span xid="span53" class="pull-right text-muted" style="font-size:x-small;font-weight:lighter;margin-top:9px;" bind-visible=' val("displaysale") == 1' bind-text="'已售' +  val(&quot;salecount&quot;) + '件'">已售100件</span></div> </div> </div> </ul> </div></div></div>
  <div class="x-panel-bottom" xid="bottom1" height="50" style="border-top-style:solid;border-top-width:1px;border-top-color:#f6f6f6;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row9" style="padding:0px;">
   <div class="x-col x-col-20 text-center" xid="col21" style="padding:0px;"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="客服" xid="button7" icon="my my-shouhou1" style="font-size:small;color:#555555;margin-top:-8px;">
   <i xid="i10" class="my my-shouhou1" style="font-size:x-large;color:#fe2e23;"></i>
   <span xid="span27">客服</span></a>
  <label xid="label1" style="height:30px;border-right-style:solid;border-right-width:1px;border-right-color:#f6f6f6;margin-top:10px;" class="pull-right"><![CDATA[]]></label></div>
   <div class="x-col x-col-20 text-center" xid="col22" style="padding:0px;"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="收藏" xid="collectionBtn" icon="my my-xinxingxian" style="font-size:small;color:#555555;margin-top:-8px;" onClick="collectionBtnClick">
   <i xid="i11" class="my my-xinxingxian" style="font-size:x-large;color:#fe2e23;"></i>
   <span xid="span28">收藏</span></a></div>
   <div class="x-col text-center" xid="col23" style="background: linear-gradient(to bottom,#ffcb7a,#ff9c50);padding:0px;padding-top:13px;" bind-click="col23Click"><span xid="span29" style="color:#FFFFFF;font-size:medium;"><![CDATA[加入购物车]]></span></div>
  <div class="x-col text-center" xid="col24" style="background: linear-gradient(to bottom,#ff6ca0,#ff4256);padding:0px;padding-top:13px;" bind-click="col24Click"><span xid="span30" style="color:#FFFFFF;font-size:medium;"><![CDATA[立即购买]]></span></div></div></div></div> 
<resource xid="resource2"><require xid="require1" url="css!$UI/flowerfront/icon/my.icons"></require>
  <require xid="require2" url="css!$UI/flowerfront/icon2/my2.icons"></require>
  </resource>
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver" direction="auto" xid="choosepop" position="bottom">
   <div class="x-popOver-overlay" xid="div7"></div>
   <div class="x-popOver-content" xid="div8" style="height:70%;width:100%;"><div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer smartradius" xid="smartContainer1" style="background-color:white;height:100%;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row8">
   <div class="x-col x-col-33" xid="col8"><img src=" " alt="" xid="image1" bind-attr-src=' $model.productData.val("cover")' style="width:100%;"></img></div>
   <div class="x-col x-col-bottom" xid="col18">
  
  <div xid="div10"><span xid="span26" bind-text="'￥' + $model.productData.val(&quot;agentprice&quot;)" style="color:#fe2e23;font-size:x-large;margin-left:-5px;"></span></div><div xid="div11">
  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row10" style="padding:0px;">
   <div class="x-col x-col-fixed" xid="col26" style="padding:0px;width:40px;"><span xid="span31"><![CDATA[选择]]></span></div>
   <div class="x-col" xid="col28" style="padding:0px;"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list4" data="optionalData">
   <ul class="x-list-template" xid="listTemplateUl4" style="margin-bottom:0px;">
    <span xid="span32" bind-text='val("selectcondition_name")'></span></ul> 
  </div></div></div></div></div>
   <div class="x-col x-col-fixed" xid="col25" style="width:40px;padding-top:0px;padding-left:0px;"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="closepopbtn" icon="linear linear-crosscircle" style="margin-top:-10px;color:#C0C0C0;" onClick="closepopbtnClick">
   <i xid="i12" class="linear linear-crosscircle" style="font-size:x-large;"></i>
   <span xid="span33"></span></a></div></div>
  <div component="$UI/system/components/justep/list/list" class="x-list" xid="list5" data="optionalData">
   <ul class="x-list-template" xid="listTemplateUl5">
    <div xid="div13" style="border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#f6f6f6;margin-left:10px;margin-bottom:5px;margin-top:10px;"></div><span xid="span34" bind-text='val("name")' style="margin-left:10px;font-size:medium;"></span><div component="$UI/system/components/justep/list/list" class="x-list" xid="list6" data="$model.conditionData" filter=' $row.val("optional_id") == val("id")' style="margin-top:5px;">
   <ul class="x-list-template" xid="listTemplateUl6" style="padding-top:10px;padding-bottom:10px;">
    <span xid="span35" bind-text='val("name")' bind-css=' val("isselect") == 1 ? "hasselect" : "noselect"' style="margin-left:10px;font-size:small;" bind-click="span35Click"></span></ul> 
  </div></ul> </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row15">
   <div class="x-col" xid="col39"><span xid="span37"><![CDATA[购买数量]]></span></div>
   <div class="x-col text-right" xid="col40"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-sm btn-only-icon addbtn" label="button" xid="subBtn" icon="icon-android-remove" onClick="subBtnClick">
   <i xid="i4" class="icon-android-remove"></i>
   <span xid="span41"></span></a>
  <label xid="numberlabel" style="font-weight:normal;width:30px;" class="text-center"><![CDATA[1]]></label>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-sm btn-only-icon addbtn" label="button" xid="addBtn" icon="icon-android-add" onClick="addBtnClick">
   <i xid="i13" class="icon-android-add"></i>
   <span xid="span42"></span></a></div>
   </div>
  
  <div xid="popdiv" style="position:absolute;left:0px;bottom:0px;width:100%;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row16">
   <div class="x-col" xid="col42"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-block surebtn" label="确定" xid="popBtn" onClick="popBtnClick">
   <i xid="i15"></i>
   <span xid="span43">确定</span></a></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row17">
   <div class="x-col" xid="col45" style="padding-right:0px;"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-block popaddcar" label="加入购物车" xid="popaddcarBtn" onClick="popaddcarBtnClick">
   <i xid="i17"></i>
   <span xid="span44">加入购物车</span></a></div>
   <div class="x-col" xid="col46" style="padding-left:0px;"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-block popbuy" label="立即购买" xid="popbuyBtn" onClick="popbuyBtnClick">
   <i xid="i18"></i>
   <span xid="span45">立即购买</span></a></div>
   </div></div></div></div></div>
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu" direction="auto" xid="popMenu1">
   <div class="x-popMenu-overlay" xid="div9"></div>
   <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content" xid="menu1"></ul></div>
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver" direction="auto" xid="ems_popOver" opacity="0">
   <div class="x-popOver-overlay" xid="div16"></div>
   <div class="x-popOver-content" xid="div17">
  <div xid="div19" style="padding:20px;"><div xid="div18" class="popback text-center" style="padding:10px;"><span xid="span4" style="color:#FFFFFF;"><![CDATA[免费包邮北京、青海、新疆地区等需要增加邮费，其它地区包邮，可能香港、台湾也不会包邮的，亲]]></span></div></div></div></div>
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver" direction="auto" xid="subscribe_popOver">
   <div class="x-popOver-overlay" xid="div14"></div>
   <div class="x-popOver-content text-center" xid="div20" style="width:100%;"><img src=" " alt="" xid="sysqrimg" style="width:60%;"></img>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row18">
   <div class="x-col text-center" xid="col41"><span xid="span46"><![CDATA[长按二维码识别关注公众号后继续]]></span></div>
   </div></div></div>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog1"></span>
  <div component="$UI/system/components/justep/windowContainer/windowContainer" class="x-window-container" xid="windowContainer1"></div></div>