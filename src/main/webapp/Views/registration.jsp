<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Register - Sahayta foundation</title>
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
						<h2>
							<span class="color_big_heading">Register</span>
						</h2>
						<ul class="breadcrumb_wrapper">
							<li class="breadcrumb_item"><a href="index.jsp">Home</a></li>
							<li class="breadcrumb_item"><img
								src="../assets/img/icon/arrow.png" alt="img"></li>
							<li class="breadcrumb_item active">Register</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Registration Form Area -->
	<section id="registration_area" class="section_padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<div class="section_heading">
						<h3>Create an account</h3>
						<h2>
							Join our <span class="color_big_heading">community</span> and
							make a difference
						</h2>
					</div>
					<div class="author_form_area">
						<form action="/NGO_3/RegistrationProcess" method="post"
							id="author_form">
							<div class="form-group">
								<input type="text" name="uname" class="form-control"
									placeholder="Enter name" required />
							</div>
							<div class="form-group">
								<input type="email" name="uemail" class="form-control"
									placeholder="Enter email" required />
							</div>
							<div class="form-group">
								<input type="text" name="uphno" class="form-control"
									placeholder="Enter phone number" required />
							</div>
							<div class="form-group">
								<input type="password" id="password" name="upass"
									class="form-control" placeholder="Enter password" required />
								<br> <input type="checkbox" id="showPassword"
									onclick="togglePassword()" /> <label for="showPassword">Show
									Password</label>
							</div>
							<div class="author_submit_form">
								<button type="submit" class="btn btn_theme btn_md">Register</button>
							</div>
						</form>

						<script>
    function togglePassword() {
        const passwordField = document.getElementById("password");
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
		<i class="fas fa-chevron-up"></i> <i class="fas fa-chevron-up"></i>
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

        // Toggle password visibility
        function togglePasswordVisibility() {
            var passwordField = document.getElementById("passwordInput");
            if (passwordField.type === "password") {
                passwordField.type = "text";
            } else {
                passwordField.type = "password";
            }
        }
    </script>
</body>
</html>
