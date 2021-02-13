<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/corpReview.css'/>" />
<script type="text/javascript">
$(function(){
    $('#star_grade a').click(function(){
        $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
        $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
        $('#corpreviewRate').val($(this).attr('id'));
        return false;
    });
    
    $('#submit').click(function(){
    	if($('#corpreviewRate').val().length<1){
			alert('별점을 입력하세요.');
			$('#corpreviewOneline').focus();
			event.preventDefault();
		}else if($('#corpreviewOneline').val().length<1){
			alert('한줄 평가를 입력하세요.');
			$('#corpreviewOneline').focus();
			event.preventDefault();
		}else if($('#corpreviewGood').val().length<1){
			alert('장점을 입력하세요.');
			$('#corpreviewGood').focus();
			event.preventDefault();
		}else if($('#corpreviewBad').val().length<1){
			alert('단점을 입력하세요.');
			$('#corpreviewBad').focus();
			event.preventDefault();
		}else if($('#corpreviewWant').val().length<1){
			alert('바라는점을 입력하세요.');
			$('#corpreviewWant').focus();
			event.preventDefault();
		}
    });
});
</script>

<!-- Register Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="register-form">
                        <h2>[ ${vo.corpName } ] 리뷰 <i class="fas fa-pencil-alt colorBlue"></i></h2><br>
                        <div>
                        <p id="star_grade" class="center">
					        <a href="#" id="1"><i class="fas fa-star"></i></a>
					        <a href="#" id="2"><i class="fas fa-star"></i></a>
					        <a href="#" id="3"><i class="fas fa-star"></i></a>
					        <a href="#" id="4"><i class="fas fa-star"></i></a>
					        <a href="#" id="5"><i class="fas fa-star"></i></a>
						</p></div>
                        <form method="post" action="<c:url value='/company/corp/corpReviewWrite.do?corpno=${param.corpno }'/>">
                            <div class="group-input">
                                <label for="corpreviewOneline">한 줄 평가 *</label>
                                <textarea id="corpreviewOneline" name="corpreviewOneline" 
                                	class="col-lg-12 borderGray" rows="5" cols="30"></textarea>
                            </div>
                            <div class="group-input">
                                <label for="corpreviewGood">장점 *</label>
                                <textarea id="corpreviewGood" name="corpreviewGood" 
                                	class="col-lg-12 borderGray" rows="5" cols="30"></textarea>
                            </div>
                            <div class="group-input">
                                <label for="corpreviewBad">단점 *</label>
                                <textarea id="corpreviewBad" name="corpreviewBad" 
                                	class="col-lg-12 borderGray" rows="5" cols="30"></textarea>
                            </div>
                            <div class="group-input">
                                <label for="corpreviewWant">바라는점 *</label>
                                <textarea id="corpreviewWant" name="corpreviewWant" 
                                	class="col-lg-12 borderGray" rows="5" cols="30"></textarea>
                            </div>
                            <div>
	                        	<p class="center">내용과 무관한 글, 상호 비방, 법적 책임을 동반할 수 있는 글은 제한됩니다.</p>
	                        </div>
                            <button type="submit" class="site-btn register-btn" id="submit">REGISTER</button>
                        	<!-- 별점 확인용 -->
							<input type="hidden" id="corpreviewRate" name="corpreviewRate">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


<%@ include file="../../inc/bottom.jsp" %>