<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onLoad="modelLoad" onParamsReceive="modelParamsReceive"> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="imageData" idColumn="id" confirmDelete="false"><column name="id" type="String" xid="xid1"></column>
  <column name="image" type="String" xid="xid2"></column>
  <column name="isnull" type="String" xid="xid3"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="评价"
          class="x-titlebar" style="background-color:white;">
          <div class="x-titlebar-left" style="color:#333333;"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title" style="font-weight:normal;color:#333333;">评价</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content x-cards" xid="content1" style="overflow: hidden"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="imageData">
   <ul class="x-list-template" xid="listTemplateUl1" componentname="$UI/system/components/justep/list/list#listTemplateUl" id="undefined_listTemplateUl1">
    <div xid="div2" class="col-xs-3 col-sm-3" style="padding:2px;"><div xid="imagediv" style="background-color: white;overflow: hidden;" class="imagediv" componentname="div(html)" id="undefined_div1" bind-click="imagedivClick"><img src=" " alt="" xid="image1" bind-attr-src=' val("image")' style="width:100%;"></img>
  <i xid="i1" class="e-commerce e-commerce-jiahao addi text-muted" style="position:absolute;left:50%;top:50%;" bind-visible=' val("isnull") == 1'></i>
  <span xid="span1" class="fileinput" bind-visible=' val("isnull") == 1'><input type="file" value="" xid="upload_file" bind-change="upload_fileChange"></input></span>
  </div></div></ul> 
  </div>
  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3">
   <div class="x-col" xid="col5"></div>
   <div class="x-col" xid="col6"></div>
   <div class="x-col" xid="col7"></div></div>
  <div xid="div6" style="background-color:white;border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#f6f6f6;"><div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified x-flower" tabbed="true" xid="buttonGroup1">
   <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-left" label="好评" xid="goodBtn" icon="my2 my2-haoping" onClick="goodBtnClick">
    <i xid="i5" class="my2 my2-haoping"></i>
    <span xid="span6">好评</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-left" label="中评" xid="normalBtn" icon="my2 my2-zhongping" onClick="normalBtnClick">
    <i xid="i6" class="my2 my2-zhongping"></i>
    <span xid="span7">中评</span></a> 
  <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-left" label="差评" xid="badBtn" icon="my2 my2-chaping" onClick="badBtnClick">
   <i xid="i7" class="my2 my2-chaping"></i>
   <span xid="span9">差评</span></a></div></div><div xid="div7" style="border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#f6f6f6;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row2" style="background-color:white;">
   <div class="x-col" xid="col2"><textarea component="$UI/system/components/justep/textarea/textarea" class="form-control input-class" xid="commenttextarea" placeHolder="评价内容"></textarea></div>
   </div></div><div xid="div8" style="background-color:white;border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#f6f6f6;"><div component="$UI/system/components/justep/row/row" class="x-row x-row-center text-muted" xid="anonymousrow" bind-click="anonymousrowClick">
   <div class="x-col x-col-fixed" xid="col19" style="width:20px;"><i xid="i8" class="my2 my2-niming" style="font-size:medium;"></i></div>
   <div class="x-col" xid="col20"><span xid="span11"><![CDATA[匿名]]></span></div>
   <div class="x-col text-right" xid="col21"><i xid="anonymousi" class="my2 my2-xuanzhong" style="display:none;"></i></div></div></div><div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row4" style="background-color:white;">
   <div class="x-col x-col-fixed" xid="col10" style="width:80px;"><span xid="span5"><![CDATA[描述相符]]></span></div>
   <div class="x-col" xid="col8"><div xid="xiangfudiv"></div></div>
   <div class="x-col x-col-fixed" xid="col9" style="width:80px;"><span xid="xiangfuspan"></span></div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row6" style="background-color:white;">
   <div class="x-col x-col-fixed" xid="col12" style="width:80px;">
    <span xid="span8"><![CDATA[物流服务]]></span></div> 
   <div class="x-col" xid="col3">
    <div xid="wuliudiv"></div></div> 
   <div class="x-col x-col-fixed" xid="col4" style="width:80px;">
    <span xid="wuliuspan"></span></div> </div><div component="$UI/system/components/justep/row/row" class="x-row x-row-center" xid="row7" style="background-color:white;">
   <div class="x-col x-col-fixed" xid="col15" style="width:80px;">
    <span xid="span10"><![CDATA[服务态度]]></span></div> 
   <div class="x-col" xid="col13">
    <div xid="fuwudiv"></div></div> 
   <div class="x-col x-col-fixed" xid="col14" style="width:80px;">
    <span xid="fuwuspan"></span></div> </div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row8" style="height:30px;">
   <div class="x-col" xid="col18"></div>
   <div class="x-col" xid="col16"></div>
   <div class="x-col" xid="col17"></div></div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row5">
   <div class="x-col" xid="col11"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-block surebtn" label="提交" xid="submitBtn" bind-click="submitBtnClick">
   <i xid="i4"></i>
   <span xid="span4">提交</span></a></div>
   </div>
  </div>
  </div> 
<div component="$UI/system/components/justep/popOver/popOver" class="x-popOver" direction="auto" xid="popOver1" opacity="0.9">
   <div class="x-popOver-overlay" xid="div1" style="background-color:black;"></div>
   <div class="x-popOver-content" xid="div3" style="width:100%;overflow-y: unset;"><div xid="div4" class="swiper-container" style="width:100%;"><div xid="div5" class="swiper-wrapper"></div></div>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-only-icon popclose" label="button" xid="closepop" icon="linear linear-cross" style="position:absolute;color:#ffffff;" onClick="closepopClick">
   <i xid="i2" class="linear linear-cross"></i>
   <span xid="span2"></span></a>
  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1" style="z-index:1;position:absolute;bottom:0px;">
   <div class="x-col" xid="col1"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-block delimg" label="删除照片" xid="delectimgBtn" onClick="delectimgBtnClick">
   <i xid="i3"></i>
   <span xid="span3">删除照片</span></a></div>
   </div></div></div>
  <resource xid="resource2"><require xid="require1" url="css!$UI/flowerfront/icon2/my2.icons"></require></resource></div>