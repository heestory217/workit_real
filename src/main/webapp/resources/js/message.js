/**
 * message.js
 */
 
 $(document).ready(function() {
	$('#notice').css('display','none');
	$("#selfMsg").bind("click",function(){
		if($('#selfMsg').is(':checked')){
			$('.col-lg-6').find('input[name=userId]').attr('disabled',true);
			$('.col-lg-6').find('input[name=userId]').val($('#loginId').val());
			$('#notice').css('display','block');
		}else{
			$('.col-lg-6').find('input[name=userId]').attr('disabled',false);
			$('.col-lg-6').find('input[name=userId]').val('');
			$('.col-lg-6').find('input[name=userId]').attr('placeholder','받는 회원 아이디를 입력하세요');
			$('#notice').css('display','none');
		}
	});	//나한테 보내기 자동설정
	
	//폼 유효성 검사
	$('form[name=msgFrm]').submit(function(){
		if($('#userId').val().length<1){
			$('.error:eq(0)').html('받는 회원 아이디를 입력하세요');
			$('#userId').focus();
			event.preventDefault();
		}else if($('#messageTitle').val().length<1){
			$('.error:eq(1)').html('제목을 입력하세요');
			$('#messageTitle').focus();
			event.preventDefault();
		}else if($('#messageContent').val().length<1){
			$('.error:eq(2)').html('쪽지 내용을 입력하세요');
			$('#messageContent').focus();
			event.preventDefault();
		}else if($('.error:eq(0)').html().length>1){
			event.preventDefault();
		}
	});//submit
	
	$('#messageTitle').keyup(function(){
		if($(this).val().length<1){
			$('.error:eq(1)').html('제목을 입력하세요');
			$(this).focus();
		}else if($(this).val().length>=30){
			$('.error:eq(1)').html('제목은 최대 30자까지 입력가능합니다. (현재 30자)');
		}else{
			$('.error:eq(1)').html('');
		}
	});
	
	$('#messageContent').keyup(function(){
		if($(this).val().length<1){
			$('.error:eq(2)').html('쪽지 내용을 입력하세요');
			$(this).focus();
		}else{
			$('.error:eq(2)').html('');
		}
	});
	
});