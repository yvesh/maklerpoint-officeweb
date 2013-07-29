<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" 
%><%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" 
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de-de" lang="de-de" dir="ltr" >
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="MaklerPoint Office, MaklerPoint" />
	<meta name="generator" content="MaklerPoint Office Web" />
	<meta name="author" content="MaklerPoint Software - http://www.maklerpoint.de" />
	 
	<title><tiles:insertAttribute name="title" ignore="true" /></title>
	
	<link rel="stylesheet" href="<c:url value='/media/css/default.css'/>" type="text/css" />
	<link rel="stylesheet" href="<c:url value='/media/css/typography.css'/>" type="text/css" />	
	<link rel="stylesheet" href="<c:url value='/media/css/menu.css'/>" type="text/css" />
	<link rel="stylesheet" href="<c:url value='/media/css/jquery.css'/>" type="text/css" />
	<link rel="stylesheet" href="<c:url value='/media/css/fg.menu.css'/>" type="text/css" />
	<link rel="stylesheet" href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz|Droid+Sans' type='text/css' />
	
	<script type="text/javascript" src="<c:url value='/media/js/jquery-1.6.2.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/media/js/jquery-ui.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/media/js/jquery.ui.datepicker-de.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/media/js/jquery.dataTables.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/media/js/TableTools.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/media/js/fg.menu.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/media/js/basic.js'/>"></script> 
	
	<script type="text/javascript" src="<c:url value='/lib/tiny_mce/tiny_mce.js' />" ></script >
	<script type="text/javascript">
	tinyMCE.init({
			language : "de",
	        mode : "textareas",
	        theme : "advanced",
	        plugins : "pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",

	     // Theme options
	        theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
	        theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
	        theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
	        theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
	        theme_advanced_toolbar_location : "top",
	        theme_advanced_toolbar_align : "left",
	        theme_advanced_statusbar_location : "bottom",
	        theme_advanced_resizing : true
	});
	</script>
</head>
<body>
	<div id="bg">
		<div align="center">
			<div id="header">
				<div id="header_top">
				<tiles:insertAttribute name="header" ></tiles:insertAttribute>				
				</div>
				<div id="header_menu"><tiles:insertAttribute name="menu" /></div>
			</div>
			<div id="container" class="clearfix">
				<div id="content">
					<div id="content_in">
						<div id="status_messages"></div>			
						<tiles:insertAttribute name="body" />
					</div>
				</div>		
			</div>
			<div id="footer">
				<div id="footer_cont">
					<tiles:insertAttribute name="footer" />
				</div>
			</div>			
		</div>
	</div>
	<div id="dloading" style="visibility: hidden;">
		<div style="width: 60px; height: 60px; margin-left: auto; margin-right: auto; margin-top: 60px; text-align: center; vertical-align: middle;">
			<img src="<c:url value='/media/images/loader.gif' />" alt="Lade Daten..." /><br />
			Lade Daten..
		</div>
	</div>
</body>
</html>