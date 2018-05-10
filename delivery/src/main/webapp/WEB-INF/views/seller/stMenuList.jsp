<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<div align="left"><h2 class="subTitle" style=" color:#34bdb9; width:1100px; height: 40px; margin-left: 400px; padding-top: 5px;"><span>&lt;&nbsp;매장 메뉴관리&nbsp;&gt;</span></h2>
<img src="<c:url value='/resources/images/밑줄쫙.png'/>" style="width: 250px; margin-left: 380px; margin-top: -40px;" >
</div>

<div style="width:1000px; margin: auto;">


<span style="font-family: baemin3; font-size: 21px; margin-left: 850px; margin-top: -50px;" id="detailspan"><a href="<c:url value='/stMenu'/>">메뉴 등록</a></span>
<br>
<form method="post" action="<c:url value='/stMenuUpdate'/>">
	<table class="table">
		<thead>
			<tr class="font2" style="font-size: 18px;">
				<th>메뉴명</th>
				<th>가격</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td><input type="hidden" name="men_num" value="${vo.men_num}">${vo.men_name}</td>
					<td><input type="text" name="men_price" value="${vo.men_price}"></td>
					<td>
						<select name="men_state">
							<c:choose>
								<c:when test="${vo.men_state=='가능' }">
									<option value="가능" selected="selected">주문가능</option>
									<option value="불가능">주문불가능</option>
								</c:when>
								<c:otherwise>
									<option value="가능">주문가능</option>
									<option value="불가능" selected="selected">주문불가능</option>
								</c:otherwise>
							</c:choose>
						</select>
					</td>
					<td><a href="<c:url value='/stMenuDelete?men_name=${vo.men_name }'/>">삭제</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table><br><br>
	<div align="center">
	<input type="submit" value="저장할래요" class="btn btn-primary font1" style="font-size:18px;">
	</div>
	</form>
</div>
<br><br><br><br><br>
