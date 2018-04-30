<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
	.revImage {
		width: 150px;
		height: 100px;
	}
	
	#members_review_list {
		width: 800px;
		margin: auto;
	}
	
	.star_rating {
		font-size: 0;
	}
	
	.star_rating span {
		font-size: 18px;
		letter-spacing: 0;
		display: inline-block;
		color: #eeeeee;
		text-decoration: none;
	}
	
	.star_rating span.on {
		color: #dddd22;
	}
</style>
<div id="members_review_list">
	<h3>리뷰</h3>
	<br>
	<c:forEach var="review" items="${review }">
		<fmt:formatDate type="date" value="${review.rev_regd }" var="regd" pattern="MM dd, yyyy" />
		<div>
			<hr>
			<p>${review.mem_nick }&ndash; ${regd }</p>
			<p>${review.rev_cont }</p>
			<c:if test="${review.reviewImage != null }">
				<div class="revImage_wrapper">
					<c:forEach var="revImage" items="${review.reviewImage }">
						<img class="revImage ${review.rev_num }"
							src="<c:url value='/resources/images/review/${revImage.rev_img }' />">
					</c:forEach>
				</div>
				<br>
			</c:if>
			<p class="star_rating">
				<c:forEach begin="1" end="${review.rev_sco}">
					<span class="on">★</span>>
				</c:forEach>
				<c:forEach begin="${review.rev_sco+1}" end="5">
					<span>★</span>>
				</c:forEach>
			</p>
			<c:if test="${review.reviewComment != null }">
				<c:set var="revComment" value="${review.reviewComment }"></c:set>
				<fmt:formatDate type="date" value="${revComment.rev_com_regd }"	var="cregd" pattern="MM dd, yyyy" />
				<div style="margin-left: 100px;">
					<p>사장님 &ndash; ${cregd }</p>
					<p>${revComment.rev_com_cont }</p>
				</div>
			</c:if>
		</div>
	</c:forEach>
	<hr>
	<div align="center">
		<c:choose>
			<c:when test="${pu.startPageNum > pu.pageBlockCount }">
				<a href="<c:url value='/menu/menu?pageNum=${pu.startPageNum -1 }&sto_num=${stovo.sto_num}' />">
				<span style="color: #555;">&lt; 이전 &gt;</span></a>
			</c:when>
			<c:otherwise>
				<span style="color: black;">&lt; 이전 &gt;</span>
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i == pu.pageNum }">
					<span style="color: black;">[${i }]</span>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/menu/menu?pageNum=${i }&sto_num=${stovo.sto_num}' />">
					<span style="color: #555;">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${pu.endPageNum < pu.totalPageCount }">
				<a href="<c:url value='/menu/menu?pageNum=${pu.endPageNum + 1 }&sto_num=${stovo.sto_num}' />">
				<span style="color: #555;">&lt; 다음 &gt;</span></a>
			</c:when>
			<c:otherwise>
				<span style="color: black;">&lt; 다음 &gt;</span>
			</c:otherwise>
		</c:choose>
	</div>
</div>