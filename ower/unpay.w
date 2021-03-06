<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onLoad="modelLoad" onunLoad="modelUnLoad"> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="orderData" idColumn="id" confirmDelete="false" confirmRefresh="false"><column name="id" type="String" xid="xid1"></column>
  <column name="user_id" type="String" xid="xid2"></column>
  <column name="ordernumber" type="String" xid="xid3"></column>
  <column name="deduction" type="String" xid="xid4"></column>
  <column name="payprice" type="String" xid="xid5"></column>
  <column name="paysum" type="String" xid="xid6"></column>
  <column name="paystatus" type="String" xid="xid7"></column>
  <column name="province" type="String" xid="xid8"></column>
  <column name="city" type="String" xid="xid9"></column>
  <column name="district" type="String" xid="xid10"></column>
  <column name="street" type="String" xid="xid11"></column>
  <column name="address" type="String" xid="xid12"></column>
  <column name="adcode" type="String" xid="xid13"></column>
  <column name="contact" type="String" xid="xid14"></column>
  <column name="contactphone" type="String" xid="xid15"></column>
  <column name="receiptstatus" type="String" xid="xid16"></column>
  <column name="autoreceipttime" type="String" xid="xid17"></column>
  <column name="summary" type="String" xid="xid18"></column>
  <column name="status" type="String" xid="xid19"></column>
  <column name="frontuuid" type="String" xid="xid20"></column>
  <column name="paytime" type="String" xid="xid21"></column>
  <column name="commentstatus" type="String" xid="xid22"></column>
  <column name="detailcount" type="String" xid="xid48"></column>
  <column name="discount" type="String" xid="xid49"></column>
  <column name="owerprofit" type="String" xid="xid50"></column>
  <column name="ordermessage" type="String" xid="xid51"></column>
  <column name="deliverstatus" type="String" xid="xid52"></column>
  <column name="orderstatus" type="String" xid="xid53"></column>
  <column name="destock" type="String" xid="xid55"></column>
  <column name="agentuserid" type="String" xid="xid56"></column>
  <column name="agentname" type="String" xid="xid57"></column>
  <column name="isselect" type="String" xid="xid58"></column>
  <column name="postage" type="String" xid="xid63"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="orderdetailData" idColumn="id"><column name="id" type="String" xid="xid23"></column>
  <column name="product_id" type="String" xid="xid24"></column>
  <column name="name" type="String" xid="xid25"></column>
  <column name="price" type="String" xid="xid26"></column>
  <column name="unit" type="String" xid="xid27"></column>
  <column name="spec" type="String" xid="xid28"></column>
  <column name="subtitle" type="String" xid="xid29"></column>
  <column name="weight" type="String" xid="xid30"></column>
  <column name="brand" type="String" xid="xid31"></column>
  <column name="pack" type="String" xid="xid32"></column>
  <column name="season" type="String" xid="xid33"></column>
  <column name="cover" type="String" xid="xid34"></column>
  <column name="order_id" type="String" xid="xid45"></column>
  <column name="number" type="String" xid="xid46"></column>
  <column name="producttype" type="String" xid="xid47"></column>
  <column name="ordermessage" type="String" xid="xid54"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="optionalData" idColumn="id"><column name="id" type="String" xid="xid35"></column>
  <column name="orderdetail_id" type="String" xid="xid36"></column>
  <column name="selectcondition_id" type="String" xid="xid37"></column>
  <column name="selectcondition_name" type="String" xid="xid38"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="activeData" idColumn="id"><column name="id" type="String" xid="xid39"></column>
  <column name="orderdetail_id" type="String" xid="xid40"></column>
  <column name="active" type="String" xid="xid41"></column>
  <column name="showlable" type="String" xid="xid42"></column>
  <column name="summary" type="String" xid="xid43"></column>
  <column name="keywords" type="String" xid="xid44"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="paystatusData" idColumn="id"><column name="id" type="String" xid="xid59"></column>
  <column name="paytype" type="String" xid="xid60"></column>
  <column name="paysummary" type="String" xid="xid61"></column>
  <column name="paysum" type="String" xid="xid62"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="待付款"
          class="x-titlebar" style="background-color:white;">
          <div class="x-titlebar-left" style="color:#333333;"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title" style="font-weight:normal;color:#333333;">待付款</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content x-cards  x-scroll-view" xid="content1" _xid="C848A2A98F600001FA32D660193017DC">
  <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView" xid="scrollView1" noMoreLoadLabel="　" onPullDown="scrollView1PullDown" onPullUp="scrollView1PullUp">
   <div class="x-content-center x-pull-down container" xid="div4">
    <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i5"></i>
    <span class="x-pull-down-label" xid="span17">下拉刷新...</span></div> 
   <div class="x-scroll-content" xid="div5"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="orderData">
   <ul class="x-list-template" xid="listTemplateUl1" style="padding:5px;">
    <div xid="div1" style="background-color:white;border-radius:5px;margin-bottom:10px;"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list2" data="orderdetailData" filter=' $row.val("order_id") == val("id")' disableInfiniteLoad="true" disablePullToRefresh="true">
   <ul class="x-list-template" xid="listTemplateUl2">
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1" bind-css="val(&quot;producttype&quot;) == 1 ? 'givebackcolor' : ''">
   <div class="x-col x-col-fixed" xid="col10" style="width:30px;"><i xid="selecti" class="my2 my2-xuanzhong2 text-muted" style="font-size:20px;" bind-visible=" $index() == 0" bind-click="selectiClick" bind-css='$model.change_select( $element, val("order_id"))'></i></div><div class="x-col x-col-25" xid="col1"><img src=" " alt="" xid="image1" bind-attr-src=' val("cover")' style="width:100%;"></img></div>
   <div class="x-col" xid="col2"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row2" style="padding:0px;">
   <div class="x-col" xid="col4" style="padding:0px;"><span xid="span1" bind-text='val("name")'></span>
  <span xid="span2" bind-text='val("subtitle")'></span></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4" style="padding:0px;">
   <div class="x-col" xid="col5" style="padding:0px;padding-top:5px;"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list3" data="optionalData" filter=' $row.val("orderdetail_id") == val("id")' disableInfiniteLoad="true" disablePullToRefresh="true">
   <ul class="x-list-template" xid="listTemplateUl3">
    <span xid="span4" bind-text='val("selectcondition_name")' class="text-muted" style="font-size:small;"></span></ul> 
  </div></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5" style="padding:0px;">
   <div class="x-col" xid="col9" style="padding:0px;padding:5px;"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list5" data="activeData" filter=' $row.val("orderdetail_id") == val("id")' style="margin-left:-4px;" disableInfiniteLoad="true" disablePullToRefresh="true">
   <ul class="x-list-template" xid="listTemplateUl5">
    <span xid="span24" style="font-size:x-small;background-color:#ffeae9;color:#fe2e23;font-weight:lighter;padding:1px;border-radius:3px;" bind-text='val("active")'></span></ul> </div></div>
   </div></div>
   <div class="x-col x-col-fixed" xid="col3" style="width:80px;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row3" style="padding:0px;">
   <div class="x-col text-right" xid="col7" style="padding:0px;"><span xid="span3" style="color:#ff4256;" bind-visible=" $index() == 0" bind-text='val("ordermessage")'><![CDATA[交易成功]]></span>
  <span xid="span7" bind-visible=" $index() != 0"><![CDATA[　]]></span></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row7" style="padding-top:5px;padding-right:0px;">
   <div class="x-col text-right" xid="col15" style="padding-right:0px;"><span xid="span6" bind-text="'￥' + val(&quot;price&quot;)"></span></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row8" style="padding:0px;padding-right:0px;">
   <div class="x-col text-right" xid="col18" style="padding:0px;padding-right:0px;"><span xid="span8" bind-text="'×' + val(&quot;number&quot;)" class="text-muted"></span></div>
   </div></div>
  </div></ul> 
  </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row13" style="border-top-style:solid;border-top-width:1px;border-top-color:#F0F0F0;" bind-visible=' val("postage") &gt; 0'>
   <div class="x-col" xid="col16" style="padding-left:35px;"><span xid="span34"><![CDATA[邮费]]></span></div>
   <div class="x-col text-right" xid="col17"><span xid="postage" bind-text="'￥' + parseFloat( val(&quot;postage&quot;)).toFixed(2)"><![CDATA[￥0.00]]></span></div>
   </div><div component="$UI/system/components/justep/row/row" class="x-row text-muted" xid="row9" bind-visible=' val("discount") &gt; 0  ||  val("owerprofit") &gt; 0'>
   <div class="x-col" xid="col6"><i xid="i6" class="my2 my2-jiesheng" bind-visible=' val("discount") &gt; 0'></i>
  <span xid="span10" bind-text="'节省￥' + val(&quot;discount&quot;) + '元'" style="margin-right:10px;" bind-visible=' val("discount") &gt; 0'></span>
  <i xid="i7" class="my my-tixian1" bind-visible=' val("owerprofit") &gt; 0'></i>
  <span xid="span11" bind-text="'获得￥' + val(&quot;owerprofit&quot;) + '元返现'" style="margin-right:10px;" bind-visible=' val("owerprofit") &gt; 0'></span></div>
   </div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row6">
   <div class="x-col text-right" xid="col12"><span xid="span5" bind-text="'共计' +   val(&quot;detailcount&quot;) + '件商品 合计：￥'"><![CDATA[共计1件商品]]></span>
  <span xid="span9" bind-text='val("paysum")' style="font-size:medium;"></span></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row11" style="padding-top:0px;padding-bottom:0px;" bind-visible=' val("destock") == 1  || val("agentuserid")  != 0'>
   <div class="x-col" xid="col8">
    <span xid="span19" style="background-color:#ffeae9;color:#fe2e23;font-weight:lighter;padding:1px;border-radius:3px;font-size:small;" bind-visible=' val("destock") == 1'><![CDATA[去库存]]></span>
    <span xid="span21" style="background-color:#ffeae9;color:#fe2e23;font-weight:lighter;padding:1px;border-radius:3px;font-size:small;" bind-visible=' val("agentuserid") != 0' bind-text="'给' + val(&quot;agentname&quot;) + '下单'"><![CDATA[给张敏(张敏)下单]]></span></div> </div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row10">
   <div class="x-col text-right" xid="col11"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-sm process-btn" label="评价商品" xid="button1" bind-visible=' val("orderstatus") == 3'>
   <i xid="i1"></i>
   <span xid="span12">评价商品</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-sm process-btn" label="确认收货" xid="button2" bind-visible=' val("orderstatus") == 2'>
   <i xid="i2"></i>
   <span xid="span13">确认收货</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-sm process-btn" label="立即支付" xid="paynowBtn" bind-visible=' val("orderstatus") == 0' onClick="paynowBtnClick">
   <i xid="i3"></i>
   <span xid="span14">立即支付</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-sm process-btn" label="删除订单" xid="deleteBtn" onClick="deleteBtnClick" bind-visible=' val("orderstatus") == 0'>
   <i xid="i4"></i>
   <span xid="span15">删除订单</span></a></div>
   </div>
  </div></ul> 
  </div></div>
   <div class="x-content-center x-pull-up" xid="div6">
    <span class="x-pull-up-label" xid="span18">加载更多...</span></div> </div>
  <div xid="mergediv" style="height:48px;position:absolute;bottom:0px;background-color:white;width:100%;padding-top:4px;border-top:solid 1px #f6f6f6;padding-right:5px;display:none;" class="text-right"><a component="$UI/system/components/justep/button/button" class="btn btn-default merge-btn" label="　合并付款　" xid="mergepaybtn" onClick="mergepaybtnClick">
   <i xid="i11"></i>
   <span xid="span22">　合并付款　</span></a></div></div>
  </div> 
