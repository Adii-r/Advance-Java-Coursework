<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile | CinoSphere</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userPanel.css">
</head>

  <style>
    /* ── PANEL LAYOUT (reuse from panels.css logic inline) ── */
    .panel-layout { display: flex; min-height: calc(100vh - 72px); }

    .sidebar {
      width: 240px; flex-shrink: 0;
      background: rgba(12,15,20,0.92);
      border-right: 1px solid var(--glass-border);
      backdrop-filter: blur(20px);
      display: flex; flex-direction: column;
      position: sticky; top: 72px;
      height: calc(100vh - 72px); overflow-y: auto;
    }

    .sidebar__logo {
      padding: 1.75rem 1.5rem 1rem;
      border-bottom: 1px solid var(--glass-border);
      display: flex; align-items: center; gap: 10px;
    }

    .sidebar__logo-img { height: 36px; width: auto; object-fit: contain; filter: drop-shadow(0 0 8px rgba(201,168,76,0.20)); }

    .sidebar__logo-meta { display: flex; flex-direction: column; }
    .sidebar__logo-name { font-family: var(--font-ui); font-size: 14px; font-weight: 800; color: var(--text); letter-spacing: -0.02em; }
    .sidebar__logo-name span { color: var(--gold); }
    .sidebar__logo-tag { font-size: 8px; font-family: var(--font-ui); font-weight: 700; letter-spacing: 0.15em; color: var(--text-muted); text-transform: uppercase; }

    .sidebar__nav { padding: 1rem 0; flex: 1; }

    .sidebar__section-label {
      font-family: var(--font-ui); font-size: 8px; font-weight: 700;
      letter-spacing: 0.25em; text-transform: uppercase;
      color: var(--text-muted); padding: 0.6rem 1.5rem 0.4rem; display: block;
    }

    .sidebar__item {
      display: flex; align-items: center; gap: 10px;
      padding: 10px 1.5rem; cursor: pointer;
      transition: all 0.2s; border-left: 2px solid transparent;
    }
    .sidebar__item:hover { background: rgba(255,255,255,0.03); border-left-color: rgba(201,168,76,0.30); }
    .sidebar__item.active { background: rgba(201,168,76,0.06); border-left-color: var(--gold); }

    .sidebar__item-icon {
      width: 32px; height: 32px; border-radius: var(--radius-sm);
      display: flex; align-items: center; justify-content: center;
      background: rgba(255,255,255,0.04); flex-shrink: 0;
    }
    .sidebar__item.active .sidebar__item-icon { background: rgba(201,168,76,0.12); }
    .sidebar__item-icon svg { width: 15px; height: 15px; stroke: var(--text-muted); fill: none; stroke-width: 1.5; stroke-linecap: round; }
    .sidebar__item.active .sidebar__item-icon svg { stroke: var(--gold); }
    .sidebar__item-label { font-family: var(--font-ui); font-size: 11px; font-weight: 600; letter-spacing: 0.04em; color: var(--text-dim); }
    .sidebar__item.active .sidebar__item-label { color: var(--gold); }
    .sidebar__badge { margin-left: auto; font-family: var(--font-ui); font-size: 8px; font-weight: 700; background: var(--crimson-bright); color: #fff; padding: 2px 6px; border-radius: 10px; }

    .sidebar__footer { padding: 1rem 1.5rem; border-top: 1px solid var(--glass-border); }
    .user-mini { display: flex; align-items: center; gap: 10px; }
    .user-avatar { width: 32px; height: 32px; border-radius: 50%; background: linear-gradient(135deg, var(--crimson), var(--crimson-bright)); display: flex; align-items: center; justify-content: center; font-family: var(--font-ui); font-size: 11px; font-weight: 700; color: #fff; flex-shrink: 0; }
    .user-mini__name { font-family: var(--font-ui); font-size: 11px; font-weight: 600; color: var(--text-dim); }
    .user-mini__tier { font-family: var(--font-ui); font-size: 8px; font-weight: 700; letter-spacing: 0.10em; color: var(--gold-dim); }

    /* ── MAIN CONTENT ── */
    .panel-main { flex: 1; background: var(--deep); overflow-y: auto; }

    .panel-topbar {
      display: flex; align-items: center; justify-content: space-between;
      padding: 1.5rem 2.5rem; border-bottom: 1px solid var(--glass-border);
      background: rgba(12,15,20,0.70); backdrop-filter: blur(16px);
      position: sticky; top: 0; z-index: 10;
    }

    .panel-topbar__title { font-family: var(--font-display); font-size: 22px; font-weight: 300; color: var(--text); }
    .panel-topbar__title em { font-style: italic; color: var(--gold); }
    .panel-topbar__sub { font-family: var(--font-body); font-size: 11px; color: var(--text-muted); margin-top: 2px; }

    /* ── PROFILE FORM CONTENT ── */
    .profile-content { padding: 2.5rem; }

    .profile-header-card {
      background: linear-gradient(135deg, rgba(12,15,20,0.90), rgba(23,28,35,0.90));
      border: 1px solid rgba(201,168,76,0.18);
      border-radius: var(--radius-xl);
      padding: 2rem 2.5rem;
      display: flex; align-items: center; gap: 2rem;
      margin-bottom: 2rem; position: relative; overflow: hidden;
    }

    .profile-header-card::before {
      content: '';
      position: absolute; top: -60px; right: -60px;
      width: 200px; height: 200px; border-radius: 50%;
      background: radial-gradient(circle, rgba(201,168,76,0.06), transparent 70%);
    }

    .profile-avatar-lg {
      width: 88px; height: 88px; border-radius: 50%;
      background: linear-gradient(135deg, var(--crimson), var(--crimson-bright));
      display: flex; align-items: center; justify-content: center;
      font-family: var(--font-display); font-size: 34px; font-weight: 300;
      color: #fff; flex-shrink: 0;
      border: 3px solid rgba(201,168,76,0.30);
      box-shadow: 0 0 24px rgba(201,168,76,0.12);
      position: relative; cursor: pointer;
    }

    .avatar-upload-btn {
      position: absolute; bottom: 0; right: 0;
      width: 26px; height: 26px; border-radius: 50%;
      background: var(--gold); display: flex; align-items: center; justify-content: center;
      border: 2px solid var(--deep); cursor: pointer;
    }

    .avatar-upload-btn svg { width: 12px; height: 12px; stroke: var(--obsidian); fill: none; stroke-width: 2; }

    .profile-header-info {}
    .profile-header-name { font-family: var(--font-display); font-size: 28px; font-weight: 300; color: var(--text); margin-bottom: 4px; }
    .profile-header-email { font-family: var(--font-body); font-size: 12px; color: var(--text-muted); margin-bottom: 12px; }

    .profile-header-badges { display: flex; gap: 8px; flex-wrap: wrap; }
    .ph-badge {
      font-family: var(--font-ui); font-size: 8px; font-weight: 700;
      letter-spacing: 0.12em; text-transform: uppercase;
      padding: 3px 10px; border-radius: 20px;
    }
    .ph-badge--tier { color: var(--gold); background: rgba(201,168,76,0.12); border: 1px solid rgba(201,168,76,0.25); }
    .ph-badge--joined { color: var(--text-muted); background: var(--glass); border: 1px solid var(--glass-border); }
    .ph-badge--points { color: #4ade80; background: rgba(74,222,128,0.10); border: 1px solid rgba(74,222,128,0.22); }

    /* Form grid */
    .profile-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 2rem; }

    .profile-section-card {
      background: rgba(255,255,255,0.03);
      border: 1px solid var(--glass-border);
      border-radius: var(--radius-lg);
      padding: 2rem;
    }

    .profile-section-card.full-width { grid-column: 1 / -1; }

    .section-card-title {
      font-family: var(--font-ui); font-size: 11px; font-weight: 700;
      letter-spacing: 0.12em; text-transform: uppercase;
      color: var(--text-dim); margin-bottom: 1.5rem;
      display: flex; align-items: center; gap: 8px;
    }

    .section-card-title svg { width: 14px; height: 14px; stroke: var(--gold); fill: none; stroke-width: 1.8; }

    /* Password strength */
    .pw-strength { margin-top: 8px; }
    .pw-strength-bar { height: 3px; background: var(--glass-border); border-radius: 2px; overflow: hidden; margin-bottom: 4px; }
    .pw-strength-fill { height: 100%; border-radius: 2px; transition: all 0.3s; }
    .pw-strength-label { font-family: var(--font-body); font-size: 10px; color: var(--text-muted); }

    /* Preference toggles */
    .pref-row {
      display: flex; align-items: center; justify-content: space-between;
      padding: 12px 0; border-bottom: 1px solid var(--glass-border);
    }
    .pref-row:last-child { border-bottom: none; padding-bottom: 0; }

    .pref-info {}
    .pref-label { font-family: var(--font-ui); font-size: 11px; font-weight: 700; color: var(--text); margin-bottom: 2px; }
    .pref-desc { font-family: var(--font-body); font-size: 10px; color: var(--text-muted); }

    .toggle {
      position: relative; width: 40px; height: 22px;
      background: var(--glass-border); border-radius: 11px;
      cursor: pointer; transition: background 0.25s; flex-shrink: 0;
    }
    .toggle.on { background: var(--gold); }
    .toggle::after {
      content: ''; position: absolute;
      width: 16px; height: 16px; border-radius: 50%; background: #fff;
      top: 3px; left: 3px; transition: left 0.25s;
    }
    .toggle.on::after { left: 21px; }

    /* Danger zone */
    .danger-zone {
      border: 1px solid rgba(198,40,40,0.25);
      border-radius: var(--radius-lg);
      padding: 2rem; background: rgba(198,40,40,0.03);
    }

    .danger-zone-title {
      font-family: var(--font-ui); font-size: 11px; font-weight: 700;
      letter-spacing: 0.12em; text-transform: uppercase;
      color: var(--crimson-bright); margin-bottom: 1.25rem;
      display: flex; align-items: center; gap: 8px;
    }

    .danger-zone-title svg { width: 14px; height: 14px; stroke: var(--crimson-bright); fill: none; stroke-width: 1.8; }

    .danger-action {
      display: flex; align-items: center; justify-content: space-between;
      padding: 12px 0; border-bottom: 1px solid rgba(198,40,40,0.12);
    }
    .danger-action:last-child { border-bottom: none; padding-bottom: 0; }
    .danger-action-info {}
    .danger-action-label { font-family: var(--font-ui); font-size: 11px; font-weight: 700; color: var(--text); margin-bottom: 2px; }
    .danger-action-desc { font-family: var(--font-body); font-size: 10px; color: var(--text-muted); }

    /* Success toast */
    #saveToast {
      position: fixed; bottom: 2rem; right: 2rem;
      background: var(--surface); border: 1px solid rgba(74,222,128,0.35);
      border-radius: var(--radius-md); padding: 1rem 1.5rem;
      z-index: 1100; display: none; max-width: 300px;
      box-shadow: 0 8px 32px rgba(0,0,0,0.5);
    }
  </style>
</head>
<body>

<jsp:include page="../components/header.jsp" />

<div style="padding-top:72px; min-height:100vh;">
<div class="panel-layout">

  <!-- ═══ SIDEBAR ═══ -->
  <aside class="sidebar">
    

    <nav class="sidebar__nav">
      <span class="sidebar__section-label">Main</span>

      <div class="sidebar__item" onclick="location.href='user-dashboard.html'">
        <div class="sidebar__item-icon"><svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg></div>
        <span class="sidebar__item-label">Dashboard</span>
      </div>

      <div class="sidebar__item">
        <div class="sidebar__item-icon"><svg viewBox="0 0 24 24"><rect x="2" y="3" width="20" height="14" rx="2"/><path d="M8 21h8M12 17v4"/></svg></div>
        <span class="sidebar__item-label">Now Showing</span>
      </div>

      <div class="sidebar__item">
        <div class="sidebar__item-icon"><svg viewBox="0 0 24 24"><path d="M20 12V22H4V12"/><path d="M22 7H2v5h20V7z"/><path d="M12 22V7"/></svg></div>
        <span class="sidebar__item-label">Book Tickets</span>
      </div>

      <div class="sidebar__item">
        <div class="sidebar__item-icon"><svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg></div>
        <span class="sidebar__item-label">My Bookings</span>
        <span class="sidebar__badge">2</span>
      </div>

      <span class="sidebar__section-label" style="margin-top:0.75rem;">Account</span>

      <div class="sidebar__item">
        <div class="sidebar__item-icon"><svg viewBox="0 0 24 24"><path d="M20 12V22H4V12"/><path d="M22 7H2v5h20V7z"/><path d="M12 22V7"/></svg></div>
        <span class="sidebar__item-label">Membership</span>
      </div>

      <!-- UPDATE PROFILE — ACTIVE -->
      <div class="sidebar__item active">
        <div class="sidebar__item-icon"><svg viewBox="0 0 24 24"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg></div>
        <span class="sidebar__item-label">Update Profile</span>
      </div>

      <div class="sidebar__item">
        <div class="sidebar__item-icon"><svg viewBox="0 0 24 24"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/><path d="M13.73 21a2 2 0 0 1-3.46 0"/></svg></div>
        <span class="sidebar__item-label">Notifications</span>
        <span class="sidebar__badge">3</span>
      </div>

      <div class="sidebar__item">
        <div class="sidebar__item-icon"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="3"/><path d="M19.07 4.93a10 10 0 0 1 0 14.14M4.93 4.93a10 10 0 0 0 0 14.14"/></svg></div>
        <span class="sidebar__item-label">Settings</span>
      </div>
    </nav>

    <footer class="sidebar__footer">
      <div class="user-mini">
        <div class="user-avatar">PS</div>
        <div>
          <div class="user-mini__name">Priya Sharma</div>
          <div class="user-mini__tier">Sphere Plus</div>
        </div>
      </div>
    </footer>
  </aside>

  <!-- ═══ MAIN CONTENT ═══ -->
  <main class="panel-main">

    <!-- Top bar -->
    <div class="panel-topbar">
      <div>
        <div class="panel-topbar__title">Update <em>Profile</em></div>
        <div class="panel-topbar__sub">Manage your personal information, preferences and security</div>
      </div>
      <div style="display:flex;gap:10px;">
        <button class="btn-ghost-sm" onclick="history.back()">Cancel</button>
        <button class="btn-gold" onclick="saveProfile()">Save Changes</button>
      </div>
    </div>

    <!-- Profile content -->
    <div class="profile-content">

      <!-- Profile header card -->
      <div class="profile-header-card">
        <div style="position:relative;">
          <div class="profile-avatar-lg" id="avatarDisplay">PS
            <div class="avatar-upload-btn" onclick="document.getElementById('avatarInput').click()">
              <svg viewBox="0 0 24 24"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
            </div>
          </div>
          <input type="file" id="avatarInput" accept="image/*" style="display:none;" onchange="previewAvatar(this)">
        </div>
        <div class="profile-header-info">
          <div class="profile-header-name" id="headerName">Priya Sharma</div>
          <div class="profile-header-email" id="headerEmail">priya.sharma@email.com</div>
          <div class="profile-header-badges">
            <span class="ph-badge ph-badge--tier">Sphere Plus</span>
            <span class="ph-badge ph-badge--joined">Member since Jan 2026</span>
            <span class="ph-badge ph-badge--points">1,240 Points</span>
          </div>
        </div>
        <div style="margin-left:auto;text-align:right;">
          <div style="font-family:var(--font-display);font-size:42px;font-weight:300;color:var(--gold);line-height:1;">1,240</div>
          <div style="font-family:var(--font-ui);font-size:8px;font-weight:700;letter-spacing:0.18em;color:var(--text-muted);">SPHERE POINTS</div>
          <div style="margin-top:8px;">
            <div style="height:3px;background:rgba(255,255,255,0.07);border-radius:2px;overflow:hidden;width:160px;">
              <div style="height:100%;width:41%;background:linear-gradient(90deg,var(--gold-dim),var(--gold));border-radius:2px;"></div>
            </div>
            <div style="font-family:var(--font-ui);font-size:8px;font-weight:600;color:var(--text-muted);margin-top:3px;">41% to Elite · 1,760 pts needed</div>
          </div>
        </div>
      </div>


        <!-- Danger Zone — full width -->
        <div class="profile-section-card full-width">
          <div class="danger-zone">
            <div class="danger-zone-title">
              <svg viewBox="0 0 24 24"><path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"/><line x1="12" y1="9" x2="12" y2="13"/><line x1="12" y1="17" x2="12.01" y2="17"/></svg>
              Danger Zone
            </div>

            <div class="danger-action">
              <div class="danger-action-info">
                <div class="danger-action-label">Export My Data</div>
                <div class="danger-action-desc">Download a copy of all your booking history, personal data, and membership records.</div>
              </div>
              <button class="btn-ghost-sm">Request Export</button>
            </div>

            <div class="danger-action">
              <div class="danger-action-info">
                <div class="danger-action-label">Deactivate Account</div>
                <div class="danger-action-desc">Temporarily disable your account. You can reactivate anytime by signing back in.</div>
              </div>
              <button class="btn-ghost-sm">Deactivate</button>
            </div>

            <div class="danger-action">
              <div class="danger-action-info">
                <div class="danger-action-label">Delete Account</div>
                <div class="danger-action-desc">This will permanently delete all your data, bookings, and accumulated Sphere points. This cannot be undone.</div>
              </div>
              <a href="${pageContext.request.contextPath}/deleteaccount">
              <button class="btn-red" style="padding:9px 16px;font-size:10px;">Delete Account</button>
			</a>            
            </div>
          </div>
        </div>

      </div><!-- /profile-grid -->

      <!-- Save bar -->
      <div style="display:flex;justify-content:flex-end;gap:10px;margin-top:2rem;padding-top:1.5rem;border-top:1px solid var(--glass-border);">
        <button class="btn-ghost" onclick="history.back()">Cancel</button>
        <button class="btn-gold" onclick="saveProfile()" style="padding:12px 32px;">Save All Changes</button>
      </div>

    </div><!-- /profile-content -->
  </main>

</div>
</div><!-- /padding-top -->

<!-- Save Toast -->
<div id="saveToast">
  <div style="font-family:var(--font-ui);font-size:9px;font-weight:700;letter-spacing:0.15em;text-transform:uppercase;color:#4ade80;margin-bottom:4px;">Changes Saved ✓</div>
  <div style="font-family:var(--font-body);font-size:12px;color:var(--text);">Your profile has been updated successfully.</div>
</div>


</body>
</html>