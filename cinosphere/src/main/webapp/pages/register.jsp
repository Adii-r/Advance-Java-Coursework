<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | CinoSphere</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
</head>

<body>

<jsp:include page="../components/header.jsp" />
        
<main class="registration_screen">
  <div class="authentication_layout_wrapper">
    
    <div class="authentication_left_column">
      <div class="authentication_background_overlay"></div>
      
      <div class="authentication_body_content">
          <div class="registration_information_block">
            <h2 class="authentication_hero_headline">Become a<br><em>Sphere Member</em></h2>
            <p class="authentication_hero_body">Join the Sphere circle to experience priority bookings, exclusive member rewards & unforgettable premiere nights.</p>
            
            <div class="authentication_feature_list">
              <div class="authentication_feature_item">
                <div class="authentication_feature_dot"></div>
                <span class="authentication_feature_text">Exclusive member rewards & special screenings</span>
              </div>
              <div class="authentication_feature_item">
                <div class="authentication_feature_dot"></div>
                <span class="authentication_feature_text">NPR 500 welcome credit on signup</span>
              </div>
              <div class="authentication_feature_item">
                <div class="authentication_feature_dot"></div>
                <span class="authentication_feature_text">Early access to premiere tickets</span>
              </div>
              <div class="authentication_feature_item">
                <div class="authentication_feature_dot"></div>
                <span class="authentication_feature_text">Earn points on every booking</span>
              </div>
            </div>
          </div>
        </div>
     </div>

    <div class="authentication_right_section">
      <div class="authentication_panel_container">
        
        <div class="registration_header_area">
          <h2 class="authentication_panel_title">Create <em>Account</em></h2>
          <p class="authentication_panel_subtitle">Join CinoSphere - Enter your details to get started</p>
        </div>

        <div class="glass_panel_container">
          <form action="RegisterServlet" method="POST">
              <div class="form_row_double">
                <div class="form_group_wrapper">
                  <label class="form_label_text">First Name</label>
                  <input type="text" name="firstName" class="form_input_field" placeholder="Aditya" required>
                </div>
                <div class="form_group_wrapper">
                  <label class="form_label_text">Last Name</label>
                  <input type="text" name="lastName" class="form_input_field" placeholder="Raut" required>
                </div>
              </div>

              <div class="form_group_wrapper">
                <label class="form_label_text">Email Address</label>
                <div class="form_input_wrapper">
                  <input type="email" name="email" class="form_input_field" placeholder="aditya@gmail.com" required>
                  <span class="form_input_icon"> 
		              <img src="${pageContext.request.contextPath}/assets/icons/mail.svg" alt="Mail" />
		            </span>
                </div>
              </div>

              <div class="form_group_wrapper">
                <label class="form_label_text">Preferred Location</label>
                <select name="location" class="form_select_field">
                  <option value="ktm">Kathmandu</option>
                  <option value="pkr">Pokhara</option>
                  <option value="brt">Biratnagar</option>
                </select>
              </div>

              <div class="form_group_wrapper">
                <label class="form_label_text">Membership Tier</label>
                <div class="membership_selector_row">
                  <label class="membership_option_card">
                  	<input type="radio" name="membership" value="starter" checked hidden>
                    <span class="membership_tier_name">Starter</span>
                    <span class="membership_price_label">Free</span>
                  </label>
                  <label class="membership_option_card">
                  	<input type="radio" name="membership" value="plus" checked hidden>
                    <span class="membership_tier_name">Plus</span>
                    <span class="membership_price_label">Rs 499</span>
                  </label>
                  <label class="membership_option_card">
                  	<input type="radio" name="membership" value="elite" checked hidden>
                    <span class="membership_tier_name">Elite</span>
                    <span class="membership_price_label">Rs 999</span>
                  </label>
                </div>
              </div>

              <div class="form_row_double">
                <div class="form_group_wrapper">
                  <label class="form_label_text">Password</label>
                  <div class="form_input_wrapper">
                    <input type="password" name="password" class="form_input_field" placeholder="••••••••" required>
                    <span class="form_input_icon"> 
		              <img src="${pageContext.request.contextPath}/assets/icons/lock.svg" alt="Lock" />
		            </span>
                  </div>
                </div>
                <div class="form_group_wrapper">
                  <label class="form_label_text">Confirm</label>
                  <div class="form_input_wrapper">
                    <input type="password" name="confirmPassword" class="form_input_field" placeholder="••••••••" required>
                    <span class="form_input_icon"> 
		              <img src="${pageContext.request.contextPath}/assets/icons/checkmark.svg" alt="Checkmark" />
		            </span>
                  </div>
                </div>
              </div>
              <button type="submit" class="primary_form_button_gold">Get Started</button>
          </form>
          <p class="authentication_switch_text">Already have an account? <a href="login.jsp">Sign in</a></p>
        </div>

        
      </div>
    </div>

  </div>
</main>

<jsp:include page="../components/footer.jsp" />

</body>
</html>