<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onParamsReceive="modelParamsReceive" onLoad="modelLoad"> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="agentlevelData" idColumn="id"><column name="id" type="String" xid="xid1"></column>
  <column name="name" type="String" xid="xid2"></column>
  <column name="corder" type="String" xid="xid3"></column>
  <column name="grant" type="String" xid="xid4"></column>
  <column name="amount" type="String" xid="xid5"></column>
  <column name="task" type="String" xid="xid6"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" style="background-color:white;" xid="title1">
          <div class="x-titlebar-left" style="color:#333333;"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title" style="font-weight:normal;color:#333333;"></div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content x-cards" xid="content1"><div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="smartContainer1" style="background-color:white;padding-top:20px;padding-bottom:20px;"><div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row1" style="height:50px;">
   <div class="x-col x-col-33" xid="col1"><span xid="span1"><![CDATA[代理等级]]></span></div>
   <div class="x-col" xid="col2"><select component="$UI/system/components/justep/select/select" bind-optionsCaption="请选择..." class="form-control input-class" xid="select1" bind-options="agentlevelData" bind-optionsValue="id" bind-optionsLabel="name"></select></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row2" style="margin-top:20px;">
   <div class="x-col" xid="col4"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-block surebtn" label="确定" xid="button1" onClick="button1Click">
   <i xid="i1"></i>
   <span xid="span2">确定</span></a></div>
   </div></div></div>
  </div> 
<div component="$UI/system/components/justep/popOver/popOver" class="x-popOver" direction="auto" xid="passwordpopOver" opacity="0.5" position="bottom">
   <div class="x-popOver-overlay" xid="div1"></div>
   <div class="x-popOver-content" xid="div2" style="width:100%;height:100%;"><div xid="div6" class="ftc_wzsf"><div xid="div7" class="srzfmm_box"><div xid="div8" class="qsrzfmm_bt clear_wl" style="padding:10px;"><i xid="i2" class="linear linear-cross text-muted" style="font-size:large;" bind-click="i2Click"></i><span xid="span3"><![CDATA[请输入操作密码]]></span>
  </div>
  <div xid="div9" class="zfmmxx_shop"><div xid="div10" class="mz"><span xid="span4"><![CDATA[测试商品]]></span></div>
  <div xid="div11" class="zhifu_price"><span xid="span5"><![CDATA[变更代理等级]]></span></div></div>
  <ul xid="ul1" class="mm_box"><li xid="li1"></li>
  <li xid="li2"></li>
  <li xid="li3"></li>
  <li xid="li4"></li>
  <li xid="li5"></li>
  <li xid="li6"></li></ul>
  <label xid="label1" style="margin-left:20px;margin-top:10px;font-weight:normal;" class="text-danger"><![CDATA[此密码不是微信支付密码]]></label><a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right" label="忘记密码" xid="forgetbtn" style="margin-right:8px;" onClick="forgetbtnClick">
   <i xid="i3"></i>
   <span xid="span6">忘记密码</span></a>
  </div>
  <div xid="div12" class="numb_box"><div xid="div13" class="xiaq_tb"><img src="$UI/flowerfront/image/jftc_14.jpg" alt="" xid="image1" height="10px"></img></div>
  <ul xid="ul2" class="nub_ggg"><li xid="li7"><a xid="a1" href="javascript:void(0);" class="zf_num"><![CDATA[1]]></a></li>
  <li xid="li8">
   <a xid="a2" href="javascript:void(0);" class="zj_x zf_num"><![CDATA[2]]></a></li>
  <li xid="li9">
   <a xid="a3" href="javascript:void(0);" class="zf_num"><![CDATA[3]]></a></li>
  <li xid="li10">
   <a xid="a4" href="javascript:void(0);" class="zf_num"><![CDATA[4]]></a></li>
  <li xid="li11">
   <a xid="a5" href="javascript:void(0);" class="zj_x zf_num"><![CDATA[5]]></a></li>
  <li xid="li12">
   <a xid="a6" href="javascript:void(0);" class="zf_num"><![CDATA[6]]></a></li>
  <li xid="li13">
   <a xid="a7" href="javascript:void(0);" class="zf_num"><![CDATA[7]]></a></li>
  <li xid="li14">
   <a xid="a8" href="javascript:void(0);" class="zj_x zf_num"><![CDATA[8]]></a></li>
  <li xid="li15">
   <a xid="a9" href="javascript:void(0);" class="zf_num"><![CDATA[9]]></a></li>
  <li xid="li16">
   <a xid="a10" href="javascript:void(0);" class="zf_empty"><![CDATA[清空]]></a></li>
  <li xid="li17">
   <a xid="a11" href="javascript:void(0);" class="zj_x zf_num"><![CDATA[0]]></a></li>
  <li xid="li18">
   <a xid="a12" href="javascript:void(0);" class="zf_del"><![CDATA[删除]]></a></li></ul></div>
  </div></div></div>
  <resource xid="resource2"><require xid="require2" url="css!$UI/flowerfront/css/zhifu"></require></resource></div>