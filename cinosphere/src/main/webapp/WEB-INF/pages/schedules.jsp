<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Schedules | CinoSphere</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/schedules.css">
</head>

<body>

    <jsp:include page="../components/header.jsp" />
    
    <main class="schedules_screen"> 
    
    	<jsp:include page="../components/heroBanner.jsp">
		    <jsp:param name="titleMain" value="What's" />
		    <jsp:param name="titleEm" value="Showing" />
		    <jsp:param name="subtitle" value="Explore available screenings and book the show that fits your time, language, and favourite cinema." />
		</jsp:include>
		
		<form method="get" action="${pageContext.request.contextPath}/schedules">
		
			<section class="date_strip_section">
			    <div class="schedules_date_strip">
			
			        <c:forEach var="date" items="${dateList}">
			
			            <jsp:include page="../components/dateCard.jsp">
			                <jsp:param name="value" value="${date.value}" />
			                <jsp:param name="day" value="${date.day}" />
			                <jsp:param name="number" value="${date.number}" />
			                <jsp:param name="month" value="${date.month}" />
			                <jsp:param name="active" value="${selectedDate == date.value}" />
			            </jsp:include>
			
			        </c:forEach>
			
			    </div>
			</section>
				    	
			<section class="schedules_filter_section"> 
			    <div class="schedules_filter_container">
			        <div class="schedules_search_wrapper">
			            <span class="schedules_search_icon_container">
			                <img src="${pageContext.request.contextPath}/icon?name=search" alt="Search" />
			            </span>
			            <input type="text" placeholder="Search movies..." name="movieSearch" class="schedules_search_input" value="${searchKeyword}">
			        </div>
			        
			        <div class="schedules_filter_dropdown_group">
			        
			        	<div class="schedules_select_wrapper">
			                <select class="schedules_filter_select" name="timeFilter">
			                    <option value="">All Timings</option>
			                    <option value="morning" ${selectedTime=="morning"?"selected":""}>Morning (Before 12PM)</option>
			                    <option value="afternoon" ${selectedTime=="afternoon"?"selected":""}>Afternoon (12-5PM)</option>
			                    <option value="evening" ${selectedEvening=="evening"?"selected":""}>Evening (5-9PM)</option>
			                    <option value="night" ${selectedTime=="night"?"selected":""}>Night (After 9PM)</option>
			                </select>
			                <span class="schedules_select_arrow">
			                    <img src="${pageContext.request.contextPath}/icon?name=arrowdown" alt="Arrow Down" />
			                </span>
			            </div>
			        
		        	    <div class="schedules_select_wrapper">
			                <select class="schedules_filter_select" name="locationFilter">
			                    <option value="">All Locations</option>
			                    <option value="kathmandu" ${selectedLocation=="kathmandu"?"selected":""}>Kathmandu</option>
			                    <option value="pokhara" ${selectedLocation=="pokhara"?"selected":""}>Pokhara</option>
			                    <option value="butwal" ${selectedLocation=="butwal"?"selected":""}>Butwal</option>
			                </select>
			                <span class="schedules_select_arrow">
			                    <img src="${pageContext.request.contextPath}/icon?name=arrowdown" alt="Arrow Down" />
			                </span>
			            </div>
			            
			            <div class="schedules_select_wrapper">
			                <select class="schedules_filter_select" name="langFilter">
			                    <option value="">All Languages</option>
			                    <option value="english" ${selectedLanguage=="english"?"selected":""}>English</option>
			                    <option value="hindi" ${selectedLanguage=="hindi"?"selected":""}>Hindi</option>
			                    <option value="nepali" ${selectedLanguage=="nepali"?"selected":""}>Nepali</option>
			                </select>
			                <span class="schedules_select_arrow">
			                    <img src="${pageContext.request.contextPath}/icon?name=arrowdown" alt="Arrow Down" />
			                </span>
			            </div>
			
			           
			            <div class="schedules_select_wrapper">
			                <select class="schedules_filter_select" name="format">
			                    <option value="all" ${selectedformat=="all"|| empty selectedStatus?"selected":""}>All</option>
			                    <option value="IMAX" ${selectedformat=="IMAX"?"selected":""}>IMAX</option>
			                    <option value="3D" ${selectedformat=="3D"?"selected":""}>Laser Atmos 3D</option>
			                    <option value="Standard" ${selectedformat=="Standard"?"selected":""}>Standard</option>
			                </select>
			                <span class="schedules_select_arrow">
			                    <img src="${pageContext.request.contextPath}/icon?name=arrowdown" alt="Arrow Down" />
			                </span>
			            </div>
			             <div class="schedules_select_wrapper">
			            <button type="submit" class="schedules_filter_pill">APPLY</button>
			            </div>
			        </div>
			    </div>
			</section>
		</form>
		
		<section class="schedules_list_section">

		    <jsp:include page="../components/scheduleCard.jsp">
		
		        <jsp:param name="movieId" value="1" />
		        <jsp:param name="movieName" value="The Devil Wears Prada 2" />
		        <jsp:param name="language" value="Hindi" />
		        <jsp:param name="duration" value="163" />
		        <jsp:param name="genre" value="Action, Biography" />
		        <jsp:param name="ageRating" value="PG" />
		        <jsp:param name="format" value="IMAX" />
		        <jsp:param name="halls"
		            value="Hall A — IMAX 4K Laser|10:00 AM,1:30 PM,5:00 PM,8:30 PM;
		                   Hall B — Standard|11:15 AM,3:00 PM,7:00 PM;"/>
		
		    </jsp:include>
		
		</section>
			    
	</main>
    <jsp:include page="../components/footer.jsp" />

</body>

</html>