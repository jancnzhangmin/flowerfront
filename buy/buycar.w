<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onParamsReceive="modelParamsReceive" onLoad="modelLoad" onActive="modelActive">
   <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="buycarData" idColumn="id">
    <column name="id" type="String" xid="xid1"></column>
  <column name="product_id" type="String" xid="xid2"></column>
  <column name="user_id" type="String" xid="xid3"></column>
  <column name="number" type="String" xid="xid4"></column>
  <column name="price" type="String" xid="xid5"></column>
  <column name="cost" type="String" xid="xid6"></column>
  <column name="discount" type="String" xid="xid7"></column>
  <column name="cover" type="String" xid="xid8"></column>
  <column name="firstprofit" type="String" xid="xid9"></column>
  <column name="secondprofit" type="String" xid="xid10"></column>
  <column name="owerprofit" type="String" xid="xid11"></column>
  <column name="producttype" type="String" xid="xid12"></column>
  <column name="openid" type="String" xid="xid13"></column>
  <column name="name" type="String" xid="xid24"></column>
  <column name="subtitle" type="String" xid="xid25"></column>
  <column name="hasoptional" type="String" xid="xid26"></column>
  <column name="agentuserid" type="String" xid="xid27"></column>
  <column name="destock" type="String" xid="xid28"></column>
  <column name="isselect" type="String" xid="xid29"></column>
  <column name="trial" type="String" xid="xid30"></column></div> 
   <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="optionalData" idColumn="id">
    <column name="id" type="String" xid="xid14"></column>
  <column name="selectcondition_id" type="String" xid="xid15"></column>
  <column name="selectcondition_name" type="String" xid="xid16"></column>
  <column name="buycar_id" type="String" xid="xid17"></column>
  </div> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="activeData" idColumn="id"><column name="id" type="String" xid="xid18"></column>
  <column name="buycar_id" type="String" xid="xid19"></column>
  <column name="active" type="String" xid="xid20"></column>
  <column name="showlable" type="String" xid="xid21"></column>
  <column name="summary" type="String" xid="xid22"></column>
  <column name="keywords" type="String" xid="xid23"></column></div></div><div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="购物车"
          class="x-titlebar" style="background-color:white;">
          <div class="x-titlebar-left"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left" xid="backi"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title" style="color:#333333;font-weight:normal;">购物车</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content x-cards" xid="content1"><div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="smartContainer1" style="background-color:white;overflow-x: unset;padding-bottom:0px;">
  <div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="buycarData" filter='$row.val("number") &gt; 0  &amp;&amp;  $row.val("producttype") == 0'>
   <ul class="x-list-template" xid="listTemplateUl1" style="overflow:hidden;">
    <div xid="div1" class="swiper-container"><div xid="div5" class="swiper-wrapper"><div xid="div6" class="swiper-slide"><div component="$UI/system/components/justep/row/row" class="x-row movrow" xid="row1" style="padding-bottom:0px;padding-top:5px;z-index:10;" bind-click="row1Click" bind-touchstart="row1Touchstart">
   <div class="x-col x-col-fixed" xid="col42" style="width:30px;padding-top:5px;"><i xid="selecti" class="my2 my2-xuanzhong2 text-muted" style="font-size:20px;" bind-css=' $model.change_select_css( val("isselect"), $element)' bind-click="selectiClick"></i></div><div class="x-col x-col-25" xid="col1"><img src=" " alt="" xid="image1" bind-attr-src=' val("cover")' style="width:100%;" class="imageradius"></img></div>
   <div class="x-col lastborder" xid="col2" style="padding:0px;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row2" style="padding:0px;">
   <div class="x-col" xid="col6"><span xid="span1" bind-text='val("name")'></span>
  <span xid="span2" bind-text='val("subtitle")'></span></div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3" style="padding:0px;">
   <div class="x-col" xid="col3" style="padding-top:0px;padding-bottom:0px;"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list2" data="activeData" filter=' $row.val("buycar_id") == val("id")'>
   <ul class="x-list-template" xid="listTemplateUl2">
    <span xid="span3" style="font-size:x-small;background-color:#ffeae9;color:#fe2e23;font-weight:lighter;padding:1px;border-radius:3px;" bind-text='val("active")'></span></ul> 
  </div></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4" style="padding:0px;">
   <div xid="col4" style="padding:5px;">
  <div component="$UI/system/components/justep/list/list" class="x-list" xid="list3" data="optionalData" filter=' $row.val("buycar_id") == val("id")'>
   <ul class="x-list-template" xid="listTemplateUl3">
    <span xid="span4" bind-text='val("selectcondition_name")' style="font-size:small;" class="text-muted"></span></ul> 
  </div></div>
   <div class="x-col" xid="col15"></div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5" style="padding:0px;">
   <div class="x-col" xid="col5"><span xid="span5" style="color:#fe2e23;font-size:large;" bind-text="'￥' + val(&quot;price&quot;)"></span>
  <span xid="span10" bind-text="'￥' + (parseFloat(val(&quot;price&quot;)) + parseFloat(val(&quot;discount&quot;)))" class="text-muted" style="text-decoration:line-through;margin-left:5px;" bind-visible=' val("discount") &gt; 0'></span></div>
   <div class="x-col text-right" xid="col7"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-sm btn-only-icon addbtn" label="button" xid="subBtn" icon="icon-android-remove" onClick="subBtnClick">
   <i xid="i4" class="icon-android-remove"></i>
   <span xid="span41"></span></a>
  <label xid="numberlabel" style="font-weight:normal;width:30px;" class="text-center" bind-text='val("number")'>1</label>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-sm btn-only-icon addbtn" label="button" xid="addBtn" icon="icon-android-add" onClick="addBtnClick">
   <i xid="i13" class="icon-android-add"></i>
   <span xid="span42"></span></a></div>
   </div></div>
   </div></div>
  <div xid="div7" class="swiper-slide menu" style="width:160px;"><div xid="div2" style="width:160px;z-index:0;position:relative;display: flex;height:100%;" class="mov pull-right"><div xid="collcetiondiv" style="background-color:#ff9c50;height:100%;width:50%;display: flex;justify-content:center;align-items:Center;overflow:hidden;" class="text-center" bind-click="collcetiondivClick"><br></br>
  
  <span xid="span22" style="white-space:nowrap;width:100%;color:#FFFFFF;"><![CDATA[移入收藏夹]]></span></div>
  <div xid="deletediv" style="background-color:#ff4256;height:100%;width:50%;display: flex;justify-content:center;align-items:Center;overflow:hidden;" class="text-center" bind-click="deletedivClick"><span xid="span21" style="white-space:nowrap;width:100%;color:#FFFFFF;"><![CDATA[删除]]></span></div></div></div></div></div></ul> 
  </div>
  </div>
  <div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="smartContainer2" style="background-color:white;overflow-x: unset;padding-bottom:0px;border-radius:5px;display:none;">
   <div component="$UI/system/components/justep/row/row" class="x-row" xid="row11" style="color:#ff4665;">
   <div class="x-col x-col-fixed" xid="col17" style="width:30px;"><i xid="i6" class="my my-shouyi"></i></div>
   <div class="x-col" xid="col18"><span xid="span15"><![CDATA[节省了35.32元]]></span></div>
   </div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row12" style="color:#ff4665;">
   <div class="x-col x-col-fixed" xid="col21" style="width:30px;">
    <i xid="i7" class="my my-tixian1"></i></div> 
   <div class="x-col" xid="col20">
    <span xid="span16"><![CDATA[获得35.32元返现]]></span></div> </div><div component="$UI/system/components/justep/list/list" class="x-list" xid="list4" data="buycarData" filter='$row.val("number") &gt; 0  &amp;&amp;  $row.val("producttype") == 1' style="border-top-style:solid;border-top-width:1px;border-top-color:#f6f6f6;">
    <ul class="x-list-template" xid="listTemplateUl6">
     <div component="$UI/system/components/justep/row/row" class="x-row" xid="row6" style="padding-bottom:0px;padding-top:5px;">
      <div class="x-col x-col-25" xid="col16">
       <img src=" " alt="" xid="image2" bind-attr-src=' val("cover")' style="width:100%;" class="imageradius"></img></div> 
      <div class="x-col lastborder" xid="col13" style="padding:0px;">
       <div component="$UI/system/components/justep/row/row" class="x-row" xid="row8" style="padding:0px;">
        <div class="x-col" xid="col9">
         <span xid="span13" bind-text='val("name")'></span>
         <span xid="span8" bind-text='val("subtitle")'></span></div> </div> 
       <div component="$UI/system/components/justep/row/row" class="x-row" xid="row7" style="padding:0px;">
        <div class="x-col" xid="col14" style="padding-top:0px;padding-bottom:0px;">
         <div component="$UI/system/components/justep/list/list" class="x-list" xid="list6" data="activeData" filter=' $row.val("buycar_id") == val("id")'>
          <ul class="x-list-template" xid="listTemplateUl5">
           <span xid="span9" style="font-size:x-small;background-color:#ffeae9;color:#fe2e23;font-weight:lighter;padding:1px;border-radius:3px;" bind-text='val("active")'></span></ul> </div> </div> </div> 
       <div component="$UI/system/components/justep/row/row" class="x-row" xid="row10" style="padding:0px;">
        <div xid="col11" style="padding:5px;">
         <div component="$UI/system/components/justep/list/list" class="x-list" xid="list5" data="optionalData" filter=' $row.val("buycar_id") == val("id")'>
          <ul class="x-list-template" xid="listTemplateUl4">
           <span xid="span11" bind-text='val("selectcondition_name")' style="font-size:small;" class="text-muted"></span></ul> </div> </div> 
        <div class="x-col" xid="col8">
         <i xid="i3" class="linear linear-chevrondown text-muted" style="font-size:x-small;" bind-visible=' val("hasoptional") &gt; 0'></i></div> </div> 
       <div component="$UI/system/components/justep/row/row" class="x-row" xid="row9" style="padding:0px;">
        <div class="x-col" xid="col12">
         <span xid="span12" style="font-size:large;" class="text-muted"><![CDATA[￥0]]></span>
         <span xid="span14" bind-text="'￥' + (parseFloat(val(&quot;price&quot;)) + parseFloat(val(&quot;discount&quot;)))" class="text-muted" style="text-decoration:line-through;margin-left:5px;" bind-visible='false'></span></div> 
        <div class="x-col text-right" xid="col10">
         <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-sm btn-only-icon addbtn" label="button" xid="button2" icon="icon-android-remove" onClick="subBtnClick" bind-visible="false">
          <i xid="i5" class="icon-android-remove"></i>
          <span xid="span6"></span></a> 
         <label xid="label1" style="font-weight:normal;width:30px;" class="text-center" bind-text="'×' + val(&quot;number&quot;)">1</label>
         <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-sm btn-only-icon addbtn" label="button" xid="button1" icon="icon-android-add" onClick="addBtnClick" bind-visible="false">
          <i xid="i2" class="icon-android-add"></i>
          <span xid="span7"></span></a> </div> </div> </div> </div> </ul> </div> 
  </div>
  <div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="smartContainer4" style="background-color:white;display:none;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="directagentrow">
   <div class="x-col x-col-fixed" xid="col35" style="width:50px;"></div>
   <div class="x-col" xid="col36"><span xid="span25" class="text-muted"><![CDATA[给直属代理下单]]></span></div>
   <div class="x-col" xid="col38"></div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="destockrow">
   <div class="x-col x-col-fixed" xid="col39" style="width:50px;"></div>
   <div class="x-col" xid="col40"><span xid="span29" class="text-muted"><![CDATA[去库存]]></span></div>
   <div class="x-col" xid="col41"></div></div></div></div>
  <div class="x-panel-bottom" xid="bottom1" style="border-top-style:solid;border-top-color:#f6f6f6;border-top-width:1px;"><div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row13" style="height:48px;padding:2px;">
   <div class="x-col x-col-20" xid="col19" style="padding-left:0px;border-right-style:solid;border-right-width:1px;border-right-color:#f6f6f6;"><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="更多" xid="morebutton" style="color:#555555;" icon="linear linear-menu" onClick="morebuttonClick">
   <i xid="i10" class="linear linear-menu"></i>
   <span xid="span23">更多</span></a></div><div class="x-col x-col-20 text-center" xid="col22" style="padding-right:0px;"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="全选" xid="selectallbtn" icon="my2 my2-xuanzhong2" style="color:#555555;padding:0px;" onClick="selectallbtnClick">
   <i xid="selectalli" class="my2 my2-xuanzhong2 text-muted" style="font-size:20px;"></i>
   <span xid="span20" style="margin-left:-8px;">全选</span></a></div>
   <div class="x-col text-right" xid="col23" style="padding-left:0px;"><span xid="span18"><![CDATA[合计：]]></span>
  <span xid="span19" style="color:#fe2e23;"></span></div>
   <div class="x-col" xid="col24" style="padding:0px;"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-block surebtn" label="结算" xid="settleBtn" onClick="settleBtnClick">
   <i xid="i8"></i>
   <span xid="span17">结算</span></a></div>
  </div></div></div> 
