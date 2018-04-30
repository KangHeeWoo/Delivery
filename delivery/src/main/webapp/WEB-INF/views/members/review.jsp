<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
	.revImage{
		width : 150px;
		height : 100px;
	}
	
	#members_review_list {
		width: 800px;
		margin: auto;
	}
	
	.star_rating {font-size:0; letter-spacing:-4px;}
	.star_rating a {
	    font-size:22px;
	    letter-spacing:0;
	    display:inline-block;
	    margin-left:5px;
	    color:#ccc;
	    text-decoration:none;
	}
	.star_rating a:first-child {margin-left:0;}
	.star_rating a.on {color:#777;}
</style>
<div id="members_review_list">
	<c:forEach var="review" items="${review }">
		<fmt:formatDate type="date" value="${review.rev_regd }" var="regd" pattern="MM dd, yyyy"/>
		<div>
			<p>${review.mem_nick } &ndash; ${regd }</p>
			<p>${review.rev_cont }</p>
			<c:if test="${review.reviewImage != null }">
				<div class="revImage_wrapper">
					<c:forEach var="revImage" items="${review.reviewImage }">
						<img class="revImage ${review.rev_num }" src="<c:url value='/resources/images/review/${revImage.rev_img }' />">
					</c:forEach>
				</div>
				<br>
			</c:if>
			<p class="star_rating">
				<c:forEach begin="1" end="${review.rev_sco}">
					<a href="#" class="on">★</a>
				</c:forEach>
				<c:forEach begin="${review.rev_sco+1}" end="5">
				
				</c:forEach>
			</p>
		</div>		
	</c:forEach>
</div>