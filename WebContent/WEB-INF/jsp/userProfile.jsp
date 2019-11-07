<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
	<link rel="icon" href="img/LOL.ico" mce_href="img/LOL.ico" type="image/x-icon" />
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style>
input.hidden {
    position: absolute;
    left: -9999px;
}

#profile-image1 {
    cursor: pointer;
     width: 100px;
    height: 100px;
	border:2px solid #03b1ce ;}
.tital{ font-size:16px; font-weight:500;}
.bot-border{ border-bottom:1px #f8f8f8 solid;  margin:5px 0  5px 0}
</style>
<body background="img/background.jpg"></body>
<h3><a href="home" style="text-decoration: none"><strong >Back</strong></a></h3>
<div class="container" style="margin: 0 auto">
	<div class="row">
		
		<div class="col-md-7 ">

			<div class="panel panel-default">
				<div class="panel-heading">
					<h4>User Profile</h4>
				</div>
				<div class="panel-body">

					<div class="box box-info">

						<div class="box-body">
							<div class="col-sm-6">
								<div align="center">
								<c:if test="${empty profile.headphoto }">
									<img alt="User Pic" src="img/family photo.jpg"
										id="profile-image1" class="img-circle img-responsive"> 
										<form action="updateFamPhoto?uid=${userID }"  method="post" enctype="multipart/form-data"><input name="image" id="profile-image-upload" class="hidden" type="file" onchange="this.form.submit()"></form>
										</c:if>
								<c:if test="${!empty profile.headphoto }">
									<img alt="User Pic"
										src="img/${profile.headphoto}"
										id="profile-image1" class="img-circle img-responsive"> 
										<form action="updateFamPhoto?uid=${userID }" method="post" enctype="multipart/form-data"><input name="image" id="profile-image-upload" class="hidden" type="file" onchange="this.form.submit()"></form>
										</c:if>
									<div style="color: #999;">click here to change image</div>
									<!--Upload Image Js And Css-->
								</div>
								<br>
								<!-- /input-group -->
							</div>

							<div class="clearfix"></div>
							<hr style="margin: 5px 0 5px 0;">

<!-- 							<div class="col-sm-5 col-xs-6 tital ">Address:</div> -->
<%-- 							<div class="col-sm-7 col-xs-6 ">${profile.address}</div> --%>
<!-- 							<div class="clearfix"></div> -->
<!-- 							<div class="bot-border"></div> -->

							<!-- /.box-body -->
						</div>
						<!-- /.box -->
						
					</div>
				</div>
			</div>
		</div>
		
	</div>
</div>
<div class="container">
  
        <div class="row">

            <div class="col-md-3">
                <ul class="nav nav-pills nav-stacked admin-menu" >
                    <li class="active"><a href="" data-target-id="profile"><i class="glyphicon glyphicon-user"></i> Profile</a></li>
                    <li><a href="" data-target-id="change-password"><i class="glyphicon glyphicon-lock"></i> Change Password</a></li>
                    <li><a href="" data-target-id="settings"><i class="glyphicon glyphicon-cog"></i> Edit Profile</a></li>
                    <li><a href="" data-target-id="logout"><i class="glyphicon glyphicon-log-out"></i> Logout</a></li>
                </ul>
            </div>

            <div class="col-md-9  admin-content" id="profile">
                <div class="panel panel-info" style="margin: 1em;">
                    <div class="panel-heading">
                        <h3 class="panel-title">Address</h3>
                    </div>
                    <div class="panel-body">
                        ${profile.address}
                    </div>
                </div>
                <div class="panel panel-info" style="margin: 1em;">
                    <div class="panel-heading">
                        <h3 class="panel-title">Email</h3>
                    </div>
                    <div class="panel-body">
                        ${profile.email}
                    </div>
                </div>
                <div class="panel panel-info" style="margin: 1em;">
                    <div class="panel-heading">
                        <h3 class="panel-title">Members</h3>
                    </div>
                    <div class="panel-body">
                        ${profile.members}
                    </div>
                </div>

            </div>
   <div class="col-md-9  admin-content" id="settings">
   <form action="updateProfile" method="post">
                <div class="panel panel-info" style="margin: 1em;">
                    <div class="panel-heading">
                        <h3 class="panel-title">Address</h3>
                    </div>
                    <div class="panel-body">
                        <input type="text" value="${profile.address }" name="address"/>
                    </div>
                </div>
                <div class="panel panel-info" style="margin: 1em;">
                    <div class="panel-heading">
                        <h3 class="panel-title">Email</h3>
                    </div>
                    <div class="panel-body">
                        <input type="email" value="${profile.email }" name="email"/>
                    </div>
                </div>
                <div class="panel panel-info" style="margin: 1em;">
                    <div class="panel-heading">
                        <h3 class="panel-title">Members</h3>

                    </div>
                    <div class="panel-body">
                         <input type="text" value="${profile.members }" name="members"/>
                    </div>
                </div>
                <div class="panel panel-info border" style="margin: 1em;">
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="pull-left">
                                    <input type="submit" class="form-control btn btn-primary" name="submit" id="submit" value="update">
                                	<input type="hidden" name="id" value="${profile.id}"> 
									<input type="hidden" name="uid" value="${userID}">
                                </div>
                            </div>
                        </div>
                    </div>
                    </form>
            </div>

            <div class="col-md-9  admin-content" id="change-password">
                <form action="/password" method="post">
                
                    <div class="panel panel-info" style="margin: 1em;">
                        <div class="panel-heading">
                            <h3 class="panel-title"><label for="new_password" class="control-label panel-title">New Password</label></h3>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" name="password" id="new_password" >
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="panel panel-info" style="margin: 1em;">
                        <div class="panel-heading">
                            <h3 class="panel-title"><label for="confirm_password" class="control-label panel-title">Confirm password</label></h3>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" name="password_confirmation" id="confirm_password" >
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-info border" style="margin: 1em;">
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="pull-left">
                                    <input type="submit" class="form-control btn btn-primary" name="submit" id="submit">
                                </div>
                            </div>
                        </div>
                    </div>

                </form>
            </div>

            <div class="col-md-9  admin-content" id="settings"></div>

            <div class="col-md-9  admin-content" id="logout">
                <div class="panel panel-info" style="margin: 1em;">
                    <div class="panel-heading">
                        <h3 class="panel-title">Confirm Logout</h3>
                    </div>
                    <div class="panel-body">
                        Do you really want to logout ?  
                        <a  href="logout" class="label label-danger">
                            <span >   Yes   </span>
                        </a>    
                        <a href="" class="label label-success"> <span >  No   </span></a>
                    </div>
          
                </div>
            </div>
        </div>
</div>
<script>
	document.getElementById('profile-image1').src='img/${profile.headphoto}?a='+Math.random();		
	$(function() {
		$('#profile-image1').on('click', function() {
			$('#profile-image-upload').click();
		});
	});
	
	$(document).ready(function()
		      {
		        var navItems = $('.admin-menu li > a');
		        var navListItems = $('.admin-menu li');
		        var allWells = $('.admin-content');
		        var allWellsExceptFirst = $('.admin-content:not(:first)');
		        allWellsExceptFirst.hide();
		        navItems.click(function(e)
		        {
		            e.preventDefault();
		            navListItems.removeClass('active');
		            $(this).closest('li').addClass('active');
		            allWells.hide();
		            var target = $(this).attr('data-target-id');
		            $('#' + target).show();
		        });
		        });
</script>
