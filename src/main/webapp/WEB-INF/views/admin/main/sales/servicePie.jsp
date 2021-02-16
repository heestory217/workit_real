<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<style>
.highcharts-figure, .highcharts-data-table table {
    min-width: 320px; 
    max-width: 800px;
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
#highcharts-oq4pc9f-22 {
	width:100%;
}
.highcharts-root{
	width:100%;
}

input[type="number"] {
	min-width: 50px;
}
</style>
</head>
<body>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<div class="col-xl-12 col-lg-12 col-md-8 col-sm-12 col-12">
	<div class="card" id="piechart">
		<h5 class="card-header">서비스별 판매 추이</h5>
		<figure class="highcharts-figure" style="margin: 50px auto;">
		    <div id="pieContainer"></div>
		</figure>
	</div>
</div>

<script type="text/javascript">
Highcharts.chart('pieContainer', {
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    title: {
        text: ''
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    accessibility: {
        point: {
            valueSuffix: '%'
        }
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: {point.percentage:.1f} %'
            }
        }
    },
    series: [{
        name: '서비스',
        colorByPoint: true,
        data: [{
            name: '광고1급 15일',
            y: ${pieList[2].PER}
        }, {
            name: '광고1급 15일',
            y: ${pieList[0].PER}
        }, {
            name: '광고1급 30일',
            y: ${pieList[1].PER}
        }, {
            name: '광고2급 7일',
            y: ${pieList[5].PER}
        }, {
            name: '광고2급 15일',
            y: ${pieList[3].PER}
        }, {
            name: '광고2급 30일',
            y: ${pieList[4].PER}
        }, {
            name: '기업후기삭제',
            y: ${pieList[6].PER}
        }, {
            name: '기업후기 열람 7일',
            y: ${pieList[9].PER}
        }, { 
            name: '기업후기 열람 30일',
            y:  ${pieList[7].PER}
        },{
            name: '기업후기 열람 90일',
            y:  ${pieList[10].PER}
        },{
            name: '기업후기 열람 365일',
            y:  ${pieList[8].PER}
        },{
            name: '이력서 열람',
            y:  ${pieList[11].PER}
        }]
    }]
});
</script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
</body>