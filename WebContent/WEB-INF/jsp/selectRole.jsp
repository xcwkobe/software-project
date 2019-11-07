<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix='fmt' %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Select Role </title>
<link rel="icon" href="img/LOL.ico" mce_href="img/LOL.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel='stylesheet prefetch' href='css/slick.css'>
<link rel='stylesheet prefetch' href='css/slick-theme.css'>
<link rel="stylesheet" href="css/style.css">

</head>
<body>
<div class="slide-container">

  
  <div class="wrapper" style="cursor: pointer;"  id="role1">
	<div class="clash-card giant">
	  <div class="clash-card__image clash-card__image--giant">
		<img src="img/giant.png" alt="giant" />
	  </div>
	  <div class="clash-card__level clash-card__level--giant">Level 5</div>
	  <div class="clash-card__unit-name">Father</div>
	  <div class="clash-card__unit-description">
		Slow, steady and powerful, Giants are massive warriors that soak up huge amounts of damage. Show them a turret or cannon and you'll see their fury unleashed!
	  </div>

	  <div class="clash-card__unit-stats clash-card__unit-stats--giant clearfix">
		<div class="one-third">
		  <div class="stat">2<sup>M</sup></div>
		  <div class="stat-value">Training</div>
		</div>

		<div class="one-third">
		  <div class="stat">12</div>
		  <div class="stat-value">Speed</div>
		</div>

		<div class="one-third no-border">
		  <div class="stat">2250</div>
		  <div class="stat-value">Cost</div>
		</div>

	  </div>

	</div> <!-- end clash-card giant-->
  </div> <!-- end wrapper -->
  
   <div class="wrapper" style="cursor: pointer;"  id="role2">
	<div class="clash-card goblin">
	  <div class="clash-card__image clash-card__image--goblin">
		<img src="img/goblin.png" alt="goblin" />
	  </div>
	  <div class="clash-card__level clash-card__level--goblin">Level 5</div>
	  <div class="clash-card__unit-name">Mother</div>
	  <div class="clash-card__unit-description">
		These pesky little creatures only have eyes for one thing: LOOT! They are faster than a Spring Trap, and their hunger for resources is limitless.
	  </div>

	  <div class="clash-card__unit-stats clash-card__unit-stats--goblin clearfix">
		<div class="one-third">
		  <div class="stat">30<sup>S</sup></div>
		  <div class="stat-value">Training</div>
		</div>

		<div class="one-third">
		  <div class="stat">32</div>
		  <div class="stat-value">Speed</div>
		</div>

		<div class="one-third no-border">
		  <div class="stat">100</div>
		  <div class="stat-value">Cost</div>
		</div>

	  </div>

	</div> <!-- end clash-card goblin-->
  </div> <!-- end wrapper -->
  
  <div class="wrapper" style="cursor: pointer;"  id="role3">
	<div class="clash-card wizard">
	  <div class="clash-card__image clash-card__image--wizard">
		<img src="img/wizard.png" alt="wizard" />
	  </div>
	  <div class="clash-card__level clash-card__level--wizard">Level 6</div>
	  <div class="clash-card__unit-name">Kid</div>
	  <div class="clash-card__unit-description">
		The Wizard is a terrifying presence on the battlefield. Pair him up with some of his fellows and cast concentrated blasts of destruction on anything, land or sky!
	  </div>

	  <div class="clash-card__unit-stats clash-card__unit-stats--wizard clearfix">
		<div class="one-third">
		  <div class="stat">5<sup>M</sup></div>
		  <div class="stat-value">Training</div>
		</div>

		<div class="one-third">
		  <div class="stat">16</div>
		  <div class="stat-value">Speed</div>
		</div>

		<div class="one-third no-border">
		  <div class="stat">4000</div>
		  <div class="stat-value">Cost</div>
		</div>

	  </div>

	</div> <!-- end clash-card wizard-->
  </div> <!-- end wrapper -->
  
</div> <!-- end container -->
<form action="selectType" method="post" id="roleForm">
  <input name="type" type="hidden" id="type">
	<input name="uid" type="hidden" value="${user.id }">
	</form>
<script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src='js/slick.min.js'></script>
<script type="text/javascript">
	$("#role1").click(function(){
		if(confirm("Are you sure to select father?")){
			$("#type").val("fatherType");
			document.getElementById("roleForm").submit();
		}
	});
	$("#role2").click(function(){
	
		if(confirm("Are you sure to select mother?")){
			$("#type").val("motherType");
			document.getElementById("roleForm").submit();
		}
	});
	$("#role3").click(function(){
	
		if(confirm("Are you sure to select kid?")){
			$("#type").val("kidType");
			document.getElementById("roleForm").submit();
		}
	});
	
	(function() {

	  var slideContainer = $('.slide-container');
	  
	  slideContainer.slick();
	  
	  $('.clash-card__image img').hide();
	  $('.slick-active').find('.clash-card img').fadeIn(200);
	  
	  // On before slide change
	  slideContainer.on('beforeChange', function(event, slick, currentSlide, nextSlide) {
		$('.slick-active').find('.clash-card img').fadeOut(1000);
	  });
	  
	  // On after slide change
	  slideContainer.on('afterChange', function(event, slick, currentSlide) {
		$('.slick-active').find('.clash-card img').fadeIn(200);
	  });
	  
	})();
</script>
</body>
</html>