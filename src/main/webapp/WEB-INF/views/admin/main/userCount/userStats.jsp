<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<link rel="stylesheet" type="text/css" 
	href="<c:url value='/resources/js/jquery-ui.min.css'/>">
<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>


<style>
	#containerUsers {
    height: 400px; 
}

.highcharts-figure, .highcharts-data-table table {
    min-width: 310px; 
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
	
</style>

<script type="text/javascript">
	$(function(){
		$('form[name=frm1]').submit(function(){
			if($('#startDay').val().length<1){
				alert('시작일을 입력하세요');
				$('#startDay').focus();
				event.preventDefault();
			}else if($('#endDay').val().length<1){
				alert('종료일을 입력하세요');
				$('#endDay').focus();
				event.preventDefault();
			}
		});
		/* $('#submit').click(){
			location.href="<c:url value='/admin/main/userCount/userStats.do'/>";
		} */
	});
</script>


<form name="frm1" method="post" >
	<!-- 조회기간 include -->
	<%@include file="../../inc/dateTerm.jsp" %>	
		
	<input type="submit" value="조회" >
</form>

<p>test중 확인용(미완) </p>
<p>${dateSearchVO.startDay } ~ ${dateSearchVO.endDay }까지의 현황입니다.</p>
<p>신규 개인 가입자 : ${totalNewUsers }</p>
<p>신규 기업 가입자 : ${totalNewCorps }</p>
<p>탈퇴 개인 : ${totalWithdrawUsers }</p>
<p>탈퇴 기업 : ${totalWithdrawCorps }</p>

<figure class="highcharts-figure">
    <div id="containerUsers"></div>
</figure>

<script type="text/javascript">

Highcharts.chart('containerUsers', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'Work IT 회원 통계'
    },
    xAxis: {
        categories: ['신규', '탈퇴']
    },
    yAxis: {
        min: 0,
        title: {
            text: '단위 : 명'
        },
        stackLabels: {
            enabled: true,
            style: {
                fontWeight: 'bold',
                color: ( // theme
                    Highcharts.defaultOptions.title.style &&
                    Highcharts.defaultOptions.title.style.color
                ) || 'gray'
            }
        }
    },
    legend: {
        align: 'right',
        x: -30,
        verticalAlign: 'top',
        y: 25,
        floating: true,
        backgroundColor:
            Highcharts.defaultOptions.legend.backgroundColor || 'white',
        borderColor: '#CCC',
        borderWidth: 1,
        shadow: false
    },
    tooltip: {
        headerFormat: '<b>{point.x}</b><br/>',
        pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
    },
    plotOptions: {
        column: {
            stacking: 'normal',
            dataLabels: {
                enabled: true
            }
        }
    },
    series: [{
        name: '개인',
        data: [${totalNewUsers}, ${totalWithdrawUsers }]
    },{
        name: '기업',
        data: [${totalNewCorps }, ${totalWithdrawCorps }]
    }]
});

</script> 

