<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
.highcharts-figure, .highcharts-data-table table {
    min-width: 360px; 
    max-width: 600px;
    margin: 1em auto;
}

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
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

<figure class="highcharts-figure">
    <div id="container"></div>
</figure>

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

var salesMonth = total;

Highcharts.chart('container', {
    chart: {
        type: 'line'
    },
    title: {
        text: '사이트 전체 매출'
    },
    subtitle: {
        text: '2021년'
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
        name: '월별 매출',
        data: salesMonth
    }]
});

</script>
