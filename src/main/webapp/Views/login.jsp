<html lang="zxx">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login - Sahayta Foundation</title>
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../assets/css/animate.min.css" />
    <link rel="stylesheet" href="../assets/css/fontawesome.all.min.css" />
    <link rel="stylesheet" href="../assets/css/owl.carousel.min.css" />
    <link rel="stylesheet" href="../assets/css/navber.css" />
    <link rel="stylesheet" href="../assets/css/meanmenu.css" />
    <link rel="stylesheet" href="../assets/css/style.css" />
    <link rel="stylesheet" href="../assets/css/responsive.css" />
    <link rel="icon" type="image/png" href="../assets/img/favicon.png">
</head>
<body>
    <!-- Preloader Area -->
    <div class="preloader">
        <div class="d-table">
            <div class="d-table-cell">
                <div class="lds-spinner">
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </div>
        </div>
    </div>

    <!-- Header Area -->
    <div id="header-placeholder"></div>

    <!-- Banner Area -->
    <section id="common_banner_area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="commn_banner_page">
                        <h2><span class="color_big_heading">Login</span></h2>
                        <ul class="breadcrumb_wrapper">
                            <li class="breadcrumb_item"><a href="index.jsp">Home</a></li>
                            <li class="breadcrumb_item"><img src="../assets/img/icon/arrow.png" alt="img"></li>
                            <li class="breadcrumb_item active">Login</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Login Form Area -->
    <section id="login_area" class="section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="section_heading">
                        <h3>Welcome Back</h3>
                        <h2>Login to <span class="color_big_heading">Sahayta Foundation</span></h2>
                    </div>

                    <!-- Show success message if registration is successful -->
                    <%
                        String message = request.getParameter("message");
                        if (message != null) {
                    %>
                        <div class="alert alert-success">
                            <%= message %>
                        </div>
                    <%
                        }
                    %>

                    <div class="author_form_area">
                        <form action="/NGO_3/LoginProcess" method="post" id="author_form">
                            <div class="form-group">
                                <input type="email" name="uemail" class="form-control" placeholder="Enter email" 
                                       value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" required />
                            </div>
                            <div class="form-group">
                                <input type="password" id="loginPassword" name="upass" class="form-control" placeholder="Enter password" required />
                                <br>
                                <input type="checkbox" id="showLoginPassword" onclick="toggleLoginPassword()" />
                                <label for="showLoginPassword">Show Password</label>
                            </div>
                            
                            <div class="author_submit_form">
                                <button type="submit" class="btn btn_theme btn_md">Login</button>
                                <p>Don't have an account? <a href="register.jsp">Register now</a></p>
                                <p><a href="forgot-password.jsp">Forgot Password?</a></p>
                            </div>
                        </form>

                        <script>
                            function toggleLoginPassword() {
                                const passwordField = document.getElementById("loginPassword");
                                if (passwordField.type === "password") {
                                    passwordField.type = "text";
                                } else {
                                    passwordField.type = "password";
                                }
                            }
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer Area -->
    <div id="footer-placeholder"></div>

    <!-- Go Top Area -->
    <div class="go-top">
        <i class="fas fa-chevron-up"></i>
        <i class="fas fa-chevron-up"></i>
    </div>

    <!-- JavaScript Files -->
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.bundle.js"></script>
    <script src="../assets/js/jquery.meanmenu.js"></script>
    <script src="../assets/js/owl.carousel.min.js"></script>
    <script src="../assets/js/wow.min.js"></script>
    <script src="../assets/js/waypoints.min.js"></script>
    <script src="../assets/js/jquery.counterup.min.js"></script>
    <script src="../assets/js/custom.js"></script>

    <script>
        // Load header and footer from shared files
        fetch('../shared/header.jsp')
            .then(response => response.text())
            .then(data => document.getElementById('header-placeholder').innerHTML = data);

        fetch('../shared/footer.html')
            .then(response => response.text())
            .then(data => document.getElementById('footer-placeholder').innerHTML = data);
    </script>
</body>
</html>
