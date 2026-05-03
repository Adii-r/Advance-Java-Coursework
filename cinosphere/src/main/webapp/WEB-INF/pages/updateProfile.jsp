<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile | CinoSphere</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userPanel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/updateProfile.css">
    
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
	
	
		<main class="profile_main_panel"> 
		
			<section class="profile_hero_section">
			    <div class="profile_hero_bg"></div>
			
			    <div class="profile_hero_content">
			        <div class="profile_hero_flex">
			            
			            <div class="profile_heading_block">
			                <h2 class="profile_hero_title">
			                    Update <em>Profile</em>
			                </h2>
			
			                <p class="profile_hero_subtitle">
			                    Personalize your account details, privacy settings and membership preferences
			                </p>
			            </div>
			
			        </div>
			    </div>
			</section>
			
			<section class="update_profile_content_wrapper">

			    <div class="update_profile_overview_card">
			        <div class="update_profile_avatar_wrapper">
			            <div class="update_profile_avatar_circle">
			                AR
			                <label for="profileAvatarInput" class="update_profile_avatar_edit_btn">
			                    <img src="${pageContext.request.contextPath}/assets/icons/camera.svg"
			                         alt="Upload Avatar">
			                </label>
			            </div>
			            <input type="file" id="profileAvatarInput" class="update_profile_avatar_input" accept="image/*">
			        </div>
			        <div class="update_profile_user_details">
			            <h3 class="update_profile_user_name">
			                Aditya Raut
			            </h3>
			            <p class="update_profile_user_email">
			                aditya.raut@email.com
			            </p>
			            <div class="update_profile_badge_row">
			                <span class="update_profile_badge update_profile_badge_tier">
			                    Sphere Plus
			                </span>
			                <span class="update_profile_badge update_profile_badge_points">
			                    1,240 Points
			                </span>
			            </div>
			        </div>
			        <div class="update_profile_points_panel">
			            <div class="update_profile_points_value">
			                1,240
			            </div>
			            <div class="update_profile_points_label">
			                SPHERE POINTS
			            </div>
			            <div class="update_profile_progress_wrapper">
			                <div class="update_profile_progress_bar">
			                    <div class="update_profile_progress_fill"></div>
			                </div>
			                <div class="update_profile_progress_text">
			                    41% to Elite · 1,760 pts needed
			                </div>
			            </div>
			        </div>
			    </div>
			</section>
			
			<section class="update_profile_form_grid">
			
			    <div class="update_profile_form_card">
			        <div class="update_profile_card_title">
			            <img src="${pageContext.request.contextPath}/assets/icons/user.svg"
			                 alt="User Icon">
			            <span>Personal Information</span>
			        </div>
			        <div class="update_profile_name_row">
			            <div class="update_profile_input_group">
			                <label class="update_profile_input_label" for="userFirstName">
			                    First Name
			                </label>
			                <input type="text"
			                       id="userFirstName"
			                       class="update_profile_input_field"
			                       value="Aditya">
			            </div>
			            <div class="update_profile_input_group">
			                <label class="update_profile_input_label" for="userLastName">
			                    Last Name
			                </label>
			                <input type="text"
			                       id="userLastName"
			                       class="update_profile_input_field"
			                       value="Raut">
			            </div>
			        </div>
			
			        <div class="update_profile_input_group">
			            <label class="update_profile_input_label" for="userEmail">
			                Email Address
			            </label>
			            <div class="update_profile_input_group">
			                <input type="email"
			                       id="userEmail"
			                       class="update_profile_input_field"
			                       value="aditya.raut@email.com">
			            </div>
			        </div>
			
			        <div class="update_profile_input_group">
			            <label class="update_profile_input_label" for="userDob">
			                Date of Birth
			            </label>
			            <input type="date"
			                   id="userDob"
			                   class="update_profile_input_field"
			                   value="2003-01-15">
			        </div>
			
			    </div>
			    
			    <div class="update_profile_form_card">

				    <div class="update_profile_card_title">
				        <img src="${pageContext.request.contextPath}/assets/icons/lock.svg"
				             alt="Lock Icon">
				        <span>Change Password</span>
				    </div>
				
				    
				    <div class="update_profile_input_group">
				        <label class="update_profile_input_label" for="currentPassword">
				            Current Password
				        </label>
				
				        <div class="update_profile_input_wrapper">
				            <input type="password"
				                   id="currentPassword"
				                   class="update_profile_input_field">
				
				            <span class="update_profile_input_icon">
				                <img src="${pageContext.request.contextPath}/assets/icons/lock.svg"
				                     alt="Current Password Icon">
				            </span>
				        </div>
				    </div>
				
				   
				    <div class="update_profile_input_group">
				        <label class="update_profile_input_label" for="newPassword">
				            New Password
				        </label>
				
				        <div class="update_profile_input_wrapper">
				            <input type="password"
				                   id="newPassword"
				                   class="update_profile_input_field">
				
				            <span class="update_profile_input_icon">
				                <img src="${pageContext.request.contextPath}/assets/icons/edit.svg"
				                     alt="New Password Icon">
				            </span>
				        </div>
				    </div>
				
				   
				    <div class="update_profile_input_group">
				        <label class="update_profile_input_label" for="confirmPassword">
				            Confirm Password
				        </label>
				
				        <div class="update_profile_input_wrapper">
				            <input type="password"
				                   id="confirmPassword"
				                   class="update_profile_input_field">
				
				            <span class="update_profile_input_icon">
				                <img src="${pageContext.request.contextPath}/assets/icons/checkmark.svg"
				                     alt="Confirm Password Icon">
				            </span>
				        </div>
				    </div>
				
				    <button class="update_profile_button_primary">
				        Update Password
				    </button>
				
				</div>
			</section>
			
		
			<section class="update_profile_danger_wrapper">
			    <div class="update_profile_form_card danger_outer_card">
			        
			        
			        <div class="update_profile_danger_zone_box">
			            <div class="update_profile_danger_header">
			                <img src="${pageContext.request.contextPath}/assets/icons/warning.svg" alt="Warning">
			                <span>Danger Zone</span>
			            </div>
			
			           
			            <div class="update_profile_danger_row">
			                <div class="update_profile_danger_text">
			                    <div class="update_profile_danger_label">Deactivate Account</div>
			                    <div class="update_profile_danger_desc">Temporarily disable your account. You can reactivate anytime by signing back in.</div>
			                </div>
			                <button class="update_profile_danger_btn_ghost">Deactivate</button>
			            </div>
			
			            
			            <div class="update_profile_danger_row">
			                <div class="update_profile_danger_text">
			                    <div class="update_profile_danger_label">Delete Account Permanently</div>
			                    <div class="update_profile_danger_desc">This will permanently delete all your data, bookings, and accumulated Sphere points.</div>
			                </div>
			                <button class="update_profile_danger_btn_solid">Delete Account</button>
			            </div>
			        </div>
			    </div>
			</section>

			<div class="update_profile_footer_actions">
			    <button class="update_profile_btn_ghost_cancel">Cancel</button>
			    <button class="update_profile_button_primary save_all_btn">
			        Save All Changes
			    </button>
			</div>
					
		</main>
 	</div>
	
     
	<jsp:include page="../components/footer.jsp" />
	
</body>
</html>
	