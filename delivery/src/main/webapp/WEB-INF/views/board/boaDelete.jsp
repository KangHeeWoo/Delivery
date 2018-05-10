<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
$(function(){
	if('${param.deleteOk}' == 'false1'){
		alert("본인의 글만 삭제 가능합니다.");
	}else{
		alert("삭제되었습니다.");
	}
})
</script>