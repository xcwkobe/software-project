<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix='fmt' %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/moment.css" rel="stylesheet">
<link rel="icon" href="img/LOL.ico" mce_href="img/LOL.ico" type="image/x-icon" />
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>

	function fileSelect() {
	    document.getElementById("fileToUpload").click(); 
	}

	function fileSelect1() {
	    document.getElementById("fileToUpload1").click(); 
	}

	function fileSelect2() {
	    document.getElementById("fileToUpload2").click(); 
	}
</script>
<!------ Include the above in your HEAD tag ---------->
<body background="img/background.jpg">
<div style="text-align: center">
<h3><a href="home">BACK</a></h3>
	<form id="form1" action="addMoments" method="post">
	            <h3>post something new!</h3><br>
	            <textarea id="content" name="content" rows="5" cols="50"></textarea><br>
	            <input type="hidden" name="uid" value="${userID }">
	            <input type="submit" value="post">
	</form>
	<c:if test="${!empty fType }">
		<c:if test="${empty photo.fheadphoto }">
		<img src="${pageContext.request.contextPath }/img/father default.jpg" onclick="fileSelect();" class="img-circle avatar" width="60px" height="60px" title="click to edit head photo" >
		<form action="updatefHeadPhoto" method="post" enctype="multipart/form-data">
           <input id="fileToUpload" type="file" name="fImage" accept="image/*" onchange="this.form.submit()" style="display:none;">
			</form></c:if>
		<c:if test="${!empty photo.fheadphoto }">
			<img src="${pageContext.request.contextPath }/img/${photo.fheadphoto }" class="img-circle avatar" onclick="fileSelect();" width="60px" height="60px" alt="user profile image">
			<form action="updatefHeadPhoto" method="post" enctype="multipart/form-data">
           <input id="fileToUpload" type="file" name="fImage" accept="image/*" onchange="this.form.submit()" style="display:none;">
			</form>
		</c:if>
		<b>click image to update your photo</b>
	</c:if>
	
	<c:if test="${!empty mType }">
		<c:if test="${empty photo.mheadphoto }">
		<img src="${pageContext.request.contextPath }/img/mother default.jpg" onclick="fileSelect();" class="img-circle avatar" width="60px" height="60px" title="click to edit head photo" >
		<form action="updatemHeadPhoto" method="post" enctype="multipart/form-data">
           <input id="fileToUpload" type="file" name="mImage" accept="image/*" onchange="this.form.submit()" style="display:none;">
			</form></c:if>
		<c:if test="${!empty photo.mheadphoto }">
			<img src="${pageContext.request.contextPath }/img/${photo.mheadphoto }" class="img-circle avatar" onclick="fileSelect();" width="60px" height="60px" alt="user profile image">
			<form action="updatemHeadPhoto" method="post" enctype="multipart/form-data">
           <input id="fileToUpload" type="file" name="mImage" accept="image/*" onchange="this.form.submit()" style="display:none;">
			</form>
		</c:if>
		<b>click image to update your photo</b>
	</c:if>
	
	<c:if test="${!empty kType }">
		<c:if test="${empty photo.kheadphoto }">
		<img src="${pageContext.request.contextPath }/img/kid default.jpg" onclick="fileSelect();" class="img-circle avatar" width="60px" height="60px" title="click to edit head photo" >
		<form action="updatekHeadPhoto" method="post" enctype="multipart/form-data">
           <input id="fileToUpload" type="file" name="kImage" accept="image/*" onchange="this.form.submit()" style="display:none;">
			</form></c:if>
		<c:if test="${!empty photo.kheadphoto }">
			<img src="${pageContext.request.contextPath }/img/${photo.kheadphoto }" class="img-circle avatar" onclick="fileSelect();" width="60px" height="60px" alt="user profile image">
			<form action="updatekHeadPhoto" method="post" enctype="multipart/form-data">
           <input id="fileToUpload" type="file" name="kImage" accept="image/*" onchange="this.form.submit()" style="display:none;">
			</form>
		</c:if>
		<b>click image to update your photo</b>
	</c:if>
	</div>
	<c:forEach items="${fMoments}" var="f" varStatus="st">
