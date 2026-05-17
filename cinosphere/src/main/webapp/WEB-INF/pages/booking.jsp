<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Booking | CinoSphere</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/booking.css">
</head>

<body>

	<jsp:include page="../components/header.jsp" />
	
	<main class ="booking_screen">
	
		<section class="booking_left_section">
			<div class="movie_card">
			    <div class="movie_card_poster">
			    	<img src="${pageContext.request.contextPath}/movieposter?name=${movie.movieId}"  alt="${movie.movieName} Poster" class="movie_poster_image"/>
			    </div>
			
			    <div class="movie_card_information">
			        <div class="movie_card_title">${movie.movieName}</div>
			        <div class="movie_card_description"> ${selectedDate} · ${selectedTime} · ${selectedHall} </div>
			        <div class="movie_card_badge_group">
			            <span class="movie_card_badge">${movie.format}</span>
			            <span class="movie_card_badge movie_card_badge_gold">${movie.ageRating}</span>
			            <span class="movie_card_badge movie_card_badge_neutral">${movie.duration} min</span>
			        </div>
			    </div>
			
			    <a href="${pageContext.request.contextPath}/schedules" class="movie_card_button"> Change Show
			        <img src="${pageContext.request.contextPath}/assets/icons/arrowright.svg" alt="Arrow Right" class="movie_card_button_icon"/>
			    </a>
				</div>
		</section>
		
		<aside class="checkout_panel">
			<div class="checkout_header">
				<span class="section_eyebrow"> Your Order </span>
				<h3 class="checkout_title"> Booking <em>Summary</em></h3>
			</div>
		</aside>
		
	</main>
	
	<jsp:include page="../components/footer.jsp" />

</body>

</html>