<resource xid="resource2"><require xid="require1" url="css!$UI/flowerfront/icon/my.icons"></require>
  <require xid="require2" url="css!$UI/flowerfront/icon2/my2.icons"></require>
  <require xid="require3" url="css!$UI/flowerfront/css/zhifu"></require></resource>
  <span component="$UI/system/components/justep/messageDialog/messageDialog" xid="deletemessageDialog" type="YesNo" message="确认删除订单？" onNo="deletemessageDialogNo"></span>
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver" direction="auto" xid="popOver1" position="bottom">
   <div class="x-popOver-overlay" xid="div2"></div>
   <div class="x-popOver-content" xid="div3" style="background-color:white;width:100%;height:70%;">
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row14" style="border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#f6f6f6;">
     <div class="x-col" xid="col23"></div>
     <div class="x-col text-center" xid="col24">
      <span xid="span20" style="font-size:medium;">确认付款</span></div> 
     <div class="x-col text-right" xid="col25">
      <i xid="i9" class="linear linear-cross text-muted" bind-click="i9Click"></i></div> </div> 
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row15" style="margin-top:20px;">
     <div class="x-col" xid="col26"></div>
     <div class="x-col text-center" xid="col27">
      <span xid="span23" style="color:#fe2e23;font-size:x-large;">￥0.00</span></div> 
     <div class="x-col" xid="col28"></div></div> 
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row16" style="margin-top:20px;border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#f6f6f6;display:none;">
     <div class="x-col x-col-25" xid="col29">
      <span xid="span16"><![CDATA[支付方式]]></span></div> 
     <div class="x-col text-right" xid="col30">
      <span xid="span25">可用余额：￥0.00</span></div> 
     </div> 
    <div component="$UI/system/components/justep/list/list" class="x-list" xid="list4" data="paystatusData">
   <ul class="x-list-template" xid="listTemplateUl4">
    <li xid="li19"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row12">
   <div class="x-col x-col-33" xid="col13"><![CDATA[]]>
  <span xid="span32"><![CDATA[支付方式]]></span></div>
   <div class="x-col text-right" xid="col14"><span xid="span33" bind-text='val("paysummary")'></span></div>
   </div></li></ul> </div><hr xid="hr3" style="margin:0px;margin-left:0px;border-top: 1px solid #f6f6f6;"></hr><div component="$UI/system/components/justep/row/row" class="x-row" xid="row17" style="position:absolute;bottom:20px;">
     <div class="x-col" xid="col32">
      <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-block wxcolor" label="立即支付" xid="payBtn" onClick="payBtnClick">
       <i xid="i10"></i>
       <span xid="span26">立即支付</span></a> </div> </div> 
  </div> </div>
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver" direction="auto" xid="passwordpopOver" opacity="0.5" position="bottom">
   <div class="x-popOver-overlay" xid="div10"></div>
   <div class="x-popOver-content" xid="div9" style="width:100%;height:100%;">
    <div xid="div8" class="ftc_wzsf">
     <div xid="div7" class="srzfmm_box">
      <div xid="div8" class="qsrzfmm_bt clear_wl" style="padding:10px;">
       <i xid="i12" class="linear linear-cross text-muted" style="font-size:large;" bind-click="i2Click"></i>
       <span xid="span27">请输入操作密码</span></div> 
      <div xid="div9" class="zfmmxx_shop">
       <div xid="div10" class="mz">
        <span xid="span28">测试商品</span></div> 
       <div xid="div11" class="zhifu_price">
        <span xid="span29"><![CDATA[支付订单]]></span>
  <span xid="span31" style="color:#fe2e23;"></span></div> </div> 
      <ul xid="ul1" class="mm_box">
       <li xid="li1"></li>
       <li xid="li2"></li>
       <li xid="li3"></li>
       <li xid="li4"></li>
       <li xid="li5"></li>
       <li xid="li6"></li></ul> 
      <label xid="label1" style="margin-left:20px;margin-top:10px;font-weight:normal;" class="text-danger">此密码不是微信支付密码</label>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right" label="忘记密码" xid="forgetbtn" style="margin-right:8px;" onClick="forgetbtnClick">
       <i xid="i13"></i>
       <span xid="span30">忘记密码</span></a> </div> 
     <div xid="div12" class="numb_box">
      <div xid="div13" class="xiaq_tb">
       <img src="$UI/flowerfront/image/jftc_14.jpg" alt="" xid="image2" height="10px"></img></div> 
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