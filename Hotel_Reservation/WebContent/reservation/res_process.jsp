<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Room.*" %> 
<%@ page import="Reservation.*" %>
<%@ page import="Main.*" %> 
<%@ page import="java.sql.*" %>   
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
	<script src="https://kit.fontawesome.com/9db93bd103.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="../css/reservation_pro.css"/>

</head>
<body>
<%
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		int newLine = Integer.parseInt(request.getParameter("newLine"));
		int rno = Integer.parseInt(request.getParameter("rno"));
		String iUseDate = request.getParameter("iUseDate");
		String str = new String(request.getParameter("iUseDate"));
		int price = 0;
		
		RoomDBBean rdb = RoomDBBean.getinstance();
		RoomBean roombean = rdb.selectRoom(rno);
		
		ReservationDBBean reservationdbbean = ReservationDBBean.getinstance();
		int max = reservationdbbean.max();
		if(max == 0){
			max = 1000;
		}
		
			int mno = 0;
			String name=null;
			String email=null;
			String phone =null;
		
		if(session.getAttribute("userid")!=null){	
			UserDBBean udb = UserDBBean.getinstance();
			UserBean ub = udb.memberInfo((String)session.getAttribute("userid"));
		
			 mno = ub.getMno();
			 name=ub.getName();
			 email=ub.getEmail();
			 phone = ub.getPhone();
		}
		
		
		String fromday = str.substring(0, 4)+"-"+"07-15";
		Date from = fm.parse(fromday);
		
		String endday = str.substring(0, 4)+"-"+"08-20";
		Date end = fm.parse(endday);
		
		java.util.Date dDate = new java.util.Date();

		
		String choday = str.substring(0, 4)+"-"+str.substring(4, 6)+"-"+str.substring(6, 8);
		Date reday = fm.parse(choday); //선택한날짜
		long fday = reday.getTime(); //선택한날짜에서 다음날 구하기 위해 캐스팅
		
		 dDate = new java.util.Date(fday+(1000*60*60*24*+1)); //다음날

		 String nextday = fm.format(dDate);
		  
		int result = reday.compareTo(from); // 선택 날짜와 성수기시작 날짜 비교 -값 : 성수기 전, +값 : 성수기
		int result2 = reday.compareTo(end); // 선택 날짜와 성수기 마지막 날짜 비교 +값 : 성수기 후 -값 : 성수기
		
		String selected=null;
		
		if(rno == roombean.getRno()){
			selected = roombean.getRname();
			
			if(result == -1 || result2 == 1){ //성수기 시작 날짜보다 작거나 성수기 마지막 날짜보다 클 때 => 성수기 아님
				if(newLine == 0 || newLine == 6){
					price = roombean.getWeekend(); //주말
				}else{
					price = roombean.getWeekday(); //평일
				}
			}else{
					price = roombean.getSweekday(); //성수기
			}
		}
		
%>
<jsp:include page="../main/header.jsp"></jsp:include>
		<div id="form">
			<div id="left">
			</div>
			<div id="right">
				<form method="post" name="fm" action="roomCheck.jsp">
					<div class="form-group">
					<input type="hidden" id="rsno" name="rsno" value="<%= max %>" >
					<input type="hidden" id="mno" name="mno" value="<%= mno %>" >
    				<label for="name">이 름</label>
    				<input type="text" class="form-control" id="rname" placeholder="예약자 성명" value="<%= name %>" name="rname" required>
  					<label for="phone">휴대폰 번호</label>
    				<input type="text" class="form-control" id="rphone" placeholder="휴대폰 번호" value="<%= phone %>" name="rphone" required maxlength="13">
    				<label for="email">Email address</label>
    				<input type="email" class="form-control" id="remail" placeholder="name@example.com" value="<%= email %>" name="remail" required>
 					</div>
 					<div class="form-group">
    				
    				<label for="roomname">방 이름</label>
    				<input type="text" class="form-control" id="roomname" value="<%= selected %>" readonly>
    				<input type="hidden" class="form-control" id="rno" value="<%= rno %>" name="rno">
    				</div>
    				
 					<div class="form-row">
 					<label for="testDatepicker" class="check">체크인 날짜</label>
 					<input type="Date" class="form-control" id="testDatepicker" value="<%= choday %>" name="check_in">
 					<label for="testDatepicker2">체크아웃 날짜</label>
					<input type="Date" class="form-control" id="testDatepicker2" value="<%= nextday %>" onchange="date()" name="check_out">
  					</div>
  					
  					<div class="form-group">
    				<label for="men">기본 인원</label>
    				<select class="form-control" id="men" name="usemen">
     				<option value="1">1</option>
      				<option value="2">2</option>
      				<option value="3">3</option>
      				<option value="4">4</option>  
    				</select>
 					<label for="addmen">추가 인원</label>
    				<select class="form-control" id="addmen" name="addmen">
    				<option value="0">0</option>
     				<option value="1">1</option>
      				<option value="2">2</option> 
    				</select>
 					</div>
 					<input value="<%= price %>" id="price" type="hidden">
 					
 					<span id="total"><b>총 금액 : <%= price %></b></span>
 					<input value="<%= price %>"   id="total2" name="price" type="hidden">
 					<div class="form-row">
 					<input type="submit" value="예약하기" class="btn btn-dark res" id="btn">
 					<input type="button" value="뒤로가기" class="btn btn-secondary res" id="btn" onClick="history.back()">	
 						
 					</div>
				</form>
			</div>
		</div>
