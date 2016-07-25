<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이메일 중복검사</title>
</head>
<body>
	<c:if test="${cnt!=0}">
		<script>
			alert("회원등록되었습니다...");
			location.href="/webApp/email_login";
		</script>
	</c:if>
	<c:if test="${cnt==0}">
		<script>
			alert("회원등록되지 않았습니다...");
			history.back();
		</script>
	</c:if>
</body>
</html>