<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<style>
div.contact-widget a div div p:hover {
    color: #4C50BB;
    font-weight: 600;
}
</style>

<div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="<c:url value='/index.do'/>"><i class="fa fa-home"></i> Home</a>
                        <span>Contact</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="map spad">
        <div class="container">
            <div class="map-inner" id="map">
                <iframe
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.3888335432084!2d127.02949595126337!3d37.49874637971151!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca157ac1001eb%3A0x1232b973d5aac612!2z7ISc7Jq47Yq567OE7IucIOqwleuCqOq1rCDsl63sgrzrj5kg7YWM7Zek656A66GcIDEyNA!5e0!3m2!1sko!2skr!4v1613480954293!5m2!1sko!2skr"
                    height="610" style="border:0" allowfullscreen="">
                </iframe>
            </div>
        </div>
    </div>

    <section class="contact-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-5">
                    <div class="contact-title">
                        <h4>Contacts Us</h4>
                        <p>이용 중 문의발생 시, 하단 정보로 연락부탁드립니다.</p>
                    </div>
                    <div class="contact-widget">
                        <div class="cw-item">
                            <div class="ci-icon">
                                <i class="ti-location-pin"></i>
                            </div>
                            <div class="ci-text">
                                <span>주소:</span>
                                <p>서울 강남구 테헤란로 124</p>
                            </div>
                        </div>
                        <div class="cw-item">
                            <div class="ci-icon">
                                <i class="ti-mobile"></i>
                            </div>
                            <div class="ci-text">
                                <span>전화:</span>
                                <p>+82 02.6255.8002</p>
                            </div>
                        </div>
                        <div class="cw-item">
                            <div class="ci-icon">
                                <i class="ti-email"></i>
                            </div>
                            <div class="ci-text">
                                <span>이메일:</span>
                                <p>workit2022@gmail.com</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 offset-lg-1">
                    <div class="contact-title">
                        <h4>고객센터</h4>
                        <p>자주묻는 질문(FAQ)과 게시판 문의답변은 하단 게시판을 참고해주세요.</p>
                    </div>
                    <div class="contact-widget">
                    	<a href="<c:url value='/notice/noticeList.do'/>">
	                        <div class="cw-item">
	                            <div class="ci-text">
	                                <p>공지사항</p>
	                            </div>
	                        </div>
                        </a>
                    	<a href="<c:url value='/faq/faqList.do'/>">
	                        <div class="cw-item">
	                            <div class="ci-text">
	                                <p>FAQ</p>
	                            </div>
	                        </div>
                        </a>
                    	<a href="<c:url value='/qna/qnaList.do'/>">
	                        <div class="cw-item">
	                            <div class="ci-text">
	                                <p>Q&A</p>
	                            </div>
	                        </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

<%@ include file="../inc/bottom.jsp"%>