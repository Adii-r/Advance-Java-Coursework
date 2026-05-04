<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Admin | CinoSphere</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminPanel.css">
</head>

<body>

    <jsp:include page="../components/header.jsp" />
    
    <div class="admin_layout_container">
	    <aside class="admin_sidebar_panel">
	        <div class="admin_sidebar_inner">
	            <nav class="admin_navigation_menu">
	                <span class="admin_navigation_label">
	                    Main Navigation
	                </span>
	                <a href="${pageContext.request.contextPath}/adminpanel"
	                   class="admin_navigation_item active">
	                    <div class="admin_navigation_icon_box">
	                        <img src="${pageContext.request.contextPath}/assets/icons/dashboard.svg"
	                             alt="Dashboard">
	                    </div>
	                    <span class="admin_navigation_text">
	                        Dashboard
	                    </span>
	                </a>
	            </nav>
	
	            <div class="admin_sidebar_footer">
	                <div class="admin_profile_card">
	                    <div class="admin_profile_avatar">
	                        <span>A</span>
	                    </div>
	                    <div class="admin_profile_details">
	                        <span class="admin_profile_name">
	                            ${user.firstName} ${user.lastName}
	                        </span>
	                        <span class="admin_profile_role">
	                            ${user.userRole}
	                        </span>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </aside>
	    
	    
	    <main class="admin_dashboard_panel">
	    
		    <section class="admin_dashboard_hero_section">
			    <div class="admin_dashboard_hero_background"></div>
			    <div class="admin_dashboard_hero_content">
			        <div class="admin_dashboard_hero_layout">
			            <div class="admin_dashboard_heading_block">
			                <h1 class="admin_dashboard_heading_title">Welcome,<em>${user.firstName}</em></h1>
			                <p class="admin_dashboard_heading_subtitle">
			                    <fmt:formatDate value="<%= new java.util.Date() %>" pattern="d MMM yyyy, EEEE" />
	                     
			                </p>
			            </div>
			            <div class="admin_dashboard_action_group">
			            	<div class="notification_wrapper">
	                            <span class="notification_icon">
	                                <img src="assets/icons/bell.svg" alt="Notifications" />
	                            </span>
	                        </div>
			                <button class="admin_dashboard_primary_button">Add Movie</button>
			            </div>
			        </div>
			    </div>
			</section>
			
			
			<section class="admin_metrics_section">
			    <div class="admin_metrics_grid">
			        <div class="admin_metric_card">
			            <span class="admin_metric_value admin_metric_gold">Rs 2.4L</span>
			            <span class="admin_metric_title">Revenue Today</span>
			            <span class="admin_metric_change">
			                ↑ 18% vs yesterday
			            </span>
			        </div>
			        <div class="admin_metric_card">
			            <span class="admin_metric_value admin_metric_green">
			                847
			            </span>
			            <span class="admin_metric_title">
			                Tickets Sold
			            </span>
			            <span class="admin_metric_change">
			                ↑ 124 vs avg
			            </span>
			        </div>
			
			        <div class="admin_metric_card">
			            <span class="admin_metric_value admin_metric_gold">
			                34
			            </span>
			            <span class="admin_metric_title">
			                New Members
			            </span>
			            <span class="admin_metric_change">
			                ↑ 8 vs yesterday
			            </span>
			        </div>
			        <div class="admin_metric_card">
			            <span class="admin_metric_value admin_metric_red">3</span>
			            <span class="admin_metric_title">
			                Pending Issues
			            </span>
			            <span class="admin_metric_change admin_metric_negative">↑ 2 new today</span>
			        </div>
			    </div>
			</section>
			
			
			<section class="admin_movie_management_section">
			    <div class="admin_panel_card">
			        <div class="admin_panel_header">
			            <h3 class="admin_panel_title">Movie Management</h3>
			            <div class="admin_panel_actions">
			                <div class="admin_search_wrapper">
			                    <img src="${pageContext.request.contextPath}/assets/icons/search.svg"
			                         alt="Search"
			                         class="admin_search_icon" />
			                    <input type="text"
			                           class="admin_search_input"
			                           placeholder="Search movies..." />
			                </div>
			                <button class="admin_add_movie_button">
			                    <img src="${pageContext.request.contextPath}/assets/icons/plus.svg"
			                         alt="Add" />
			                    Add Movie
			                </button>
			            </div>
			        </div>
			        <div class="admin_movie_tabs">
			            <button class="admin_movie_tab active">All</button>
			            <button class="admin_movie_tab">Showing</button>
			            <button class="admin_movie_tab">Upcoming</button>
			            <button class="admin_movie_tab">Archived</button>
			        </div>
			        <div class="admin_movie_table_wrapper">
			            <table class="admin_movie_table">
			                <thead>
			                    <tr>
			                        <th>Film</th>
			                        <th>Format</th>
			                        <th>Rating</th>
			                        <th>Status</th>
			                        <th>Actions</th>
			                    </tr>
			                </thead>
			                <tbody>
			                    <tr>
			                        <td>
			                            <div class="admin_movie_info">
			                                <div class="admin_movie_poster">
			                                    <img src="${pageContext.request.contextPath}/assets/posters/2.jpg"
			                                         alt="Michael"
			                                         class="admin_movie_poster_image" />
			                                </div>
			                                <span class="admin_movie_name">
			                                    Michael
			                                </span>
			                            </div>
			                        </td>
			                        <td>IMAX</td>
			                        <td>⭐ 9.1</td>
			                        <td>
			                            <span class="status-pill status-confirmed">
			                                Showing
			                            </span>
			                        </td>
			                        <td>
			                            <div class="admin_movie_action_group">
			                                <button class="admin_action_button edit">
			                                    <img src="${pageContext.request.contextPath}/assets/icons/edit.svg"
			                                         alt="Edit" />
			                                </button>
			                                <button class="admin_action_button delete">
			                                    <img src="${pageContext.request.contextPath}/assets/icons/delete.svg"
			                                         alt="Delete" />
			                                </button>
			                            </div>
			                        </td>
			                    </tr>
			                    <tr>
			                        <td>
			                            <div class="admin_movie_info">
			                                <div class="admin_movie_poster">
			                                    <img src="${pageContext.request.contextPath}/assets/posters/3.jpg"
			                                         alt="Bhoot Bangla"
			                                         class="admin_movie_poster_image" />
			                                </div>
			                                <span class="admin_movie_name">
			                                    Bhoot Bangla
			                                </span>
			                            </div>
			                        </td>
			                        <td>IMAX</td>
			                        <td>⭐ 9.4</td>
			                        <td>
			                            <span class="status-pill status-confirmed">
			                                Showing
			                            </span>
			                        </td>
			                        <td>
			                            <div class="admin_movie_action_group">
			                                <button class="admin_action_button edit">
			                                    <img src="${pageContext.request.contextPath}/assets/icons/edit.svg"
			                                         alt="Edit" />
			                                </button>
			                                <button class="admin_action_button delete">
			                                    <img src="${pageContext.request.contextPath}/assets/icons/delete.svg"
			                                         alt="Delete" />
			                                </button>
			                            </div>
			                        </td>
			                    </tr>
			                    <tr>
			                        <td>
			                            <div class="admin_movie_info">
			                                <div class="admin_movie_poster">
			                                    <img src="${pageContext.request.contextPath}/assets/posters/4.jpg"
			                                         alt="Project Hail Mary"
			                                         class="admin_movie_poster_image" />
			                                </div>
			                                <span class="admin_movie_name">
			                                    Project Hail Mary
			                                </span>
			                            </div>
			                        </td>
			                        <td>IMAX 3D</td>
			                        <td>⭐ 8.7</td>
			                        <td>
			                            <span class="status-pill status-upcoming">
			                                Upcoming
			                            </span>
			                        </td>
			                        <td>
			                            <div class="admin_movie_action_group">
			                                <button class="admin_action_button edit">
			                                    <img src="${pageContext.request.contextPath}/assets/icons/edit.svg"
			                                         alt="Edit" />
			                                </button>
			                                <button class="admin_action_button delete">
			                                    <img src="${pageContext.request.contextPath}/assets/icons/delete.svg"
			                                         alt="Delete" />
			                                </button>
			                            </div>
			                        </td>
			                    </tr>
			                    <tr>
			                        <td>
			                            <div class="admin_movie_info">
			                                <div class="admin_movie_poster">
			                                    <img src="${pageContext.request.contextPath}/assets/posters/6.jpg"
			                                         alt="Spider Man: Brand New Day"
			                                         class="admin_movie_poster_image" />
			                                </div>
			                                <span class="admin_movie_name">
			                                    Spider Man: Brand New Day
			                                </span>
			                            </div>
			                        </td>
			                        <td>Dolby Cinema</td>
			                        <td>⭐ 9.8</td>
			                        <td>
			                            <span class="status-pill status-upcoming">
			                                Upcoming
			                            </span>
			                        </td>
			                        <td>
			                            <div class="admin_movie_action_group">
			                                <button class="admin_action_button edit">
			                                    <img src="${pageContext.request.contextPath}/assets/icons/edit.svg"
			                                         alt="Edit" />
			                                </button>
			                                <button class="admin_action_button delete">
			                                    <img src="${pageContext.request.contextPath}/assets/icons/delete.svg"
			                                         alt="Delete" />
			                                </button>
			                            </div>
			                        </td>
			                    </tr>
			                </tbody>
			            </table>
			        </div>
			    </div>
			</section>
			
			<section class="admin_user_management_section">

			    <div class="admin_panel_card">
			        <div class="admin_panel_header">
			            <h3 class="admin_panel_title">
			                User Management
			            </h3>
			            <div class="admin_panel_actions">
			                <div class="admin_search_wrapper">
			                    <img src="${pageContext.request.contextPath}/assets/icons/search.svg"
			                         alt="Search"
			                         class="admin_search_icon" />
			                    <input type="text"
			                           class="admin_search_input"
			                           placeholder="Search users..." />
			                </div>
			                <button class="admin_add_user_button">
			                    <img src="${pageContext.request.contextPath}/assets/icons/plus.svg"
			                         alt="Add" />
			                    Add User
			                </button>
			            </div>
			        </div>
			        <div class="admin_movie_tabs">
			            <button class="admin_movie_tab active">All Users</button>
			            <button class="admin_movie_tab">Starter</button>
			            <button class="admin_movie_tab">Plus</button>
			            <button class="admin_movie_tab">Elite</button>
			            <button class="admin_movie_tab">Flagged</button>
			        </div>
			
			        <div class="admin_movie_table_wrapper">
			            <table class="admin_movie_table">
			                <thead>
			                    <tr>
			                        <th>Name</th>
			                        <th>Email</th>
			                        <th>Tier</th>
			                        <th>Bookings</th>
			                        <th>Points</th>
			                        <th>Status</th>
			                        <th>Toggle</th>
			                        <th>Actions</th>
			                    </tr>
			                </thead>
			                <tbody>
			                    <tr>
			                        <td>
			                            <div class="admin_user_identity">
			                                <div class="admin_user_avatar">
			                                    SS
			                                </div>
			
			                                <span class="admin_user_name">
			                                    Shimran Shrestha
			                                </span>
			                            </div>
			                        </td>
			                        <td>shimran@email.com</td>
			                        <td>
			                            <span class="admin_tier_badge elite">
			                                Elite
			                            </span>
			                        </td>
			                        <td>12</td>
			                        <td>2,240</td>
			                        <td>
			                            <span class="status-pill status-confirmed">
			                                Active
			                            </span>
			                        </td>
			                        <td>
			                            <label class="admin_status_toggle">
			                                <input type="checkbox" checked />
			                                <span class="admin_toggle_slider"></span>
			                            </label>
			                        </td>
			                        <td>
			                            <div class="admin_movie_action_group">
			                                <button class="admin_action_button edit">
			                                    <img src="${pageContext.request.contextPath}/assets/icons/edit.svg"
			                                         alt="Edit" />
			                                </button>
			                                <button class="admin_action_button delete">
			                                    <img src="${pageContext.request.contextPath}/assets/icons/delete.svg"
			                                         alt="Delete" />
			                                </button>
			                            </div>
			                        </td>
			                    </tr>
			                    <tr>
			                        <td>
			                            <div class="admin_user_identity">
			                                <div class="admin_user_avatar elite">
			                                    ML
			                                </div>
			                                <span class="admin_user_name">
			                                    Milan Lama
			                                </span>
			                            </div>
			                        </td>
			                        <td>milan@email.com</td>
			                        <td>
			                            <span class="admin_tier_badge elite">
			                                Elite
			                            </span>
			                        </td>
			                        <td>28</td>
			                        <td>4,800</td>
			                        <td>
			                            <span class="status-pill status-confirmed">
			                                Active
			                            </span>
			                        </td>
			                        <td>
			                            <label class="admin_status_toggle">
			                                <input type="checkbox" checked />
			                                <span class="admin_toggle_slider"></span>
			                            </label>
			                        </td>
			                        <td>
			                            <div class="admin_movie_action_group">
			                                <button class="admin_action_button edit">
			                                    <img src="${pageContext.request.contextPath}/assets/icons/edit.svg"
			                                         alt="Edit" />
			                                </button>
			                                <button class="admin_action_button delete">
			                                    <img src="${pageContext.request.contextPath}/assets/icons/delete.svg"
			                                         alt="Delete" />
			                                </button>
			                            </div>
			                        </td>
			                    </tr>
			                    <tr>
			                        <td>
			                            <div class="admin_user_identity">
			                                <div class="admin_user_avatar starter">
			                                    SS
			                                </div>
			                                <span class="admin_user_name">
			                                    Sabal Sharma
			                                </span>
			                            </div>
			                        </td>
			                        <td>sabal@email.com</td>
			                        <td>
			                            <span class="admin_tier_badge starter">
			                                Starter
			                            </span>
			                        </td>
			                        <td>4</td>
			                        <td>320</td>
			                        <td>
			                            <span class="status-pill status-past suspended-status">
			                                Inactive
			                            </span>
			                        </td>
			                        <td>
			                            <label class="admin_status_toggle">
			                                <input type="checkbox" />
			                                <span class="admin_toggle_slider"></span>
			                            </label>
			                        </td>
			                        <td>
			                            <div class="admin_movie_action_group">
			                                <button class="admin_action_button edit">
			                                    <img src="${pageContext.request.contextPath}/assets/icons/edit.svg"
			                                         alt="Edit" />
			                                </button>
			                                <button class="admin_action_button delete">
			                                    <img src="${pageContext.request.contextPath}/assets/icons/delete.svg"
			                                         alt="Delete" />
			                                </button>
			                            </div>
			                        </td>
			                    </tr>
			                </tbody>
			            </table>
			        </div>
			    </div>
			</section>
	    </main>
	</div>
    

    <jsp:include page="../components/footer.jsp" />

</body>

</html>