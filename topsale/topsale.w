<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onLoad="modelLoad" onActive="modelActive"> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="productData" idColumn="id"><column name="id" type="String" xid="xid1"></column>
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
  <column name="agentprice" type="String" xid="xid22"></column>
  <column name="displaysale" type="String" xid="xid29"></column>
  <column name="salecount" type="String" xid="xid30"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="searchData" idColumn="id"><column name="id" type="String" xid="xid13"></column>
  <column name="name" type="String" xid="xid14"></column>
  <column name="price" type="String" xid="xid15"></column>
  <column name="unit" type="String" xid="xid16"></column>
  <column name="spec" type="String" xid="xid17"></column>
  <column name="pinyin" type="String" xid="xid18"></column>
  <column name="fullpinyin" type="String" xid="xid19"></column>
  <column name="subtitle" type="String" xid="xid20"></column>
  <column name="cover" type="String" xid="xid21"></column>
  <column name="agentprice" type="String" xid="xid37"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="agentstatusData" idColumn="status"><column name="status" type="String" xid="xid23"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="wxmessageData" idColumn="id" onDataChange="wxmessageDataDataChange" onAfterNew="wxmessageDataAfterNew"><column name="id" type="String" xid="xid24"></column>
  <column name="name" type="String" xid="xid25"></column>
  <column name="message" type="String" xid="xid26"></column>
  <column name="created_at" type="String" xid="xid27"></column>
  <column name="timesummary" type="String" xid="xid28"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="activetypeData" idColumn="id"><column name="id" type="String" xid="xid31"></column>
  <column name="product_id" type="String" xid="xid32"></column>
  <column name="active" type="String" xid="xid33"></column>
  <column name="showlable" type="String" xid="xid34"></column>
  <column name="summary" type="String" xid="xid35"></column>
  <column name="keywords" type="String" xid="xid36"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full  x-card top-trans" xid="panel1"> 
      <div class="x-panel-content" xid="content1" style="background-color:#f6f6f6;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row5" style="position:absolute;">
   <div class="x-col" xid="col17"><div class="form-group has-feedback text-muted" xid="formGroup1">
   <i class="icon-ios7-search-strong form-control-feedback" xid="col1" style="left:0;font-size:large;"></i><input component="$UI/system/components/justep/input/input" class="form-control x-inputText" xid="key" bind-click="keyClick"></input>
   </div></div>
   <div class="x-col x-col-fixed" xid="col18" style="padding-left:0px;width:38px;"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm btn-only-icon" label="button" xid="button1" icon="my my-liaotian" style="padding-top:4px;margin-left:-5px;color:#fff;">
   <i xid="i1" class="my my-liaotian" style="font-size:x-large;"></i>
   <span xid="span1"></span></a></div></div><img src="../image/top01.png" alt="" xid="image1" style="width:100%;" class="iBanner"></img>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1" style="border-bottom-style:dashed;border-bottom-width:1px;border-bottom-color:#dddddd;padding-top:10px;padding-bottom:10px;">
   <div class="x-col text-center" xid="col2"><i xid="i2" class="my my-tubiao_dagou" style="color:#fe2d29;"></i>
  <span xid="span2" style="font-size:small;color:#fe2d29;"><![CDATA[正品茶叶直销]]></span></div>
   <div class="x-col text-center" xid="col3"><i xid="i3" class="my my-tubiao_dagou" style="color:#fe2d29;"></i>
  <span xid="span3" style="font-size:small;color:#fe2d29;"><![CDATA[超值正品优惠]]></span></div>
   <div class="x-col text-center" xid="col4"><i xid="i4" class="my my-tubiao_dagou" style="color:#fe2d29;"></i>
  <span xid="span4" style="font-size:small;color:#fe2d29;"><![CDATA[畅享健康生活]]></span></div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2" style="padding-top:20px;padding-bottom:20px;">
   <div class="x-col text-center" xid="yjmhcol" bind-click="yjmhcolClick"><div xid="div1"><img src="$UI/flowerfront/image/yjmh_logo.png" alt="" xid="image2" style="width:50px;"></img></div>
  <div xid="div2"><span xid="span5" style="color:#333333;"><![CDATA[遇见玫好]]></span></div></div>
   <div class="x-col text-center" xid="azlcol" bind-click="azlcolClick"><div xid="div4">
   <img src="$UI/flowerfront/image/azl_logo.png" alt="" xid="image3" style="width:50px;"></img></div>
  <div xid="div3">
   <span xid="span6" style="color:#333333;"><![CDATA[啊咱哩]]></span></div></div>
   <div class="x-col text-center" xid="cysycol" bind-click="cysycolClick"><div xid="div6">
   <img src="$UI/flowerfront/image/cysy_logo.png" alt="" xid="image4" style="width:50px;"></img></div>
  <div xid="div5">
   <span xid="span7" style="color:#333333;"><![CDATA[茶言水语]]></span></div></div>
  <div class="x-col text-center" xid="peccol" bind-click="peccolClick"><div xid="div8">
   <img src="$UI/flowerfront/image/pec_logo.png" alt="" xid="image5" style="width:50px;"></img></div>
  <div xid="div7">
   <span xid="span8" style="color:#333333;"><![CDATA[普洱茶]]></span></div></div>
  <div class="x-col text-center" xid="cpqmcol" bind-click="cpqmcolClick"><div xid="div10">
   <img src="$UI/flowerfront/image/cpqm_logo.png" alt="" xid="image6" style="width:50px;"></img></div>
  <div xid="div9">
   <span xid="span9" style="color:#333333;"><![CDATA[冲泡器皿]]></span></div></div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3" style="background-color:white;padding-bottom:0px;">
   <div class="x-col x-col-fixed" xid="hotcol" style="width:110px;" bind-click="hotcolClick"><img src="$UI/flowerfront/image/hot_logo.png" alt="" xid="image7" style="width:40px;"></img>
  <span xid="span10" style="margin-left:5px;"><![CDATA[花当家]]></span>
  <img src="$UI/flowerfront/image/vertical_line.png" alt="" xid="image8" height="25px" class="pull-right" style="margin-top:8px;"></img></div>
   <div class="x-col" xid="col11"><div xid="topswiperdiv" class="swiper-container" style="height:40px;"><div xid="div12" class="swiper-wrapper"></div></div></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row text-center" xid="row4" style="margin-top:15px;">
   <div class="x-col" xid="hctjcol" style="background-color:white;border-radius: 5px;margin-left:5px;margin-right:5px;" bind-click="hctjcolClick"><div xid="div15"><span xid="span15" style="color:#333333;font-size:medium;font-weight:bold;"><![CDATA[好茶推荐]]></span></div>
  <div xid="div16"><span xid="span16" class="text-muted" style="font-size:small;"><![CDATA[热卖好茶任你挑]]></span></div>
  <div xid="div17" style="padding-top:15px;padding-bottom:15px;"><img src="$UI/flowerfront/image/hctj.png" alt="" xid="image9" style="width:80%;"></img></div></div>
   <div class="x-col" xid="czyhcol" style="background-color:white;border-radius: 5px;margin-left:5px;margin-right:5px;" bind-click="czyhcolClick"><div xid="div20">
   <span xid="span18" style="color:#333333;font-size:medium;font-weight:bold;"><![CDATA[超值优惠]]></span></div>
  <div xid="div18">
   <span xid="span17" class="text-muted" style="font-size:small;"><![CDATA[每日优惠帮你省]]></span></div>
  <div xid="div19" style="padding-top:15px;padding-bottom:15px;">
   <img src="$UI/flowerfront/image/czyh.png" alt="" xid="image10" style="width:80%;"></img></div></div>
   <div class="x-col" xid="cjtjcol" style="background-color:white;border-radius: 5px;margin-left:5px;margin-right:5px;" bind-click="cjtjcolClick"><div xid="div23">
   <span xid="span20" style="color:#333333;font-size:medium;font-weight:bold;"><![CDATA[茶具推荐]]></span></div>
  <div xid="div21">
   <span xid="span19" class="text-muted"><![CDATA[精品茶具好看不贵]]></span></div>
  <div xid="div22" style="padding-top:15px;padding-bottom:15px;">
   <img src="$UI/flowerfront/image/cjtj.png" alt="" xid="image11" style="width:90%;"></img></div></div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row6" style="margin-top:10px;">
   <div class="x-col" xid="col12"></div>
   <div class="x-col text-center" xid="col16"><img src="$UI/flowerfront/image/mxcp_title.png" alt="" xid="image12" style="width:120px;"></img></div>
   <div class="x-col" xid="col19"></div></div>
  <div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="productData" style="margin-top:-10px;" onAfterRender="list1AfterRender">
   <ul class="x-list-template" xid="listTemplateUl1" style="padding-right:5px;">
    <div xid="div25" class="col-xs-6 col-sm-4" style="padding-top:5px;padding-bottom:5px;" bind-click="div25Click" bind-css="val(&quot;odd&quot;) == 0 ? 'ev' : 'od'"><div xid="div24" style="border-radius:5px 5px 0px 0px;overflow: hidden;background-color:#eaeaea;" class="imagediv"><i xid="i5" style="position:absolute;font-size:x-large;" bind-click="i5Click" bind-css='val("collection") == 1 ? "my my-xinxingshi" : "my my-xinxingxian"' class="follow btnclass"></i><img src=" " alt="" xid="image13" bind-attr-src=' val("cover")' style="width:100%;"></img>
  
  <div xid="ribbondiv" class="wrap" style="display:none;" bind-visible=' $model.active_showlable( val("id"))'><span xid="ribbonspan" class="ribbon ribbon-ef" bind-text=' $model.active_text( val("id"))'><![CDATA[预售]]></span></div></div>
  
  
  <div xid="div28" style="background-color:white;padding-bottom:5px;border-radius: 0 0 5px 5px;"><div xid="div26" style="padding-top:10px;padding-left:10px;"><span xid="span21" bind-text='val("name")' style="font-size:medium;"></span></div><div xid="div27" style="padding-left:10px;"><span xid="span22" bind-text='val("subtitle")' style="background-color:white;font-size:small;" class="text-muted"></span></div>
  <div xid="div29" style="padding-left:10px;padding-right:5px;"><span xid="span23" bind-text="'￥' + val(&quot;price&quot;)" style="font-size:large;color:#fe2e23;"></span>
  <span xid="span24" style="font-size:small;background-color:#ffeae9;color:#fe2e23;font-weight:lighter;padding:1px;border-radius:3px;" bind-visible=' $model.agentstatusData.val("status") == 1' bind-text="'代理 ￥' + val(&quot;agentprice&quot;)"><![CDATA[]]></span>
  <span xid="span25" class="pull-right text-muted" style="font-size:x-small;font-weight:lighter;margin-top:9px;" bind-text="'售' +  val(&quot;salecount&quot;) + '件'" bind-visible=' val("displaysale") == 1'><![CDATA[售100件]]></span></div></div></div></ul> 
  </div></div>
  </div> 
