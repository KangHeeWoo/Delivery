<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div align="center"><h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;&nbsp;매장 관리&nbsp;&gt;</span></h2></div><br>
<div class="wrap_subContent">
	<ul class="boardul">
		<li><a href="<c:url value='/adstAdd' />" style="font-family: baemin4; font-size: 25px; margin-left: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;1. 매장 신청대기 리스트</a></li>
		<li><a href="<c:url value='/adstDel' />" style="font-family: baemin4; font-size: 25px; margin-left: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		2. 매장 탈퇴신청 리스트</a></li>
	</ul>
	<div><br><br><br><br></div>
 <table class="table">
 <tr class="font2" style="font-size: 18px;">
 <th>매장 번호</th><th>매장명</th><th>매장등록일</th><th>매장 상태</th>
 </tr>
 <c:forEach var="vo" items="${list }">
 <fmt:formatDate value="${vo.sto_regd }" var="regd" pattern="yyyy-MM-dd"/>
 <tr>
 <td>${vo.sto_num }</td><td><a href="<c:url value='/adstDetail?sto_num=${vo.sto_num }'/>">${vo.sto_name }</a></td><td>${regd}</td><td>${vo.sto_state }</td>
 </tr>
 </c:forEach>
 </table>
<br>
<!-- 페이징 -->
<div align="center">
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==pu.pageNum }"> <!-- 현재페이지 색상 다르게 표시하기 -->
				<span style="color: #34bdb9;">[${i }]</span>
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/adList/search?pageNum=${i }&word=${map.word }&search=${map.search }'/>"><span style="color: black;">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<br>
<form method="post" action="<c:url value='/adList/search'/>">
   <select name="search" id="search" size="1">
   <option value="name">매장명</option>
   </select>
<input type="text" name="word">
<input type="submit" value="검색">
</form>
</div>
</div>
</script>