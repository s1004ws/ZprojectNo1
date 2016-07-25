<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.project.webApp.custom.CustomDAOInterface"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이메일 중복검사</title>
<script src="/webApp/js_css/jquery-1.12.4.min.js"></script>
</head>
<body>
<script>
	$(function(){
		$("#emailSet").click(function(){
			//alert("qwer");
			opener.document.getElementById("user_email").value = "${user_email}";
			// 팝업창을 열어준 창을 opener 라고 함
			// user_email아 user_email인곳을 value를 지정한 이메일 값으로
			opener.document.getElementById("emailCheck").value = "${user_email}";
			self.close(); //클릭하면 팝업창 자동을 닫히도록
			//window.close();
		});
	});
</script>
<div>
	<c:choose>
		<c:when test="${user_email==null || user_email==''}">
		이메일을 입력후 중복검사 버튼을 선택해라.<br/>
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${cnt == 0}">
					<span style="color:red"> ${user_email}</span>은 사용 가능한 이메일 입니다.
					<input type="button" value="사용하기" id="emailSet"/>
				</c:when>
				<c:otherwise>
					${user_email} 은 사용 불가능한 이메일 입니다.<br/>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
</div>
<hr/>
<div>
	<form method="post" action="/webApp/emailCheck">
		이메일 입력 <input type="text" name="user_email" id="uesr_email" />
		<input type="submit" value="이메일 중복확인"/>
	</form>
</div>
</body>
</html>