<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Main.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
	 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../bootstrap/bootstrap.min.js"></script>
	<link rel="stylesheet" href="../bootstrap/bootstrap.min.css"/>
	<script src="https://kit.fontawesome.com/9db93bd103.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="../css/reservation_pro.css"/>
</head>
<body>
<%
	UserDBBean udb = UserDBBean.getinstance();
	String id = request.getParameter("id");
	UserBean ub = udb.memberInfo(id);
	String name=ub.getName();
	
%>
<jsp:include page="../main/pre.jsp"></jsp:include>
	<div id="form">
			<div id="left">
			</div>
			<div id="right">
				<div id="container-fluid">
				<form method="post" name="fm" action="accountOk.jsp?id=<%= id %>">
					<div class="form-group">
    				<label for="name">이 름&nbsp;&nbsp;<i class="fas fa-user"></i></label>
    				<input type="text" class="form-control" id="name" name="name" value="<%= name %>" readonly>
    				
  					<label for="phone">휴대폰 번호&nbsp;&nbsp;<i class="fas fa-mobile-alt"></i></label>
    				<input type="text" class="form-control phone1" placeholder="휴대폰 번호" name="phone" value="<%= ub.getPhone() %>" required maxlength="13">
    				
    				<label for="email">Email address&nbsp;&nbsp;<i class="far fa-envelope"></i></label>
    				<input type="email" class="form-control" id="email" placeholder="name@example.com" value="<%= ub.getEmail() %>" name="email" required>
 					</div>
 					<div class="form-group">
    				
    				<label for="roomname">아이디&nbsp;&nbsp;<i class="fas fa-id-card"></i></label>
    				<input type="text" class="form-control" id="id" value="<%= id %>" readonly>
    				
    				<label for="roomname">비밀번호&nbsp;&nbsp;<i class="fas fa-lock"></i></label>
    				<input type="password" class="form-control pwd" id="pwd" name="password" >
    				
    				<label for="roomname">비밀번호 확인&nbsp;&nbsp;<i class="far fa-check-square"></i></label>
    				<input type="password" class="form-control pwd2" id="pwd1" name="password2" >
    				<br>
    				<div class="alert alert-success" role="alert" id="alert-success1">
  					비밀번호가 일치합니다.
					</div>			
    				<div class="alert alert-danger" role="alert" id="alert-danger1">
  					비밀번호가 일치하지 않습니다.
					</div>
    				</div>
 					<div class="form-row">
 					<input type="submit" value="변경하기" class="btn btn-dark res" id="submit">
 					<input type="button" value="뒤로가기" class="btn btn-secondary res" id="btn" onClick="history.back()">	
 						
 					</div>
				</form>
			</div>
			</div>
		</div>
<jsp:include page="../main/after.jsp"></jsp:include>			
</body>
<script>
$('.phone1').keydown(function(event) {
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

$(function(){ $("#alert-success1").hide(); 
			  $("#alert-danger1").hide();
			  $("input").keyup(function(){ 
				  var pwdo=$(".pwd").val(); 
				  var pwdt=$(".pwd2").val(); 
				  if(pwdo != "" || pwdt != "")
				  { 
					if(pwdo == pwdt){ 
						$(".alert-success").show(); 
				  		$(".alert-danger").hide(); 
				  		$("#submit").removeAttr("disabled"); 
				  }else{ 
					  $(".alert-success").hide(); 
				  	  $(".alert-danger").show(); 
				  	  $("#submit").attr("disabled", "disabled");
				  } 
			} 
		}); 
	});

</script>
</html>