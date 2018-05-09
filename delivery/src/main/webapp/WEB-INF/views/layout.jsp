<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배달의백성民</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css?ver=1'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap-theme.min.css'/>">
<link href="<c:url value='/resources/css/agency.min.css'/>" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/blueimp-gallery.min.css'/>">

<script src="<c:url value='/resources/js/blueimp-gallery.js'/>"></script>

 
<style>
@font-face{
	font-family: 'baemin';
	src:url(<c:url value="/resources/fonts/BMHANNA_11YRS_TTF.TTF"/>) format('truetype');
}
@font-face{
	font-family: 'baemin1';
	src:url(<c:url value="/resources/fonts/BMDOHYEON_TTF.TTF"/>) format('truetype');
}
@font-face{
	font-family: 'baemin2';
	src:url(<c:url value="/resources/fonts/BMJUA_TTF.TTF"/>) format('truetype');
}
@font-face{
	font-family: 'baemin3';
	src:url(<c:url value="/resources/fonts/BMKIRANGHAERANG-TTF.TTF"/>) format('truetype');
}
@font-face{
	font-family: 'baemin4';
	src:url(<c:url value="/resources/fonts/BMYEONSUNG_TTF.TTF"/>) format('truetype');
}
@font-face{
	font-family: 'baemin5';
	src:url(<c:url value="/resources/fonts/glyphicons-halflings-regular.ttf"/>) format('truetype');
}
.subTitle {
    font-family: baemin;
}
.font2{
	font-family: baemin2;
}
.font4{
	font-family: baemin4;
}
.font1{
	font-family: baemin1;
}
.font3{
	font-family: baemin3;
}
.font5{
	font-family: baemin5;
}

#mypageul li{
	 margin: 0 0 0 0;
    padding: 0 0 0 0;
    border : 0;
    float: left;
    list-style-type: none;
}
#mypageul li a{
	color : black;
	text-decoration:none;
	
}
#mypageul li a:hover{
	color : #34bdb9;
	text-decoration:none;
	
}
.wrap_subContent{
	width: 1000px;
	margin: auto;
}
.map_wrap {
	position: relative;
	width: 100%;
	height: 700px;
}

.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
	color:black;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
	color:black;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	color:black;
}
.main_ads{
	width:1000px;
	height: 700px;
}

</style>
</head>
<body>
<div id="warp">
	<div id="header">
		<tiles:insertAttribute name="header"/>
	</div>
	<div id="main">
		<tiles:insertAttribute name="main"/>
	</div>
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
</div>
</body>


 
 
 <!-- Bootstrap core JavaScript -->

    <script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>

    <!-- Plugin JavaScript -->
    <script src="<c:url value='/resources/js/jquery.easing.min.js'/>"></script>

    <!-- Contact form JavaScript -->
    <script src="<c:url value='/resources/js/jqBootstrapValidation.js'/>"></script>
    <script src="<c:url value='/resources/js/contact_me.js'/>"></script>

    <!-- Custom scripts for this template -->
    <script src="<c:url value='/resources/js/agency.min.js'/>"></script>
</html>