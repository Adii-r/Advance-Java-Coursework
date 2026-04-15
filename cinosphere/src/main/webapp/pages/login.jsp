<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | CinoSphere</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>

<body class="theme-obsidian">

<jsp:include page="../components/header.jsp" />
    
<main class="viewport-main">
    <div class="auth-container">
      <div class="auth-split-layout">
        
        <section class="auth-visual-side">
          <div class="visual-overlay"></div>
          <div class="texture-grain"></div>
          
          <div class="visual-content-wrap">
            <div class="brand-narrative">
              <h2 class="hero-display-title">The screen<br /><em>missed you</em></h2>
              <p class="hero-display-subtitle">
                Sign back in back to manage your bookings, enjoy membership perks &
                never miss a premiere of your favourite.
              </p>
              
              <div class="feature-perk-list">
                <div class="perk-item">
                  <span class="perk-dot"></span>
                  <span class="perk-label">Upcoming booking reminders</span>
                </div>
                <div class="perk-item">
                  <span class="perk-dot"></span>
                  <span class="perk-label">Loyalty points & Sphere credits</span>
                </div>
                <div class="perk-item">
                  <span class="perk-dot"></span>
                  <span class="perk-label">Priority IMAX seat selection</span>
                </div>
              </div>
            </div>
          </div>
        </section>

        <section class="auth-form-side">
		  <div class="control-panel">
		    
		    <header class="panel-header">
		      <h2 class="panel-title">Log <em>In</em></h2>
		      <p class="panel-subtitle">Enter your credentials to continue</p>
		    </header>
		    
		    <div class="glass-card"> <form action="${pageContext.request.contextPath}/login" method="POST" class="form-standard">
		        
		        <div class="form-group">
		          <label class="field-label">Email Address</label>
		          <div class="input-field-wrap">
		            <input type="email" name="email" class="input-control" placeholder="you@example.com" required />
		            <span class="input-icon"> <img src="${pageContext.request.contextPath}/assets/icons/mail.svg" alt="Email" />
		            </span>
		          </div>
		        </div>
		        
		        <div class="form-group">
		          <div class="field-header-row">
		            <label class="field-label">Password</label>
		            <a href="#" class="link-muted-sm">Forgot?</a>
		          </div>
		          <div class="input-field-wrap">
		            <input type="password" name="password" class="input-control" placeholder="••••••••" required />
		            <span class="input-icon"> <img src="${pageContext.request.contextPath}/assets/icons/lock.svg" alt="Lock" />
		            </span>
		          </div>
		        </div>
		        
		        <button type="submit" class="btn-primary-gold">
		          Sign In
		        </button>
		    
		    <footer class="panel-footer">
		      <p class="switch-context-text">
		        New to CinoSphere?
		        <a href="${pageContext.request.contextPath}/register" class="link-gold">Create an account →</a>
		      </p>
		    </footer>
		  </div>
		</section>

      </div>
    </div>
</main>

<jsp:include page="../components/footer.jsp" />

</body>
</html> 