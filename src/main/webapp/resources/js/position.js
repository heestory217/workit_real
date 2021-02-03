/**
 * position.js
 */
 
$(document).ready(function() {
	$('#notice').css('display','none');
	$("#saveForm").bind("click",function(){
		if($('#saveForm').is(':checked')){
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
	$('form[name=positionFrm]').submit(function(){
		if($('#userId').val().length<1){
			$('.error:eq(0)').html('받는 회원 아이디를 입력하세요');
			$('#userId').focus();
			event.preventDefault();
		}else if($('#positionsuggestTitle').val().length<1){
			$('.error:eq(1)').html('제목을 입력하세요');
			$('#positionsuggestTitle').focus();
			event.preventDefault();
		}else if($('#positionsuggestPosition').val().length<1){
			$('.error:eq(2)').html('포지션을 입력하세요');
			$('#positionsuggestPosition').focus();
			event.preventDefault();
		}else if($('#positionsuggestPrice').val().length<1){
			$('.error:eq(3)').html('연봉을 입력하세요');
			$('#positionsuggestPrice').focus();
			event.preventDefault();
		}else if($('#positionsuggestContents').val().length<1){
			$('.error:eq(4)').html('내용을 입력하세요');
			$('#positionsuggestContents').focus();
			event.preventDefault();
		}else if($('.error:eq(0)').html().length>1){
			event.preventDefault();
		}
	});//submit
	
	$('#positionsuggestTitle').keyup(function(){
		if($(this).val().length<1){
			$('.error:eq(1)').html('제목을 입력하세요');
			$(this).focus();
		}else if($(this).val().length>=30){
			$('.error:eq(1)').html('제목은 최대 30자까지 입력가능합니다. (현재 30자)');
		}else{
			$('.error:eq(1)').html('');
		}
	});
	
	$('#positionsuggestTitle').keyup(function(){
		if($(this).val().length<1){
			$('.error:eq(1)').html('제목을 입력하세요');
			$(this).focus();
		}else if($(this).val().length>=30){
			$('.error:eq(1)').html('제목은 최대 30자까지 입력가능합니다. (현재 30자)');
		}else{
			$('.error:eq(1)').html('');
		}
	});
	
	$('#positionsuggestPosition').keyup(function(){
		if($(this).val().length<1){
			$(this).parent().find('span').html($(this).prop('placeholder'));
			$(this).focus();
		}else{
			$(this).parent().find('span').html('');
		}
	});
	
	$('#positionsuggestPrice').keyup(function(){
		if($(this).val().length<1){
			$(this).parent().find('span').html($(this).prop('placeholder'));
			$(this).focus();
		}else{
			$(this).parent().find('span').html('');
		}
	});
	
	$('#positionsuggestContents').keyup(function(){
		if($(this).val().length<1){
			$(this).parent().find('span').html($(this).prop('placeholder'));
			$(this).focus();
		}else{
			$(this).parent().find('span').html('');
		}
	});
	
	/*
	$('form[name=positionFrm] input[type=text]').keyup(function(){
		if($(this).val().length<1){
			$(this).parent().find('span').html($(this).prop('placeholder'));
			$(this).focus();
		}else{
			$(this).parent().find('span').html('');
		}
	});
	*/
});
