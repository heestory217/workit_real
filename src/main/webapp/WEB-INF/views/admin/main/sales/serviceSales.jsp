<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
${reviewList }
${adList }
${delList }
${resumeList }
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
        <div class="tab-pane fade active show" id="pills-review" role="tabpanel" aria-labelledby="pills-campaign-tab">
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="section-block">
                        <h3 class="section-title">My Campaign State</h3>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                    <div class="card">
                        <div class="card-body">
                            <h1 class="mb-1">9</h1>
                            <p>Campaign Invitations</p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                    <div class="card">
                        <div class="card-body">
                            <h1 class="mb-1">35</h1>
                            <p>Finished Campaigns</p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                    <div class="card">
                        <div class="card-body">
                            <h1 class="mb-1">8</h1>
                            <p>Accepted Campaigns</p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                    <div class="card">
                        <div class="card-body">
                            <h1 class="mb-1">1</h1>
                            <p>Declined Campaigns</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section-block">
                <h3 class="section-title">Campaign List</h3>
            </div>
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="media influencer-profile-data d-flex align-items-center p-2">
                                <div class="mr-4">
                                    <img src="assets/images/slack.png" alt="User Avatar" class="user-avatar-lg">
                                </div>
                                <div class="media-body ">
                                    <div class="influencer-profile-data">
                                        <h3 class="m-b-10">Your Campaign Title Here</h3>
                                        <p>
                                            <span class="m-r-20 d-inline-block">Draft Due Date
                                                <span class="m-l-10 text-primary">24 Jan 2018</span>
                                            </span>
                                            <span class="m-r-20 d-inline-block"> Publish Date
                                                <span class="m-l-10 text-secondary">30 Feb 2018</span>
                                            </span>
                                                <span class="m-r-20 d-inline-block">Ends <span class="m-l-10  text-info">30 May, 2018</span>
                                            </span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="border-top card-footer p-0">
                    <div class="campaign-metrics d-xl-inline-block">
                        <h4 class="mb-0">45k</h4>
                        <p>Total Reach</p>
                    </div>
                    <div class="campaign-metrics d-xl-inline-block">
                        <h4 class="mb-0">29k</h4>
                        <p>Total Views</p>
                    </div>
                    <div class="campaign-metrics d-xl-inline-block">
                        <h4 class="mb-0">5k</h4>
                        <p>Total Click</p>
                    </div>
                    <div class="campaign-metrics d-xl-inline-block">
                        <h4 class="mb-0">4k</h4>
                        <p>Engagement</p>
                    </div>
                    <div class="campaign-metrics d-xl-inline-block">
                        <h4 class="mb-0">2k</h4>
                        <p>Conversion</p>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="media influencer-profile-data d-flex align-items-center p-2">
                                <div class="mr-4">
                                    <img src="assets/images/dribbble.png" alt="User Avatar" class="rounded-circle user-avatar-lg">
                                </div>
                                <div class="media-body">
                                     <h3 class="m-b-10">Your Campaign Title Here</h3>
                                    <p><span class="m-r-20 d-inline-block">Draft Due Date<span class="m-l-10 d-inline-block text-primary">28 Jan 2018</span></span><span class="m-r-20 d-inline-block"> Publish Date<span class="m-l-10 text-secondary">20 March 2018</span></span><span class="m-r-20">Ends<span class="m-l-10 text-info">10 July, 2018</span></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="border-top card-footer p-0">
                    <div class="campaign-metrics d-xl-inline-block">
                        <h4 class="mb-0 ">35k</h4>
                        <p>Total Reach</p>
                    </div>
                    <div class="campaign-metrics d-xl-inline-block">
                        <h4 class="mb-0 ">45k</h4>
                        <p>Total Views</p>
                    </div>
                    <div class="campaign-metrics d-xl-inline-block">
                        <h4 class="mb-0">8k</h4>
                        <p>Total Click</p>
                    </div>
                    <div class="campaign-metrics d-xl-inline-block">
                        <h4 class="mb-0 ">10k</h4>
                        <p>Engagement</p>
                    </div>
                    <div class="campaign-metrics d-xl-inline-block">
                        <h4 class="mb-0">3k</h4>
                        <p>Conversion</p>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="media influencer-profile-data d-flex align-items-center p-2">
                                <div class="mr-4">
                                    <img src="assets/images/dropbox.png" alt="User Avatar" class="user-avatar-lg">
                                </div>
                                <div class="media-body">
                                      <h3 class="m-b-10">Your Campaign Title Here</h3>
                                    <p><span class="m-r-20 d-inline-block">Draft Due Date
                                        <span class="m-l-10 text-primary">05 Feb 2018</span></span>
                                        <span class="m-r-20 d-inline-block"> Publish Date
                                            <span class="m-l-10 text-secondary">14 May 2018</span></span><span class="m-r-20 d-inline-block">Ends<span class="m-l-10 text-info">16 Aug, 2018</span></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="border-top card-footer p-0">
                    <div class="campaign-metrics d-xl-inline-block">
                        <h4 class="mb-0">40k</h4>
                        <p>Total Reach</p>
                    </div>
                    <div class="campaign-metrics d-xl-inline-block">
                        <h4 class="mb-0 ">35k</h4>
                        <p>Total Views</p>
                    </div>
                    <div class="campaign-metrics d-xl-inline-block">
                        <h4 class="mb-0">5k</h4>
                        <p>Total Click</p>
                    </div>
                    <div class="campaign-metrics d-xl-inline-block">
                        <h4 class="mb-0">15k</h4>
                        <p>Engagement</p>
                    </div>
                    <div class="campaign-metrics d-xl-inline-block">
                        <h4 class="mb-0">14k</h4>
                        <p>Conversion</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="pills-resume" role="tabpanel" aria-labelledby="pills-packages-tab">
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="section-block">
                        <h2 class="section-title">My Packages</h2>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                    <div class="card">
                        <div class="card-header bg-primary text-center p-3 ">
                            <h4 class="mb-0 text-white"> Basic</h4>
                        </div>
                        <div class="card-body text-center">
                            <h1 class="mb-1">$150</h1>
                            <p>Per Month Plateform</p>
                        </div>
                        <div class="card-body border-top">
                            <ul class="list-unstyled bullet-check font-14">
                                <li>Facebook, Instagram, Pinterest,Snapchat.</li>
                                <li>Guaranteed follower growth for increas brand awareness.</li>
                                <li>Daily updates on choose platforms</li>
                                <li>Stronger customer service through daily interaction</li>
                                <li>Monthly progress report</li>
                                <li>1 Million Followers</li>
                            </ul>
                            <a href="#" class="btn btn-outline-secondary btn-block btn-lg">Get Started</a>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                    <div class="card">
                        <div class="card-header bg-info text-center p-3">
                            <h4 class="mb-0 text-white"> Standard</h4>
                        </div>
                        <div class="card-body text-center">
                            <h1 class="mb-1">$350</h1>
                            <p>Per Month Plateform</p>
                        </div>
                        <div class="card-body border-top">
                            <ul class="list-unstyled bullet-check font-14">
                                <li>Facebook, Instagram, Pinterest,Snapchat.</li>
                                <li>Guaranteed follower growth for increas brand awareness.</li>
                                <li>Daily updates on choose platforms</li>
                                <li>Stronger customer service through daily interaction</li>
                                <li>Monthly progress report</li>
                                <li>2 Blog Post &amp; 3 Social Post</li>
                                <li>5 Millions Followers</li>
                                <li>Growth Result</li>
                            </ul>
                            <a href="#" class="btn btn-secondary btn-block btn-lg">Get Started</a>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                    <div class="card">
                        <div class="card-header bg-primary text-center p-3">
                            <h4 class="mb-0 text-white">Premium</h4>
                        </div>
                        <div class="card-body text-center">
                            <h1 class="mb-1">$550</h1>
                            <p>Per Month Plateform</p>
                        </div>
                        <div class="card-body border-top">
                            <ul class="list-unstyled bullet-check font-14">
                                <li>Facebook, Instagram, Pinterest,Snapchat.</li>
                                <li>Guaranteed follower growth for increas brand awareness.</li>
                                <li>Daily updates on choose platforms</li>
                                <li>Stronger customer service through daily interaction</li>
                                <li>Monthly progress report &amp; Growth Result</li>
                                <li>4 Blog Post &amp; 6 Social Post</li>
                            </ul>
                            <a href="#" class="btn btn-secondary btn-block btn-lg">Contact us</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="pills-adv" role="tabpanel" aria-labelledby="pills-review-tab">
            <div class="card">
                <h5 class="card-header">Campaign Reviews</h5>
                <div class="card-body">
                    <div class="review-block">
                        <p class="review-text font-italic m-0">“Quisque lobortis vestibulum elit, vel fermentum elit pretium et. Nullam id ultrices odio. Cras id nulla mollis, molestie diam eu, facilisis tortor. Mauris ultrices lectus laoreet commodo hendrerit. Nullam varius arcu sed aliquam imperdiet. Etiam ut luctus augue.”</p>
                        <div class="rating-star mb-4">
                            <i class="fa fa-fw fa-star"></i>
                            <i class="fa fa-fw fa-star"></i>
                            <i class="fa fa-fw fa-star"></i>
                            <i class="fa fa-fw fa-star"></i>
                            <i class="fa fa-fw fa-star"></i>
                        </div>
                        <span class="text-dark font-weight-bold">Tabitha C. Campbell</span><small class="text-mute"> (Company name)</small>
                    </div>
                </div>
                <div class="card-body border-top">
                    <div class="review-block">
                        <p class="review-text font-italic m-0">“Maecenas rutrum viverra augue. Nulla in eros vitae ante ullamcorper congue. Praesent tristique massa ac arcu dapibus tincidunt. Mauris arcu mi, lacinia et ipsum vel, sollicitudin laoreet risus.”</p>
                        <div class="rating-star mb-4">
                            <i class="fa fa-fw fa-star"></i>
                            <i class="fa fa-fw fa-star"></i>
                            <i class="fa fa-fw fa-star"></i>
                            <i class="fa fa-fw fa-star"></i>
                            <i class="fa fa-fw fa-star"></i>
                        </div>
                        <span class="text-dark font-weight-bold">Luise M. Michet</span><small class="text-mute"> (Company name)</small>
                    </div>
                </div>
                <div class="card-body border-top">
                    <div class="review-block">
                        <p class="review-text font-italic m-0">“ Cras non rutrum neque. Sed lacinia ex elit, vel viverra nisl faucibus eu. Aenean faucibus neque vestibulum condimentum maximus. In id porttitor nisi. Quisque sit amet commodo arcu, cursus pharetra elit. Nam tincidunt lobortis augueat euismod ante sodales non. ”</p>
                        <div class="rating-star mb-4">
                            <i class="fa fa-fw fa-star"></i>
                            <i class="fa fa-fw fa-star"></i>
                            <i class="fa fa-fw fa-star"></i>
                            <i class="fa fa-fw fa-star"></i>
                            <i class="fa fa-fw fa-star"></i>
                        </div>
                        <span class="text-dark font-weight-bold">Gloria S. Castillo</span><small class="text-mute"> (Company name)</small>
                    </div>
                </div>
                <div class="card-body border-top">
                    <div class="review-block">
                        <p class="review-text font-italic m-0">“Vestibulum cursus felis vel arcu convallis, viverra commodo felis bibendum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin non auctor est, sed lacinia velit. Orci varius natoque penatibus et magnis dis parturient montes nascetur ridiculus mus.”</p>
                        <div class="rating-star mb-4">
                            <i class="fa fa-fw fa-star"></i>
                            <i class="fa fa-fw fa-star"></i>
                            <i class="fa fa-fw fa-star"></i>
                            <i class="fa fa-fw fa-star"></i>
                            <i class="fa fa-fw fa-star"></i>
                        </div>
                        <span class="text-dark font-weight-bold">Virgina G. Lightfoot</span><small class="text-mute"> (Company name)</small>
                    </div>
                </div>
                <div class="card-body border-top">
                    <div class="review-block">
                        <p class="review-text font-italic m-0">“Integer pretium laoreet mi ultrices tincidunt. Suspendisse eget risus nec sapien malesuada ullamcorper eu ac sapien. Maecenas nulla orci, varius ac tincidunt non, ornare a sem. Aliquam sed massa volutpat, aliquet nibh sit amet, tincidunt ex. Donec interdum pharetra dignissim.”</p>
                        <div class="rating-star mb-4">
                            <i class="fa fa-fw fa-star"></i>
                            <i class="fa fa-fw fa-star"></i>
                            <i class="fa fa-fw fa-star"></i>
                            <i class="fa fa-fw fa-star"></i>
                            <i class="fa fa-fw fa-star"></i>
                        </div>
                        <span class="text-dark font-weight-bold">Ruby B. Matheny</span><small class="text-mute"> (Company name)</small>
                    </div>
                </div>
            </div>
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item active"><a class="page-link " href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </nav>
        </div>
        <div class="tab-pane fade" id="pills-del" role="tabpanel" aria-labelledby="pills-msg-tab">
            <div class="card">
                <h5 class="card-header">Send Messages</h5>
                <div class="card-body">
                    <form>
                        <div class="row">
                            <div class="offset-xl-3 col-xl-6 offset-lg-3 col-lg-3 col-md-12 col-sm-12 col-12 p-4">
                                <div class="form-group">
                                    <label for="name">Your Name</label>
                                    <input type="text" class="form-control form-control-lg" id="name" placeholder="">
                                </div>
                                <div class="form-group">
                                    <label for="email">Your Email</label>
                                    <input type="email" class="form-control form-control-lg" id="email" placeholder="">
                                </div>
                                <div class="form-group">
                                    <label for="subject">Subject</label>
                                    <input type="text" class="form-control form-control-lg" id="subject" placeholder="">
                                </div>
                                <div class="form-group">
                                    <label for="messages">Messgaes</label>
                                    <textarea class="form-control" id="messages" rows="3"></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary float-right">Send Message</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">

var reviewList = [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, null];
var resumeList = [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3];
var advList = [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2];
var delList = [42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1];

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
            text: '단위 : 만원'
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
        data: reviewList

    }, {
        name: '이력서열람',
        data: resumeList

    }, {
        name: '채용공고광고',
        data: advList

    }, {
        name: '기업리뷰삭제',
        data: delList

    }]
});
</script>
<!-- highchart -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>