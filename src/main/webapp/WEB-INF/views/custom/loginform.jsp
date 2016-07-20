<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
ul,li{padding: 0px;margin: 0px}
#main{width:25%;height:330px;background:white;margin:0 auto;border:2px #26d1ce solid}
#login{font-size:1.2em;color:gray}
#line{height:1px;background:gray}
#text{text-align:center;font-size:1em;padding:0px;color:gray}
#text>ul>li{list-style-type:none;text-align:center;float:center;color:gray}
.btn{width:90%; height:40px;margin:10px 0px;float:center;text-align:center;}
#sub{float:center;text-align:center;}
#blue{background:#3b5998;color:white}
#face{margin:0px;padding:0px}
#yellow{background:#fbe300;color:#523738}
#cyon{background:#26d1ce;color:white}
</style>
<script src="/webApp/js_css/kakao.js"></script>
</head>
<body>
<div id="main">
   <div>
      <div id="login">
         로그인
      </div>
      
      <br>
      
      <div id="line">
      </div>
      
      <br>
      
      <div id="text">
      <ul>
         <li>기존에 사용하시던 서비스 계정이나</li>
         <li>편하신 방법으로 시작해주세요.</li>
      </ul>
      </div>
      
      <br>
   <div id="sub">
      
      <div id="face">
      <input type="button" class="btn" id="blue" value="FACEBOOK으로 시작"/>
      </div>
      
      <!-- 
      <div id="kakao">
      <input type="button" class="btn" id="yellow" value="KAKAOTALK으로 시작"/>
      </div>
      -->
      <a id="kakao-login-btn"></a>
      <a href="http://alpha-developers.kakao.com/logout"></a>
      <script type='text/javascript'>
        //<![CDATA[
          // 사용할 앱의 JavaScript 키를 설정해 주세요.
          Kakao.init('f60fa5afea135a2fe242a27b0a7c8098');
          // 카카오 로그인 버튼을 생성합니다.
          Kakao.Auth.createLoginButton({
            container: '#kakao-login-btn',
            success: function(authObj) {
              alert(JSON.stringify(authObj));
            },
            fail: function(err) {
               alert(JSON.stringify(err));
            }
          });
        //]]>
      </script>
      
      
      <div id="mail">
      <input type="button" class="btn" id="cyon" value="E-MAIL주소로 시작"/>
      </div>      
   </div>
   </div>
</div>
</body>
</html>