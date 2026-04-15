<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CinoSphere</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>

<jsp:include page="components/header.jsp" />
    
<main>

  <section class="landing_hero">
    <div class="hero_content">
      <div class="hero_row">
        <div class="row"></div>
        <span class="row_text">Nepal's First and Finest IMAX Experience</span>
        <div class="row_bottom"></div>
      </div>

      <h1 class="hero_title">Cinema<br><em>Reimagined</em></h1>

      <p class="hero_subtitle">
        An experience beyond cinema — Stories. Vision. Emotion. Impact.
      </p>

      <div class="hero_actions">
        <a href="${pageContext.request.contextPath}/#" class="btn_hero_p">
          <img src="${pageContext.request.contextPath}/assets/icons/ticket.svg" alt="ticket" class="btn_icon" />
          <span class="btn_text">Reserve Now</span>   
        </a>
      </div>
    </div>
  </section>
   
  <section class="location_strip">
    <div class="location_row">
      <span class="row_label">Launching At Your</span>

      <div class="row_list">
        <div class="row_item_wrap">
          <span class="row_name">Kathmandu</span>
          <span class="row_tag soon">Opening Soon</span>
        </div>
        <div class="row_item_wrap">
          <span class="row_name">Pokhara</span>
          <span class="row_tag far">Q3 2026</span>
        </div>
        <div class="row_item_wrap">
          <span class="row_name">Butwal</span>
          <span class="row_tag far">2027</span>
        </div>
      </div>

      <span class="row_label">Nearest 3 Locations</span>
    </div>
  </section>
   
  <section class="features_strip">
    <div class="strip_content">
      <div class="strip_label_wrap">
        <div class="strip_line"></div>
        <span class="strip_label">Why CinoSphere?</span>
        <div class="strip_line"></div>
      </div>

      <h2 class="strip_title">
        Cinematic Experience <em>Beyond Extraordinary</em>
      </h2>
    </div>
  </section>
 	
  <section class="screen_details">
    <div class="details_grid">

      <div class="details_info">
        <h2 class="details_title">
          Every Screen<em>Built for Stories.</em>
        </h2>

        <p class="details_desc">
          A geometry that dissolves cinematic reality. Built for Detail. Emotion. Impact.
        </p>
            
        <div class="details_stats">
          <div class="stat_item">
            <span class="stat_value">18K</span>
            <span class="stat_label">sq. Ft. Screen</span>
          </div>

          <div class="stat_item">
            <span class="stat_value">350+</span>
            <span class="stat_label">Seats</span>
          </div>

          <div class="stat_item">
            <span class="stat_value">44k</span>
            <span class="stat_label">Audio</span>
          </div>
        </div>
      </div>

      <div class="details_visual">
        <img src="${pageContext.request.contextPath}/assets/images/poster.jpg"
             alt="Civil War IMAX Experience"
             class="visual_screen_img">
        <div class="visual_screen_overlay"></div>
      </div>

    </div>
  </section>

</main>

<jsp:include page="components/footer.jsp" />

</body>
</html>