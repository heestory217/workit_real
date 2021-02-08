<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
.highcharts-figure, .highcharts-data-table table {
    min-width: 360px; 
    width: 75%;
    margin: auto;
}

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 1200px;
	max-width: 1200px;
}
.highcharts-container {
	width:1200px;
	
}
.highcharts-data-table caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}
.highcharts-data-table th {
	font-weight: 600;
    padding: 0.5em;
}
.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
    padding: 0.5em;
}
.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
    background: #f8f8f8;
}
.highcharts-data-table tr:hover {
    background: #f1f7ff;
}

</style>
<div class="col-xl-9 col-lg-12 col-md-8 col-sm-12 col-12">
	<div class="card" id="chart">
		<h5 class="card-header">사이트 전체 매출</h5>
		<figure class="highcharts-figure">
    		<div id="container"></div>
		</figure>
	</div>
</div>


<div class="col-xl-3 col-lg-12 col-md-4 col-sm-12 col-12">
	<div class="card" id="table">
		<table class="table">
			<colgroup>
				<col width="20%">
				<col width="30%">
				<col width="50%">
			</colgroup>
		<thead class="bg-light">
		  <tr class="border-0">
		    <th>월</th>
		    <th>판매 수량</th>
		    <th>금액</th>
		  </tr>
	  	</thead>
		  <c:forEach var="item" items="${totalList}">
			  <tr>
			    <td>${item.MONTH }</td>
			    <td>${item.QTY } 건</td>
			    <td>
			    	<c:if test="${empty item.TOTAL }">0 원</c:if>
			    	<c:if test="${!empty item.TOTAL }">
				    	<fmt:formatNumber value="${item.TOTAL }" pattern="#,###"/> 원
			    	</c:if>
		    	</td>
			  </tr>
		  </c:forEach>
		</table>
	</div>
</div>


<!-- highchart -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<script type="text/javascript">

var total=[${totalList[0].TOTAL}, ${totalList[1].TOTAL},${totalList[2].TOTAL},${totalList[3].TOTAL},${totalList[4].TOTAL},${totalList[5].TOTAL},${totalList[6].TOTAL},${totalList[7].TOTAL},${totalList[8].TOTAL},${totalList[9].TOTAL},${totalList[10].TOTAL},${totalList[11].TOTAL},${totalList[12].TOTAL}];
for(var i=0; i<total.length; i++){
	if(total[i]==null){
		total[i]=0;
	}
}
var year = ${year};

var salesMonth = total;

Highcharts.chart('container', {
    chart: {
        type: 'line'
    },
    title: {
        text: ''
    },
    subtitle: {
        text: year+'년'
    },
    xAxis: {
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    },
    yAxis: {
        title: {
            text: '단위 : 원'
        }
    },
    plotOptions: {
        line: {
            dataLabels: {
                enabled: true
            },
            enableMouseTracking: false
        }
    },
    series: [{
        name: '월간 매출',
        data: salesMonth
    }]
});

/*
var obj10 = document.getElementById('table'); 
var obj20 = document.getElementById('chart');

var obj10_height = obj10.offsetHeight;
var obj20_height = obj20.offsetHeight;

function chartResize(){
	if(obj10_height > obj20_height) { obj20.style.height = obj10_height + 'px'; }
	else { obj10.style.height = obj20_height + 'px'; }
}

window.onload = function() {
		chartResize();
		window.onresize = function(event) { console.log('Resizing...'), chartResize(); };
	}
*/
</script>
