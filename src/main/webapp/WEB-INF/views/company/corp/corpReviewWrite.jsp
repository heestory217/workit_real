<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/corpReview.css'/>" />
<script type="text/javascript">
    $('#star_grade a').click(function(){
        $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
        $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
       	 return false;
    });
</script>

<style>
     #star_grade a{
        text-decoration: none;
        color: gray;
        font-size: 30px;
    }
    #star_grade a.on{
        color: #4C50BB;
    }
</style>

<!-- Register Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="register-form">
                        <h2>리뷰 작성</h2><br>
                        <div>
                        <p id="star_grade" class="center">
					        <a href="#" class="on"><i class="fas fa-star"></i></a>
					        <a href="#"><i class="fas fa-star"></i></a>
					        <a href="#"><i class="fas fa-star"></i></a>
					        <a href="#"><i class="fas fa-star"></i></a>
					        <a href="#"><i class="fas fa-star"></i></a>
						</p></div>
                        <form method="post" action="<c:url value='/company/corp/corpReviewWrite.do?corpno=${param.corpno }'/>">
                            <div class="group-input">
                                <label for="corpreviewOneline">한 줄 평가</label>
                                <textarea id="corpreviewOneline" name="corpreviewOneline" 
                                	class="col-lg-12 borderGray" rows="5" cols="30"></textarea>
                            </div>
                            <div class="group-input">
                                <label for="corpreviewGood">장점</label>
                                <textarea id="corpreviewGood" name="corpreviewGood" 
                                	class="col-lg-12 borderGray" rows="5" cols="30"></textarea>
                            </div>
                            <div class="group-input">
                                <label for="corpreviewBad">단점</label>
                                <textarea id="corpreviewBad" name="corpreviewBad" 
                                	class="col-lg-12 borderGray" rows="5" cols="30"></textarea>
                            </div>
                            <div class="group-input">
                                <label for="corpreviewWant">바라는점</label>
                                <textarea id="corpreviewWant" name="corpreviewWant" 
                                	class="col-lg-12 borderGray" rows="5" cols="30"></textarea>
                            </div>
                            
                            <div class="group-input"><!-- 임시 -->
                                <label for="corpreviewRate">점수</label>
                                <select name="corpreviewRate" id="corpreviewRate" class="col-lg-7 mystyle">
						            <option value="1">1점</option>
						            <option value="2">2점</option>
						            <option value="3">3점</option>
						            <option value="4">4점</option>
						            <option value="5">5점</option>
					        	</select>
					        	
                            </div><br>
                            <div>
	                        	<p class="center">내용과 무관한 글, 상호 비방, 법적 책임을 동반할 수 있는 글은 제한됩니다.</p>
	                        </div>
                            <button type="submit" class="site-btn register-btn" id="submit">REGISTER</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


<%@ include file="../../inc/bottom.jsp" %>