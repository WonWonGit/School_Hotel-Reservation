<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
<script type ="text/javascript" src="../js/javascript.js" defer> </script>
	<style>
		.navbar{
			background-color:#585858;
			width:100%;
			position:relative;
			margin:0;
			padding:0;
			padding-top:20px;
		}
		.text-right{
			width:100%;
		}
		.btn{
			margin-top:10px;
		}
		.navbtn:hover{
			color:#808080;
		}
	</style>
</head>
 <body>  
<nav class="navbar">
<!--Modal: Login Form-->
<div class="modal fade" id="modalLRForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog cascading-modal" role="document">
    <!--Content-->
    <div class="modal-content">
     <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Member</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
          <div class="tab-pane fade in show active">
			<!-- ******************************** 회원 로그인 *************************************** -->
            <!--Body-->
            <div class="modal-body mb-1">
              <div class="md-form mb-5">
              	<form method="post" action="../main/login.jsp"><!-- 로그인 폼 -->
                <i class="fas fa-user-circle"></i>
                <label data-error="wrong" data-success="right" for="modalLRInput10">Your ID</label><br>
                <input type="text" class="form-control form-control-sm validate" 
                			name="id" placeholder="아이디">
               
                <i class="fas fa-lock prefix"></i>
                <label data-error="wrong" data-success="right" for="modalLRInput11">Your password</label><br>
                <input type="password" class="form-control form-control-sm validate" 
                			name="password" placeholder="비밀번호">
                
                <input type="submit"  class="btn btn-dark" value="Login" ><i class="fas fa-sign-in ml-1"></i>
                </form>
              </div>
            </div>
            <!--Footer-->
            <div class="modal-footer">
              <div class="options text-center text-md-right mt-1">
                <p>Not a member? <a href="" class="blue-text">Sign Up</a></p>
                <p>Forgot <a href="#" class="blue-text">Password?</a></p>
              </div>
              <button type="button" class="btn btn-outline-dark waves-effect ml-auto" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
    </div>
    <!--/.Content-->
  </div>
</div>
<!-- ******************************** 회원 가입 *************************************** -->
<div class="modal fade" id="modalRegisterForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Sign up</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
        <div class="md-form mb-5">
        <form action="../main/register.jsp" method="post" name="rf">
        
          <i class="fas fa-users"></i>
          <label data-error="wrong" data-success="right" for="orangeForm-name">Your name</label>
          <input type="text" class="form-control validate" 
          			name="name" placeholder="이름" required onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
        
          <i class="fas fa-envelope"></i>
          <label data-error="wrong" data-success="right" for="orangeForm-email">Your email</label>
          <input type="email" class="form-control validate" 
          			name="email" placeholder="이메일" required onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
          
          <i class="fas fa-user-circle"></i>
          <label data-error="wrong" data-success="right" for="orangeForm-pass" >Your ID</label>
          <input type="text" class="form-control validate" 
          			name="id" placeholder="아이디" required onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
     
          <i class="fas fa-lock prefix grey-text"></i>
          <label data-error="wrong" data-success="right" for="orangeForm-pass" >Your password</label>
          <input type="password" id="pwd1" class="form-control validate" 
          			name="password" placeholder="비밀번호" required onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
          
          <i class="fas fa-lock prefix grey-text"></i>
          <label data-error="wrong" data-success="right" for="orangeForm-pass" >Check password</label><br>
          <input type="password" id="pwd2" class="form-control validate" 
          			name="password2" placeholder="비밀번호 확인 ">
          <br>			
          <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
          <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
			
		  <i class="fas fa-mobile-alt"></i>	
          <label data-error="wrong" data-success="right" for="orangeForm-pass">Your phone number</label><br>
          <input type="text" class="form-control validate phone" 
          			name="phone" maxlength=13 placeholder="휴대번호" onKeyup="inputPhoneNumber(this);">
       	  <input type="submit" value="Sign Up" class="btn btn-dark" id="submit">
        </form>
      </div>
    </div>
  </div>
</div>
</div><!-- fade -->
<div class="text-right">
<% 
	String userid = (String)session.getAttribute("userid");
    
   	if(session.getAttribute("userid")!=null){
   		if(userid.equals("admin")){
%>
	<a href="../main/logout.jsp" class="btn btn-default btn-rounded mb-4 navbtn" style="color: #fff;">Logout</a>	
<%    			
   		}else{
 %>
 	<a href="../main/logout.jsp" class="btn btn-default btn-rounded mb-4 navbtn" style="color: #fff;">Logout</a>
	<a href="../main/account.jsp?id=<%= userid %>" class="btn btn-default btn-rounded mb-4 navbtn" style="color: #fff;">Account</a>
 <%  			
   		}
   	}else{
%>
	<a href="" class="btn btn-default btn-rounded mb-4 navbtn" data-toggle="modal" data-target="#modalLRForm" style="color: #fff;">
    Login</a>
  	<a href="" class="btn btn-default btn-rounded mb-4 navbtn" data-toggle="modal" data-target="#modalRegisterForm" style="color: #fff;">
    Register</a>
<%    		
   	}
%>	
</div>
</nav>
</body>
<script>
function noSpaceForm(obj) 
{             
    var str_space = /\s/;               // 공백 체크
    if(str_space.exec(obj.value)) 
    {     // 공백 체크
        alert("해당 항목에는 공백을 사용할 수 없습니다.\n\n공백 제거됩니다.");
        obj.focus();
        obj.value = obj.value.replace(' ',''); // 공백제거
        return false;
    }
}
</script>
</html>