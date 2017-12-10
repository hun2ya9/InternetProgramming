function LoginCheck(){
	if(document.ch.userid.value.length == 0){
		alert("아이디를 써주세요");
		ch.ID.focus();
		return false;
	}
	if(document.ch.pwd.value == ""){
		alter("암호는 반드시 입력해야 합니다.");
		ch.pwd.focus();
		return false;
	}
	return true;
}

function JoinCheck(){
	if(document.jo.userid.value.length == 0){
		alert("아이디를 써주세요");
		ch.userid.focus();
		return false;
	}
	if(document.jo.userid.value.length < 4){
		alert("아이디는 4글자이상이어야 합니다.");
		ch.userid.focus();
		return false;
	}
	if(document.jo.pwd.value == ""){
		alert("암호는 반드시 입력해야 합니다.");
		ch.pwd.focus();
		return false;
	}
	if(document.jo.pwd.value != document.jo.pwd_check.value){
		alert("암호가 일치하지 않습니다.");
		ch.pwd_Check.focus();
		return false;
	}
	if(document.jo.name.value.length == 0){
		alert("이름을 써주세요");
		ch.name.focus();
		return false;
	}
	return true;
}