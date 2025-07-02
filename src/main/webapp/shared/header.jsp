<header class="main_header_arae">
    <!-- Top Bar -->
    <div class="topbar-area">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6">
                    <ul class="topbar-list">
                        <li><a href="contact.html"><i class="fa fa-envelope"></i><span>sahaytafoundation4@gmail.com</span></a></li>
                        <li><a href="contact.html"><i class="fa fa-phone"></i><span>+91 12345 678980</span></a></li>
                        <li><a href="faqs.html"><span>Faqs</span></a></li>
                    </ul>
                </div>
                <div class="col-lg-6 col-md-6">
                    <ul class="topbar-list-right">
                        <li><a href="#!"><i class="fab fa-facebook"></i></a></li>
                        <li><a href="#!"><i class="fab fa-twitter-square"></i></a></li>
                        <li><a href="#!"><i class="fab fa-instagram"></i></a></li>
                        <li><a href="#!"><i class="fab fa-linkedin"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Navbar Bar -->
    <div class="navbar-area">
        <div class="main-responsive-nav">
            <div class="container">
                <div class="main-responsive-menu">
                    <div class="logo">
                        <a href="index.jsp">
                            <img src="../assets/img/logo2.png" alt="logo" width="189" height="54">
                        </a>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="main-navbar">
            <div class="container">
                <nav class="navbar navbar-expand-md navbar-light">
                    <a class="navbar-brand" href="index.jsp">
                        <img src="../assets/img/logo2.png" alt="logo" width="150" height="54">
                    </a>
                    <div class="collapse navbar-collapse mean-menu" id="navbarSupportedContent">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a href="index.jsp" class="nav-link">Home</a>
                            </li>
                            <li class="nav-item">
                                <a href="causes.html" class="nav-link">Causes</a>
                            </li>
                            <li class="nav-item">
                                <a href="events.html" class="nav-link">Events</a>
                            </li>
                            <li class="nav-item">
                                <a href="gallery-grid.jsp" class="nav-link">Gallery</a>
                            </li>
                            <li class="nav-item">
                                <a href="about.html" class="nav-link">About</a>
                            </li>
                            <li class="nav-item">
                                <a href="news.html" class="nav-link">News</a>
                            </li>
                            <li class="nav-item">
                                <a href="contact.html" class="nav-link">Contact</a>
                            </li>
                            
                        </ul>
                        
                        <div class="others-options d-flex align-items-center">
                            <!-- Conditional Rendering of Login/Register or Username/Logout/Donate -->
                            <%
                                String username = (String) session.getAttribute("user");
                                String userRole = (String) session.getAttribute("role"); // Get user role
                                if (username != null) {
                            %>
                                <!-- Display Donate, Username, and Logout Buttons -->
                                <div class="option-item">
                                    <a href="make-donation.jsp" class="btn btn_navber">Donate</a>
                                </div>
                                
                                <!-- Check if the user is admin or regular user -->
                                <div class="option-item">
                                    <% if ("admin".equals(userRole)) { %>
                                        <a href="admin-dashboard.jsp" class="btn btn_navber">Admin Dashboard</a>
                                    <% } else { %>
                                        <a href="user-dashboard.jsp" class="btn btn_navber">Welcome, <%= username %></a>
                                    <% } %>
                                </div>
                                
                                <div class="option-item">
                                    <a href="/NGO_3/LogoutServlet" class="btn btn_navber">Logout</a>
                                </div>
                            <%
                                } else {
                            %>
                                <!-- Display Login and Register Buttons -->
                                <div class="option-item">
                                    <a href="login.jsp" class="btn btn_navber">Login</a>
                                </div>
                                <div class="option-item">
                                    <a href="registration.jsp" class="btn btn_navber">Register</a>
                                </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </nav>
            </div>
        </div>

        <!-- Mobile Menu -->
        <div class="others-option-for-responsive">
            <div class="container">
                <div class="dot-menu">
                    <div class="inner">
                        <div class="circle circle-one"></div>
                        <div class="circle circle-two"></div>
                        <div class="circle circle-three"></div>
                    </div>
                </div>
                
                <div class="container">
                    <div class="option-inner">
                        <div class="others-options d-flex align-items-center">
                            <%
                                if (username != null) {
                            %>
                                <!-- Donate Button for Mobile when Logged In -->
                                <div class="option-item">
                                    <a href="make-donation.jsp" class="btn btn_navber">Donate</a>
                                </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
