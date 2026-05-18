<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>

<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/seat.css">
</head>


<label class="seat ${param.isTaken == 'true' ? 'seat_reserved' : ''}">
    <input type="checkbox" class="seat_input" name="selectedSeats" value="${param.seatId}" ${param.isTaken == 'true' ? 'disabled' : ''} />
    <span class="seat_visual">
        <span class="seat_number">${param.seatNumber}</span>
    </span>
</label>