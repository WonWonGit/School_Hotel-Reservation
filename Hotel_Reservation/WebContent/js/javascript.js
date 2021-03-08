
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

$(function(){ $("#alert-success").hide(); 
			  $("#alert-danger").hide();
			  $("input").keyup(function(){ 
				  var pwd1=$("#pwd1").val(); 
				  var pwd2=$("#pwd2").val(); if(pwd1 != "" || pwd2 != "")
				  { if(pwd1 == pwd2){ $("#alert-success").show(); 
				  $("#alert-danger").hide(); 
				  $("#submit").removeAttr("disabled"); 
				  }else{ $("#alert-success").hide(); 
				  $("#alert-danger").show(); 
				  $("#submit").attr("disabled", "disabled");
				  } 
			} 
		}); 
	});

