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