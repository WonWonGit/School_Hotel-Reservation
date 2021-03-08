<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<!-- ******************************** 회원 가입 *************************************** -->
<div class="modal fade" id="modalRForm" tabindex="0" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content modal-content_res">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Sign up</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body modal-body_res mx-3">
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
          <input type="password" id="pass" class="form-control validate" 
          			name="password" placeholder="비밀번호" required onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
          
          <i class="fas fa-lock prefix grey-text"></i>
          <label data-error="wrong" data-success="right" for="orangeForm-pass" >Check password</label><br>
          <input type="password" id="pass2" class="form-control validate" 
          			name="password2" placeholder="비밀번호 확인" onKeyup="inputPassCheck(this);">
          <br>			
          <div class="alert alert-success" id="success">비밀번호가 일치합니다.</div>
          <div class="alert alert-danger" id="danger">비밀번호가 일치하지 않습니다.</div>
			
		  <i class="fas fa-mobile-alt"></i>	
          <label data-error="wrong" data-success="right" for="orangeForm-pass">Your phone number</label><br>
          <input type="text" class="form-control validate res_phone" 
          			name="phone" maxlength=13 placeholder="휴대번호" onKeyup="inputPhoneNumber(this);" >
       	  <input type="submit" value="Sign Up" class="btn btn-dark" id="submit" >
        </form>
      </div>
    </div>
  </div>
</div>
</div><!-- fade -->
</body>
<script>
function inputPhoneNumber(obj) {

    var number = obj.value.replace(/[^0-9]/g, "");
    var phone = "";



    if(number.length < 4) {
        return number;
    } else if(number.length < 7) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3);
    } else if(number.length < 11) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 3);
        phone += "-";
        phone += number.substr(6);
    } else {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 4);
        phone += "-";
        phone += number.substr(7);
    }
    obj.value = phone;
}

document.getElementById('success').style.display="none";
document.getElementById('danger').style.display="none";
function inputPassCheck(obj){
	var pwd2 = obj.value;
	var pwd1 = document.getElementById('pass').value;
	
	if(pwd2 != pwd1){
		document.getElementById('success').style.display="none";
		document.getElementById('danger').style.display="block";
	}else if(pwd2 == pwd1){
		document.getElementById('success').style.display="block";
		document.getElementById('danger').style.display="none";
	}
	
}

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