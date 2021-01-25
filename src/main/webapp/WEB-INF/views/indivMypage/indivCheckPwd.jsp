<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="indivMypageMenu.jsp"%>

<section class="shopping-cart spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="cart-table">
					<table>
						<tr>
							<td class="cart-title"><br><br><br>
								<h5 class="center">비밀번호를 입력하세요.</h5>
							</td>
						</tr>
						<tr>
							<td class="cart-title">
								<div class="group-input center"><br>
									<form method="post" action="<c:url value='/indivMypage/indivCheckPwd.do '/>">
                                		<input type="password" id="pwd" class="col-lg-6 mybtn" name="pwd">
                                		&nbsp;&nbsp;&nbsp;
                                		<button type="submit" class="site-btn" id="submit">확인</button>
                            		</form>
                            	</div>
                            	<br><br><br>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Menu include 한것 닫는 태그 -->
</div></div></div></section>

<%@ include file="../inc/bottom.jsp"%>