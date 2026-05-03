<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/variables.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
</head>

<header class="navigation_header" id="mainHeader">
  <nav class="navigation_container">
    
    <a href="${pageContext.request.contextPath}/home" class="navigation_brand">
      <img src="${pageContext.request.contextPath}/assets/logos/logo.png" alt="Logo" class="navigation_logo"/>
    </a>

    <ul class="navigation_menu">
      <li>
        <a href="${pageContext.request.contextPath}/#" class="${activePage == 'movies' ? 'active' : ''}">Movies</a>
      </li>

      <li>
      	<a href="${pageContext.request.contextPath}/#" class="${activePage == 'schedules' ? 'active' : ''}">Schedules</a>
      </li>

      <li>
        <a href="${pageContext.request.contextPath}/#" class="${activePage == 'about' ? 'active' : ''}">About Us</a>
      </li>

      <li>
        <a href="${pageContext.request.contextPath}/#" class="${activePage == 'experience' ? 'active' : ''}">Experience</a>
      </li>
    </ul>
    
    <div class="navigation_actions">
      <a href="${pageContext.request.contextPath}/login" class="button outline_button">
        <img src="${pageContext.request.contextPath}/assets/icons/user.svg" alt="" class="navigation_icon" />
        <span class="button_text">Sign In</span>
      </a>

      <a href="${pageContext.request.contextPath}/register" class="button primary_button">
        <span class="button_text">Get Started</span>
        <img src="${pageContext.request.contextPath}/assets/icons/rightarrow.svg" alt="" class="navigation_icon" />
      </a>
    </div>

  </nav>
</header>