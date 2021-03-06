<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onLoad="modelLoad" onParamsReceive="modelParamsReceive"> 
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
   <column name="hasoptional" type="String" xid="xid26"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="optionalData" idColumn="id">
   <column name="id" type="String" xid="xid14"></column>
   <column name="selectcondition_id" type="String" xid="xid15"></column>
   <column name="selectcondition_name" type="String" xid="xid16"></column>
   <column name="buycar_id" type="String" xid="xid17"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="activeData" idColumn="id">
   <column name="id" type="String" xid="xid18"></column>
   <column name="buycar_id" type="String" xid="xid19"></column>
   <column name="active" type="String" xid="xid20"></column>
   <column name="showlable" type="String" xid="xid21"></column>
   <column name="summary" type="String" xid="xid22"></column>
   <column name="keywords" type="String" xid="xid23"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="paystatusData" idColumn="id">
   <column name="id" type="String" xid="xid59"></column>
   <column name="paytype" type="String" xid="xid60"></column>
   <column name="paysummary" type="String" xid="xid61"></column>
   <column name="paysum" type="String" xid="xid62"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="确认订单"
          class="x-titlebar" style="background-color:white;">
          <div class="x-titlebar-left" style="color:#333333;"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title" style="font-weight:normal;color:#333333;">确认订单</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content x-cards" xid="content1"><div xid="letterdiv" class="letter" bind-click="letterdivClick"><div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row1" style="padding-top:0px;padding-bottom:0px;margin-bottom:-10px;">
   <div class="x-col x-col-fixed" xid="col1" style="width:20px;"><i xid="i1" class="my my-shouhuodizhi1" style="font-size:large;"></i></div>
   <div class="x-col" xid="col2"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row2" style="padding-top:0px;padding-bottom:0px;">
   <div class="x-col" xid="col4"><span xid="span1"></span></div>
   <div class="x-col text-right" xid="col5"><span xid="span2"></span></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3" style="padding-top:0px;padding-bottom:0px;">
   <div class="x-col" xid="col7"><span xid="span3"></span></div>
   </div></div>
   <div class="x-col x-col-fixed text-right" xid="col3" style="width:20px;"><i xid="i2" class="linear linear-chevronright text-muted"></i></div></div>
  </div>
  <div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="smartContainer1" style="background-color:white;overflow-x: unset;padding-bottom:0px;margin-top:10px;">
   <div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="buycarData" filter='$row.val("number") &gt; 0  &amp;&amp;  $row.val("producttype") == 0'>
    <ul class="x-list-template" xid="listTemplateUl1" style="overflow:hidden;">
     <div xid="div2" class="swiper-container">
      <div xid="div5" class="swiper-wrapper">
       <div xid="div6" class="swiper-slide">
        <div component="$UI/system/components/justep/row/row" class="x-row movrow" xid="row4" style="padding-bottom:0px;padding-top:5px;z-index:10;">
         <div class="x-col x-col-25" xid="col15">
          <img src=" " alt="" xid="image1" bind-attr-src=' val("cover")' style="width:100%;" class="imageradius"></img></div> 
         <div class="x-col lastborder" xid="col13" style="padding:0px;">
          <div component="$UI/system/components/justep/row/row" class="x-row" xid="row6" style="padding:0px;">
           <div class="x-col" xid="col6">
            <span xid="span6" bind-text='val("name")'></span>
            <span xid="span4" bind-text='val("subtitle")'></span></div> </div> 
          <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5" style="padding:0px;">
           <div class="x-col" xid="col14" style="padding-top:0px;padding-bottom:0px;">
            <div component="$UI/system/components/justep/list/list" class="x-list" xid="list2" data="activeData" filter=' $row.val("buycar_id") == val("id")'>
             <ul class="x-list-template" xid="listTemplateUl2">
              <span xid="span5" style="font-size:x-small;background-color:#ffeae9;color:#fe2e23;font-weight:lighter;padding:1px;border-radius:3px;" bind-text='val("active")'></span></ul> </div> </div> </div> 
          <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4" style="padding:0px;">
           <div xid="col11" style="padding:5px;">
            <div component="$UI/system/components/justep/list/list" class="x-list" xid="list3" data="optionalData" filter=' $row.val("buycar_id") == val("id")'>
             <ul class="x-list-template" xid="listTemplateUl3">
              <span xid="span4" bind-text='val("selectcondition_name")' style="font-size:small;" class="text-muted"></span></ul> </div> </div> 
           <div class="x-col" xid="col15">
            <i xid="i3" class="linear linear-chevrondown text-muted" style="font-size:x-small;" bind-visible='false'></i></div> </div> 
          <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5" style="padding:0px;">
           <div class="x-col" xid="col12">
            <span xid="span5" style="color:#fe2e23;font-size:large;" bind-text="'￥' + val(&quot;price&quot;).toFixed(2)"></span>
            <span xid="span10" bind-text="'￥' + (parseFloat(val(&quot;price&quot;)) + parseFloat(val(&quot;discount&quot;)))" class="text-muted" style="text-decoration:line-through;margin-left:5px;" bind-visible=' val("discount") &gt; 0'></span></div> 
           <div class="x-col text-right" xid="col10">
            <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-sm btn-only-icon addbtn" label="button" xid="subBtn" icon="icon-android-remove" onClick="subBtnClick" bind-visible="false">
             <i xid="i4" class="icon-android-remove"></i>
             <span xid="span41"></span></a> 
            <label xid="numberlabel" style="font-weight:normal;width:30px;" class="text-center" bind-text="'×' + val(&quot;number&quot;)">1</label>
            <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-sm btn-only-icon addbtn" label="button" xid="addBtn" icon="icon-android-add" onClick="addBtnClick" bind-visible="false">
             <i xid="i13" class="icon-android-add"></i>
             <span xid="span42"></span></a> </div> </div> </div> </div> </div> 
       <div xid="div7" class="swiper-slide menu" style="width:160px;">
        <div xid="div2" style="width:160px;z-index:0;position:relative;display: flex;height:100%;" class="mov pull-right">
         <div xid="collcetiondiv" style="background-color:#ff9c50;height:100%;width:50%;display: flex;justify-content:center;align-items:Center;overflow:hidden;" class="text-center" bind-click="collcetiondivClick">
          <br xid="default1"></br>
          <span xid="span22" style="white-space:nowrap;width:100%;color:#FFFFFF;">移入收藏夹</span></div> 
         <div xid="deletediv" style="background-color:#ff4256;height:100%;width:50%;display: flex;justify-content:center;align-items:Center;overflow:hidden;" class="text-center" bind-click="deletedivClick">
          <span xid="span21" style="white-space:nowrap;width:100%;color:#FFFFFF;">删除</span></div> </div> </div> </div> </div> </ul> </div> </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row20" style="background-color:white;margin-top:-10px;">
   <div class="x-col" xid="col42"><span xid="span34"><![CDATA[邮费]]></span></div>
   <div class="x-col text-right" xid="col43"><span xid="postagespan"><![CDATA[￥0.00]]></span></div>
   </div><div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="smartContainer2" style="background-color:white;overflow-x: unset;padding-bottom:0px;border-radius:5px;">
   <div component="$UI/system/components/justep/row/row" class="x-row" xid="row11" style="color:#ff4665;">
    <div class="x-col x-col-fixed" xid="col17" style="width:30px;">
     <i xid="i6" class="my2 my2-jiesheng"></i></div> 
    <div class="x-col" xid="col18">
     <span xid="span15">节省了35.32元</span></div> </div> 
   <div component="$UI/system/components/justep/row/row" class="x-row" xid="row12" style="color:#ff4665;">
    <div class="x-col x-col-fixed" xid="col21" style="width:30px;">
     <i xid="i7" class="my my-tixian1"></i></div> 
    <div class="x-col" xid="col20">
     <span xid="span16">获得35.32元返现</span></div> </div> 
   <div component="$UI/system/components/justep/list/list" class="x-list" xid="list4" data="buycarData" filter='$row.val("number") &gt; 0  &amp;&amp;  $row.val("producttype") == 1' style="border-top-style:solid;border-top-width:1px;border-top-color:#f6f6f6;">
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
         <span xid="span12" style="font-size:large;" class="text-muted" bind-text="'￥' + val(&quot;price&quot;)">￥0</span>
         <span xid="span14" bind-text="'￥' + (parseFloat(val(&quot;price&quot;)) + parseFloat(val(&quot;discount&quot;)))" class="text-muted" style="text-decoration:line-through;margin-left:5px;" bind-visible="false"></span></div> 
        <div class="x-col text-right" xid="col10">
         <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-sm btn-only-icon addbtn" label="button" xid="button2" icon="icon-android-remove" onClick="subBtnClick" bind-visible="false">
          <i xid="i5" class="icon-android-remove"></i>
          <span xid="span6"></span></a> 
         <label xid="label1" style="font-weight:normal;width:30px;" class="text-center" bind-text="'×' + val(&quot;number&quot;)">1</label>
         <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-sm btn-only-icon addbtn" label="button" xid="button1" icon="icon-android-add" onClick="addBtnClick" bind-visible="false">
          <i xid="i4" class="icon-android-add"></i>
          <span xid="span7"></span></a> </div> </div> </div> </div> </ul> </div> </div>
  <div component="$UI/system/components/justep/row/row" class="x-row x-row-center row-class" xid="row18" style="background-color:white;">
   <div class="x-col x-col-fixed" xid="col33" style="width:80px;"><span xid="span27"><![CDATA[买家留言：]]></span></div>
   <div class="x-col" xid="col34"><textarea component="$UI/system/components/justep/textarea/textarea" class="form-control input-class" xid="textarea1"></textarea></div>
   </div>
  <div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="smartContainer3" style="background-color:white;display:none;"><div component="$UI/system/components/justep/row/row" class="x-row x-row-center text-muted" xid="paytoagentrow">
   <div class="x-col x-col-fixed" xid="col35" style="width:40px;"></div>
   <div class="x-col" xid="col36"><span xid="paytoagentspan"><![CDATA[给代理下单]]></span></div>
   <div class="x-col" xid="col37"></div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row x-row-center text-muted" xid="destockrow">
   <div class="x-col x-col-fixed" xid="col40" style="width:40px;"></div>
   <div class="x-col" xid="col39">
    <span xid="destockspan">去库存</span></div> 
   <div class="x-col" xid="col38">
    </div> </div></div>
  </div>
  <div class="x-panel-bottom" xid="bottom1"><div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row13" style="padding:0px;">
   <div class="x-col text-right" xid="col19" style="padding-right:20px;"><span xid="span18"><![CDATA[合计金额：]]></span>
  <span xid="span19" style="color:#fe2e23;font-size:large;"></span></div>
   <div class="x-col x-col-33" xid="col22" style="padding:0px;"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-lg btn-block surebtn" label="提交订单" xid="submitBtn" onClick="submitBtnClick">
   <i xid="i8"></i>
   <span xid="span17">提交订单</span></a></div>
   </div></div></div> 