<jsp:include page="../main/after.jsp"></jsp:include>				
<script>
$(function () {
    $( "#testDatepicker" ).datepicker({
    	dateFormat: "yy-mm-dd",
    	minDate: 0,
    	//체크아웃 날짜가 체크인 날짜 이전으로 선택 안되기 위해
    	onSelect: function (date) {
			var endDate = $('#testDatepicker2');
			var startDate = $(this).datepicker('getDate');
			var minDate = $(this).datepicker('getDate');
			endDate.datepicker('setDate', minDate);
			startDate.setDate(startDate.getDate() + 30);
			endDate.datepicker('option', 'maxDate', startDate);
			endDate.datepicker('option', 'minDate', minDate);
		}
    
	});
    
    $( "#testDatepicker2" ).datepicker({
    	dateFormat: "yy-mm-dd",
    	minDate: 0
    });
    
});

var UserId = '<%= (String)session.getAttribute("userid") %>';

if(UserId=="null"){
	document.getElementById("mno").value=Number(0);
	document.getElementById("rname").value=null;
	document.getElementById("remail").value=null;
	document.getElementById("rphone").value=null;
}


$(document).ready(function(){
	$("#addmen").change(function(){
		var room=$('#roomname').val();
		var addmen=$('#addmen').val();
		var price = $('#price').val();
		if(addmen==1||addmen==2){
			addmen=Number(addmen);
		}
		var total = (addmen*20000)+Number(price);
		$("#total").html("<b>"+"총 금액 : "+total+"</b>");
		document.getElementById("total2").value=total;
	});
});



$(document).ready(function(){
	$("#testDatepicker2").change(function(){
		var checkin=$('#testDatepicker').val();
		var checkout=$('#testDatepicker2').val();
		var price = $('#price').val();
		
		var check_in = checkin.split("-")
		var check_out = checkout.split("-")
		
		
		var checkin_date = new Date(check_in[0],Number(check_in[1])-1,check_in[2]);
		var checkout_date = new Date(check_out[0],Number(check_out[1])-1,check_out[2]);
	
		var day = (checkout_date.getTime()-checkin_date.getTime())/(1000*60*60*24);
		
		var total = Number(price)*day;
		$("#total").html("<b>"+"총 금액 : "+total+"</b>");
		document.getElementById("total2").value=total;
		document.getElementById("price").value=total;
	});
});

$(document).ready(function(){
	var rno = $('#rno').val();
	if(rno==1){
		$('#men option:eq(1)').remove();
		$('#men option:eq(2)').remove();
		$('#men option:last').remove();
		$('#addmen option:eq(1)').remove();
		$('#addmen option:eq(2)').remove();
		$('#addmen option:last').remove();
	}
	else if(rno==2){
		$('#men option:eq(2)').remove();
		$('#men option:last').remove();
	}
});

window.onload = function(){
	document.getElementById('btn').onclick=function(){
		document.getElementId('fm').submit();
		return false;
	}
}

$('#rphone').keydown(function(event) {
    var key = event.charCode || event.keyCode || 0;
    $text = $(this);
    if (key !== 8 && key !== 9) {
        if ($text.val().length === 3) {
            $text.val($text.val() + '-');
        }
        if ($text.val().length === 8) {
            $text.val($text.val() + '-');
        }
    }
 
    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));          
});

</script>			
</html>