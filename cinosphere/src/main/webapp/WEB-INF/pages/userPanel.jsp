<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User | CinoSphere</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
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
	                            <img src="${pageContext.request.contextPath}/icon?name=dashboard" alt="Dashboard" />
	                        </span>
	                    </div>
	                    <span class="sidebar_nav_label">Dashboard</span>
	                </a>
	                
	              
	                <span class="sidebar_section_label">Account</span>
	                <a href="${pageContext.request.contextPath}/updateprofile?view=profile" 
               		class="sidebar_nav_item ${param.view eq 'profile' ? 'active' : ''}">
	                    <div class="sidebar_icon_box">
	                        <span class="movie_select_arrow">
	                            <img src="${pageContext.request.contextPath}/icon?name=user" alt="Profile" />
	                        </span>
	                    </div>
	                    <span class="sidebar_nav_label">Profile Settings</span>
	                </a>
	            </nav>
	
	           <div class="sidebar_footer">
				    <div class="footer_divider"></div>
				    
				    
				    <div class="sidebar_user_profile">
				        <div class="user_avatar_circle" style="overflow: hidden;">
				        	<img id="imagePreview" style="width: 100%;height: 100%;object-fit: cover;display: block;" src="${pageContext.request.contextPath}/profileimage?name=${user.userId}" alt="Preview"> 
				        </div>
				        <div class="user_info_stack">
				            <span class="user_name">${user.firstName}</span>
				            <span class="membership_tier">${membership.membershipType}</span>
				        </div>
				    </div>			 
				</div>
	        </div>
	    </aside>
	
	    
	    <main class="dashboard_main_panel">
	        <section class="hero_overlay_section">
	            <div class="hero_radial_bg"></div>
	            
	            <div class="hero_content_inner">
	                <div class="hero_flex_layout">
	                    <div class="greeting_text_block">
	                        <h2 class="greeting_primary">Welcome back, <em>${user.firstName}</em></h2>
	                        <p class="greeting_secondary">
	                           <fmt:formatDate value="<%= new java.util.Date() %>" pattern="d MMM yyyy, EEEE" />
	                        </p>
	                    </div>
	
	                    <div class="hero_action_cluster">
	                        <div class="notification_wrapper">
	                            <span class="notification_icon">
	                                <img src="${pageContext.request.contextPath}/icon?name=bell" alt="Notifications" />
	                            </span>
	                        </div>
	                        <button class="hero_button_primary">Book Now</button>
	                    </div>
	                </div>
	            </div>
	        </section>
	
	
			<div class="dashboard_scroll_area">
			    <div class="stats-row">
			        <div class="stat-card">
			            <span class="stat-num">${totalBookings==null?'0':totalBookings}</span>
			            <span class="stat-label">Total Bookings</span>
			            <span class="stat-delta">↑ 3 this month</span>
			        </div>
			        
			        <div class="stat-card">
			            <span class="stat-num" style="color: var(--gold)">${membership.totalLoyaltyPoints}</span>
			            <span class="stat-label">Sphere Points</span>
			            <span class="stat-delta">↑ 200 pts earned</span>
			        </div>
			        
			        <div class="stat-card">
			            <span class="stat-num" style="color: var(--crimson-bright)">TODO</span>
			            <span class="stat-label">Upcoming Bookings</span>
			            <span class="stat-delta">Next: Apr 14</span>
			        </div>
			        
			        <div class="stat-card">
			            <span class="stat-num">TODO</span>
			            <span class="stat-label">Welcome Credit</span>
			            <span class="stat-delta">Valid until Jun 2026</span>
			        </div>
			    </div>
			</div>
			
			
			<section class="booking-membership-grid">
			
				<div class="booking-column">
					<div class="panel-glass">
						<div class="section-title">Upcoming Bookings <a href="#">View all →</a></div>
						
						<div class="booking-row">
							<div class="booking-poster">
							  <img src="${pageContext.request.contextPath}/movieposter?name=2"
							       alt="Michael"
							       class="booking-poster-image" />
							</div>
				        		<div class="booking-info">
				          		<div class="booking-movie">Michael</div>
				          		<div class="booking-meta">Apr 30, 2026 · 7:30 PM</div>
				          		<div class="booking-meta">Kathmandu · Hall A · Seats D4, D5</div>
			        		</div>
			        		
			        		<div class="booking-status">
					          <span class="status-pill status-confirmed">Confirmed</span>
					          <span class="seat-label">2 seats</span>
					        </div>
			      		</div>
			      		
			      		<div class="booking-row">
							<div class="booking-poster">
							  <img src="${pageContext.request.contextPath}/movieposter?name=3"
							       alt="Michael"
							       class="booking-poster-image" />
							</div>
				        		<div class="booking-info">
				          		<div class="booking-movie">Bhoot Bangla</div>
				          		<div class="booking-meta">May 2, 2026 · 10:30 AM</div>
				          		<div class="booking-meta">Pokhara · Hall B · Seats I8, O5,I7</div>
			        		</div>
			        		
			        		<div class="booking-status">
					          <span class="status-pill status-upcoming">Waiting</span>
					          <span class="seat-label">3 seats</span>
					        </div>
			      		</div>
			      	</div>
			      </div>
			      
			      <div class="membership-column">
			      	<div class="membership-card">
			      		<span class="membership-tier">${membership.membershipType}</span>
			      		<div class="membership-name">${user.firstName} ${user.lastName}</div>
			      		<div class="membership-points-value">${membership.totalLoyaltyPoints}</div>
			      		<span class="membership-points-label">Points Available</span>
			      		
			      		<div class="membership-progress">
			      			<div class="membership-progress-label">
				          		<span>Progress to Elite</span>
				          		<span>${membership.totalLoyaltyPoints} / 3,000 pts</span>
			        		</div>
			        		<div class="membership-progress-bar">
			        			<div class="membership-progress-fill" style="width:${(membership.totalLoyaltyPoints*100)/3000}%"></div>
			        		</div>
			        	</div>
			        	
			    	</div>
			    </div>
			
			</section>
	    </main>
	</div>

     
	<jsp:include page="../components/footer.jsp" />
	
</body>
</html>
