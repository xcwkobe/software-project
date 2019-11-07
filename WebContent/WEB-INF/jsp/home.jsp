<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix='fmt' %>
<html lang="en">
<head>
<title>home</title>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/jquery.datetimepicker.css">
<link rel="stylesheet" href="css/common.css"/>
<link rel="icon" href="img/LOL.ico" mce_href="img/LOL.ico" type="image/x-icon" />
<script type="text/javascript" src="js/jquery.datetimepicker.js"></script>
<script>
	$(function(){
		$(".tbox").click(function(){
			$('#myModal').modal('show') 
		})
	}); 
	$(function(){
		$(".edit").click(function(){
			$('#myModal2').modal('show');
		})
	});  
	$(function(){
		$(".comment").click(function(){
			$('#myModal3').modal('show');
		})
	});
	function update(id) {
		$.ajax({
			url:"editThing",
			type:"get",
			data:{"tid":id},
			success:function(data){
				$("#name1").val(data.title);
				$("#name2").val(data.description);
				$("#tid").val(id);
			}
		});
	}
	
	function comment(id) {
			$("#toid").val(id);
	}
	
	function succ(){
		alert("comment successfully!");
		}
	
// 	document.getElementById('headPhoto').src='img/${profile.headphoto}?a='+Math.random();
</script>

</head>
<body background="img/background.jpg">
	<div style="text-align: center; margin: 0 auto;">
		<span>Welcome back!</span>
		<c:if test="${!empty user}">
			<span>${user.name}</span>
			<c:if test="${empty profile.headphoto }">
				<a href="userProfile?uid=${user.id }">
				<img src="img/father default.jpg" title="complete your profile" width="64px" height="64px">
			</a></c:if>
			<c:if test="${!empty profile.headphoto }">
				<a href="userProfile?uid=${user.id }">
				<img id="headPhoto" src="img/${profile.headphoto }" title="complete your profile" width="64px" height="64px">
			</a></c:if>
			
			<c:if test="${!empty fType }">
			<span> ,the role you select is <b style="color:red">father</b></span>
			</c:if>
			
			<c:if test="${!empty mType }">
				<span>the role you select is <b style="color:red">mother</b></span>
			</c:if>
			
			<c:if test="${!empty kType }">
				<span>the role you select is <b style="color:red">kid</b></span>
			</c:if>
			<a href="logout"><button>logout</button></a>
		</c:if>
		
		<h3><a href="CommentsList?uid=${user.id }">Comments</a></h3>
		<h3><a href="familyMoments">Moments</a></h3>

			<!-- add modal -->
			<div class="modal fade" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
					  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">
					<h4 class="modal-title" align="center">add to do</h4>
					<br/>
					<form class="form-horizontal" role="form" action="addToDo" method="post">
						<div class="form-group">
							<label for="name" class="col-sm-offset-2 col-sm-2 control-label">Title</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="name" name="title">
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-offset-2 col-sm-2 control-label">Description</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="name" name="description">
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-sm-offset-2 col-sm-2 control-label">Start Time</label>
							<div class="col-sm-5">
							<div class="mycontainer">
								<input type="text" class="form-control" id="datetimepicker1" name="start"></div>
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-sm-offset-2 col-sm-2 control-label">End Time</label>
							<div class="col-sm-5">
							<div class="mycontainer">
								<input type="text" class="form-control" id="datetimepicker2" name="end"></div>
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-offset-2 col-sm-2 control-label">status</label>
							<div class="col-sm-5">
								<select class="form-control" name="status">
									<option disabled selected="selected">select status</option>
									<option value="doing">doing</option>
									<option value="done">done</option>
								</select>
