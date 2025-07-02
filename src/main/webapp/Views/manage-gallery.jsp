<%@ page import="java.sql.*, jakarta.servlet.*, jakarta.servlet.http.*" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>User Dashboard - Sahayta Foundation</title>
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
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
        }

        #manage-gallery-section {
            padding: 50px 0;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        #manage-gallery-section h3 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 2em;
            color: #333;
        }

        .form-group label {
            font-size: 1.2em;
            color: #555;
        }

        .form-group input {
            padding: 15px;
            font-size: 1.1em;
            border-radius: 5px;
            border: 1px solid #ddd;
            width: 100%;
        }

        .form-group input:focus {
            outline: none;
            border-color: #007bff;
        }

        button {
            background-color: #ff7f32;
            color: white;
            font-size: 1.1em;
            padding: 12px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            display: block;
            margin: 20px auto;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #e26d1f;
        }

        .form-container {
            max-width: 500px;
            margin: 0 auto;
        }

        .btn-secondary {
            background-color: #007bff;
            color: white;
            font-size: 1.1em;
            padding: 12px 30px;
            border: none;
            border-radius: 5px;
            text-align: center;
            display: inline-block;
            margin-top: 20px;
            transition: background-color 0.3s;
        }

        .btn-secondary:hover {
            background-color: #0056b3;
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
                        <h2>User <span class="color_big_heading">Dashboard</span></h2>
                        <ul class="breadcrumb_wrapper">
                            <li class="breadcrumb_item"><a href="index.jsp">Home</a></li>
                            <li class="breadcrumb_item"><img src="../assets/img/icon/arrow.png" alt="img"></li>
                            <li class="breadcrumb_item active">User Dashboard</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Image Upload Form -->
    <section id="manage-gallery-section">
        <div class="container form-container">
            <h3>Upload New Image</h3>
            <form action="/NGO_3/UploadImageServlet" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="image">Select Image to Upload:</label>
                    <input type="file" name="image" id="image" class="form-control" required />
                </div>
                <button type="submit" class="btn btn-primary">Upload</button>
            </form>
        </div>
    </section>

    <!-- Main content -->

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
