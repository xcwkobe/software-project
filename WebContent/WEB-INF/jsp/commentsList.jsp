<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix='fmt' %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>comments list</title>
<link rel="icon" href="img/LOL.ico" mce_href="img/LOL.ico" type="image/x-icon" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<style type="text/css">
	a:hover,a:focus{
		text-decoration: none;
		outline: none;
	}
	#accordion{
		padding-right: 24px;
		padding-left: 24px;
		z-index: 1;
	}
	#accordion .panel{
		border: none;
		box-shadow: none;
	}
	#accordion .panel-heading{
		padding: 0;
		border-radius: 0;
		border: none;
	}
	#accordion .panel-title{
		padding: 0;
	}
	#accordion .panel-title a{
		display: block;
		font-size: 16px;
		font-weight: bold;
		background: #e16b47;
		color: #f7c59f;
		padding: 15px 25px;
		position: relative;
		margin-left: -24px;
		transition: all 0.3s ease 0s;
	}
	#accordion .panel-title a.collapsed{
		background: #f7c59f;
		color: #e16b47;
		margin-left: 0;
		transition: all 0.3s ease 0s;
	}
	#accordion .panel-title a:before{
		content: "";
		border-left: 24px solid #e16b47;
		border-top: 24px solid transparent;
		border-bottom: 24px solid transparent;
		position: absolute;
		top: 0;
		right: -24px;
		transition: all 0.3s ease 0s;
	}
	#accordion .panel-title a.collapsed:before{
		border-left-color: #f7c59f;
	}
	#accordion .panel-title a:after{
		content: "\f106";
		font-family: 'FontAwesome';
		position: absolute;
		top: 30%;
		right: 15px;
		font-size: 18px;
		color: #f7c59f;
	}
	#accordion .panel-title a.collapsed:after{
		content: "\f107";
		color: #e16b47;
	}
	#accordion .panel-collapse{
		position: relative;
	}
	#accordion .panel-collapse.in:before{
		content: "";
		border-right: 24px solid #f7c59f;
		border-bottom: 18px solid transparent;
		position: absolute;
		top: 0;
		left: -24px;
	}
	#accordion .panel-body{
		font-size: 14px;
		color: #333;
		background: #D0F5A9;
		border-top: none;
		z-index: 1;
	}
</style>
</head>
<body background="img/background.jpg">
<div class="demo" style="padding: 1em 0;">
	<div class="container">
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
			<h4><a href="home">BACK</a></h4>
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
				<h2>Your to do list comments </h2>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingOne">
							<h4 class="panel-title">
								<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									from father
								</a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">
							<c:forEach items="${fromFather}" var="f" varStatus="st">
								content:<span>${f.content }</span><br>
								points:<span>${f.points }</span><br>
								tid:<span>${f.tid }</span><br>
								<hr>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingTwo">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
									from mother
								</a>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
							<div class="panel-body">
								<c:forEach items="${fromMother}" var="m" varStatus="st">
								content:<span>${m.content }</span><br>
								points:<span>${m.points }</span><br>
								tid:<span>${m.tid }</span><br>
								<hr>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingThree">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
									from kid
								</a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
							<div class="panel-body">
								<c:forEach items="${fromKid}" var="k" varStatus="st">
								content:<span>${k.content }</span><br>
								points:<span>${k.points }</span><br>
								tid:<span>${k.tid }</span><br>
								<hr>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>