<resource xid="resource2"><require xid="require1" url="css!$UI/flowerfront/icon/my.icons"></require>
  </resource>
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver" direction="auto" xid="serachpopOver" opacity="1" position="bottom">
   <div class="x-popOver-overlay" xid="div30" style="background-color:#f6f6f6;"></div>
   <div class="x-popOver-content" xid="div31" style="width:100%;height:100%;"><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel2">
   <div class="x-panel-top" xid="top1"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row7" style="position:absolute;">
   <div class="x-col" xid="col21">
    <div class="form-group has-feedback text-muted" xid="formGroup2">
     <i class="icon-ios7-search-strong form-control-feedback" xid="col22" style="left:0;font-size:large;"></i>
     <input component="$UI/system/components/justep/input/input" class="form-control x-inputText" xid="searchinput" bind-keyup="searchinputKeyup"></input></div> </div> 
   <div class="x-col x-col-fixed" xid="col20" style="padding-left:0px;width:60px;">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="取消" xid="cancelsearchBtn" style="color:#333333;" onClick="cancelsearchBtnClick">
   <i xid="i7"></i>
   <span xid="span27">取消</span></a></div> </div></div>
   <div class="x-panel-content x-cards" xid="content2"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list2" data="searchData">
   <ul class="x-list-template" xid="listTemplateUl2">
    <div xid="div33" style="border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#f6f6f6;" bind-click="div33Click"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row8" style="background-color:white;">
   <div class="x-col x-col-25" xid="col23"><div xid="div32" style="border-radius:5px;    overflow: hidden;"><img src=" " alt="" xid="image14" bind-attr-src=' val("cover")' style="width:100%;"></img>
  </div></div>
   <div class="x-col" xid="col24" style="padding:0px;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row9">
   <div class="x-col" xid="col26"><span xid="span26" bind-text='val("name")'></span>
  <span xid="span28" bind-text='val("subtitle")'></span></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row11" style="padding-top:0px;padding-bottom:0px;">
   <div class="x-col" xid="col5">
    <div component="$UI/system/components/justep/list/list" class="x-list" xid="list3" data="activetypeData" filter=' $row.val("product_id") == val("id")'>
   <ul class="x-list-template" xid="listTemplateUl3">
    <span xid="span14" style="font-size:x-small;background-color:#ffeae9;color:#fe2e23;font-weight:lighter;padding:1px;border-radius:3px;" bind-text='val("active")'></span></ul> </div></div> </div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row10">
   <div class="x-col" xid="col29"><span xid="span29" bind-text="'￥' + val(&quot;price&quot;)" style="font-size:large;color: #fe2e23;"></span>
  <span xid="span30" style="font-size:small;background-color:#ffeae9;color:#fe2e23;font-weight:lighter;padding:1px;border-radius:3px;" bind-visible=' $model.agentstatusData.val("status") == 1' bind-text="'代理 ￥' + val(&quot;agentprice&quot;)"></span></div>
   </div>
  </div>
   </div></div></ul> 
  </div></div>
   </div></div></div></div>