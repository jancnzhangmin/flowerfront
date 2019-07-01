<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onParamsReceive="modelParamsReceive" onLoad="modelLoad"> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="commentData" idColumn="id"><column name="id" type="String" xid="xid1"></column>
  <column name="comment" type="String" xid="xid2"></column>
  <column name="anonymous" type="String" xid="xid3"></column>
  <column name="nickname" type="String" xid="xid4"></column>
  <column name="headurl" type="String" xid="xid5"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="commentimgData" idColumn="id"><column name="id" type="String" xid="xid6"></column>
  <column name="comment_id" type="String" xid="xid7"></column>
  <column name="commentimg" type="String" xid="xid8"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="买家相册"
          class="x-titlebar" style="background-color:white;">
          <div class="x-titlebar-left" style="font-weight:normal;color:#333333;"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title" style="font-weight:normal;color:#333333;">买家相册</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="commentData">
   <ul class="x-list-template" xid="listTemplateUl1" style="padding-left:5px;padding-right:5px;">
    <div xid="div1" class="col-xs-6 col-sm-4" style="padding:5px;"><div xid="div2" style="border-radius:5px 5px 0px 0px;overflow: hidden;"><img src=" " alt="" xid="image1" bind-attr-src=' $model.getFirstImg( val("id"))' style="width:100%;" bind-click="image1Click"></img></div>
  <div xid="div3" style="padding-top:5px;">
  <span xid="span1" bind-text='val("comment")' class="textout"></span></div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1" style="padding:0px;">
   <div class="x-col x-col-fixed" xid="col1" style="width:30px;padding:0px;padding-top:3px;"><img src="$UI/flowerfront/image/user-192.png" alt="" xid="image2" style="border-radius: 50%;width:25px;" bind-attr-src=' val("headurl")' bind-visible=' val("anonymous") != 1'></img>
  
  <div xid="div4" bind-visible=' val("anonymous") == 1' style="padding-top:2px;"><i xid="i1" class="my2 my2-niming text-muted" bind-visible=' val("anonymous") == 1' style="font-size:large;margin-top:15px;"></i></div></div>
   <div class="x-col" xid="col4"><span xid="span2" bind-text=" val(&quot;anonymous&quot;) != 1 ? val(&quot;nickname&quot;) : '匿名'" class="text-muted" style="font-size:small;"></span></div></div></div></ul> 
  </div></div>
  </div> 
<resource xid="resource2"><require xid="require1" url="css!$UI/flowerfront/icon2/my2.icons"></require></resource>
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver" direction="auto" xid="popOver1" opacity="1" dismissible="false">
   <div class="x-popOver-overlay" xid="div5"></div>
   <div class="x-popOver-content" xid="div6" style="width:100%;height:100%;"><div xid="div7" class="swiper-container photoswiper"><div xid="div8" class="swiper-wrapper"></div></div>
  <div xid="div9" style="position:absolute;top:0;z-index:1;width:100%;" class="topdiv-gradient"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row2">
   <div class="x-col" xid="col2"><i xid="i2" class="linear linear-cross" style="color:#FFFFFF;" bind-click="i2Click"></i></div>
   <div class="x-col text-center" xid="col3"><span xid="span3" style="color:#FFFFFF;"><![CDATA[0/0]]></span></div>
   <div class="x-col" xid="col5"></div></div></div>
  <div xid="div10" style="position:absolute;bottom:0;z-index:1;width:100%;" class="bottomdiv-gradient"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row3" style="padding-top:0px;padding-bottom:0px;">
   <div class="x-col" xid="col6"><span xid="span4" style="color:#FFFFFF;"><![CDATA[@]]></span></div>
   <div class="x-col" xid="col7"></div>
   </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4">
   <div class="x-col" xid="col9"><span xid="span5" style="color:#FFFFFF;"></span></div>
   </div></div></div></div></div>