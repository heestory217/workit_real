<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
.highcharts-figure, .highcharts-data-table table {
    min-width: 310px; 
    max-width: 1600px;
    margin: 1em auto;
}

#container {
    height: 400px;
}

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 1600px;
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
<div class="col-xl-12 col-lg-12 col-md-8 col-sm-12 col-12">
	<div class="card">
		<h5 class="card-header">서비스별 월간 매출</h5>
		<figure class="highcharts-figure">
		    <div id="serviceContainer"></div>
		</figure>
	</div>
</div>

<!-- 서비스별 상세 통계  -->
<div class="influence-profile-content pills-regular">
    <ul class="nav nav-pills mb-3 nav-justified" id="pills-tab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active show" id="pills-campaign-tab" data-toggle="pill" href="#pills-review" role="tab" aria-controls="pills-campaign" aria-selected="false">리뷰 열람</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="pills-packages-tab" data-toggle="pill" href="#pills-resume" role="tab" aria-controls="pills-packages" aria-selected="true">이력서 열람</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="pills-review-tab" data-toggle="pill" href="#pills-adv" role="tab" aria-controls="pills-review" aria-selected="false">채용공고 광고</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="pills-msg-tab" data-toggle="pill" href="#pills-del" role="tab" aria-controls="pills-msg" aria-selected="false">기업 리뷰 삭제</a>
        </li>
    </ul>
    <div class="tab-content" id="pills-tabContent">
	     <!-- 기업 리뷰 열람 서비스  -->
	     <!-- 기업 리뷰 열람 서비스  -->
	     <!-- 기업 리뷰 열람 서비스  -->
        <div class="tab-pane fade active show" id="pills-review" role="tabpanel" aria-labelledby="pills-campaign-tab">
            <div class="row">
                <div class="col-xl-9 col-lg-3 col-md-6 col-sm-12 col-12">
                    <div class="card">
                        <h5 class="card-header">건별 매출</h5>
							<figure class="highcharts-figure">
					    		<div id="reviewContainer"></div>
							</figure>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-12 col-md-4 col-sm-12 col-12">
					<div class="card">
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
						  	<c:forEach var="reviews" items="${reviewList}">
							  	<tr>
							  		<td>${reviews.MONTH}</td>
							  		<td>${reviews.QTY} 건</td>
							  		<td><fmt:formatNumber value="${reviews.TOTAL}" pattern="#,###"/> 원</td>
							  	</tr>
						  	</c:forEach>
                		</table>
                	</div>
             	</div>
            </div>
        </div>
        
        
        <!-- 이력서 열람 서비스  -->
        <!-- 이력서 열람 서비스  -->
        <!-- 이력서 열람 서비스  -->
        <div class="tab-pane fade" id="pills-resume" role="tabpanel" aria-labelledby="pills-packages-tab">
            <div class="row">
                  <div class="col-xl-9 col-lg-3 col-md-6 col-sm-12 col-12">
                    <div class="card">
                        <h5 class="card-header">건별 매출</h5>
							<figure class="highcharts-figure">
					    		<div id="resumeContainer"></div>
							</figure>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-12 col-md-4 col-sm-12 col-12">
					<div class="card">
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
						  	<c:forEach var="resumes" items="${resumeList}">
							  	<tr>
							  		<td>${resumes.MONTH}</td>
							  		<td>${resumes.QTY} 건</td>
							  		<td><fmt:formatNumber value="${resumes.TOTAL}" pattern="#,###"/> 원</td>
							  	</tr>
						  	</c:forEach>
                		</table>
                	</div>
             	</div>
            </div>
        </div>

		<!-- 광고  서비스  -->
		<!-- 광고  서비스  -->
		<!-- 광고  서비스  -->
        <div class="tab-pane fade" id="pills-adv" role="tabpanel" aria-labelledby="pills-review-tab">
            <div class="row">
                  <div class="col-xl-9 col-lg-3 col-md-6 col-sm-12 col-12">
                    <div class="card">
                        <h5 class="card-header">건별 매출</h5>
							<figure class="highcharts-figure">
					    		<div id="adContainer"></div>
							</figure>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-12 col-md-4 col-sm-12 col-12">
					<div class="card">
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
						  	<c:forEach var="ads" items="${adList}">
							  	<tr>
							  		<td>${ads.MONTH}</td>
							  		<td>${ads.QTY} 건</td>
							  		<td><fmt:formatNumber value="${ads.TOTAL}" pattern="#,###"/> 원</td>
							  	</tr>
						  	</c:forEach>
                		</table>
                	</div>
             	</div>
            </div>
        </div>
        
       	<!-- 리뷰 삭제  서비스  -->
       	<!-- 리뷰 삭제  서비스  -->
       	<!-- 리뷰 삭제  서비스  -->
        <div class="tab-pane fade" id="pills-del" role="tabpanel" aria-labelledby="pills-msg-tab">
			<div class="row">
                  <div class="col-xl-9 col-lg-3 col-md-6 col-sm-12 col-12">
                    <div class="card">
                        <h5 class="card-header">건별 매출</h5>
							<figure class="highcharts-figure">
					    		<div id="delContainer"></div>
							</figure>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-12 col-md-4 col-sm-12 col-12">
					<div class="card">
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
						  	<c:forEach var="dels" items="${delList}">
							  	<tr>
							  		<td>${dels.MONTH}</td>
							  		<td>${dels.QTY} 건</td>
							  		<td><fmt:formatNumber value="${dels.TOTAL}" pattern="#,###"/> 원</td>
							  	</tr>
						  	</c:forEach>
                		</table>
                	</div>
             	</div>
            </div>
        </div>
    
    	<!-- 리뷰 삭제  서비스끝  -->
    </div>
