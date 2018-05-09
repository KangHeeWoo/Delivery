<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.store-manage-menu{
	position: absolute;
	left : 300px;
}
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   <script type="text/javascript">
  // alert("test1");
   
      google.charts.load('current', {'packages':['gauge']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
    	var sto_num=${vo.sto_num};
        var data = google.visualization.arrayToDataTable([
          ['Label', 'Value'],
          ['주문량', 55]
        ]);
        var options = {
          width: 400, height: 120,
          redFrom: 90, redTo: 100,
          yellowFrom:75, yellowTo: 90,
          minorTicks: 5
        };

        var chart = new google.visualization.Gauge(document.getElementById('chart_div'));
        chart.draw(data, options);
         
        $.ajax({
			url:"<c:url value='/Sungjoon'/>",
			dataType:"json",
			data:{sto_num:sto_num},
			success:function(data1){
				var a=data1.a;
          data.setValue(0, 1, a);
          chart.draw(data, options);
  		 	 },error:function(){
  		 		 alert("error");
  		 	 }
  		});
      }
    </script>
    <div class="store-manage-menu" id="chart_div" style="width: 400px; height: 120px;"></div>
<table class="table" style="width: 800px;margin: auto;">
	<tr>
	<th>매장명</th><td>${vo.sto_name }</td>
	</tr>
	<tr>
	<th>사업자 등록번호</th><td>${vo.sto_regnum }</td>
	</tr>
	<tr>
	<th>주소</th><td>${vo.sto_addr }</td>
	</tr>
	<tr>
	<th>전화번호</th><td>${vo.sto_phone }</td>
	</tr>
	<fmt:formatDate value="${vo.sto_regd }" var="regd1" pattern="yyyy-MM-dd"/>
	<tr>
	<th>등록일</th><td>${regd1 }</td>
	</tr>
	<tr>
	<fmt:formatDate value="${vo.sto_open }" var="regd2" pattern="kk:mm"/>
	<th>오픈시간</th><td>${regd2 }</td>
	</tr>
	<fmt:formatDate value="${vo.sto_close }" var="regd3" pattern="kk:mm"/>
	<tr>
	<th>마감시간</th><td>${regd3 }</td>
	</tr>
	<tr>
	<th>휴무일</th><td>${vo.sto_holiday }</td>
	</tr>
	<tr>
	<th>소개</th><td><textarea cols="60" rows="10" name="sto_intro" readonly="readonly">${vo.sto_intro }</textarea></td>
	</tr>
	<tr>
	<th>상태</th><td>${vo.sto_state }</td>
	</tr>
</table>
<div style="width: 800px; margin: auto;">
</div>

