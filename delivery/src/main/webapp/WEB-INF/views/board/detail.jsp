<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	#board_detail{
		width : 800px;
		margin : auto;
	}
	
	#notice_board .table th{
		width : 150px;
	}
	#boa_cont{
		width : 700px;
	}
	.re{
		width : 500px;
		margin-left: 150px;
		margin-right: 50px;
	}
	
	#comment_list{
		width : 800px;
		margin : auto;
	}
	
	#comment_list div{
		border-bottom: 1px solid gray;
		padding : 5px 0 5px 0;
	}
	
	#comment_list .comment_title span{
		font-weight: bold;
	}
	
	.comment_writer{
		width : 150px;
		display: inline-block;
	}
	
	.comment_content{
		width : 550px;
		display: inline-block;
	}
	
	.comment_re{
		width : 50px;
		display: inline-block;
	}
</style>
<div id="board_detail">
	<fmt:formatDate value="${vo.boa_regd }" var="date" pattern="yyyy-MM-dd HH:mm"/>
	<table class="table">
	<thead>
		<tr><th colspan="2">제목 : ${vo.boa_title }</th></tr>
	</thead>
	<tbody>
		<tr>
			<td>작성일 : ${date }</td>
		</tr>
		<tr>
			<td>
				<img src="<c:url value='/resources/images/board/${vo1.boa_img }' />">
				<p>${vo.boa_cont }</p>
			</td>
		</tr>
	</tbody>
	</table>
	
	<div id="comment_list">
		<div class="comment_title">
			<span class="comment_writer">작성자</span>
			<span class="comment_content">내용</span>
			<span class="comment_re">답글</span>
		</div>
		<c:forEach var="vo" items="${clist }">
			<div>
			<span class="comment_writer">
				<c:if test="${vo.boa_lev >0 }">
					<c:forEach begin="1" end="${vo.boa_lev }">
					&nbsp;&nbsp;&nbsp;
					</c:forEach>
					[re]
				</c:if>
				${vo.boa_com_writer }</span>
				<span class="comment_content">
				<c:if test="${vo.boa_lev >0 }">
					<c:forEach begin="1" end="${vo.boa_lev }">
					&nbsp;&nbsp;&nbsp;
					</c:forEach>
				</c:if>
				${vo.boa_cont }</span>
				<span class="comment_re">
					<a onclick="reComment(${vo.boa_com_num}, event)">답글</a>
				</span>
			</div>
			<div style="display: none">
				<form action="<c:url value='/comment/insertOk'/>" method="post" onsubmit="return idcheck('${email}')">
					<input type="hidden" name="boa_num" value="${vo.boa_num }">
					<input type="hidden" name="boa_com_num" value="${vo.boa_com_num }">
					<input type="hidden" name="boa_lev" value="${vo.boa_lev }">
					<input type="hidden" name="boa_step" value="${vo.boa_step }">
					<input type="hidden" name="boa_ref" value="${vo.boa_ref }">
					<input type="text" class="re" name="boa_cont"><input type="submit" value="등록">
				</form>
			</div>
		</c:forEach>
	</div>
	<br>
	<form action="<c:url value='/comment/insertOk'/>" method="post" onsubmit="return idcheck('${email}')">
		<input type="hidden" name="boa_num" value="${vo.boa_num }">
		댓글 <input id="boa_cont" type="text" name="boa_cont">
		<input type="submit" value="등록">
	</form>
	<br><br>
	<table class="table">
		<c:choose>
			<c:when test="${prev == null }">
				<tr><th>이전글</th><td>이전글이 없습니다.</td></tr>
			</c:when>
			<c:otherwise>
				<tr><th>이전글</th><td onclick="detail(${prev.boa_num})">${prev.boa_title }</td></tr>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${next == null }">
				<tr><th>다음글</th><td>다음글이 없습니다.</td></tr>
			</c:when>
			<c:otherwise>
				<tr><th>다음글</th><td onclick="detail(${next.boa_num})">${next.boa_title }</td></tr>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="2"><a href="<c:url value='/board/list' />">목록으로 가기</a></td>
			<td><a href="<c:url value='/board/delete?boa_num=${vo.boa_num }' />">삭제</a></td>
			<td><a href="<c:url value='/board/update?boa_num=${vo.boa_num }' />">수정</a></td>			
		</tr>
	</table>
</div>
<script>
	function detail(boa_num){
		location.href = "<c:url value='/board/detail?boa_num=" + boa_num + "' />";
	}
	function reComment(boa_com_num,event){
		var reForm = $(event.target).parent().parent().next();
		
		if($(reForm).css("display")=="none"){
			//alert(reForm.style.display);
			$(reForm).css("display", "inline");
		}else{
			$(reForm).css("display", "none");
		}
	}
	function idcheck(email){
		if(email==""){
			alert("로그인 후 이용해 주세요.");
			return false;
		}
	}
</script>