</div>

<script type="text/javascript">
var reviewTotal =[${reviewList[0].TOTAL},${reviewList[1].TOTAL},${reviewList[2].TOTAL},${reviewList[3].TOTAL},${reviewList[4].TOTAL},${reviewList[5].TOTAL},${reviewList[6].TOTAL},${reviewList[7].TOTAL},${reviewList[8].TOTAL},${reviewList[9].TOTAL},${reviewList[10].TOTAL},${reviewList[11].TOTAL},${reviewList[12].TOTAL} ];
var adTotal = [${adList[0].TOTAL},${adList[1].TOTAL},${adList[2].TOTAL},${adList[3].TOTAL},${adList[4].TOTAL},${adList[5].TOTAL},${adList[6].TOTAL},${adList[7].TOTAL},${adList[8].TOTAL},${adList[9].TOTAL},${adList[10].TOTAL},${adList[11].TOTAL},${adList[12].TOTAL}];
var delTotal = [${delList[0].TOTAL},${delList[1].TOTAL},${delList[2].TOTAL},${delList[3].TOTAL},${delList[4].TOTAL},${delList[5].TOTAL},${delList[6].TOTAL},${delList[7].TOTAL},${delList[8].TOTAL},${delList[9].TOTAL},${delList[10].TOTAL},${delList[11].TOTAL},${delList[12].TOTAL}];
var resumeTotal = [${resumeList[0].TOTAL},${resumeList[1].TOTAL},${resumeList[2].TOTAL},${resumeList[3].TOTAL},${resumeList[4].TOTAL},${resumeList[5].TOTAL},${resumeList[6].TOTAL},${resumeList[7].TOTAL},${resumeList[8].TOTAL},${resumeList[9].TOTAL},${resumeList[10].TOTAL},${resumeList[11].TOTAL},${resumeList[12].TOTAL}];

var reviewQty =[${reviewList[0].QTY},${reviewList[1].QTY},${reviewList[2].QTY},${reviewList[3].QTY},${reviewList[4].QTY},${reviewList[5].QTY},${reviewList[6].QTY},${reviewList[7].QTY},${reviewList[8].QTY},${reviewList[9].QTY},${reviewList[10].QTY},${reviewList[11].QTY},${reviewList[12].QTY} ];
var adQty = [${adList[0].QTY},${adList[1].QTY},${adList[2].QTY},${adList[3].QTY},${adList[4].QTY},${adList[5].QTY},${adList[6].QTY},${adList[7].QTY},${adList[8].QTY},${adList[9].QTY},${adList[10].QTY},${adList[11].QTY},${adList[12].QTY}];
var delQty = [${delList[0].QTY},${delList[1].QTY},${delList[2].QTY},${delList[3].QTY},${delList[4].QTY},${delList[5].QTY},${delList[6].QTY},${delList[7].QTY},${delList[8].QTY},${delList[9].QTY},${delList[10].QTY},${delList[11].QTY},${delList[12].QTY}];
var resumeQty = [${resumeList[0].QTY},${resumeList[1].QTY},${resumeList[2].QTY},${resumeList[3].QTY},${resumeList[4].QTY},${resumeList[5].QTY},${resumeList[6].QTY},${resumeList[7].QTY},${resumeList[8].QTY},${resumeList[9].QTY},${resumeList[10].QTY},${resumeList[11].QTY},${resumeList[12].QTY}];

//
/*
var delTotal = new Array();
for(var i=0; i<12; i++){
	var delNum = ${delList[i].TOTAL};
	if(delNum == null || delNum == 0){
		delTotal.push(0);
	}else{
		delTotal.push('${delList[i].TOTAL}');
	}
}
*/

Highcharts.chart('serviceContainer', {
    chart: {
        type: 'column'
    },
    title: {
        text: ''
    },
    subtitle: {
        text: '2021년'
    },
    xAxis: {
        categories: [
            'Jan',
            'Feb',
            'Mar',
            'Apr',
            'May',
            'Jun',
            'Jul',
            'Aug',
            'Sep',
            'Oct',
            'Nov',
            'Dec'
        ],
        crosshair: true
    },
    yAxis: {
        min: 0,
        title: {
            text: '단위 : 원'
        }
    },
    tooltip: {
        headerFormat: '<span style="font-size:8px">{point.key}</span><table>',
        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.1f} 원</b></td></tr>',
        footerFormat: '</table>',
        shared: true,
        useHTML: true
    },
    plotOptions: {
        column: {
            pointPadding: 0.2,
            borderWidth: 0
        }
    },
    series: [{
        name: '리뷰열람',
        data: reviewTotal

    }, {
        name: '이력서열람',
        data: resumeTotal

    }, {
        name: '채용공고광고',
        data: adTotal

    }, {
        name: '기업리뷰삭제',
        data: delTotal

    }]
});

//이력서 열람 건수
Highcharts.chart('resumeContainer', {
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
            text: '단위 : 건'
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
        name: '이력서 열람권 판매 건수',
        data: resumeQty
    }]
});

//기업 리뷰 열람
Highcharts.chart('reviewContainer', {
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
            text: '단위 : 건'
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
        name: '기업 리뷰 열람 판매 건수',
        data: reviewQty
    }]
});

//기업 리뷰 삭제
Highcharts.chart('delContainer', {
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
            text: '단위 : 건'
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
        name: '기업 리뷰 삭제 판매 건수',
        data: delQty
    }]
});

//광고
Highcharts.chart('adContainer', {
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
            text: '단위 : 건'
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
        name: '채용공고 광고권 판매 건수',
        data: adQty
    }]
});
</script>
<!-- highchart -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>