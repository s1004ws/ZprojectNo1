
//정규표현식을 이용하여 입력유무확인
function memCheck(){
	//아이디 검사
	var reg =  /^\w{4,15}[@][a-z]{2,10}[.][a-z]{2,3}[.]?[a-z]{0,2}$/;
	var input = document.getElementById("user_email");
	if(!reg.test(input.value)){
		//아이디 검사하고 false를 부정해서 
		alert("이메일을 입력하세요...");
		input.value="";
		input.focus();
		return false;
	}
	//아이디 중복 검사
	if(document.getElementById("user_email").value != document.getElementById("emailCheck").value){
		alert("이메일 중복검사를 하세요...");
		document.getElementById("user_email").focus();
		return false; //submit 취소 시킨다
	}
	//비밀번호 검사
	var reg1 = /^[a-zA-Z]{1}[a-zA-Z0-9]{7,11}$/;
	input = document.getElementById("user_email_password");
	if(!reg1.test(input.value)){
		alert("비밀번호를 입력하세요...");
		input.value="";
		input.focus();
		return false;
	}
	//비밀번호 확인 검사
	if(input.value != document.getElementById("user_email_password2").value){
		alert("비밀번호를 잘못입력하였습니다...");
		input.value=""; 
		document.getElementById("user_email_password2").value="";
		input.focus();
		return false;
	}
	return true;
}
