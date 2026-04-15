<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CinoSphere</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
</head>

<body>

<jsp:include page="../components/header.jsp" />
    
<div class="screen" id="s-register">
  <div class="auth-wrap">
    <div class="auth-left">
      <div class="auth-left-bg"></div>
      <div class="grain"></div>
      <div class="auth-left-body">
        <div class="auth-logo">Cino<span>Sphere</span> <span style="font-size:9px;color:var(--crimson-bright);margin-left:5px;font-weight:700;letter-spacing:0.12em;font-family:var(--font-ui);">IMAX</span></div>
        <div class="registerInfo">
          <h2 class="auth-hero-headline">Become a<br><em>Sphere Member</em></h2>
          <p class="auth-hero-body">Step into a world of exclusive screenings, priority booking, and rewards every time you watch.</p>
          <div class="auth-feat-list">
            <div class="auth-feat-item"><div class="auth-feat-dot"></div><span class="auth-feat-text">Free Sphere Starter membership</span></div>
            <div class="auth-feat-item"><div class="auth-feat-dot"></div><span class="auth-feat-text">NPR 500 welcome credit on signup</span></div>
            <div class="auth-feat-item"><div class="auth-feat-dot"></div><span class="auth-feat-text">Early access to premiere tickets</span></div>
            <div class="auth-feat-item"><div class="auth-feat-dot"></div><span class="auth-feat-text">Earn points on every booking</span></div>
          </div>
        </div>
        <div>
          <div class="auth-ticker"><div class="tick-dot"></div><span class="tick-text">2,840 members joined this week</span></div>
          <span style="font-size:10px;color:var(--text-muted);margin-top:5px;display:block;font-family:var(--font-body);">Be part of Nepal's cinema future</span>
        </div>
      </div>
    </div>
    <div class="auth-right" style="align-items:flex-start;padding-top:1.5rem;overflow-y:auto;">
      <div class="auth-panel" style="max-width:440px;padding-top:1rem;">
        <div style="margin-bottom:2rem;">
          <h2 class="auth-panel-title">Create <em>Account</em></h2>
        </div>
        <div class="glass-panel" style="padding:1rem;">
          <div class="form-row-2">
            <div class="form-group"><label class="form-label">First Name</label><input type="text" class="form-input" placeholder="Priya"></div>
            <div class="form-group"><label class="form-label">Last Name</label><input type="text" class="form-input" placeholder="Sharma"></div>
          </div>
          <div class="form-group"><label class="form-label">Email Address</label><div class="input-wrap"><input type="email" class="form-input" placeholder="you@example.com"><span class="input-icon"><svg viewBox="0 0 24 24"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg></span></div></div>
          <div class="form-group"><label class="form-label">Preferred Location</label><select class="form-select"><option>Select nearest CinoSphere</option><option>Kathmandu — Opening Soon</option><option>Pokhara — Q3 2026</option><option>Biratnagar — Q4 2026</option><option>Butwal — 2027</option></select></div>
          <div class="form-group">
            <label class="form-label">Membership Tier</label>
            <div class="mem-selector">
              <div class="mem-opt sel"><span class="mem-tier">Starter</span><span class="mem-price">Free</span></div>
              <div class="mem-opt"><span class="mem-tier">Plus</span><span class="mem-price">₨499</span></div>
              <div class="mem-opt"><span class="mem-tier">Elite</span><span class="mem-price">₨999</span></div>
            </div>
          </div>
          <div class="form-row-2">
            <div class="form-group"><label class="form-label">Password</label><div class="input-wrap"><input type="password" class="form-input" placeholder="••••••••"><span class="input-icon"><svg viewBox="0 0 24 24"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg></span></div></div>
            <div class="form-group"><label class="form-label">Confirm</label><div class="input-wrap"><input type="password" class="form-input" placeholder="••••••••"><span class="input-icon"><svg viewBox="0 0 24 24"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg></span></div></div>
          </div>
          <div class="cb-group"><input type="checkbox" class="form-cb" id="t1"><label class="cb-label" for="t1">I agree to CinoSphere's <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a></label></div>
          <div class="cb-group" style="margin-bottom:1.5rem;"><input type="checkbox" class="form-cb" id="t2" checked><label class="cb-label" for="t2">Send me premiere alerts and member-only offers</label></div>
          <button class="btn-form-gold">Create My Account</button>
        </div>
        <p class="auth-switch">Already have an account? <a href="#" onclick="show('login',document.querySelectorAll('.dev-nav button')[1])">Sign in →</a></p>
      </div>
    </div>
  </div>
</div>

<jsp:include page="../components/footer.jsp" />
<script>
function show(name, btn) {
  document.querySelectorAll('.screen').forEach(s => s.classList.remove('active'));
  document.querySelectorAll('.dev-nav button').forEach(b => b.classList.remove('active'));
  document.getElementById('s-' + name).classList.add('active');
  if (btn) btn.classList.add('active');
  window.scrollTo(0, 0);
}
document.querySelectorAll('.mem-opt').forEach(opt => {
  opt.addEventListener('click', function() {
    document.querySelectorAll('.mem-opt').forEach(o => o.classList.remove('sel'));
    this.classList.add('sel');
  });
});
document.querySelectorAll('.tab-btn').forEach(btn => {
  btn.addEventListener('click', function() {
    const row = this.closest('.tab-row');
    row.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
    this.classList.add('active');
  });
});
</script>

</body>
</html>