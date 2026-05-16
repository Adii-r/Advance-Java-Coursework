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
		            <input type="text" placeholder="Search movie names..." name="movieSearch" class="movie_search_input" value="${searchKeyword}">
		        </div>
		        <div class="movie_filter_dropdown_group">
		            <div class="movie_select_wrapper">
		                <select class="movie_filter_select" name="langFilter">
		                    <option value="">All Languages</option>
		                    <option value="english" ${selectedLanguage=="english"?"selected":""}>English</option>
		                    <option value="hindi" ${selectedLanguage=="hindi"?"selected":""}>Hindi</option>
		                    <option value="nepali" ${selectedLanguage=="nepali"?"selected":""}>Nepali</option>
		                </select>
		                <span class="movie_select_arrow">
		                    <img src="${pageContext.request.contextPath}/assets/icons/arrowdown.svg" alt="Arrow Down" />
		                </span>
		            </div>
		
		            <div class="movie_select_wrapper">
		                <select class="movie_filter_select" name="genreFilter">
		                    <option value="">All Genres</option>
		                    <option value="action" ${selectedGenre=="action"?"selected":""}>Action</option>
		                    <option value="drama" ${selectedGenre=="drama"?"selected":""}>Drama</option>
		                    <option value="comedy" ${selectedGenre=="comedy"?"selected":""}>Comedy</option>
			                <option value="sci-fi" ${selectedGenre=="sci-fi"?"selected":""}>Sci-Fi</option>
			                <option value="horror" ${selectedGenre=="horror"?"selected":""}>Horror</option>
			                <option value="biography" ${selectedGenre=="biography"?"selected":""}>Biography</option>
		                </select>
		                <span class="movie_select_arrow">
		                    <img src="${pageContext.request.contextPath}/assets/icons/arrowdown.svg" alt="Arrow Down" />
		                </span>
		            </div>
		            <div class="movie_select_wrapper">
		                <select class="movie_filter_select" name="status">
		                    <option value="all" ${selectedStatus=="all"|| empty selectedStatus?"selected":""}>All</option>
		                    <option value="NOW_SHOWING" ${selectedStatus=="NOW_SHOWING"?"selected":""}>Now Showing</option>
		                    <option value="COMING_SOON" ${selectedStatus=="COMING_SOON"?"selected":""}>Coming Soon</option>
		                </select>
		                <span class="movie_select_arrow">
		                    <img src="${pageContext.request.contextPath}/assets/icons/arrowdown.svg" alt="Arrow Down" />
		                </span>
		            </div>
		             <div class="movie_select_wrapper">
		            <button type="submit" class="movie_filter_pill">APPLY</button>
		            </div>
		        </div>
			<%-- Radio button for movie filter selection 
		        <div class="movie_status_pill_group">
				    <input type="radio" name="status" id="all" value="all" class="pill_radio" ${selectedStatus=="all" || empty selectedStatus ?"checked":""}>
				    <label for="all" class="movie_filter_pill">All</label>
				
				    <input type="radio" name="status" id="showing" value="NOW_SHOWING" class="pill_radio" ${selectedStatus=="NOW_SHOWING"?"checked":""}>
				    <label for="showing" class="movie_filter_pill">Now Showing</label>
				
				    <input type="radio" name="status" id="soon" value="COMING_SOON"class="pill_radio" ${selectedStatus=="COMING_SOON"?"checked":""}>
				    <label for="soon" class="movie_filter_pill">Coming Soon</label>
				    <button type="submit" class="movie_filter_pill">APPLY</button>
				</div>
			--%>
				<c:if test="${not empty error}">
            			<div class="error_banner">
                		<p>${error}</p>
            			</div>
        		</c:if>
		    </div>
		    
		  </form>
		</section>
		<c:if test="${not empty filteredMovies}">

		<section class="movie_section">
			    <div class="movie_main_content_container">
			        <div class="movie_cards_presentation_grid">
			        <c:forEach var="movie" items="${filteredMovies}">
			         <c:choose>
			        <c:when test="${movie.movieStatus == 'NOW_SHOWING'}">
                                    <div class="movie_feature_film_card">
                                        <div class="movie_poster_visual_wrapper">
                                            <div class="movie_status_badge_group">
                                                <span class="movie_certification_badge">${movie.ageRating}</span>
                                            </div>                                       
                                            <img src="${pageContext.request.contextPath}/movieposter?name=${movie.movieId}"
                                                 alt="${movie.movieName} poster"
                                                 class="movie_poster_image_element"/>
                                        </div>
                                        <div class="movie_information_panel">
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
                                
			            </c:when>	            
		            <c:otherwise>
		            					<div class="movie_feature_film_card coming_soon_card">
                                        <div class="movie_release_header">
                                            <span class="release_date_text">${movie.releaseDate}</span>
                                        </div>
                                        <div class="movie_poster_visual_wrapper">
                                            <div class="movie_status_badge_group">
                                                <span class="movie_certification_badge">${movie.ageRating}</span>
                                            </div>
                                            <img src = "${pageContext.request.contextPath}/movieposter?name=${movie.movieId}"
                                                 alt="${movie.movieName} poster"
                                                 class="movie_poster_image_element"/>
                                        </div>
                                        <div class="movie_information_panel">
                                            <h3 class="movie_title">${movie.movieName}</h3>
                                            <p class="movie_description">
                                                ${movie.movieLanguage} | ${movie.genre}
                                                <span>${movie.duration} min</span>
                                            </p>
                                            <div class="movie_action_button_bar">
                                                <button class="movie_booking_primary_button" href="${pageContext.request.contextPath}/notif>">
                                                    Notify me
                                                </button>
                                               <a href='${pageContext.request.contextPath}/movie-detail?movieId=${movie.movieId}'>
                                                <div class="movie_quick_view_icon_wrapper">
                                                    <img src="${pageContext.request.contextPath}/assets/icons/info.svg" alt="Info" />
                                                </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
		                </c:otherwise>

		
		</c:choose>
		</c:forEach>
			</div>		
		    </div>
		</section>
		</c:if>
		<c:if test="${empty filteredMovies && empty error}">
            <section class="movie_section">
                <div class="movie_main_content_container">
                    <p class="movie_description" style="color:red;font-size:1rem;">No movies match your current filters</p>
                </div>
            </section>
        </c:if>    
	</main>
    <jsp:include page="../components/footer.jsp" />

</body>

</html>