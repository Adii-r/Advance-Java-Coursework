<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile | CinoSphere</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/updateProfile.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userPanel.css">
</head>

<body>

	<jsp:include page="../components/header.jsp" />
	
	<div class="panel_layout_wrapper">
	    <aside class="dashboard_sidebar">
	        <div class="sidebar_nav_container">
	            <nav class="sidebar_nav_menu">
	                <span class="sidebar_section_label">Main</span>
	                <a href="${pageContext.request.contextPath}/userpanel" 
               		class="sidebar_nav_item ${(empty param.view or param.view eq 'dashboard') ? 'active' : ''}">
	                    <div class="sidebar_icon_box">
	                        <span class="movie_select_arrow">
	                            <img src="assets/icons/dashboard.svg" alt="Dashboard" />
	                        </span>
	                    </div>
	                    <span class="sidebar_nav_label">Dashboard</span>
	                </a>
	                
	              
	                <span class="sidebar_section_label">Account</span>
	                <a href="${pageContext.request.contextPath}/updateprofile?view=profile" 
               		class="sidebar_nav_item ${param.view eq 'profile' ? 'active' : ''}">
	                    <div class="sidebar_icon_box">
	                        <span class="movie_select_arrow">
	                            <img src="assets/icons/user.svg" alt="Profile" />
	                        </span>
	                    </div>
	                    <span class="sidebar_nav_label">Profile Settings</span>
	                </a>
	            </nav>
	
	           <div class="sidebar_footer">
				    <div class="footer_divider"></div>
				    
				    
				    <div class="sidebar_user_profile">
				        <div class="user_avatar_circle">
				        	<span>AR</span> 
				        </div>
				        <div class="user_info_stack">
				            <span class="user_name">Aditya Raut</span>
				            <span class="membership_tier">Sphere Plus</span>
				        </div>
				    </div>			 
				</div>
	        </div>
	    </aside>
	 </div>
	
	    
	    
	    <main class="profile_main_panel">

   
		    <section class="profile_hero_section">
		        <div class="profile_hero_background"></div>
		
		        <div class="profile_hero_content">
		            <div class="profile_hero_layout">
		
		                <div class="profile_heading_block">
		                    <h2 class="profile_heading_title">
		                        Manage your <em>Profile</em>
		                    </h2>
		
		                    <p class="profile_heading_subtitle">
		                        Update your personal details, preferences and account information
		                    </p>
		                </div>
		
		                <div class="profile_hero_actions">
		                    <button class="profile_primary_button">
		                        Save Changes
		                    </button>
		                </div>
		
		            </div>
		        </div>
		    </section>
		  </main>
	

     
	<jsp:include page="../components/footer.jsp" />
	
</body>
</html>