<!-- 								<input type="text" class="form-control" id="name" name="status"> -->
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-5">
								
								<button id="submitBtn" type="submit" class="btn btn-default btn-block btn-primary">save</button>
							</div>
						</div>
						</form>
			</div>
			<div class="modal-footer">
			</div>
		</div>
		<!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- edit modal -->
			<div class="modal fade" id="myModal2">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
					  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">
					<h4 class="modal-title" align="center">edit</h4>
					<br/>
					<form class="form-horizontal" role="form" action="updateThing" method="post">
						<div class="form-group">
							<label for="name" class="col-sm-offset-2 col-sm-2 control-label">Title</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="name1" name="title">
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-offset-2 col-sm-2 control-label">Description</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="name2" name="description">
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-sm-offset-2 col-sm-2 control-label">Start Time</label>
							<div class="col-sm-5">
							<div class="mycontainer">
								<input type="text" class="form-control" id="datetimepicker3" name="starttime"></div>
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-sm-offset-2 col-sm-2 control-label">End Time</label>
							<div class="col-sm-5">
							<div class="mycontainer">
								<input type="text" class="form-control" id="datetimepicker4" name="endtime"></div>
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-offset-2 col-sm-2 control-label">status</label>
							<div class="col-sm-5">
								<select class="form-control" name="status">
									<option disabled selected="selected">select status</option>
									<option value="doing">doing</option>
									<option value="done">done</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-5">
							<input type="hidden" name="id" id="tid">
								<button id="submitBtn" type="submit" class="btn btn-default btn-block btn-primary">update</button>
							</div>
						</div>
						</form>
			</div>
			<div class="modal-footer">
			</div>
		</div>
		<!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

	<!-- comment modal -->
			<div class="modal fade" id="myModal3">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
					  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">
					<h4 class="modal-title" align="center">comment here</h4>
					<br/>
					<form class="form-horizontal" role="form" action="Scontent" method="post">
						<div class="form-group">
							<label for="name" class="col-sm-offset-2 col-sm-2 control-label">points</label>
							<div class="col-sm-5">
								<select class="form-control" name="points">
									<option disabled selected="selected">select points</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-offset-2 col-sm-2 control-label">content</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" name="content">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-5">
							<input type="hidden" name="tid" id="toid">
								<button id="submitBtn" type="submit" class="btn btn-default btn-block btn-primary" onclick="succ()">submit</button>
							</div>
						</div>
						</form>
			</div>
			<div class="modal-footer">
			</div>
		</div>
		<!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

		<div style="text-align: center;">
		<div style="width: 25%;height: 500px;border:1px solid red;overflow: auto;display: inline-block;">
		<h3>father list</h3>
			<c:if test="${!empty fType }">
				<h3><a  href="#" class="tbox">add</a></h3>
			</c:if>
				<c:forEach items="${fatherList}" var="f" varStatus="st">
					title:<span id="ftitle" data="${f.title}">${f.title}</span><br>
					description:<span id="fdesc">${f.description}</span><br>
					start time:<span id="fstart"><fmt:formatDate value="${f.starttime}" pattern="yyyy/MM/dd HH:mm"/></span><br>
					end time:<span id="fend"><fmt:formatDate value="${f.endtime}" pattern="yyyy/MM/dd HH:mm"/></span><br>
					status:<span id="fstatus">${f.status}</span><br>
						<c:if test="${!empty fType }">
							<a href="#" class="edit" onclick="update(${f.id})">edit</a>
						</c:if>
						<c:if test="${!empty mType || !empty kType || !empty fType}">
							<a href="#" class="comment" onclick="comment(${f.id})"><span>comment here</span></a><br>
							<hr>
						</c:if>
				</c:forEach>
			</div>
			
			<div style="width: 25%;height: 500px;border:1px solid red;overflow: auto;display: inline-block;">
		<h3>mother list</h3>
			<c:if test="${!empty mType }">
				<h3><a  href="#" class="tbox">add</a></h3>
			</c:if>
				<c:forEach items="${motherList}" var="m" varStatus="st">
					title:<span id="mtitle">${m.title}</span><br>
					description:<span id="mdesc">${m.description}</span><br>
					start time:<span id="mstart"><fmt:formatDate value="${m.starttime}" pattern="yyyy/MM/dd HH:mm"/></span><br>
					end time:<span id="mend"><fmt:formatDate value="${m.endtime}" pattern="yyyy/MM/dd HH:mm"/></span><br>
					status:<span id="mstatus">${m.status}</span><br>
						<c:if test="${!empty mType }">
							<a href="#" class="edit" onclick="update(${m.id})">edit</a>
						</c:if>
						<c:if test="${!empty mType || !empty kType || !empty fType}">
							<a href="#" class="comment" onclick="comment(${m.id})"><span>comment here</span></a><br>
							<hr color="black">
						</c:if>
				</c:forEach>
			</div>
			
			<div style="width: 25%;height: 500px;border:1px solid red;overflow: auto;display: inline-block;">
		<h3>kid list</h3>
			<c:if test="${!empty kType }">
				<h3><a  href="#" class="tbox">add</a></h3>
			</c:if>
				<c:forEach items="${kidList}" var="k" varStatus="st">
					title:<span id="ktitle">${k.title}</span><br>
					description:<span id="kdesc">${k.description}</span><br>
					start time:<span id="kstart"><fmt:formatDate value="${k.starttime}" pattern="yyyy/MM/dd HH:mm"/></span><br>
					end time:<span id="kend"><fmt:formatDate value="${k.endtime}" pattern="yyyy/MM/dd HH:mm"/></span><br>
					status:<span id="kstatus">${k.status}</span><br>
						<c:if test="${!empty kType }">
							<a href="#" class="edit" onclick="update(${k.id})">edit</a>
						</c:if>
						<c:if test="${!empty mType || !empty kType || !empty fType}">
							<a href="#" class="comment" onclick="comment(${k.id})"><span>comment here</span></a><br>
							<hr color="black">
						</c:if>
				</c:forEach>
			</div>
			
		</div>
	</div>

</body>
<script type="text/javascript">
$('#datetimepicker1').datetimepicker();
$('#datetimepicker1').datetimepicker({step:10});
$('#datetimepicker2').datetimepicker();
$('#datetimepicker2').datetimepicker({step:10});

$('#datetimepicker3').datetimepicker();
$('#datetimepicker3').datetimepicker({step:10});
$('#datetimepicker4').datetimepicker();
$('#datetimepicker4').datetimepicker({step:10});
</script>
</html>