<resource xid="resource2"><require xid="require1" url="css!$UI/flowerfront/icon/my.icons"></require>
  <require xid="require2" url="css!$UI/flowerfront/css/zhifu"></require>
  <require xid="require3" url="css!$UI/flowerfront/icon2/my2.icons"></require></resource>
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver" direction="auto" xid="popOver1" position="bottom">
   <div class="x-popOver-overlay" xid="div1"></div>
   <div class="x-popOver-content" xid="div3" style="background-color:white;width:100%;height:70%;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row14" style="border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#f6f6f6;">
   <div class="x-col" xid="col23"></div>
   <div class="x-col text-center" xid="col24"><span xid="span20" style="font-size:medium;"><![CDATA[确认付款]]></span></div>
   <div class="x-col text-right" xid="col25"><i xid="i9" class="linear linear-cross text-muted" bind-click="i9Click"></i></div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row15" style="margin-top:20px;">
   <div class="x-col" xid="col26"></div>
   <div class="x-col text-center" xid="col27"><span xid="span23" style="color:#fe2e23;font-size:x-large;"><![CDATA[￥0.00]]></span></div>
   <div class="x-col" xid="col28"></div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row16" style="margin-top:20px;border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#f6f6f6;display:none;">
   <div class="x-col x-col-25" xid="col29"><span xid="span24"><![CDATA[支付方式]]></span></div>
   <div class="x-col text-right" xid="col31"><span xid="span25"><![CDATA[可用余额：￥0.00]]></span></div></div>
  <div component="$UI/system/components/justep/list/list" class="x-list" xid="list7" data="paystatusData">
   <ul class="x-list-template" xid="listTemplateUl7">
    <li xid="li19">
     <div component="$UI/system/components/justep/row/row" class="x-row" xid="row19">
      <div class="x-col x-col-33" xid="col41">
       <span xid="span32">支付方式</span></div> 
      <div class="x-col text-right" xid="col30">
       <span xid="span33" bind-text='val("paysummary")'></span></div> </div> </li> </ul> </div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row17" style="position:absolute;bottom:20px;">
   <div class="x-col" xid="col32"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-block wxcolor" label="立即支付" xid="payBtn" onClick="payBtnClick">
   <i xid="i10"></i>
   <span xid="span26">立即支付</span></a></div>
   </div>
  </div></div>
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver" direction="auto" xid="passwordpopOver" opacity="0.5" position="bottom">
   <div class="x-popOver-overlay" xid="div10"></div>
   <div class="x-popOver-content" xid="div9" style="width:100%;height:100%;">
    <div xid="div8" class="ftc_wzsf">
     <div xid="div4" class="srzfmm_box">
      <div xid="div8" class="qsrzfmm_bt clear_wl" style="padding:10px;">
       <i xid="i12" class="linear linear-cross text-muted" style="font-size:large;" bind-click="i2Click"></i>
       <span xid="span28">请输入操作密码</span></div> 
      <div xid="div9" class="zfmmxx_shop">
       <div xid="div10" class="mz">
        <span xid="span28">测试商品</span></div> 
       <div xid="div11" class="zhifu_price">
        <span xid="span29">支付订单</span>
        <span xid="span31" style="color:#fe2e23;"></span></div> </div> 
      <ul xid="ul1" class="mm_box">
       <li xid="li1"></li>
       <li xid="li2"></li>
       <li xid="li3"></li>
       <li xid="li4"></li>
       <li xid="li5"></li>
       <li xid="li6"></li></ul> 
      <label xid="label2" style="margin-left:20px;margin-top:10px;font-weight:normal;" class="text-danger">此密码不是微信支付密码</label>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right" label="忘记密码" xid="forgetbtn" style="margin-right:8px;" onClick="forgetbtnClick">
       <i xid="i11"></i>
       <span xid="span30">忘记密码</span></a> </div> 
     <div xid="div12" class="numb_box">
      <div xid="div13" class="xiaq_tb">
       <img src="$UI/flowerfront/image/jftc_14.jpg" alt="" xid="image3" height="10px"></img></div> 
      <ul xid="ul2" class="nub_ggg">
       <li xid="li7">
        <a xid="a1" href="javascript:void(0);" class="zf_num">1</a></li> 
       <li xid="li8">
        <a xid="a2" href="javascript:void(0);" class="zj_x zf_num">2</a></li> 
       <li xid="li9">
        <a xid="a3" href="javascript:void(0);" class="zf_num">3</a></li> 
       <li xid="li10">
        <a xid="a4" href="javascript:void(0);" class="zf_num">4</a></li> 
       <li xid="li11">
        <a xid="a5" href="javascript:void(0);" class="zj_x zf_num">5</a></li> 
       <li xid="li12">
        <a xid="a6" href="javascript:void(0);" class="zf_num">6</a></li> 
       <li xid="li13">
        <a xid="a7" href="javascript:void(0);" class="zf_num">7</a></li> 
       <li xid="li14">
        <a xid="a8" href="javascript:void(0);" class="zj_x zf_num">8</a></li> 
       <li xid="li15">
        <a xid="a9" href="javascript:void(0);" class="zf_num">9</a></li> 
       <li xid="li16">
        <a xid="a10" href="javascript:void(0);" class="zf_empty">清空</a></li> 
       <li xid="li17">
        <a xid="a11" href="javascript:void(0);" class="zj_x zf_num">0</a></li> 
       <li xid="li18">
        <a xid="a12" href="javascript:void(0);" class="zf_del">删除</a></li> </ul> </div> </div> </div> </div></div>