<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
		$('#btWeek').click(function(){
			setDate(7, 'D');
		});
		$('#btMonth1').click(function(){
			setDate(1, 'M');
		});
		$('#btMonth3').click(function(){
			setDate(3, 'M');
		});
		$('#btYear').click(function(){
			setDate(12, 'M');
		});

		$('#startDay').datepicker({
			dateFormat:'yy-mm-dd',
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		});
		
		$('#endDay').datepicker({
			dateFormat:'yy-mm-dd',
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		});
		
	});
	
	function setDate(term, type){
		//endDay 기준으로 7일을 빼거나, 1개월이나 3개월을 빼서 startDay에 셋팅
		var str=$('#endDay').val().split('-');  //2021-01-03
		var d = new Date(str[0], str[1]-1, str[2]);  //월 : 0~11
		
		if(type=='D'){
			d.setDate(d.getDate()-term);  //7일전	
		}else if(type=='M'){
			d.setMonth(d.getMonth()-term); //1개월전, 3개월전
		}
		
		$('#startDay').val(findDate(d));
	}
	
	function findDate(date){
		return date.getFullYear() + "-" + formatDate(date.getMonth()+1)+"-"
			+ formatDate(date.getDate());
	}
	
	function formatDate(d){  //1월 => 01, 9일 => 09
		var day=d;
		if(d<10){
			day="0"+d;
		}
		
		return day;
	}
	
</script>

	<input type="button" value="1주일" id="btWeek" class="btnGray">
	<input type="button" value="1개월" id="btMonth1" class="btnGray">
	<input type="button" value="3개월" id="btMonth3" class="btnGray">
	<input type="button" value="1년" id="btYear" class="btnGray">
		
	<input type="text" name="startDay" id="startDay" 
		value="${dateSearchVO.startDay }"> 
	~ 
	<input type="text" name="endDay" id="endDay"
		value="${dateSearchVO.endDay }">
		