<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>login and register</title>
<link rel="icon" href="img/LOL.ico" mce_href="img/LOL.ico" type="image/x-icon" />
<script src="js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/styles.css">
<script type="text/javascript">
	function a1() {
		var A=$("#user").val();
		if (A.length>0) {
			$.ajax({
				url:"checkAccount",
				type:"post",
				data:{"name":A},
				success:function(data){
					if (data=="account already exist!") {
						$("#msg").css("color","red");
						$("#submit").attr("disabled", true); 
					}else {
						$("#msg").css("color","green");
						$("#submit").attr("disabled", false);
					}
					$("#msg").html(data)
				}
			});
		}else {
			$("#msg").html("");
		}
	}
	$(function(){
			$("#submit").click(function(){
		    alert("register successfully! You can login now!");
		})
	});
</script>

</head>
<body background="img/background.jpg">
<div class="jq22-container" style="padding-top:10px">
	<div class="login-wrap">
		<div class="login-html">

			<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Log In</label>
			<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Register</label>
			<div class="login-form">
			<form action="admin" method="post">
				<div class="sign-in-htm">
					<div class="group">
						<label for="user" class="label">Family Account</label>
						<input id="user1" type="text" class="input" name="name">
					</div>
					<div class="group">
						<label for="pass" class="label">Password</label>
						<input id="pass" type="password" class="input" data-type="password" name="password">
					</div>
					<c:if test="${!empty Lmsg }">
						<h3 style="color:red">${Lmsg }</h3>
					</c:if>
					<div class="group">
						<input id="check" type="checkbox" class="check" checked>
						<label for="check"><span class="icon"></span> Keep me Signed in</label>
					</div>
					<div class="group">
						<input type="submit" class="button" value="Log In">
					</div>
					<div class="hr"></div>
					<div class="foot-lnk">
						<label for="tab-2">Not a Member?</label>
					</div>
				</div>
				</form>
				<form action="register" method="post" >
				<div class="sign-up-htm">
					<div class="group">
						<label for="user" class="label">Family Account</label>
						<input id="user" type="text" class="input" name="name" onblur="a1()">
					</div>
					<h3 id="msg"></h3>
					<div class="group">
						<label for="pass" class="label">Password</label>
						<input id="pwd1" type="password" class="input" data-type="password" name="password">
					</div>
					<div class="group">
						<label for="pass" class="label">Confirm Password</label>
						<input id="pwd2" type="password" class="input" data-type="password">
					</div>
					<div class="group">
						<input type="submit" class="button" id="submit" value="Register">
					</div>
					<div class="hr"></div>
					<div class="foot-lnk">
						<label for="tab-1">Already Member?</label>
					</div>
				</div>
				</form>
			</div>
			
		</div>
	</div>
</div>
<script>
 window.onload=function(){
	 document.getElementById("pwd1").onchange=validatePassword;
    document.getElementById("pwd2").onchange=validatePassword;
 }

 function validatePassword() {
     var pwd1 = document.getElementById("pwd1").value;         
	var pwd2 = document.getElementById("pwd2").value;
     if(pwd1 != pwd2) {
         document.getElementById("pwd2").setCustomValidity("password don't match");
      }
       else {
          document.getElementById("pwd2").setCustomValidity("");
              }
     }
</script>
</body>
</html>