<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Movie | CinoSphere</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminPanel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/updateMovie.css">
</head>

<body>

    <c:set var="currentAdminPage" value="updatemovie" scope="request" />

    <jsp:include page="../components/header.jsp" />

    <div class="admin_layout_container">
        <aside class="admin_sidebar_panel">
            <div class="admin_sidebar_inner">
                <nav class="admin_navigation_menu">    
	               <div class="admin_menu_group">
				        <span class="admin_navigation_label"> Main </span> 
				        <a href="${pageContext.request.contextPath}/admin"
				           class="admin_navigation_item ${currentAdminPage eq 'dashboard' ? 'active' : ''}">
				            <div class="admin_navigation_icon_box">
				                <img src="${pageContext.request.contextPath}/icon?name=dashboard" alt="Dashboard">
				            </div> 
				            <span class="admin_navigation_text"> Dashboard </span>
				        </a>
				    </div>
				    
				    <div class="admin_menu_group">
				        <span class="admin_navigation_label"> Actions </span> 
				        <a href="${pageContext.request.contextPath}/updatemovie"
				           class="admin_navigation_item ${currentAdminPage eq 'updatemovie' ? 'active' : ''}">
				            <div class="admin_navigation_icon_box">
				                <img src="${pageContext.request.contextPath}/icon?name=monitor" alt="Actions">
				            </div> 
				            <span class="admin_navigation_text"> Movies </span>
				        </a>
				    </div>
                </nav>
            </div>
        </aside>

  
        <main class="admin_dashboard_panel">

            <section class="admin_dashboard_hero_section">
                <div class="admin_dashboard_hero_background"></div>
                <div class="admin_dashboard_hero_content">
                    <div class="admin_dashboard_hero_layout">
                        <div class="admin_dashboard_heading_block">
                            <h1 class="admin_dashboard_heading_title">
                                Modify <em>Movies</em>
                            </h1>
                            <p class="update_movie_heading_subtitle">
                                Modify active listings, adjust release metadata status, age validation parameters, and artwork.
                            </p>
                        </div>
                    </div>
                </div>
            </section>

        
            <c:if test="${not empty error}">
                <jsp:include page="../components/errorBox.jsp">
                    <jsp:param name="errorMessage" value="${error}" />
                </jsp:include>
            </c:if>
            
            <div class="admin_movie_content_wrapper">
	            <form action="${pageContext.request.contextPath}/admin/updatemovie" method="POST" enctype="multipart/form-data" class="admin_workspace_form">
	                <div class="admin_workspace_card">
	                    <div class="admin_card_header">
	                        <span class="admin_card_eyebrow">Manage Movies</span>
	                        <h2 class="admin_card_heading">Flim <em>Configuration</em></h2>
	                    </div>
	                 
	                        <div class="admin_form_layout_grid">
	                        	<div class="admin_avatar_upload_pane">
	                                <label class="admin_field_label_av">Movie Poster</label>
	                                <div class="admin_avatar_poster_wrapper">
	                                    <label for="poster_file_input" class="admin_avatar_circle_frame">
	                                        <img id="poster_view_element" 
	                                             src="${pageContext.request.contextPath}/movieposter?name=${movie.movieId}" alt="${movie.movieName} poster"/>
	                                        <div class="admin_avatar_hover_overlay">
	                                            <span>Select File</span>
	                                        </div>
	                                    </label>
	                                    <input type="file" id="poster_file_input" name="moviePoster" accept="image/*" class="admin_hidden_file_input" />
	                                </div>
	                            </div>
	                            
	                            <div class="admin_fields_entry_pane">
	                                <div class="form_single_row">
	                                    <div class="admin_field_group">
	                                        <label class="admin_field_label" for="movie_title">Movie Title *</label>
	                                        <input type="text" id="movie_title" name="movieTitle" class="admin_form_input" placeholder="e.g. Raja Shivaji" value="${movie.movieName}" required />
	                                    </div>
	                                </div>
	                                
	                                
	                                <div class="form_grid_3">
	                                    <div class="admin_field_group">
	                                        <label class="admin_field_label" for="movie_lang">Language *</label>
	                                        <select id="movie_lang" name="movieLanguage" class="admin_form_select" required>
	                                            <option value="">Select</option>
	                                            <option ${movie.movielanguage == 'Hindi' ? 'selected' : ''}>Hindi</option>
	                                            <option ${movie.movielanguage == 'English' ? 'selected' : ''}>English</option>
	    
	                                        </select>
	                                    </div>
	                                    <div class="admin_field_group">
	                                        <label class="admin_field_label" for="movie_genre">Genre *</label>
	                                        <input type="text" id="movie_genre" name="movieGenre" class="admin_form_input" placeholder="Action, Drama, Sci-Fi" value="${movie.genre}" required />
	                                    </div>
	                                    <div class="admin_field_group">
	                                        <label class="admin_field_label" for="movie_duration">Duration (min) *</label>
	                                        <input type="number" id="movie_duration" name="movieDuration" class="admin_form_input" placeholder="148" min="1" value="${movie.duration}" required />
	                                    </div>
	                                </div>
	                                
	                                <div class="form_grid_2">
	                                    <div class="admin_field_group">
	                                        <label class="admin_field_label" for="movie_cert">Certificate *</label>
	                                        <select id="movie_cert" name="movieCertificate" class="admin_form_select" required>
	                                            <option value="">Select</option>
	                                            <option ${movie.ageRating == 'PG' ? 'selected' : ''}>PG</option>
	                                            <option ${movie.ageRating == 'A' ? 'selected' : ''}>A</option>
	
	                                        </select>
	                                    </div>
	                                    <div class="admin_field_group">
	                                        <label class="admin_field_label" for="movie_status">Status *</label>
	                                        <select id="movie_status" name="movieStatus" class="admin_form_select" required>
	                                            <option value="">Select</option>
	                                            <option value="NOW_SHOWING" ${movie.movieStatus == 'NOW_SHOWING' ? 'selected' : ''}>Showing</option>
	                                            <option value="COMING_SOON" ${movie.movieStatus == 'COMING_SOON' ? 'selected' : ''}>Upcoming</option>
	                                            <option value="ARCHIVED" ${movie.movieStatus == 'ARCHIVED' ? 'selected' : ''}>Archived</option>
	                                        </select>
	                                    </div>
	                                  </div>
	                                    
										<div class="form_grid_2 form_row_spacer">
										    <div class="admin_fields_stacked_column">
										        <div class="admin_field_group">
										            <label class="admin_field_label" for="movie_director">Director *</label>
										            <input type="text" id="movie_director" name="movieDirector" class="admin_form_input" placeholder="Director name" value="${movie.director}" required />
										        </div>
										        
										        <div class="admin_field_group">
										            <label class="admin_field_label" for="movie_release">Release Date *</label>
										            <input type="date" id="movie_release" name="movieReleaseDate" class="admin_form_input" value="${movie.releaseDate}" required />
										        </div>
										    </div>	
										    
										    <div class="admin_field_group structural_textarea_fill">
										        <label class="admin_field_label" for="movie_desc">Description *</label>
										        <textarea id="movie_desc" name="movieDescription" class="admin_form_textarea execution_fill" placeholder="Write a compelling 2-3 sentence synopsis of the film..." required>${movie.description}</textarea>
										    </div>
										</div>
	         
	                            </div>
	                        </div>
	                    </div>
	                                    
	       
	                    <div class="admin_workspace_card">
	                        <div class="admin_card_header">
	                            <span class="admin_card_eyebrow">Timings & Venues</span>
	                            <h2 class="admin_card_heading">Showtimes & <em>Schedules</em></h2>
	                        </div>
	
	                        <div class="admin_schedule_matrix_block">
	                            <div class="schedule_header_grid">
	                                <span class="schedule_grid_header_title">Hall</span>
	                                <span class="schedule_grid_header_title">Date</span>
	                                <span class="schedule_grid_header_title">Time</span>
	                                <span class="schedule_grid_header_title">Location</span>
	                                <span></span>
	                            </div>
	
	                           
	                            <div class="schedule_add_row">
	                                <select name="scheduleHall" class="admin_form_select">
	                                    <option value="">Select Hall</option>
	                                    <option>IMAX Luxury</option>
	                                    <option>Auditorium 1</option>
	                                </select>
	                                <input type="date" name="scheduleDate" class="admin_form_input">
	                                <input type="time" name="scheduleTime" class="admin_form_input">
	                                <select name="scheduleLocation" class="admin_form_select">
	                                    <option value="">Select Location</option>
	                                    <option>Kathmandu</option>
	                                    <option>Pokhara</option>
	                                </select>
	                                <button type="button" class="remove_button">
        								<img src="${pageContext.request.contextPath}/icon?name=delete" alt="del" class="admin_button_icon">
   									</button>
	                            </div>
	
	                            
	                            <button type="button" class="add_button">
        							<img src="${pageContext.request.contextPath}/icon?name=plus" alt="add" class="admin_button_icon">
   								</button>
	                        </div>
	
	                        
	                        <div class="admin_location_segment_wrapper">
	                            <span class="admin_field_label">Available Locations</span>
	                            
	                            <div class="location_checkbox_flex_matrix">
	                                <label class="loc_check_label">
	                                    <input type="checkbox" name="movieLocations" value="Kathmandu" class="custom_location_checkbox" checked> 
	                                    <span class="checkbox_label_text">Kathmandu</span>
	                                </label>
	                                <label class="loc_check_label">
	                                    <input type="checkbox" name="movieLocations" value="Pokhara" class="custom_location_checkbox"> 
	                                    <span class="checkbox_label_text">Pokhara</span>
	                                </label>
	                                <label class="loc_check_label">
	                                    <input type="checkbox" name="movieLocations" value="Butwal" class="custom_location_checkbox"> 
	                                    <span class="checkbox_label_text">Butwal</span>
	                                </label>
	                            </div>
	                        </div>
	                    </div>
	                    
	                  
	                    <div class="admin_workspace_form_footer">
	                        <button type="button" class="button_model_secondary">Cancel</button>
	                        <button type="submit" class="button_model_primary">Save Modifications</button>
	                    </div>
	                </form>
            	</div>
        	</main>
   	 	</div>

    <jsp:include page="../components/footer.jsp" />

</body>
</html>