<div class="container">
    <div class="row">
        <div class="col-8">
            <div class="card card-white post">
                <div class="post-heading">
                
                <c:if test="${empty photo.fheadphoto }">
                    <div class="float-left image">
                        <img src="${pageContext.request.contextPath }/img/father default.jpg" class="img-circle avatar" title="click to edit head photo" >
                        <form action="updatefHeadPhoto" method="post" enctype="multipart/form-data">
                    </form>
                    </div></c:if>
                    <c:if test="${!empty photo.fheadphoto }">
                    <div class="float-left image">
                        <img src="${pageContext.request.contextPath }/img/${photo.fheadphoto }" class="img-circle avatar"  alt="user profile image">
                    </div></c:if>
                    
                    <div class="float-left meta">
                        <div class="title h5">
                            <b>father</b>
                            made a post.
                        </div>
                        <h6 class="text-muted time"><fmt:formatDate value="${f.createtime}" pattern="yyyy-MM-dd HH:mm"/></h6>
                    </div>
                </div> 
                <div class="post-description"> 
                    <p>${f.content }</p>

                </div>
            </div>
        </div>
        
    </div>
</div>
<div style="height: 10px"></div>
</c:forEach>

<c:forEach items="${mMoments}" var="m" varStatus="st">
<div class="container">
    <div class="row">
        <div class="col-8">
            <div class="card card-white post">
                <div class="post-heading">
                
                    <c:if test="${empty photo.mheadphoto }">
                    <div class="float-left image">
                        <img src="${pageContext.request.contextPath }/img/mother default.jpg" onclick="fileSelect1();" class="img-circle avatar" title="click to edit head photo" alt="user profile image">
                    </div></c:if>
                    <c:if test="${!empty photo.mheadphoto }">
                    <div class="float-left image">
                        <img src="${pageContext.request.contextPath }/img/${photo.mheadphoto }" class="img-circle avatar" alt="user profile image" title="click to edit head photo">
                    </div></c:if>
                    
                    <div class="float-left meta">
                        <div class="title h5">
                            <b>mother</b>
                            made a post.
                        </div>
                        <h6 class="text-muted time"><fmt:formatDate value="${m.createtime}" pattern="yyyy-MM-dd HH:mm"/></h6>
                    </div>
                </div> 
                <div class="post-description"> 
                    <p>${m.content }</p>

                </div>
            </div>
        </div>
        
    </div>
</div>
<div style="height: 10px"></div>
</c:forEach>

<c:forEach items="${kMoments}" var="k" varStatus="st">
<div class="container">
    <div class="row">
        <div class="col-8">
            <div class="card card-white post">
                <div class="post-heading">
                
                    <c:if test="${empty photo.kheadphoto }">
                    <div class="float-left image">
                        <img src="${pageContext.request.contextPath }/img/kid default.jpg" onclick="fileSelect2();" class="img-circle avatar" title="click to edit head photo" alt="user profile image">
                    </div></c:if>
                    <c:if test="${!empty photo.kheadphoto }">
                    <div class="float-left image">
                        <img src="${pageContext.request.contextPath }/img/${photo.kheadphoto }" class="img-circle avatar" alt="user profile image" title="click to edit head photo">
                    </div></c:if>
                    
                    <div class="float-left meta">
                        <div class="title h5">
                            <b>kid</b>
                            made a post.
                        </div>
                        <h6 class="text-muted time"><fmt:formatDate value="${k.createtime}" pattern="yyyy-MM-dd HH:mm"/></h6>
                    </div>
                </div> 
                <div class="post-description"> 
                    <p>${k.content }</p>

                </div>
            </div>
        </div>
        
    </div>
</div><div style="height: 10px"></div>
</c:forEach>

</body>