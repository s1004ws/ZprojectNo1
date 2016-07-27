<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 정보확인</title>
</head>
<body>
	<c:if test="${loginStatus == 'Y' && user_email != 's1004ws@naver.com'}">
		<script>
			alert("로그인되었습니다...");

			opener.location.href="/webApp/";
			//오픈너의 화면을 다음경로로 변경 ^^
			
			self.close();
			
		</script>
	</c:if>
	<c:if test="${loginStatus == 'Y' && user_email == 's1004ws@naver.com'}">
		<script>
			alert("로그인되었습니다...");

			opener.location.href="/webApp/admin";
			//오픈너의 화면을 다음경로로 변경 ^^
			
			self.close();
			
		</script>
	</c:if>
	<c:if test="${loginStatus == 'N'}">
		<script>
			alert("로그인 실패했습니다...이메일 과 비밀번호를 다시 입력해주세요...");
			history.back();
		</script>
	</c:if>
</body>
</html>