<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home | CinoSphere</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>

<jsp:include page="WEB-INF/components/header.jsp" />
    
<main>

  <section class="landing_hero">
    <div class="hero_content">
      <div class="hero_row">
        <div class="row"></div>
        <span class="row_text">Nepal's First and Finest IMAX Experience</span>
        <div class="row_bottom"></div>
      </div>

      <h1 class="hero_title">Cinema<br><em>Reimagined</em></h1>

      <p class="hero_subtitle">
        An experience beyond cinema — Stories. Vision. Emotion. Impact.
      </p>

      <div class="hero_actions">
        <a href="${pageContext.request.contextPath}/#" class="hero_button">
          <img src="${pageContext.request.contextPath}/assets/icons/ticket.svg" alt="ticket" class="hero_button_icon" />
          <span class="hero_button_text">Reserve Now</span>   
        </a>
      </div>
    </div>
  </section>
   
  <section class="location_strip">
    <div class="location_row">
      <span class="row_label">Launching At Your</span>

      <div class="row_list">
        <div class="row_item_wrap">
          <span class="row_name">Kathmandu</span>
          <span class="row_tag soon">Opening Soon</span>
        </div>
        <div class="row_item_wrap">
          <span class="row_name">Pokhara</span>
          <span class="row_tag far">Q3 2026</span>
        </div>
        <div class="row_item_wrap">
          <span class="row_name">Butwal</span>
          <span class="row_tag far">2027</span>
        </div>
      </div>

      <span class="row_label">Nearest 3 Locations</span>
    </div>
  </section>
  
  
  <section class="movie_display_section">
    <div class="movie_decorative_accent_line line_top"></div>
    <div class="movie_main_content_container">
        <div class="movie_section_header_container centered_layout">
            <h2 class="section_display_title">On<em> Screen Now</em></h2>
        </div>

        <div class="movie_category_navigation_bar">
            <div class="movie_category_tab_switcher">
                <button class="movie_category_tab_button active_tab">
                    <span class="movie_tab_icon_container">
                        <img src="${pageContext.request.contextPath}/assets/icons/monitor.svg" alt="Now Showing Icon" />
                    </span>
                    Now Showing
                </button>
                <div class="movie_tab_vertical_divider"></div>
            </div>

            <a href="${pageContext.request.contextPath}/movies" class="movie_navigation_link_all">
                View All Films 
                <span class="navigation_arrow_icon">
                    <img src="${pageContext.request.contextPath}/assets/icons/rightarrow.svg" alt="Right Arrow" />
                </span>
            </a>
        </div>

        <div class="movie_cards_presentation_grid">
            	<c:if test="${not empty activeMovies}">
   		<c:forEach var="movie" items="${activeMovies}">
	    <c:choose>
		<c:when test="${movie.movieStatus == 'NOW_SHOWING'}">
            <div class="movie_feature_film_card">
             <div class="movie_poster_visual_wrapper">
             <div class="movie_status_badge_group">
               <span class="movie_certification_badge">${movie.ageRating}</span>
                </div>
                 <img src="${pageContext.request.contextPath}/movieposter?name=${movie.movieId}" alt="${movie.movieName} poster" class="movie_poster_image_element"/>
                  <div class="movie_poster_gradient_overlay"></div>
                  </div>
                                        <div class="movie_information_panel">
                                        <div class="movie_metadata_text_group">
                                            <h3 class="movie_title">${movie.movieName}</h3>
                                            <p class="movie_description">
                                                ${movie.movieLanguage} | ${movie.genre}
                                                <span>${movie.duration} min</span>
                                            </p>
                                            <div class="movie_action_button_bar">
                                            <button class="movie_booking_primary_button" href="${pageContext.request.contextPath}/booking">
                                                    Book Now
                                                </button>
                                                <a href='${pageContext.request.contextPath}/movie-detail?movieId=${movie.movieId}'>
                                                <div class="movie_quick_view_icon_wrapper">
                                                    <img src="${pageContext.request.contextPath}/assets/icons/info.svg" alt="Info" />
                                                </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                             </div>
            				</c:when>
           			 </c:choose>
            </c:forEach>
            </c:if>  
         </div>
    </div>
    <c:if test="${error}">
                <div class="movie_main_content_container">
                    <p class="movie_description" style="color:red;font-size:1rem;">${error}</p>
                </div>
        </c:if>    
  </section>
   
  <section class="features_strip">
    <div class="strip_content">
      <div class="strip_label_wrap">
        <div class="strip_line"></div>
        <span class="strip_label">Why CinoSphere?</span>
        <div class="strip_line"></div>
      </div>

      <h2 class="strip_title">
        Cinematic Experience <em>Beyond Extraordinary</em>
      </h2>
    </div>
  </section>
 	
  <section class="screen_details">
    <div class="details_grid">

      <div class="details_info">
        <h2 class="details_title">
          Every Screen<em>Built for Stories.</em>
        </h2>

        <p class="details_description">
          A geometry that dissolves cinematic reality. Built for Detail. Emotion. Impact.
        </p>
            
        <div class="details_stats">
          <div class="stat_item">
            <span class="stat_value">18K</span>
            <span class="stat_label">sq. Ft. Screen</span>
          </div>

          <div class="stat_item">
            <span class="stat_value">350+</span>
            <span class="stat_label">Seats</span>
          </div>

          <div class="stat_item">
            <span class="stat_value">44k</span>
            <span class="stat_label">Audio</span>
          </div>
        </div>
      </div>

      <div class="details_visual">
        <img src="${pageContext.request.contextPath}/assets/posters/poster.jpg"
             alt="Civil War IMAX Experience"
             class="visual_screen_img">
        <div class="visual_screen_overlay"></div>
      </div>

    </div>
  </section>
  
	<section class="newsletter_subscription_section" id="s-newsletter">
	   <div class="newsletter_accent_line line_top"></div>
	
	   <div class="newsletter_content_container centered_layout">
	       <div class="newsletter_column_registration">
	           <h2 class="section_display_title">Behind the<em> Curtains</em></h2>
	           <p class="newsletter_informative_text">
	               Get exclusive early access to premieres, exclusive member offers, weekly film highlights and
	               behind the scenes stories, as well as the latest editions from the world of entertainment.
	           </p>
	           
	           <form action="subscribe" method="POST" class="newsletter_interaction_form">
	               <div class="newsletter_input_field_wrapper">
	                   <input type="email" name="email" class="newsletter_input_element" placeholder="aditya@gmail.com" required>
	            
	                   <span class="newsletter_input_icon_container icon_right"> 
	                       <img src="${pageContext.request.contextPath}/assets/icons/mail.svg" alt="Mail Icon" />
	                   </span>
	               </div>
	               <button type="submit" class="newsletter_submit_button">Subscribe</button>
	           </form>
	       </div>
	   </div>
	
	   
	   <div class="newsletter_accent_line line_bottom"></div>
	</section>
	 
</main>

<jsp:include page="WEB-INF/components/footer.jsp" />

</body>
</html>