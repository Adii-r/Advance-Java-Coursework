<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin | CinoSphere</title>
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,300;1,400&family=Syne:wght@400;600;700;800&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css"  href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/adminPanel.css">
<link rel="stylesheet" href="../css/variables.css">
<link rel="stylesheet" href="../css/header.css">
</head>
<body>
<div class="screen active" id="s-admin">
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
            <div class="user-mini-tier" style="color:var(--crimson-bright);">Super Admin</div>
          </div>
      <a href="${pageContext.request.contextPath}/#" class="btn btn_outline"  style="width:130px;">
        <img src="../assets/icons/user.svg" alt="" class="nav_icon" />
        <span class="btn_text">Sign Out</span>
      </a>
    </div>

  </nav>
</header>
  <div class="panel-layout">
    <!-- Admin Main -->
    <main class="panel-main">
      <div class="panel-topbar">
        <div>
          <div class="panel-topbar-title">Welcome, Raunit <em>Admin</em></div>
          <div style="font-family:var(--font-body);font-size:14px;color:var(--text-muted);margin-top:2px;">Saturday, 11 April 2026 · All Locations</div>
        </div>
        <div class="topbar-right">
          <select class="form-select" style="width:160px;height:45px;padding:8px 12px;font-size:11px;font-weight:bold;">
            <option>All Locations</option>
            <option>Kathmandu</option>
            <option>Pokhara</option>
          </select>
          <div class="notif-btn"><svg viewBox="0 0 24 24"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/><path d="M13.73 21a2 2 0 0 1-3.46 0"/></svg><div class="notif-dot"></div></div>
                  <div class="user-mini">
        </div>
        </div>
      </div>

      <div class="panel-content">
        <!-- KPI Row -->
        <div style="margin-bottom:0.75rem;"><span class="section-eyebrow">Today's Performance</span></div>
        <div style="display:grid;grid-template-columns:repeat(5,1fr);gap:14px;margin-bottom:2rem;">
          <div class="admin-stat-card"><span class="admin-stat-num gold">2.4L</span><span class="admin-stat-lbl">Revenue Today</span><span class="admin-stat-delta">↑ 18% vs yesterday</span></div>
          <div class="admin-stat-card"><span class="admin-stat-num green">847</span><span class="admin-stat-lbl">Tickets Sold</span><span class="admin-stat-delta">↑ 124 vs avg</span></div>
          <div class="admin-stat-card"><span class="admin-stat-num">78%</span><span class="admin-stat-lbl">Occupancy Rate</span><span class="admin-stat-delta">↑ 12% vs last week</span></div>
          <div class="admin-stat-card"><span class="admin-stat-num gold">34</span><span class="admin-stat-lbl">New Members</span><span class="admin-stat-delta">↑ 8 vs yesterday</span></div>
          <div class="admin-stat-card"><span class="admin-stat-num green">9.8</span><span class="admin-stat-lbl">Overall Rating</span><span class="admin-stat-delta">↑ 0.2 today</span></div>
        </div>
        <!-- Movies Table + Alerts -->
        <div class="panel-grid-2" style="margin-bottom:2rem;">
          <div class="glass-panel" style="padding:1.5rem;">
            <div class="card-title">
              Movie Management
              <div style="display:flex;gap:8px;align-items:center;">
                <button class="btn-gold" style="padding:8px 14px;font-size:10px;font-weight:bold;">EDIT</button>
              </div>
            </div>
            <div class="admin-table-wrap">
              <table class="cs-table">
                <thead>
                  <tr><th>Film</th><th>Format</th><th>Rating</th><th>Status</th></tr>
                </thead>
                <tbody>
                  <tr><td><div class="admin-movie-row"><div class="admin-movie-thumb c1"></div>Dune: Messiah</div></td><td>IMAX</td><td>⭐ 9.1</td><td><span class="status-pill confirmed">Showing</span></td></tr>
                  <tr><td><div class="admin-movie-row"><div class="admin-movie-thumb c2"></div>Interstellar Returns</div></td><td>IMAX</td><td>⭐ 9.4</td><td><span class="status-pill confirmed">Showing</span></td></tr>
                  <tr><td><div class="admin-movie-row"><div class="admin-movie-thumb c3"></div>Avatar: Seed Bearer</div></td><td>IMAX 3D</td><td>⭐ 8.7</td><td><span class="status-pill confirmed">Showing</span></td><td></tr>
                  <tr><td><div class="admin-movie-row"><div class="admin-movie-thumb c4"></div>Mission: Omega</div></td><td>IMAX</td><td>⭐ 8.2</td><td><span class="status-pill confirmed">Showing</span></td><td></tr>
                  <tr><td><div class="admin-movie-row"><div class="admin-movie-thumb c5"></div>The Void Protocol</div></td><td>IMAX</td><td>⭐ 8.9</td><td><span class="status-pill confirmed">Showing</span></td></tr>
                  <tr><td><div class="admin-movie-row"><div class="admin-movie-thumb c3"></div>Avatar: Seed Bearer</div></td><td>IMAX 3D</td><td>⭐ 8.7</td><td><span class="status-pill confirmed">Showing</span></td><td></tr>
                </tbody>
              </table>
            </div>
          </div>

          <div style="display:flex;flex-direction:column;gap:1.25rem;">
            <!-- System Alerts -->
            <div class="glass-panel" style="padding:1.5rem;">
              <div class="card-title">System Alerts</div>
              <div class="alert-item danger"><div class="alert-dot danger"></div><div><span class="alert-text">Hall A projector maintenance overdue — scheduled Apr 15.</span><span class="alert-time">Critical · 1 hour ago</span></div></div>
              <div class="alert-item warn"><div class="alert-dot warn"></div><div><span class="alert-text">Dune: Messiah Hall A shows are 94% sold out.</span><span class="alert-time">High · 2 hours ago</span></div></div>
              <div class="alert-item info"><div class="alert-dot info"></div><div><span class="alert-text">New membership tier upgrade requests: 12 pending.</span><span class="alert-time">Info · Today</span></div></div>
              <div class="alert-item warn"><div class="alert-dot warn"></div><div><span class="alert-text">Pokhara location permit docs due by Apr 20.</span><span class="alert-time">Warning · 2 days ago</span></div></div>
              <div class="alert-item info"><div class="alert-dot info"></div><div><span class="alert-text">New membership tier upgrade requests: 12 pending.</span><span class="alert-time">Info · Today</span></div></div>
              <div class="alert-item warn"><div class="alert-dot warn"></div><div><span class="alert-text">Pokhara location permit docs due by Apr 20.</span><span class="alert-time">Warning · 2 days ago</span></div></div>
            </div>
          </div>
        </div>

        <!-- User Management Table -->
        <div class="glass-panel" style="padding:1.5rem;margin-bottom:2rem;">
          <div class="card-title">
            User Management
            <div style="display:flex;gap:8px;align-items:center;">
              <button class="btn-red" style="padding:9px 14px;font-size:10px;">Export CSV</button>
            </div>
          </div>
          <div class="tab-row">
            <button class="tab-btn active">All Users</button>
            <button class="tab-btn">Starter</button>
            <button class="tab-btn">Plus</button>
            <button class="tab-btn">Elite</button>
            <button class="tab-btn">Suspended</button>
          </div>
          <div class="admin-table-wrap">
            <table class="cs-table">
              <thead><tr><th>Name</th><th>Email</th><th>Location</th><th>Tier</th><th>Bookings</th><th>Points</th><th>Joined</th><th>Status</th></tr></thead>
              <tbody>
                <tr><td>Sabal Sharma</td><td>Sabal@email.com</td><td>Kathmandu</td><td><span class="gold-badge">Plus</span></td><td>12</td><td>1,240</td><td>Jan 2026</td><td><span class="status-pill confirmed">Active</span></td></tr>
                <tr><td>Milan Thapa</td><td>Milan@email.com</td><td>Kathmandu</td><td><span class="red-badge">Elite</span></td><td>28</td><td>4,800</td><td>Dec 2025</td><td><span class="status-pill confirmed">Active</span></td></tr>
                <tr><td>Aditya Gurung</td><td>Yuden@email.com</td><td>Pokhara</td><td><span class="gold-badge">Plus</span></td><td>4</td><td>320</td><td>Mar 2026</td><td><span class="status-pill confirmed">Active</span></td></tr>
                <tr><td>Lucky Karki</td><td>Lucky@email.com</td><td>Kathmandu</td><td><span class="gold-badge">Plus</span></td><td>9</td><td>890</td><td>Feb 2026</td><td><span class="status-pill past" style="color:#f87171;background:rgba(248,113,113,0.1);border-color:rgba(248,113,113,0.2);">Suspended</span></td></tr>
              </tbody>
            </table>
          </div>
        </div>

      </div>
    </main>
  </div>
</div>
<jsp:include page="../components/footer.jsp" />
</body>
</html>