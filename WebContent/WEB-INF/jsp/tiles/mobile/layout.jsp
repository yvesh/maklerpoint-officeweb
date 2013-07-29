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
	
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	
	<title><tiles:insertAttribute name="title" ignore="true" /></title>
	
	<link rel="stylesheet" href="<c:url value='/media/css/jquery-mobile.css'/>" type="text/css" />
	<script type="text/javascript" src="<c:url value='/media/js/jquery-1.6.2.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/media/js/jquery.mobile-1.0b2.min.js'/>"></script>		
	
</head>
<body>
	<div data-role="page"> 
		<div data-role="header"><tiles:insertAttribute name="header" ></tiles:insertAttribute></div> 
		<div data-role="content"><tiles:insertAttribute name="body" ></tiles:insertAttribute></div> 
		<div data-role="footer"><tiles:insertAttribute name="footer" ></tiles:insertAttribute></div> 
	</div> 
</body>
</html>
	