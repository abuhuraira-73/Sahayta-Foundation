
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin Dashboard - Sahayta Foundation</title>
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../assets/css/animate.min.css" />
    <link rel="stylesheet" href="../assets/css/fontawesome.all.min.css" />
    <link rel="stylesheet" href="../assets/css/owl.carousel.min.css" />
    <link rel="stylesheet" href="../assets/css/owl.theme.default.min.css" />
    <link rel="stylesheet" href="../assets/css/navber.css" />
    <link rel="stylesheet" href="../assets/css/meanmenu.css" />
    <link rel="stylesheet" href="../assets/css/style.css" />
    <link rel="stylesheet" href="../assets/css/responsive.css" />
    <link rel="icon" type="image/png" href="../assets/img/favicon.png">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 15px;
            text-align: center;
            font-size: 1.2em;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f8f9fa;
            font-weight: bold;
        }

        td {
            background-color: #fff;
        }

        tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
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
                </div>
            </div>
        </div>
    </div>

    <div id="header-placeholder"></div>

    <section id="common_banner_area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="commn_banner_page">
                        <h2>Admin <span class="color_big_heading">Dashboard</span></h2>
                        <ul class="breadcrumb_wrapper">
                            <li class="breadcrumb_item"><a href="index.jsp">Home</a></li>
                            <li class="breadcrumb_item"><img src="../assets/img/icon/arrow.png" alt="img"></li>
                            <li class="breadcrumb_item active">Admin Dashboard</li>
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
                        <h3>Admin Information</h3>
                        <h2><span class="color_big_heading">Welcome</span> to your admin dashboard</h2>
                    </div>
                </div>
            </div>

            <!-- Admin Dashboard Options -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="details_wrapper_area">
                        <h4>Dashboard Options</h4>
                        <!-- Links to admin functionalities -->
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th scope="col">Option</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- <tr>
                                    <td>Manage Users</td>
                                    <td><a href="manage-users.jsp" class="btn btn-primary">Go</a></td>
                                </tr> -->
                                <tr>
                                    <td>View Donations</td>
                                    <td><a href="view-donations.jsp" class="btn btn-primary">Go</a></td>
                                </tr>
                                <tr>
                                    <td>Manage Gallery</td>
                                    <td><a href="manage-gallery.jsp" class="btn btn-primary">Go</a></td>
                                </tr>
                                <!-- <tr>
                                    <td>Settings</td>
                                    <td><a href="settings.jsp" class="btn btn-primary">Go</a></td>
                                </tr> -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="../assets/js/jquery.min.js"></script>
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
    </script>

</body>

</html>
