<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>

<div align="center"><h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;즐겨찾기&gt;</span></h2></div><br>
<div class="wrap_subContent">
<table class="table" >
	<thead>
		<tr class="font2" style="font-size: 18px;">
			<th>매장명</th><th>주소</th><th>전화번호</th><th>영업시간</th><th>해제</th>
		</tr>
		<c:forEach var="book" items="${booklist }">
		<fmt:formatDate value="${book.sto_open}" var="open" pattern="HH:mm"/>
		<fmt:formatDate value="${book.sto_close}" var="close" pattern="HH:mm"/>
		<tr>
			<td onclick="bookpage(${book.sto_num})">${book.sto_name}</td>
			<td onclick="bookpage(${book.sto_num})">${book.sto_addr}</td>
			<td onclick="bookpage(${book.sto_num})">${book.sto_phone}</td>
			<td onclick="bookpage(${book.sto_num})">${open} &sim; ${close }
			</td>
			<td><input type="button" value="즐겨찾기 해제" onclick="bookDel(${book.sto_num})"></td>
		</tr>
		</c:forEach>
	</thead>
</table>
<div align="center">
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==pu.pageNum }"><!-- 현재페이지 색상 다르게 표시하기 -->
				<a href="<c:url value='/members/bookmark?pageNum=${i }&field=${field }&search=${search }'/>"><span style='color:#34bdb9'>[${i }]</span></a>
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/members/bookmark?pageNum=${i }&field=${field }&search=${search }'/>"><span style='color:black'>[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
</div><br><br><br><br><br><br><br><br><br><br><br>
<%-- <div  style="width:1000px; margin: auto; ">
<table id="table_id" class="display" >
    <thead>
        <tr>
            <th>매장명</th>
            <th>주소</th>
            <th>전화번호</th>
            <th>영업시간</th>
            <th>해제</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="book" items="${booklist }">
		<fmt:formatDate value="${book.sto_open}" var="open" pattern="HH:mm"/>
		<fmt:formatDate value="${book.sto_close}" var="close" pattern="HH:mm"/>
		<tr >
			<td onclick="bookpage(${book.sto_num})">${book.sto_name}</td>
			<td onclick="bookpage(${book.sto_num})">${book.sto_addr}</td>
			<td onclick="bookpage(${book.sto_num})">${book.sto_phone}</td>
			<td onclick="bookpage(${book.sto_num})">${open} &sim; ${close }
			</td>
			<td><input type="button" value="즐겨찾기 해제" onclick="bookDel(${book.sto_num})"></td>
		</tr>
		</c:forEach>
    </tbody>
</table>
</div> --%>
<script>
	function bookpage(num){
		location.href="<c:url value='/menu/menu?sto_num="+num+"'/>";
	}
	function bookDel(sto_num){
		location.href="<c:url value='/members/bookDel?sto_num="+sto_num+"'/>";
		
	}
	/* $(document).ready( function () {
	    $('#table_id').DataTable({
	    	
	    	 "language": {
	             "lengthMenu": "Page _MENU_",
	             "zeroRecords": "즐겨찾기에 저장된 매장이 존재하지 않습니다.",
	             "info": "_PAGE_ of _PAGES_",
	             "infoEmpty": "No records available",
	             "infoFiltered": "(filtered from _MAX_ total records)",
	             "search":"검색"
	             
	         }
	    });
	} ); */
</script>