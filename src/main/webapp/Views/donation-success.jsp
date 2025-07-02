<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Title -->
    <title>Thanks - ̥Sahayta Foundation</title>
    <!-- Bootstrap css -->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
    <!-- animate css -->
    <link rel="stylesheet" href="../assets/css/animate.min.css" />
    <!-- Fontawesome css -->
    <link rel="stylesheet" href="../assets/css/fontawesome.all.min.css" />
    <!-- owl.carousel css -->
    <link rel="stylesheet" href="../assets/css/owl.carousel.min.css" />
    <!-- owl.theme.default css -->
    <link rel="stylesheet" href="../assets/css/owl.theme.default.min.css" />
    <!-- navbar css -->
    <link rel="stylesheet" href="../assets/css/navber.css" />
    <!-- meanmenu css -->
    <link rel="stylesheet" href="../assets/css/meanmenu.css" />
    <!-- Style css -->
    <link rel="stylesheet" href="../assets/css/style.css" />
    <!-- Responsive css -->
    <link rel="stylesheet" href="../assets/css/responsive.css" />
    <!-- Favicon -->
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

    <!-- Donation Success Area -->
    <section id="donation_success_area" class="section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-12 col-sm-12 col-12">
                    <div class="section_heading">
                        <h2>Thank you for your <span class="color_big_heading">donation</span></h2>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="author_form_area">
                        <!-- Display username if logged in -->
                        <h2>Hi, <%= session.getAttribute("user") %>! Thank you for your generous donation.</h2>
                        <br>
                        <p>Your donation helps us continue our mission to support those in need. Your contribution will make a real difference.</p>

                        <div class="author_submit_form">
                            <!-- Redirect to index.jsp -->
                            <a href="index.jsp" class="btn btn_theme btn_md">Back to Home</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Top To Bottom Area -->
    <div class="go-top">
        <i class="fas fa-chevron-up"></i>
        <i class="fas fa-chevron-up"></i>
    </div>

    <script src="../assets/js/jquery.min.js"></script>
    <!-- Bootstrap js -->
    <script src="../assets/js/bootstrap.bundle.js"></script>
    <!-- Meanu js -->
    <script src="../assets/js/jquery.meanmenu.js"></script>
    <!-- owl carousel js -->
    <script src="../assets/js/owl.carousel.min.js"></script>
    <!-- wow.js -->
    <script src="../assets/js/wow.min.js"></script>
    <!-- waypoints.js -->
    <script src="../assets/js/waypoints.min.js"></script>
    <!-- counterup.js -->
    <script src="../assets/js/jquery.counterup.min.js"></script>
    <!-- Custom js -->
    <script src="../assets/js/custom.js"></script>


</body>

</html>
