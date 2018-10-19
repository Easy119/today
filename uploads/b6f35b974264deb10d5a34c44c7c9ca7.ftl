<#include "../include/imports.ftl">

<#-- @ftlvariable name="document" type="com.eorionsolution.ziincms.beans.Product" -->
<#if document??>
	<@hst.link var="link" hippobean=document/>
  <!-- NAVIGATION -->
  <nav class="navbar navbar-custom navbar-transparent navbar-light navbar-fixed-top">
    <div class="container">
      <div class="navbar-header"> 
        <!-- YOU LOGO HERE --> 
        <a class="navbar-brand" href="/"> 
        <!-- IMAGE OR SIMPLE TEXT --> 
        <img src="<@hst.webfile  path="/images/ziinlogob.png"/>" width="123" alt=""> </a> </div>
      
      <!-- ICONS NAVBAR -->
      <ul id="icons-navbar" class="nav navbar-nav navbar-right">
        <li> <a href="#" id="toggle-menu" class="show-overlay" title="Menu"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </a> </li>
      </ul>
      <!-- /ICONS NAVBAR -->
      
      <ul class="extra-navbar nav navbar-nav navbar-right">
        <li><a href="/" title="Home">Hone</a> </li>
        <li><a href="https://ziin.taobao.com/" title="Shop">Shop</a></li>
        <!-- <li><a href="index.html" title="APP">APP</a></li>-->
        <li><a href="/message" title="Contact">Contact</a></li>
      </ul>
    </div>
  </nav>
  <!-- /NAVIGATION --> 
  <@hst.cmseditlink hippobean=document/>
  <!-- HERO -->
  <#if document.topImage?has_content>
  	<@hst.link var="topImg" hippobean=document.topImage.original/>
  	<section id="show_full_height" class="module module-parallax module-full-height" data-background="${topImg}"> 
  <#elseif document.movieURL?has_content>
    <section id="hero" class="module-hero module-parallax module-full-height" data-vidbg-bg="mp4: ${document.movieURL}" data-vidbg-options="loop: true, muted: true, overlay: true ">
  <#else>
  	<section class="module module-parallax">
  </#if>
  
    
    <!-- HERO TEXT -->
    <div class="hero-caption">
      <div class="hero-text">
          <h1 class="mh-line-size-1 font-alt m-b-50">${document.title?html}</h1>
        </div>
    </div>
    <!-- /HERO TEXT --> 
    
  </section>
  <!-- /HERO --> 
  
  <!-- BLOG 2 COLUMN -->
  <section class="module">
    <div class="container">
      <div class="row"> 
        
        <!-- POSTS COLUMN -->
        <div class="col-sm-9" style="padding-right: 30px;">
          <div class="row multi-columns-row">
            <article class="post post-single">
              <div class="post-media">
  				<@hst.link var="oimg" hippobean=document.mainImage.original/>
              	<img src="${oimg}" alt="">
              </div>
              
              <!-- META -->
              <div class="post-meta font-alt">SIZE/${document.sizeMessage}</div>
              <!-- /META --> 
              
              <!-- HEADER -->
              <div class="post-header">
                <h1 class="post-title font-alt">${document.title?html}, ${document.chineseTitle?html}</h1>
              </div>
              <!-- /HEADER --> 
              
              <!-- POST CONTENT -->
              <div class="post-entry" style="display: inline-block;word-break: break-word;">
                <p style="word-break:break-normal;"></p>
                ${document.description}
              </div>
              <!-- /POST CONTENT --> 
              
              <!-- TAGS -->
              <div class="tags"> 
              
          		<#list document.category as categ>
              	<a href="#">${categ}</a>
				</#list>
              </div>
              <br>
              <!-- /TAGS --> 
              
            </article>
            
            <!-- WORKS GRID -->
            <div class="row"> 
			<#if document.partialImages?has_content>
    		<#list document.partialImages as parImage>
              <!-- GALLERY ITEM -->
              <div class="col-sm-12 col-md-12 col-lg-12">
                <div class="gallery-box">
                <@hst.link var="parImg" hippobean=parImage.original/>
                 <a href="${parImg}" class="gallery" title="Title 1">
                  <img src="${parImg}" alt="">
                 </a>
                </div>
              </div>
              <!-- /GALLERY ITEM --> 
            </#list>
            </#if>
            </div>
            <!--add a button to buy-->
            <div class="wrapBuyBtn">
              <a class="addBuyBtn" style="padding:8px 82px;background:rgba(238, 238, 238, 0.7);color:#111;" href="${document.movieURL}">BUY</a>
            </div>
            <!-- /WORKS GRID --> 
            
			<@hst.include ref="comment"/>
            
          </div>
        </div>
        <!-- POSTS COLUMN --> 
        
        <!-- SIDEBAR -->
        <div class="col-sm-3 m-t-sm-60"> 
          <!-- WIDGET -->
          <div class="widget">
            <h5 class="widget-title font-alt">Material Color</h5>
            <ul>
          		<#if document.materials?has_content>
				<#-- @ftlvariable name="material" type="com.eorionsolution.ziincms.beans.Material" -->
          		<#list document.materials as material>
          			<@hst.link var="pmImg" hippobean=material.image.original/>
          			<@hst.link var="pImg" hippobean=material.productImage.original/>
              		<li><img src="${pmImg}" class="img-circle" style=" height:14px"><a class="image-link" href="${pImg}" style="font-size:12px">${material.name?html}</a></li>
              	</#list>
              	</#if>
            </ul>
          </div>
          <!-- /WIDGET --> 
          
          <!-- WIDGET -->
          <div class="widget">
            <h5 class="widget-title font-alt">portrait</h5>
            
            <!-- BLOCKQUOTE -->
            <#if document.portrait?has_content>
				<#-- @ftlvariable name="portrait" type="com.eorionsolution.ziincms.beans.Portrait" -->
          		<#list document.portrait as portrait>
            <div class="row">
              <blockquote>
                <p style=" margin-bottom: 0px;"> 
                <font size="-1">MATERIAL:
                <ul>
                  <li style="padding: 0px 0px; padding-left: 10px;">${portrait.material}</li>
                </ul>
                </font>
                </p>
              </blockquote>
              <blockquote>
                <p style=" margin-bottom: 0px;"> 
                <font size="-1">SIZE:
                <ul>
                  <li style="padding: 0px 0px; padding-left: 10px;">${portrait.sizestring}</li>
                </ul>
                </font>
                </p>
              </blockquote>
              <blockquote>
                <p style=" margin-bottom: 0px;"> 
                <font size="-1">COLOR:
                <ul>
                  <li style="padding: 0px 0px; padding-left: 10px;">${portrait.color?html}</li>
                </ul>
                </font>
                </p>
              </blockquote>
              <blockquote>
                <p style=" margin-bottom: 0px;"> 
                <font size="-1">PAINTING:
                <ul>
                  <li style="padding: 0px 0px; padding-left: 10px;">${portrait.painting?html}</li>
                  <@hst.link var="poimg" hippobean=portrait.image.original/>
                  <li style="padding: 0px 0px; padding-left: 10px;"><img src="${poimg}" alt=""></li>
                </ul>
                
                </font> 
                </p>
              </blockquote>
            </div>
            </#list>
            </#if>
          </div>
          
          <!-- /BLOCKQUOTE --> 
          
          <!-- WIDGET -->
          <div class="widget">
            <h5 class="widget-title font-alt">RECOMMENDED</h5>
            <ul class="widget-posts">
            <#if document.recommended?has_content>
				<#-- @ftlvariable name="recommend" type="com.eorionsolution.ziincms.beans.Product" -->
          		<#list document.recommended as recommend>
          		<@hst.link var="rlink" hippobean=recommend/>
          		<@hst.link var="rimg" hippobean=recommend.image.original/>
              <li class="clearfix">
                <div class="widget-posts-image"> <a href="${rlink}"> <img src="${rimg}" alt=""> </a> </div>
                <div class="widget-posts-body">
                  <h6 class="widget-posts-title font-alt"> <a href="${rlink}">${recommend.title?html}</a> </h6>
                  <div class="widget-posts-meta">${recommend.chineseTitle?html}</div>
                </div>
              </li>
              </#list>
            </#if>
            </ul>
          </div>
          <!-- /WIDGET --> 
          
        </div>
        <!-- /SIDEBAR --> 
        
      </div>
    </div>
  </section>
  <!-- /BLOG 2 COLUMN --> 
</#if>