<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery.min.js"></script>
    <!-- google charts -->
       <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<div align="left"><h2 class="subTitle" style=" color:#212529; width:1100px; height: 60px; margin-left: 150px;"><span>&lt;&nbsp;매출 통계&nbsp;&gt;</span></h2>
		<img src="<c:url value='/resources/images/밑줄쫙.png'/>" style="width: 230px; margin-left: 130px; margin-top: -80px;" ></div>
<div style="margin-left: 150px;">
    <form method="get" action="<c:url value='/chart'/>">
    <select name="year" size="1">
 		<option value="2017">2017년</option>
 		<option value="2018">2018년</option>
 		<option value="2019">2019년</option>
 	</select>
 	<select name="month" size="1">
     	<option value="1">1월</option>
 		<option value="2">2월</option>
 		<option value="3">3월</option>
 		<option value="4">4월</option>
 		<option value="5">5월</option>
 		<option value="6">6월</option>
 		<option value="7">7월</option>
 		<option value="8">8월</option>
 		<option value="9">9월</option>
 		<option value="10">10월</option>
 		<option value="11">11월</option>
 		<option value="12">12월</option>
 	</select>
 	<input type="submit" value="조회">
 	</form>
 	</div>
 	<script type="text/javascript">
	var select=document.getElementsByName("year")[0];
	for(var i=0; i<select.options.length;i++){
		if(select.options[i].value=='${map.selyear}'){
			select.options[i].selected=true;
		}
	}
	var select1=document.getElementsByName("month")[0];
	for(var i=0; i<select1.options.length;i++){
		if(select1.options[i].value=='${map.selmonth}'){
			select1.options[i].selected=true;
		}
	}
</script>
 	<div align="right" style="margin-right: 150px;">
 	<h4 class="font1" style="font-size:18px;">등급별 적립포인트</h4>
 	<form method="post" action="<c:url value='/chart'/>">
꼬끼오등급 적립포인트 :
<select name="goggio">
<option value="0">0%</option>
<option value="1">1%</option>
<option value="3">3%</option>
<option value="5">5%</option>
<option value="10">10%</option>
<option value="20">20%</option>
<option value="50">50%</option>
</select><br>
<script type="text/javascript">
	var select2=document.getElementsByName("goggio")[0];
	for(var i=0; i<select2.options.length;i++){
		if(select2.options[i].value=='${map.goggio1}'){
			select2.options[i].selected=true;
		}
	}
</script>
삐약등급 적립포인트 :
<select name="biyack">
<option value="0">0%</option>
<option value="1">1%</option>
<option value="3">3%</option>
<option value="5">5%</option>
<option value="10">10%</option>
<option value="20">20%</option>
<option value="50">50%</option>
</select><br>
<script type="text/javascript">
	var select3=document.getElementsByName("biyack")[0];
	for(var i=0; i<select3.options.length;i++){
		if(select3.options[i].value=='${map.biyack1}'){
			select3.options[i].selected=true;
		}
	}
</script>
알등급 적립포인트 :
<select name="al">
<option value="0">0%</option>
<option value="1">1%</option>
<option value="3">3%</option>
<option value="5">5%</option>
<option value="10">10%</option>
<option value="20">20%</option>
<option value="50">50%</option>
</select><br>
<script type="text/javascript">
	var select4=document.getElementsByName("al")[0];
	for(var i=0; i<select4.options.length;i++){
		if(select4.options[i].value=='${map.al1}'){
			select4.options[i].selected=true;
		}
	}
</script>
주문 수수료 :
<select name="ordFee">
<option value="0">0%</option>
<option value="1">1%</option>
<option value="2">2%</option>
<option value="3">4%</option>
<option value="5">5%</option>
</select><br><br>
<script type="text/javascript">
	var select5=document.getElementsByName("ordFee")[0];
	for(var i=0; i<select5.options.length;i++){
		if(select5.options[i].value=='${map.ordFee1}'){
			select5.options[i].selected=true;
		}
	}
