<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/adminIndivUsers.css'/>"/>

<style type="text/css">
	table{
		border:1px solid #e6e6f2;
		width:685px;
		height:400px;
		border-collapse:collapse;
	    background: white;
	    border-radius: 5px;
	    margin-bottom: 10px;
	}
	
	input[type=text]{
		border:none;
		outline:none;
	    width: 95%;
	    padding-left:10px;
	}
	
	th,td{
		border:1px solid #e6e6f2;
	}
	
	tr{
		height:25px;
		border-bottom: 2px solid #e6e6f2;
		padding-left:10px;
		padding-right:10px;
	}
	
	.content{
		height:200px;
	}
	
	.content td{
		padding:10px; 
	}
	
	[name=noticeAbout]{
        resize: none;
	    width: 99%;
	    height: 99%;
	    border: none;
	    outline: none;
	}
	
	/* 스크롤바 굵기 */
	[name=noticeAbout]::-webkit-scrollbar {
	  width:8px;
	}
	
	[name=noticeAbout]::-webkit-scrollbar-thumb {
	  border-radius: 5px;
	  background-color: silver;
	}
	
	body{
	    font-family: 'Circular Std Book';
	    font-style: normal;
	    font-weight: normal;
	    font-size: 14px;
	    color: #71748d;
	    background-color: #efeff6;
	    -webkit-font-smoothing: antialiased;
	}
	
	[name=classificationNo]{
	    width: 98%;
	    height: 100%;
	    border: none;
	    outline: none;
	    padding-left:5px;
	}
	
	.notcie-Btn{
	    width: 80px;
	    height: 34px;
	    color: white;
	    background: #4C50BB;
	    border: 1px solid silver;
	    outline:none;
	    cursor: pointer;
	}
	
	.input-group{
		outline: none;
	}
	
	#cancelBtn{
		background:white;
		color:#71748d;
		border: 1px solid silver;
	}
	
	#upfile{
	
	}
	
</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#cancelBtn').click(function(){
			if(!confirm('글을 등록하지 않고 나가시겠습니까?')){
				return false;
			}
			self.close();
		});
		
		$('#writeFrm').submit(function(){
			$.ajax({
				url:'<c:url value="/admin/notice/noticeRegister.do"/>',
				type:'post',
				data:$(this).serializeArray(),
				dataType:'json',
				success:function(res){
					if(res==1){
						alert('공지사항이 정상적으로 등록되었습니다.');
						opener.document.location.reload();
						self.close();
					}
					
				},error:function(xhr, status, error){
					alert('공지사항 등록에 실패하였습니다.\n다시 등록하세요.');
				}
			});
			event.preventDefault();
		});
		
		/* $(window).blur(function(){
			self.close();
		}); */
	});
</script>
<title>공지사항 등록</title>
</head>
<body>


<!-- Register Section Begin -->
<div class="spad">
<div class="container">
<h3 class="section-title float_left">공지사항 등록</h3>
</div><br><br><br>
	<form name="writeFrm" id="writeFrm" method="post" enctype="multipart/form-data">
		<table>
			<tbody>
				<tr>
					<th>제목</th>
					<td><input type="text" name="noticeTitle"></td>
				</tr>
				<tr>
					<th>분류</th>
					<td>
						<select name="classificationNo">
							<option>분류</option>
							<option value="1">공지</option>
							<option value="2">이벤트</option>
							<option value="3">안내</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<c:set var="managerName" value="${sessionScope.managerName}"/>
					<td><input type="text" name="managerName" value="${managerName}"></td>
				</tr>
				<tr class="content">
					<th>내용</th>
					<td><textarea name="noticeAbout" id="noticeAbout"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="center">
			<input type="submit" id="writeBtn" value="등록하기" class="notcie-Btn margin_right_5">
			<input type="button" id="cancelBtn" value="취소" class="notcie-Btn margin_right_5">
		</div>
	</form>

</div>


</body>
</html>