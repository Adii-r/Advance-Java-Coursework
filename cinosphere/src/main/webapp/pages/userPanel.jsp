<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CinoSphere — Full Wireframe Suite</title>
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,300;1,400&family=Syne:wght@400;600;700;800&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css"  href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/userPanel.css">
<link rel="stylesheet" href="../css/variables.css">
<link rel="stylesheet" href="../css/header.css">
</head>
<body>
<div class="screen active" id="s-user">
<header class="nav_header" id="mainHeader">
  <nav class="nav_container">
    
    <a href="/#" class="nav_brand">
      <img src="../assets/images/image.png" alt="Logo" class="nav_logo" />
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
	<div class="user-avatar-sm" style="background:linear-gradient(135deg,var(--gold-dim),var(--gold));">RG</div>
          <div>
            <div class="user-mini-name">Raunit Giri</div>
            <div class="user-mini-tier" style="color:var(--crimson-bright);">Member</div>
          </div>
      <a href="${pageContext.request.contextPath}/#" class="btn btn_outline"  style="width:130px;">
        <img src="../assets/icons/user.svg" alt="" class="nav_icon" />
        <span class="btn_text">Sign Out</span>
      </a>
    </div>

  </nav>
</header>
  <div class="panel-layout">
<!-- Main Content -->
    <main class="panel-main">
      <div class="panel-topbar">
        <div>
          <div class="panel-topbar-title">Welcome, <em>Raunit</em></div>
          <div style="font-family:var(--font-body);font-size:14px;color:var(--text-muted);margin-top:2px;">Saturday, 11 April 2026</div>
        </div>
        <div class="topbar-right">
          <div class="notif-btn"><svg viewBox="0 0 24 24"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/><path d="M13.73 21a2 2 0 0 1-3.46 0"/></svg><div class="notif-dot"></div></div>
          <button class="btn-red" onclick="">Book Now</button>
        </div>
      </div>

      <div class="panel-content">
        <!-- Quick Actions -->
        <div style="margin-bottom:0.75rem;"><span class="section-eyebrow">Quick Actions</span></div>
        <div class="quick-actions">
          <div class="quick-action-btn">
            <div class="qa-icon red"><svg viewBox="0 0 24 24"><path d="M20 12V22H4V12"/><path d="M22 7H2v5h20V7z"/><path d="M12 22V7"/></svg></div>
            <div class="qa-label">Book Tickets</div>
          </div>
          <div class="quick-action-btn">
            <div class="qa-icon gold"><svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg></div>
            <div class="qa-label">My Tickets</div>
          </div>
          <div class="quick-action-btn">
            <div class="qa-icon gold"><svg viewBox="0 0 24 24"><path d="M12 2L15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2z"/></svg></div>
            <div class="qa-label">Redeem Points</div>
          </div>
          <div class="quick-action-btn">
            <div class="qa-icon red"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg></div>
            <div class="qa-label">Report Issue</div>
          </div>
        </div>
                <!-- Stats Row -->
        <div style="margin-bottom:0.75rem;"><span class="section-eyebrow">User overview</span></div>
        <div class="stats-row">
          <div class="stat-card"><span class="stat-num">12</span><span class="stat-label">Total Bookings</span><span class="stat-delta">↑ 3 this month</span></div>
          <div class="stat-card"><span class="stat-num" style="color:var(--gold);">1,240</span><span class="stat-label">Sphere Points</span><span class="stat-delta">↑ 200 pts earned</span></div>
          <div class="stat-card"><span class="stat-num" style="color:var(--crimson-bright);">2</span><span class="stat-label">Upcoming Shows</span><span class="stat-delta">Next: Apr 14</span></div>
          <div class="stat-card"><span class="stat-num">₨500</span><span class="stat-label">Welcome Credit</span><span class="stat-delta">Valid until Jun 2026</span></div>
        </div>

        <!-- Bookings + Membership Card -->
        <div class="panel-grid-2">
          <div>
            <div class="glass-panel" style="padding:1.5rem;">
              <div class="card-title">Upcoming Bookings <a href="#">View all →</a></div>
              <div class="booking-item">
                <div class="booking-poster"><span class="booking-poster-label">IMAX</span></div>
                <div class="booking-info">
                  <div class="booking-movie">Dune: Messiah</div>
                  <div class="booking-meta">Apr 14, 2026 · 7:30 PM</div>
                  <div class="booking-meta">Kathmandu · Hall A · Seats D4, D5</div>
                </div>
                <div class="booking-status">
                  <span class="status-pill confirmed">Confirmed</span>
                  <span class="seat-label">2 seats</span>
                </div>
              </div>
              <div class="booking-item">
                <div class="booking-poster" style="background:linear-gradient(135deg,#0a0a1a,#0f1a3d);"><span class="booking-poster-label">IMAX</span></div>
                <div class="booking-info">
                  <div class="booking-movie">Interstellar Returns</div>
                  <div class="booking-meta">Apr 20, 2026 · 5:00 PM</div>
                  <div class="booking-meta">Kathmandu · Hall B · Seat G8</div>
                </div>
                <div class="booking-status">
                  <span class="status-pill upcoming">Upcoming</span>
                  <span class="seat-label">1 seat</span>
                </div>
              </div>
              <div class="card-title" style="margin-top:1.25rem;margin-bottom:0.75rem;">Recent History <a href="#">View all →</a></div>
              <div class="booking-item">
                <div class="booking-poster" style="background:linear-gradient(135deg,#0a1a0a,#0f2a0f);"><span class="booking-poster-label">IMAX</span></div>
                <div class="booking-info">
                  <div class="booking-movie">Avatar: The Seed Bearer</div>
                  <div class="booking-meta">Mar 28, 2026 · 8:00 PM</div>
                  <div class="booking-meta">Kathmandu · Hall A · Seats F2, F3, F4</div>
                </div>
                <div class="booking-status">
                  <span class="status-pill past">Watched</span>
                  <span class="seat-label">3 seats</span>
                </div>
              </div>
              <div class="booking-item">
                <div class="booking-poster" style="background:linear-gradient(135deg,#0a1a0a,#0f2a0f);"><span class="booking-poster-label">IMAX</span></div>
                <div class="booking-info">
                  <div class="booking-movie">Avatar: The Way of water</div>
                  <div class="booking-meta">Mar 28, 2026 · 8:00 PM</div>
                  <div class="booking-meta">Kathmandu · Hall A · Seats F2, F3, F4</div>
                </div>
                <div class="booking-status">
                  <span class="status-pill past">Watched</span>
                  <span class="seat-label">3 seats</span>
                </div>
              </div>
            </div>
          </div>

          <div style="display:flex;flex-direction:column;gap:1.25rem;">
            <!-- Membership Card -->
            <div class="membership-card">
              <span class="mem-card-tier">Sphere Plus · Member</span>
              <div class="mem-card-name">Priya Sharma</div>
              <div class="mem-card-pts">1,240</div>
              <span class="mem-card-pts-label">Points Available</span>
              <div class="mem-progress" style="margin-top:1.25rem;">
                <div class="mem-progress-label">
                  <span>Progress to Elite</span>
                  <span>1,240 / 3,000 pts</span>
                </div>
                <div class="mem-progress-bar"><div class="mem-progress-fill" style="width:41%;"></div></div>
              </div>
              <div class="mem-card-perks">
                <div class="mem-perk"><div class="mem-perk-dot"></div>Priority seats</div>
                <div class="mem-perk"><div class="mem-perk-dot"></div>+10% pts</div>
                <div class="mem-perk"><div class="mem-perk-dot"></div>2 Guest passes</div>
              </div>
            </div>

            <!-- Notifications Card -->
            <div class="glass-panel" style="padding:1.5rem;">
              <div class="card-title">Alerts</div>
              <div class="alert-item warn">
                <div class="alert-dot warn"></div>
                <div><span class="alert-text">Dune: Messiah IMAX is 94% sold out for Apr 14.</span><span class="alert-time">2 hours ago</span></div>
              </div>
              <div class="alert-item info">
                <div class="alert-dot info"></div>
                <div><span class="alert-text">Your NPR 500 welcome credit expires in 52 days.</span><span class="alert-time">Yesterday</span></div>
              </div>
              <div class="alert-item danger">
                <div class="alert-dot danger"></div>
                <div><span class="alert-text">Booking #CS-2041 requires payment confirmation.</span><span class="alert-time">3 days ago</span></div>
              </div>
            </div>
          </div>
        </div>

      </div>
    </main>
  </div>
</div>
<jsp:include page="../components/footer.jsp" />
</body>
</html>
