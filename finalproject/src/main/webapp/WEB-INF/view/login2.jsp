<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
<style type="text/css">
.form-control {
    border: none !important;
    border-radius: 0 !important;
    margin-top: 20px !important;
    /* padding: 12px 0 !important; */
    width: 70% !important;
    font-size: 14px !important;
    margin-left: 100px !important;
    }
    
.form-group {
  margin-bottom: 15px !important;
  position: relative !important;
  width: 100% !important;
  overflow: hidden !important;
}

.form-group .label-control {
  color: #888 !important;
  display: block !important;
  font-size: 14px !important;
  position: absolute !important;
  top: 0 !important;
  left: 0 !important;
  padding: 0 !important;
  width: 100% !important;
  pointer-events: none !important;
  height: 100% !important; 
}
</style>
</head>
<body>
<!-- <div class="blankSeparator" style="padding-top: 200px;"/> -->
<div class="container" style="height:600px;">
  <div class="form-box">
    <div class="head">Welcome Back</div>     
     <form method="Post" action="login">   
        <div class="form-group">
          <label class="label-control">
            <span class="label-text">ID</span>
          </label>
          <input type="text" name="fid" class="form-control" />
        </div>
        <div class="form-group">
          <label class="label-control">
            <span class="label-text">Password</span>
          </label> 
          <input type="password" name="fpass" class="form-control" />
        </div>
        <c:if test="${requestScope.logChk==-1}">         
           <span style="font-size: 20; color: red;">비밀번호를 확인하세요</span>
        </c:if>
        <c:if test="${requestScope.logChk==0}">
           <span style="font-size: 20; color: red;">일치하는 회원 정보가 없습니다. 회원가입을 해주세요.</span>
        </c:if>
        <input type="submit" value="Login" class="btn" />
        <p class="text-p">Don't have an account? <a href="signup" >회원가입</a> </p>
    </form>
  </div>
  </div>
</body>
</html>