<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Make a Donation - Sahayta Foundation</title>
<link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="../assets/css/animate.min.css" />
<link rel="stylesheet" href="../assets/css/fontawesome.all.min.css" />
<link rel="stylesheet" href="../assets/css/owl.carousel.min.css" />
<link rel="stylesheet" href="../assets/̥css/owl.theme.default.min.css" />
<link rel="stylesheet" href="../assets/css/navber.css" />
<link rel="stylesheet" href="../assets/css/meanmenu.css" />
<link rel="stylesheet" href="../assets/css/style.css" />
<link rel="stylesheet" href="../assets/css/responsive.css" />
<link rel="icon" type="image/png" href="../assets/img/favicon.png">
</head>

<body>
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
					<div></div>
				</div>
			</div>
		</div>
	</div>

	<div id="header-placeholder"></div>

	<div class="search-overlay">
		<div class="d-table">
			<div class="d-table-cell">
				<div class="search-overlay-layer"></div>
				<div class="search-overlay-layer"></div>
				<div class="search-overlay-layer"></div>
				<div class="search-overlay-close">
					<span class="search-overlay-close-line"></span> <span
						class="search-overlay-close-line"></span>
				</div>
				<div class="search-overlay-form">
					<form>
						<input type="text" class="input-search"
							placeholder="Search here...">
						<button type="button">
							<i class="fas fa-search"></i>
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<section id="common_banner_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="commn_banner_page">
						<h2>
							Make a <span class="color_big_heading">donation</span>
						</h2>
						<ul class="breadcrumb_wrapper">
							<li class="breadcrumb_item"><a href="index.jsp">Home</a></li>
							<li class="breadcrumb_item"><img
								src="../assets/img/icon/arrow.png" alt="img"></li>
							<li class="breadcrumb_item active">Make a donation</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="make_donation_area" class="section_padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3 col-md-12 col-sm-12 col-12">
					<div class="section_heading">
						<h3>Make a donation</h3>
						<h2>
							<span class="color_big_heading">Donate</span> now to help the <br>
							people
						</h2>
					</div>
				</div>
			</div>
			<div class="row" id="counter">
				<div class="col-lg-8">
					<div class="details_wrapper_area">
						<form action="/NGO_3/DonationServlet" method="post">
							<div class="donet_amount_form_area doner_content_pbottom">
								<h3>Enter your details</h3>
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<input type="text" class="form-control" name="fname"
												placeholder="Enter first name*" required />
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<input type="text" class="form-control" name="lname"
												placeholder="Enter last name*" required />
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<input type="email" class="form-control" name="email"
												value="${sessionScope.userEmail}" readonly required />
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<input type="text" class="form-control" name="phone"
												placeholder="Enter phone number*" 
												pattern="^[0-9]{10}$"
												title="Phone number must be exactly 10 digits."
												required />
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<input type="text" class="form-control" name="address"
												placeholder="Enter address*" required />
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<input type="number" class="form-control" name="amount"
												placeholder="Enter donation amount*" 
												min="1"
												title="Amount must be a positive number."
												required />
										</div>
									</div>
								</div>
							</div>
							<div class="payment_amount_submit">
								<button class="btn btn_theme btn_md">Donate now</button>
							</div>
						</form>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="sidebar_first">
						<div class="project_recentdonet_wrapper sidebar_boxed">
							<div class="sidebar_heading_main">
								<h3>Recent donations</h3>
							</div>
							<div class="recent_donet_item">
								<div class="recent_donet_img">
									<a href="cause-details.html"><img
										src="../assets/img/sidebar/rec-donet-1.png" alt="img"></a>
								</div>
								<div class="recent_donet_text">
									<div class="sidebar_inner_heading">
										<h4>
											<a href="cause-details.html">Abu Huraira</a>
										</h4>
										<h5>$1.00</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div id="footer-placeholder"></div>

	<div class="go-top">
		<i class="fas fa-chevron-up"></i> <i class="fas fa-chevron-up"></i>
	</div>

	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/bootstrap.bundle.js"></script>
	<script src="../assets/js/jquery.meanmenu.js"></script>
	<script src="../assets/js/owl.carousel.min.js"></script>
	<script src="../assets/js/wow.min.js"></script>
	<script src="../assets/js/waypoints.min.js"></script>
	<script src="../assets/js/jquery.counterup.min.js"></script>
	<script src="../assets/js/custom.js"></script>
	<script src="../assets/js/custom-progress-bar.js"></script>
	<script src="../assets/js/custom-scroll-count.js"></script>

	<script>
		// Load header from the shared folder
		fetch('../shared/header.jsp')
			.then(response => response.text())
			.then(data => document.getElementById('header-placeholder').innerHTML = data);

		// Load footer from the shared folder
		fetch('../shared/footer.html')
			.then(response => response.text())
			.then(data => document.getElementById('footer-placeholder').innerHTML = data);
	</script>

</body>

</html>
