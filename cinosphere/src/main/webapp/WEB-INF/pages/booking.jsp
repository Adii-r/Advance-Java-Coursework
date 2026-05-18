<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
			        <div class="movie_card_description">${selectedTime} · ${selectedDate} · ${selectedHall} </div>
			        <div class="movie_card_badge_group">
			            <span class="movie_card_badge movie_card_badge_gold">${movie.ageRating}</span>
			            <span class="movie_card_badge movie_card_badge_neutral">${movie.duration} min</span>
			        </div>
			    </div>
			
			    <a href="${pageContext.request.contextPath}/schedules" class="movie_card_button"> Change Show
			        <img src="${pageContext.request.contextPath}/icon?name=rightarrow" alt="Arrow Right" class="movie_card_button_icon"/>
			    </a>
				</div>
				
				<div class="seat_selection_header">

				    <div class="seat_selection_heading">
				        <span class="section_eyebrow">Select Your Seats</span>
				        <h2 class="seat_selection_title"> ${selectedHall} </h2>
				    </div>
			
					<div class="hall_selector">
					    <label class="hall_pill ${selectedHall == 'A' ? 'active' : ''}">
					        <input type="radio" name="selectedHall" value="A" class="hall_radio_input" ${selectedHall == 'A' ? 'checked' : ''}>
					        <span>Hall A — IMAX</span>
					    </label>
					
					    <label class="hall_pill ${selectedHall == 'B' ? 'active' : ''}">
					        <input type="radio" name="selectedHall" value="B" class="hall_radio_input" ${selectedHall == 'B' ? 'checked' : ''}>
					        <span>Hall B — IMAX</span>
					    </label>
					
					    <label class="hall_pill ${selectedHall == 'C' ? 'active' : ''}">
					        <input type="radio" name="selectedHall" value="C" class="hall_radio_input" ${selectedHall == 'C' ? 'checked' : ''}>
					        <span>Hall C — Premium</span>
					    </label>
					</div>
					
					<div class="seat_indicator_bar">
						<div class="indicator_item">
					        <div class="overlay overlay_available"></div>
					        <span class="label">Available</span>
					    </div>
					
					    <div class="indicator_item">
					        <div class="overlay overlay_reserved"></div>
					        <span class="label">Reserved</span>
					    </div>
					
					    <div class="indicator_item">
					        <div class="overlay overlay_taken"></div>
					        <span class="label">Taken</span>
					    </div>
					</div>
				</div>
				
				<div class="screen_label_wrap">
				    <div class="screen_bar"></div>
				    <div class="screen_bar_glow"></div>
				    <div class="screen_text">Screen this way</div>
				</div>
				
				<div class="seat_map_wrap">
				    <div class="seat_map">
				
				        <c:set var="rows" value="A,B,C,D,E,F,G,H,J,K" />
				        <c:set var="seatsPerRow" value="18" />
				        <c:set var="takenSeats" value="A3,A4,B7,B8,C12,D5,D6,D7,E9,E10,F3,F4,G14,G15,H2,H3,J8,J9,K1,K2" />
				
				        <c:forTokens var="row" items="${rows}" delims=",">	            
				            <c:if test="${row == 'A'}">
				                <div class="section_label_row">
				                    <span class="section_label_text">Standard</span>
				                    <div class="section_label_line"></div>
				                </div>
				            </c:if>
				
				            <c:if test="${row == 'F'}">
				                <div class="section_label_row">
				                    <span class="section_label_text">Premium</span>
				                    <div class="section_label_line"></div>
				                </div>
				            </c:if>
				
				            <c:if test="${row == 'K'}">
				                <div class="section_label_row">
				                    <span class="section_label_text">VIP Area</span>
				                    <div class="section_label_line"></div>
				                </div>
				            </c:if>
			
				            <div class="seat_row">
				                <span class="seat_row_label">${row}</span>
				                <c:forEach var="s" begin="1" end="${seatsPerRow}">
				                    <c:if test="${s == 4 || s == 14}">
				                        <div class="seat_aisle"></div>
				                    </c:if>
				                    <c:set var="seatId" value="${row}${s}" />
									<jsp:include page="../components/seat.jsp">
									    <jsp:param name="seatId" value="${seatId}" />
									    <jsp:param name="seatNumber" value="${s}" />
									    <jsp:param name="isTaken" value="${fn:contains(takenSeats, seatId)}" />
									</jsp:include>				
				                </c:forEach>
				
				            </div>
				
				        </c:forTokens>
				
				    </div>
				</div>	
		</section>
		
		<aside class="checkout_panel">
		
			<div class="checkout_header">
				<span class="section_eyebrow"> Your Order </span>
				<h3 class="checkout_title"> Booking <em>Summary</em></h3>
				<div class="checkout_line"></div>
			</div>
			
			<div class="checkout_body">	
			
				<div class="checkout_section_label"> Selected Seats (<span><c:out value="${seatCount != null ? seatCount : 0}" /></span>)</div>
        	
	        	<div class="selected_seats_area">
	        		<c:choose>
	        		
	        			<c:when test="${not empty selectedSeats}">
	        				<c:forEach var="seat" items="${selectedSeats}">
	                        	<div class="selected_seat_chip"><span>${seat}</span></div>
	                    	</c:forEach>
	                	</c:when>
	                	
		                <c:otherwise>
		                    <div class="no_seats_notifier"> Tap seats on the screen to select them</div>
		                </c:otherwise>
	            	
	            	</c:choose>
	        	</div>
        			
        		<div class="checkout_section_label">Sphere Points</div>
				<div class="sphere_row">
				    <div class="sphere_display">
				        <div class="sphere_title">Use Sphere Points</div>
				        <div class="sphere_meta"> ${spherePoints} Pts · Rs.${sphereValue} </div>
				    </div>
				    <button type="submit" name="useSpherePoints" value="true" class="sphere_button">Apply</button>
				</div>        	
							
				<div class="checkout_section_label">Checkout Summary</div>
				<div class="order_lines">
					<div class="order_line">
						<span class="order_line_label"> Tickets (${seatCount != null ? seatCount : 0})</span>
						<span class="order_line_value">₨${ticketSubtotal}</span>
					</div>
					
					<c:if test="${sphereDiscount > 0}">
						<div class="order_line order_line_discount">
							<span class="order_line_label">Sphere Credits Applied</span>
							<span class="order_line_value">−Rs ${sphereDiscount}</span>
						</div>
					</c:if>
					
					<div class="order_line order_line_total">
						<span class="order_line_label">Total</span>
						<span class="order_line_value">₨${totalAmount}</span>
					</div>
				</div>
				
				<form method="post" action="${pageContext.request.contextPath}/#">
					<div class="payment_section">
						<div class="checkout_section_label">Payment Method</div>
							<div class="payment_methods">
								<label class="payment_method ${selectedPayment=='esewa' ? 'active' : ''}">
									<input type="radio" name="paymentMethod" value="esewa" class="payment_input" ${selectedPayment=='esewa' ? 'checked' : ''}>
									
									<div class="payment_icon">
										<img src="${pageContext.request.contextPath}/icon?name=esewa" alt="eSewa" class="payment_icon_image"/>
									</div>
									
						            <div class="payment_info">
						                <div class="payment_name">eSewa</div>
						            </div>
					            </label>
					            
					            <label class="payment_method ${selectedPayment=='khalti' ? 'active' : ''}">
					            	<input type="radio" name="paymentMethod" value="khalti" class="payment_input" ${selectedPayment=='khalti' ? 'checked' : ''}>

									<div class="payment_icon">
										<img src="${pageContext.request.contextPath}/icon?name=khalti" alt="Khalti" alt="khalti" class="payment_icon_image"/>
									</div>
									
						            <div class="payment_info">
						                <div class="payment_name">Khalti</div>
						            </div>
					            </label>
					            
					            <label class="payment_method ${selectedPayment=='fonepay' ? 'active' : ''}">
					            	<input type="radio" name="paymentMethod" value="fonepay" class="payment_input" ${selectedPayment=='fonepay' ? 'checked' : ''}>						
									<div class="payment_icon">
										<img src="${pageContext.request.contextPath}/icon?name=fonepay" alt="fonepay" class="payment_icon_image"/>
									</div>
									
						            <div class="payment_info">
						                <div class="payment_name">Fonepay</div>
						            </div>
					            </label>
					       </div>
					</div>
	
					<div class="checkout_footer">
					<div class ="checkout_footer_line"></div>
						<button class="checkout_button" type="submit" formaction="${pageContext.request.contextPath}/checkout/confirm"  ${seatCount == 0 ? 'disabled' : ''}>
						${seatCount == 0 ? 'Select Seats to Continue' : 'Proceed to Payment'}
						</button>
					</div>
				</form>
			</div>
		
		</aside>
	</main>
	
	<jsp:include page="../components/footer.jsp" />

</body>

</html>