<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Footer Section Begin -->
    <footer class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="footer-left">
                        <div class="footer-logo">
                            <a href="#"><img src="<c:url value="/resources/img/footer_workit_logo.PNG"/>" alt=""></a>
                        </div>
                        <ul>
                            <li>Address: 124, Teheran-ro, Gangnam-gu, Seoul, Korea</li>
                            <li>Phone: +82 02.6255.8002</li>
                            <li>Email: workit2022@gmail.com</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 offset-lg-1">
                    <div class="footer-widget">
                        <h5>고객센터</h5>
                        <ul>
                            <li><a href="<c:url value='/notice/noticeList.do'/>">공지사항</a></li>
                            <li><a href="<c:url value='/faq/faqList.do'/>">FAQ</a></li>
                            <li><a href="<c:url value='/qna/qnaList.do'/>">Q&A</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="footer-widget">
                        <h5>My Account</h5>
                        <ul>
                            <li><a href="<c:url value='/indivMypage/indivMypageEdit.do'/>">회원 정보 수정</a></li>
                            <li>
	                            <c:if test="${empty sessionScope.userId || sessionScope.user_corpcheck==1}">
	                            	<a href="<c:url value='/indivMypage/indivPayment.do'/>">유료 결제 내역</a>
			                    </c:if>
			                    <!-- 기업 -->
			                    <c:if test="${sessionScope.user_corpcheck==2}">
	                            	<a href="<c:url value='/companyMypage/companyPayment.do'/>">유료 결제 내역</a>
			                    </c:if>
                            </li>
                            <li><a href="<c:url value='/message/messageBox.do'/>">쪽지함</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="footer-widget">
                        <h5>사이트 소개</h5>
                        <ul>
                            <li><a href="<c:url value='/website/termsOfService.do'/>">이용약관</a></li>
                            <li><a href="<c:url value='/website/privacyPolicy.do'/>">개인정보처리방침</a></li>
                            <c:if test="${empty sessionScope.userId || sessionScope.user_corpcheck==1}">
                            	<li><a href="<c:url value='/indiv/serviceIntro.do'/>">서비스 안내</a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->


</body>

</html>