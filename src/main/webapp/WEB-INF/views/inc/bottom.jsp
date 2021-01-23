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
                            <li>Address: 28 Road 588 Seoul</li>
                            <li>Phone: +82 02.1422.4527</li>
                            <li>Email: workit2022@gmail.com</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 offset-lg-1">
                    <div class="footer-widget">
                        <h5>고객센터</h5>
                        <ul>
                            <li><a href="#">공지사항</a></li>
                            <li><a href="<c:url value='/faq/faqList.do'/>">FAQ</a></li>
                            <li><a href="<c:url value='/qna/qnaList.do'/>">Q&A</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="footer-widget">
                        <h5>My Account</h5>
                        <ul>
                            <li><a href="#">회원 정보 수정</a></li>
                            <li><a href="#">구매 내역 조회</a></li>
                            <li><a href="<c:url value='/message/messageBox.do'/>">쪽지함</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="footer-widget">
                        <h5>사이트 소개</h5>
                        <ul>
                            <li><a href="#">회사 소개</a></li>
                            <li><a href="#">이용약관</a></li>
                            <li><a href="#">개인정보처리방침</a></li>
                            <li><a href="#">서비스 소개</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->


</body>

</html>