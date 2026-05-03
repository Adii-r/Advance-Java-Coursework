<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Movies | CinoSphere</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/movies.css">
</head>

<body>

    <jsp:include page="../components/header.jsp" />
    
    <main class="movie_screen"> 
    
	    <section class="hero_movie_section">	
	        <div class="overlay"></div>
	        
	        <div class="main_content_container">
	            <div class="hero_text_stack">
	                <h1 class="hero_primary_title">What's <em>Playing</em></h1>
	                <p class="hero_narrative_subtitle">Storytelling under spectacle, explore the latest blockbusters now showing.</p>
	            </div>
	        </div>
	    </section>
	    
	    <section class="movie_filter_section">
	    <form method="get" action="${pageContext.request.contextPath}/movies">
		    <div class="movie_filter_container">
		        <div class="movie_search_wrapper">
		            <span class="movie_search_icon_container">
		                <img src="${pageContext.request.contextPath}/assets/icons/search.svg" alt="Search" />
		            </span>
		            <input type="text" placeholder="Search movies, genres, languages..." name="movieSearch" class="movie_search_input" value="${searchKeyword}">
		        </div>
		        <div class="movie_filter_dropdown_group">
		            <div class="movie_select_wrapper">
		                <select class="movie_filter_select" name="langFilter">
		                    <option value="">All Languages</option>
		                    <option value="english" ${selectedLanguage=="english"?"selected":""}>English</option>
		                    <option value="hindi" ${selectedLanguage=="english"?"selected":""}>Hindi</option>
		                    <option value="nepali" ${selectedLanguage=="english"?"selected":""}>Nepali</option>
		                </select>
		                <span class="movie_select_arrow">
		                    <img src="${pageContext.request.contextPath}/assets/icons/arrowdown.svg" alt="Arrow Down" />
		                </span>
		            </div>
		
		            <div class="movie_select_wrapper">
		                <select class="movie_filter_select" name="genreFilter">
		                    <option value="">All Genres</option>
		                    <option value="action" ${selectedGenre=="english"?"selected":""}>Action</option>
		                    <option value="drama" ${selectedGenre=="english"?"selected":""}>Drama</option>
		                    <option value="comedy" ${selectedGenre=="english"?"selected":""}>Comedy</option>
			                <option value="sci-fi" ${selectedGenre=="english"?"selected":""}>Sci-Fi</option>
			                <option value="horror" ${selectedGenre=="english"?"selected":""}>Horror</option>
			                <option value="biography" ${selectedGenre=="english"?"selected":""}>Biography</option>
		                </select>
		                <span class="movie_select_arrow">
		                    <img src="${pageContext.request.contextPath}/assets/icons/arrowdown.svg" alt="Arrow Down" />
		                </span>
		            </div>
		        </div>
		
		        <div class="movie_status_pill_group">
				    <input type="radio" name="status" id="all" value="all" class="pill_radio" ${selectedStatus=="english" || empty selectedStatus ?"selected":""}>
				    <label for="all" class="movie_filter_pill">All</label>
				
				    <input type="radio" name="status" id="showing" value="now_showing" class="pill_radio" ${selectedStatus=="english"?"selected":""}>
				    <label for="showing" class="movie_filter_pill">Now Showing</label>
				
				    <input type="radio" name="status" id="soon" value="comming_soon"class="pill_radio" ${selectedStatus=="english"?"selected":""}>
				    <label for="soon" class="movie_filter_pill">Coming Soon</label>
				</div>
				<c:if test="${not empty error}">
            			<div class="error_banner">
                		<p>${errorMessage}</p>
            			</div>
        		</c:if>
		    </div>
		    <button type="submit" class="movie_filter_button">Filter</button>
		  </form>
		</section>
		
		<section class="movie_section">
			    
			    <div class="movie_main_content_container">
			        <div class="movie_cards_presentation_grid">
			        
			            <div class="movie_feature_film_card">
			                <div class="movie_poster_visual_wrapper">
			                    <div class="movie_status_badge_group">
			                        <span class="movie_certification_badge">PG</span>
			                    </div>
			                    <img src="${pageContext.request.contextPath}/assets/posters/poster_1.jpeg" alt="Poster" class="movie_poster_image_element"/>
			                </div>
			                <div class="movie_information_panel">
			                    <h3 class="movie_title">The Devil Wears Prada 2</h3>
			                    <p class="movie_description">English | Comedy <span>2h 15m</span></p>
			                    <div class="movie_action_button_bar">
			                        <button class="movie_booking_primary_button">Book Now</button>
			                        <div class="movie_quick_view_icon_wrapper">
			                            <img src="${pageContext.request.contextPath}/assets/icons/info.svg" alt="Info" />
			                        </div>
			                    </div>
			                </div>
			            </div>
			
			           
			            <div class="movie_feature_film_card">
			                <div class="movie_poster_visual_wrapper">
			                    <div class="movie_status_badge_group">
			                        <span class="movie_certification_badge">PG</span>
			                    </div>
			                    <img src="${pageContext.request.contextPath}/assets/posters/poster_2.jpg" alt="Poster" class="movie_poster_image_element"/>
			                </div>
			                <div class="movie_information_panel">
			                    <h3 class="movie_title">Michael</h3>
			                    <p class="movie_description">English | Biography <span>2h 05m</span></p>
			                    <div class="movie_action_button_bar">
			                        <button class="movie_booking_primary_button">Book Now</button>
			                        <div class="movie_quick_view_icon_wrapper">
			                            <img src="${pageContext.request.contextPath}/assets/icons/info.svg" alt="Info" />
			                        </div>
			                    </div>
			                </div>
			            </div>
			
			            
			            <div class="movie_feature_film_card">
			                <div class="movie_poster_visual_wrapper">
			                    <div class="movie_status_badge_group">
			                        <span class="movie_certification_badge">PG</span>
			                    </div>
			                    <img src="${pageContext.request.contextPath}/assets/posters/poster_3.jpg" alt="Poster" class="movie_poster_image_element"/>
			                </div>
			                <div class="movie_information_panel">
			                    <h3 class="movie_title">Bhoot Bangla</h3>
			                    <p class="movie_description">Hindi | Horror <span>2h 40m</span></p>
			                    <div class="movie_action_button_bar">
			                        <button class="movie_booking_primary_button">Book Now</button>
			                        <div class="movie_quick_view_icon_wrapper">
			                            <img src="${pageContext.request.contextPath}/assets/icons/info.svg" alt="Info" />
			                        </div>
			                    </div>
			                </div>
			            </div>
			
			           
			            <div class="movie_feature_film_card">
			                <div class="movie_poster_visual_wrapper">
			                    <div class="movie_status_badge_group">
			                        <span class="movie_certification_badge">PG</span>
			                    </div>
			                    <img src="${pageContext.request.contextPath}/assets/posters/poster_4.jpg" alt="Poster" class="movie_poster_image_element"/>
			                </div>
			                <div class="movie_information_panel">
			                    <h3 class="movie_title">Project Hail Mary</h3>
			                    <p class="movie_description">English | Sci-Fi <span>2h 30m</span></p>
			                    <div class="movie_action_button_bar">
			                        <button class="movie_booking_primary_button">Book Now</button>
			                        <div class="movie_quick_view_icon_wrapper">
			                            <img src="${pageContext.request.contextPath}/assets/icons/info.svg" alt="Info" />
			                        </div>
			                    </div>
			                </div>
			            </div>
			
			        </div>
			    </div>
			</section>
	    
	    
	    <section class="movie_section">
		
		    <div class="movie_main_content_container">
		        <div class="movie_cards_presentation_grid">
		            
		            <div class="movie_feature_film_card coming_soon_card">
		                <div class="movie_release_header">
		                    <span class="release_date_text">17 July 2026</span>
		                </div>
		
		                <div class="movie_poster_visual_wrapper">
		                   	<div class="movie_status_badge_group">
		                        <span class="movie_certification_badge">PG</span>
		                    </div>
		                    <img src="${pageContext.request.contextPath}/assets/posters/poster_5.jpg" alt="Poster" class="movie_poster_image_element"/>
		                </div>
		
		                <div class="movie_information_panel">
		                    <h3 class="movie_title">The Odyssey</h3>
		                    <p class="movie_description">English | Action <span>3h</span></p>
		                    <div class="movie_action_button_bar">
		                        <button class="movie_booking_primary_button">Notify Me</button>
		                        <div class="movie_quick_view_icon_wrapper">
		                            <img src="${pageContext.request.contextPath}/assets/icons/info.svg" alt="Info" />
		                        </div>
		                    </div>
		                </div>
		            </div>
		            
		            <div class="movie_feature_film_card coming_soon_card">
		                <div class="movie_release_header">
		                    <span class="release_date_text">31 July 2026</span>
		                </div>
		
		                <div class="movie_poster_visual_wrapper">
		                   	<div class="movie_status_badge_group">
		                        <span class="movie_certification_badge">PG</span>
		                    </div>
		                    <img src="${pageContext.request.contextPath}/assets/posters/poster_6.jpg" alt="Poster" class="movie_poster_image_element"/>
		                </div>
		
		                <div class="movie_information_panel">
		                    <h3 class="movie_title">Spider Man: Brand New Day</h3>
		                    <p class="movie_description">English | Action  <span>3h 10m</span></p>
		                    <div class="movie_action_button_bar">
		                        <button class="movie_booking_primary_button">Notify Me</button>
		                        <div class="movie_quick_view_icon_wrapper">
		                            <img src="${pageContext.request.contextPath}/assets/icons/info.svg" alt="Info" />
		                        </div>
		                    </div>
		                </div>
		            </div>
		            
		            <div class="movie_feature_film_card coming_soon_card">
		                <div class="movie_release_header">
		                    <span class="release_date_text">21 Aug 2026</span>
		                </div>
		
		                <div class="movie_poster_visual_wrapper">
		                   	<div class="movie_status_badge_group">
		                        <span class="movie_certification_badge">ADULT</span>
		                    </div>
		                    <img src="${pageContext.request.contextPath}/assets/posters/poster_7.jpg" alt="Poster" class="movie_poster_image_element"/>
		                </div>
		
		                <div class="movie_information_panel">
		                    <h3 class="movie_title">Insidious: Out of the Further</h3>
		                    <p class="movie_description">English | Horror  <span>2h 35m</span></p>
		                    <div class="movie_action_button_bar">
		                        <button class="movie_booking_primary_button">Notify Me</button>
		                        <div class="movie_quick_view_icon_wrapper">
		                            <img src="${pageContext.request.contextPath}/assets/icons/info.svg" alt="Info" />
		                        </div>
		                    </div>
		                </div>
		            </div>
		            
		            <div class="movie_feature_film_card coming_soon_card">
		                <div class="movie_release_header">
		                    <span class="release_date_text">02 Oct 2026</span>
		                </div>
		
		                <div class="movie_poster_visual_wrapper">
		                   	<div class="movie_status_badge_group">
		                        <span class="movie_certification_badge">PG</span>
		                    </div>
		                    <img src="${pageContext.request.contextPath}/assets/posters/poster_8.jpg" alt="Poster" class="movie_poster_image_element"/>
		                </div>
		
		                <div class="movie_information_panel">
		                    <h3 class="movie_title">Drishyam 3</h3>
		                    <p class="movie_description">Hindi | Thriller <span>2h 55m</span></p>
		                    <div class="movie_action_button_bar">
		                        <button class="movie_booking_primary_button">Notify Me</button>
		                        <div class="movie_quick_view_icon_wrapper">
		                            <img src="${pageContext.request.contextPath}/assets/icons/info.svg" alt="Info" />
		                        </div>
		                    </div>
		                </div>
		            </div>
		                
		         </div>		
		    </div>
		</section>	    
	</main>
    <jsp:include page="../components/footer.jsp" />

</body>

</html>