<resource xid="resource2"><require xid="require1" url="css!$UI/flowerfront/icon/my.icons"></require>
  <require xid="require2" url="css!$UI/flowerfront/icon2/my2.icons"></require></resource>
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver" direction="auto" xid="directagentpopOver" position="bottom">
   <div class="x-popOver-overlay" xid="div3"></div>
   <div class="x-popOver-content" xid="div4" style="width:100%;height:80%;"><div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="smartContainer3" style="height:100%;background-color:white;border-top-left-radius:5px;border-top-right-radius:5px;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row14">
   <div class="x-col" xid="col25"></div>
   <div class="x-col" xid="col26"></div>
   <div class="x-col text-right" xid="col27"><i xid="closedirectagentpopi" class="linear linear-cross" bind-click="closedirectagentpopiClick"></i></div></div>
  <hr xid="hr1" style="margin:0px;margin-left:0px;border-top: 1px solid #f6f6f6;"></hr><div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="directagnetrow" style="height:50px;" bind-click="directagnetrowClick">
   <div class="x-col" xid="col28"><span xid="span24"><![CDATA[给直属代理下单]]></span></div>
   <div class="x-col text-right" xid="col29"><span xid="agentnamespan"></span></div>
   <div class="x-col x-col-fixed text-right" xid="col30" style="width:30px;"><i xid="i12" class="linear linear-chevronright"></i></div></div>
  <hr xid="hr2" style="margin:0px;margin-left:0px;border-top: 1px solid #f6f6f6;"></hr>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row16" style="height:50px;">
   <div class="x-col" xid="col31"><span xid="span26"><![CDATA[订单方式]]></span></div>
   <div class="x-col text-right" xid="col32"><span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="destockcheckbox" label="去库存" onChange="destockcheckboxChange"></span></div>
   <div class="x-col x-col-fixed" xid="col33" style="width:20px;"></div></div>
  <hr xid="hr3" style="margin:0px;margin-left:0px;border-top: 1px dashed #f6f6f6;margin-top:10px;"></hr>
  <div component="$UI/system/components/justep/row/row" class="x-row text-muted" xid="row17">
   <div class="x-col" xid="col34"><span xid="span27"><![CDATA[给直属代理下单：下单时，将扣除指定直属代理的货款]]></span></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row text-muted" xid="row18">
   <div class="x-col" xid="col37">
    <span xid="span28"><![CDATA[去库存：下单后，订单不提交至公司，公司不安排发货，客户所需货品由自己安排处理；选中直属代理时，以直属代理价扣除直属代理货款，你获得直属与自己商品价差提现额。]]></span></div> </div></div></div></div>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog1" onReceive="windowDialog1Receive"></span></div>