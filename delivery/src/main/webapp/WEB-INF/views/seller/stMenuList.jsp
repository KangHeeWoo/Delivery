<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="width: 800px; margin: auto;">
<a href="<c:url value='/stMenu'/>">메뉴 등록</a>
<form method="post" action="<c:url value='/stMenuUpdate'/>">
	<table class="table">
		<thead>
			<tr>
				<th>메뉴번호</th>
				<th>메뉴명</th>
				<th>가격</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td>${vo.men_num}</td>
					<td>${vo.men_name}</td>
					<td>${vo.men_price}</td>
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
					<td><a href="/stMenuDelete">삭제</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div align="center">
	
	<input type="submit" value="확인">
	</div>
	</form>
</div>
