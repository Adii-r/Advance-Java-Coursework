<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/variables.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
</head>

<header class="nav_header" id="mainHeader">
  <nav class="nav_container">
    
    <a href="${pageContext.request.contextPath}/#" class="nav_brand">
      <img src="${pageContext.request.contextPath}/assets/images/image.png" alt="Logo" class="nav_logo" />
    </a>

    <ul class="nav_menu">
      <li>
        <a href="${pageContext.request.contextPath}/#"
           class="${activePage == 'movies' ? 'active' : ''}">
          Movies
        </a>
      </li>

      <li>
        <a href="${pageContext.request.contextPath}/#"
           class="${activePage == 'schedules' ? 'active' : ''}">
          Schedules
        </a>
      </li>

      <li>
        <a href="${pageContext.request.contextPath}/#"
           class="${activePage == 'about' ? 'active' : ''}">
          About Us
        </a>
      </li>

      <li>
        <a href="${pageContext.request.contextPath}/#"
           class="${activePage == 'experience' ? 'active' : ''}">
          Experience
        </a>
      </li>

    </ul>
    
    <div class="nav_actions">
      <a href="${pageContext.request.contextPath}/#" class="btn btn_outline">
        <img src="${pageContext.request.contextPath}/assets/icons/user.svg" alt="" class="nav_icon" />
        <span class="btn_text">Sign In</span>
      </a>

      <a href="${pageContext.request.contextPath}/#" class="btn btn_primary">
        <span class="btn_text">Get Started</span>
        <img src="${pageContext.request.contextPath}/assets/icons/rightarrow.svg" alt="" class="nav_icon" />
      </a>
    </div>

  </nav>
</header>