</script>
<input type="submit" value="적용" class="btn btn-primary font1" style="font-size:18px;">
</form>
</div>
 	
    <div id="Line_Controls_Chart">
      <!-- 라인 차트 생성할 영역 -->
          <div id="lineChartArea" style="padding:0px 20px 0px 0px;"></div>
      <!-- 컨트롤바를 생성할 영역 -->
          <div id="controlsArea" style="padding:0px 20px 0px 0px;"></div>
        </div>
 
  <script>
 
  var chartDrowFun = {
 
    chartDrow : function(){
        var chartData = '';
        var chartDateformat     = 'yyyy년MM월dd일';
        var chartLineCount    = 10;
        var controlLineCount    = 10;
 
 		
        function drawDashboard() {
       	    var selyear=${map.selyear };
        	var selmonth=${map.selmonth };
        	var md=${map.md};
  
        	  $.ajax({
      			url:"<c:url value='/adminchart'/>",
      			data:{selyear:selyear,selmonth:selmonth,md:md},
      			dataType:"json",
      			success:function(data1){
      				var a = data1.a;
      				var b = data1.b;
      				var c = data1.c;
      				var year=data1.year;
      				var month=data1.month;
      				
          var data = new google.visualization.DataTable();
          data.addColumn('datetime' , '날짜');
          data.addColumn('number'   , '상단 광고비'); 
          data.addColumn('number'   , '메인 광고비');
          data.addColumn('number'   , '주문 수수료');
          data.addColumn('number'   , '총 수익');

          var dataRow = [];
        	for(var i=0; i<a.length; i++){
            var top = c[i];
            var main = b[i];
            var fee = a[i];
            var total = a[i]+b[i]+c[i];
            
            dataRow = [new Date(year, month-1, i , '10'),top,main,fee,total];
            data.addRow(dataRow);
        	}

            var chart = new google.visualization.ChartWrapper({
              chartType   : 'LineChart',
              containerId : 'lineChartArea',
              options     : {
                              isStacked   : 'percent',
                              focusTarget : 'category',
                              height          : 500,
                              width              : '100%',
                              legend          : { position: "top", textStyle: {fontSize: 13}},
                              pointSize        : 5,
                              tooltip          : {textStyle : {fontSize:12}, showColorCode : true,trigger: 'both'},
                              hAxis              : {format: chartDateformat, gridlines:{count:chartLineCount,units: {
                                                                  years : {format: ['yyyy년']},
                                                                  months: {format: ['MM월']},
                                                                  days  : {format: ['dd일']},
                                                                  hours : {format: ['HH시']}}
                                                                },textStyle: {fontSize:12}},
                vAxis              : {minValue: 100,viewWindow:{min:0},gridlines:{count:-1},textStyle:{fontSize:12}},
                animation        : {startup: true,duration: 1000,easing: 'in' },
                annotations    : {pattern: chartDateformat,
                                textStyle: {
                                fontSize: 15,
                                bold: true,
                                italic: true,
                                color: '#871b47',
                                auraColor: '#d799ae',
                                opacity: 0.8,
                                pattern: chartDateformat
                              }
                            }
              }
            });
 
            var control = new google.visualization.ControlWrapper({
              controlType: 'ChartRangeFilter',
              containerId: 'controlsArea',
              options: {
                  ui:{
                        chartType: 'LineChart',
                        chartOptions: {
                        chartArea: {'width': '60%','height' : 80},
                          hAxis: {'baselineColor': 'none', format: chartDateformat, textStyle: {fontSize:12},
                            gridlines:{count:controlLineCount,units: {
                                  years : {format: ['yyyy년']},
                                  months: {format: ['MM월']},
                                  days  : {format: ['dd일']},
                                  hours : {format: ['HH시']}}
                            }}
                        }
                  },
                    filterColumnIndex: 0
                }
            });
 
            var date_formatter = new google.visualization.DateFormat({ pattern: chartDateformat});
            date_formatter.format(data, 0);
 
            var dashboard = new google.visualization.Dashboard(document.getElementById('Line_Controls_Chart'));
            window.addEventListener('resize', function() { dashboard.draw(data); }, false); //화면 크기에 따라 그래프 크기 변경
            dashboard.bind([control], [chart]);
            dashboard.draw(data); 
      			}
      		});
        }
          google.charts.setOnLoadCallback(drawDashboard);
 
      }
    }
 
$(document).ready(function(){
  google.charts.load('current', {'packages':['line','controls']});
  chartDrowFun.chartDrow();
});
  </script>