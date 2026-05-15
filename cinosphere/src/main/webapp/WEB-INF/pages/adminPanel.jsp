<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Admin | CinoSphere</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/adminPanel.css">
</head>

<body>

	<jsp:include page="../components/header.jsp" />

	<div class="admin_layout_container">
		<aside class="admin_sidebar_panel">
			<div class="admin_sidebar_inner">
				<nav class="admin_navigation_menu">
					<span class="admin_navigation_label"> Main Navigation </span> <a
						href="${pageContext.request.contextPath}/admin"
						class="admin_navigation_item active">
						<div class="admin_navigation_icon_box">
							<img
								src="${pageContext.request.contextPath}/assets/icons/dashboard.svg"
								alt="Dashboard">
						</div> <span class="admin_navigation_text"> Dashboard </span>
					</a>
				</nav>

				<div class="admin_sidebar_footer">
					<div class="admin_profile_card">
						<div class="admin_profile_avatar">
							<span><img id="imagePreview"
								src="${pageContext.request.contextPath}/profileimage?name=${user.userId}"
								alt="Preview"> </span>
						</div>
						<div class="admin_profile_details">
							<span class="admin_profile_name"> ${user.firstName}
								${user.lastName} </span> <span class="admin_profile_role">
								${user.userRole} </span>
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
							<h1 class="admin_dashboard_heading_title">
								Welcome,<em>${user.firstName}</em>
							</h1>
							<p class="admin_dashboard_heading_subtitle">
								<fmt:formatDate value="<%=new java.util.Date()%>"
									pattern="d MMM yyyy, EEEE" />

							</p>
						</div>
						<div class="admin_dashboard_action_group">
							<div class="notification_wrapper">
								<span class="notification_icon"> <img
									src="assets/icons/bell.svg" alt="Notifications" />
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
						<span class="admin_metric_title">Revenue Today</span> <span
							class="admin_metric_change"> ↑ 18% vs yesterday </span>
					</div>
					<div class="admin_metric_card">
						<span class="admin_metric_value admin_metric_green"> 847 </span> <span
							class="admin_metric_title"> Tickets Sold </span> <span
							class="admin_metric_change"> ↑ 124 vs avg </span>
					</div>

					<div class="admin_metric_card">
						<span class="admin_metric_value admin_metric_gold"> 34 </span> <span
							class="admin_metric_title"> New Members </span> <span
							class="admin_metric_change"> ↑ 8 vs yesterday </span>
					</div>
					<div class="admin_metric_card">
						<span class="admin_metric_value admin_metric_red">3</span> <span
							class="admin_metric_title"> Pending Issues </span> <span
							class="admin_metric_change admin_metric_negative">↑ 2 new
							today</span>
					</div>
				</div>
			</section>


			<section class="admin_movie_management_section">
				<div class="admin_panel_card">
					<div class="admin_panel_header">
						<h3 class="admin_panel_title">Movie Management</h3>
						<form action="${pageContext.request.contextPath}/admin"
							method="post">
							<div class="admin_panel_actions">
								<div class="admin_search_wrapper">
									<img
										src="${pageContext.request.contextPath}/assets/icons/search.svg"
										alt="Search" class="admin_search_icon" /> <input type="text"
										name="searchMovie" class="admin_search_input"
										placeholder="Search movies..." value="${searchmovie}"/>
								</div>
								<button class="admin_add_movie_button" type="submit">
									<img
										src="${pageContext.request.contextPath}/assets/icons/search.svg"
										alt="Search" />  Search
								</button>
							</div>
						</form>
					</div>
					<div class="admin_movie_tabs">
						<form action="${pageContext.request.contextPath}/admin"
							method="post" style="display: inline;">
							<input type="hidden" name="movieStatus" value="all">
							<button
								class="admin_movie_tab ${movieStatus=='all'||empty movieStatus?'active':''}"
								type="submit">All</button>
						</form>

						<form action="${pageContext.request.contextPath}/admin"
							method="post" style="display: inline;">
							<input type="hidden" name="movieStatus" value="NOW_SHOWING">
							<button
								class="admin_movie_tab ${movieStatus=='NOW_SHOWING'?'active':''}"
								type="submit">Showing</button>
						</form>

						<form action="${pageContext.request.contextPath}/admin"
							method="post" style="display: inline;">
							<input type="hidden" name="movieStatus" value="COMING_SOON">
							<button
								class="admin_movie_tab ${movieStatus=='COMING_SOON'?'active':''}"
								type="submit">Upcoming</button>
						</form>

						<form action="${pageContext.request.contextPath}/admin"
							method="post" style="display: inline;">
							<input type="hidden" name="movieStatus" value="ARCHIVED">
							<button
								class="admin_movie_tab ${movieStatus=='ARCHIVED'?'active':''}"
								type="submit">Archived</button>
						</form>
					</div>
					<div class="admin_movie_table_wrapper">
						<table class="admin_movie_table">
							<thead>
								<tr>
									<th>Film</th>
									<th>Duration</th>
									<th>Age Rating</th>
									<th>Status</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="movie" items="${filteredMovies}">
									<tr>
										<td>
											<div class="admin_movie_info">
												<div class="admin_movie_poster">
													<img
														src="${pageContext.request.contextPath}/assets/posters/${movie.movieId}.jpg"
														alt="Michael" class="admin_movie_poster_image" />
												</div>
												<span class="admin_movie_name"> ${movie.movieName} </span>
											</div>
										</td>
										<td>${movie.duration}</td>
										<td>${movie.ageRating}</td>
										<td><span
											class="status-pill ${movie.movieStatus=='NOW_SHOWING'?'status-confirmed': movie.movieStatus=='COMING_SOON'?'status-upcomming':'status-archived'}">
												${movie.movieStatus} </span></td>
										<td>
											<div class="admin_movie_action_group">
												<button class="admin_action_button edit">
													<img
														src="${pageContext.request.contextPath}/assets/icons/edit.svg"
														alt="Edit" />
												</button>
												<button class="admin_action_button delete">
													<img
														src="${pageContext.request.contextPath}/assets/icons/delete.svg"
														alt="Delete" />
												</button>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</section>

			<section class="admin_user_management_section">

				<div class="admin_panel_card">
					<div class="admin_panel_header">
						<h3 class="admin_panel_title">User Management</h3>
						<form action="${pageContext.request.contextPath}/admin"
							method="post">
							<div class="admin_panel_actions">

								<div class="admin_search_wrapper">
									<img
										src="${pageContext.request.contextPath}/assets/icons/search.svg"
										alt="Search" class="admin_search_icon" /> <input type="text"
										name="searchUser" class="admin_search_input"
										placeholder="Search users..." value="${searchUser }"/>
								</div>
								<button class="admin_add_movie_button" type="submit">
									<img
										src="${pageContext.request.contextPath}/assets/icons/search.svg"
										alt="Search" /> Search
								</button>

							</div>
						</form>
					</div>
					<div class="admin_movie_tabs">
						<form action="${pageContext.request.contextPath}/admin"
							method="post" style="display: inline;">
							<input type="hidden" name="userType" value="all">
							<button
								class="admin_movie_tab ${userType=='all'||empty userType?'active':''}"
								type="submit">All Users</button>
						</form>

						<form action="${pageContext.request.contextPath}/admin"
							method="post" style="display: inline;">
							<input type="hidden" name="userType" value="active">
							<button class="admin_movie_tab ${userType=='active'?'active':''}"
								type="submit">Active</button>
						</form>

						<form action="${pageContext.request.contextPath}/admin"
							method="post" style="display: inline;">
							<input type="hidden" name="userType" value="inactive">
							<button
								class="admin_movie_tab ${userType=='inactive'?'active':''}"
								type="submit">InActive</button>
						</form>
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

								<c:if test="${not empty userList}">
									<c:forEach var="user" items="${userList}">
										<c:set var="membership"
											value="${membershipList[userList.indexOf(user)]}" />
										<c:set var="booking"
											value="${bookingList[userList.indexOf(user)]}" />
										<tr>
											<td>
												<div class="admin_user_identity">
													<div class="admin_user_avatar">
														<img id="imagePreview"
															src="${pageContext.request.contextPath}/profileimage?name=${user.userId}"
															alt="Preview">
													</div>

													<span class="admin_user_name"> ${user.username} </span>
												</div>
											</td>
											<td>${user.email}</td>
											<td><span class="admin_tier_badge elite">
													${membership.membershipType} </span></td>
											<td>${booking}</td>
											<td>${membership.totalLoyaltyPoints}</td>
											<td><span
												class="status-pill ${user.isActive==true?'status-confirmed':'status-past suspended-status'}">
													${user.isActive==true?"ACTIVE":"INACTIVE"} </span></td>
											<td>
											    <form action="${pageContext.request.contextPath}${user.isActive ? '/admindeleteaccount':'/adminactivateaccount'}"
											          method="post">
											
											        <input type="hidden"
											               name="userId"
											               value="${user.userId}">
											
											        <input type="hidden"
											               name="currentStatus"
											               value="${user.isActive}">
											
											        <button type="submit"
											                class="admin_toggle_button">
											
											            <label class="admin_status_toggle">
											
											                <input type="checkbox" ${user.isActive ? "checked" : ""} disabled>
											
											                <span class="admin_toggle_slider"></span>
											
											            </label>
											
											        </button>
											
											    </form>
											</td>
											<td>
												<div class="admin_movie_action_group">
													<form action="${pageContext.request.contextPath}/admindeleteaccount" method="post">
														<input type="hidden" name="userId" value="${user.userId}">
														<button class="admin_action_button delete" type="submit">
															<img
																src="${pageContext.request.contextPath}/assets/icons/delete.svg"
																alt="Delete" />
														</button>
													</form>
												</div>
											</td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${empty userList && empty error}">
									<div class="admin_user_identity">
										<p style="color: red; font-size: 1rem;">No user</p>
									</div>
								</c:if>
								<c:if test="${not empty error}">
									<div class="admin_user_identity">
										<p style="color: red; font-size: 1rem;">${error}</p>
									</div>
								</c:if>
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