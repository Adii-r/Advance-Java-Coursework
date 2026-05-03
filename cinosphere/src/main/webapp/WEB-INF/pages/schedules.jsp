<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Schedules| CinoSphere</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/movies.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/schedules.css">
</head>

<body>

    <jsp:include page="../components/header.jsp" />
    
    <main class="schedules_screen"> 
    
	    <section class="hero_schedules_section">	
	        <div class="schedules_overlay"></div>
	        
	        <div class="schedules_container">
	            <div class="hero_text">
	                <h1 class="primary_title">What's <em>Showing</em></h1>
	                <p class="subtitle">Explore available screenings and book the show that fits your time, language, and favourite cinema..</p>
	            </div>
	        </div>
	    </section>
	    
	    <section class="movie_filter_section">
		    <div class="movie_filter_container">
		        
		        <div class="movie_search_wrapper">
		            <span class="movie_search_icon_container">
		                <img src="${pageContext.request.contextPath}/assets/icons/search.svg" alt="Search" />
		            </span>
		            <input type="text" placeholder="Search movies, genres, languages..." id="movieSearch" class="movie_search_input">
		        </div>
		
		        <div class="movie_filter_dropdown_group">
		            <div class="movie_select_wrapper">
		                <select class="movie_filter_select" id="langFilter">
		                    <option value="">All Languages</option>
		                    <option value="english">English</option>
		                    <option value="hindi">Hindi</option>
		                    <option value="nepali">Nepali</option>
		                </select>
		                <span class="movie_select_arrow">
		                    <img src="${pageContext.request.contextPath}/assets/icons/arrowdown.svg" alt="Arrow Down" />
		                </span>
		            </div>
		
		            <div class="movie_select_wrapper">
		                <select class="movie_filter_select" id="genreFilter">
		                    <option value="">All Genres</option>
		                    <option value="action">Action</option>
		                    <option value="drama">Drama</option>
		                    <option value="comedy">Comedy</option>
			                <option value="sci-fi">Sci-Fi</option>
			                <option value="horror">Horror</option>
			                <option value="biography">Biography</option>
		                </select>
		                <span class="movie_select_arrow">
		                    <img src="${pageContext.request.contextPath}/assets/icons/arrowdown.svg" alt="Arrow Down" />
		                </span>
		            </div>
		
		            <div class="movie_select_wrapper">
		                <select class="movie_filter_select" id="formatFilter">
		                    <option value="">All Formats</option>
		                    <option value="imax">IMAX</option>
		                    <option value="standard">Standard</option>
			                <option value="imax 3d">IMAX 3D</option>
		                </select>
		                <span class="movie_select_arrow">
		                    <img src="${pageContext.request.contextPath}/assets/icons/arrowdown.svg" alt="Arrow Down" />
		                </span>
		            </div>
		        </div>
		
		        <div class="movie_status_pill_group">
				    <input type="radio" name="status" id="all" class="pill_radio" checked>
				    <label for="all" class="movie_filter_pill">All</label>
				
				    <input type="radio" name="status" id="showing" class="pill_radio">
				    <label for="showing" class="movie_filter_pill">Now Showing</label>
				
				    <input type="radio" name="status" id="soon" class="pill_radio">
				    <label for="soon" class="movie_filter_pill">Coming Soon</label>
				</div>
		
		    </div>
		</section>
			    
	</main>
    <jsp:include page="../components/footer.jsp" />

</body>

</html>