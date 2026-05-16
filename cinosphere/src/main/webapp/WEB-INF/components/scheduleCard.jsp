<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/variable.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/scheduleCard.css">
</head>


<div class="schedules_row">
    <div class="schedules_row_movie">
        <div class="schedules_row_poster">
        	<img src="${pageContext.request.contextPath}/movieposter?name=${param.movieId}" alt="${param.movieName} poster" class="movie_poster_image_element"/>
        	<div class="schedules_row_poster-overlay"></div>
        </div>
        <div class="schedules_row__information">
            <div class="schedules_row_title">${param.movieName}</div>
            <div class="schedules_row_description"> ${param.language} · ${param.duration} min · ${param.genre}</div>
            <div class="schedule_row_badges">
                <span class="age_rating_badge">${param.ageRating}</span>
                <span class="format_badge">${param.format}</span>
            </div>
        </div>
    </div>

	<div class="schedules_row_times">
	    <c:forEach var="hallBlock" items="${fn:split(param.halls, ';')}">
	        <c:set var="cleanBlock" value="${fn:trim(hallBlock)}" />
	        <c:set var="hallName" value="${fn:split(cleanBlock, '|')[0]}" />
	        <c:set var="times" value="${fn:split(cleanBlock, '|')[1]}" />
	        <div class="time_hall_block">
	            <div class="time_hall_label">${hallName}</div>
	            <form method="get" action="${pageContext.request.contextPath}/schedules">
	                <input type="hidden" name="movieId" value="${param.movieId}" />
	                <div class="times_slots">
	                    <c:forEach var="time" items="${fn:split(times, ',')}">
	                        <button type="submit" name="selectedTime" value="${time}" class="time_slot">
	                            <div class="time_slot_times">${time}</div>
	                        </button>
	                    </c:forEach>
	                </div>
	            </form>
	        </div>
	    </c:forEach>
	</div>
</div>