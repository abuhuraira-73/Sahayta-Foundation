<!-- forgot-password.jsp -->
<html lang="zxx">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Forgot Password - Sahayta Foundation</title>
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
</head>
<body>
    <section id="forgot-password-area">
        <div class="container">
            <h3>Forgot Password</h3>

            <!-- Show email form first -->
            <div id="email-form">
                <form action="/ForgotPasswordServlet" method="post">

                    <input type="email" name="uemail" class="form-control" placeholder="Enter your registered email" required />
                    <input type="password" name="newpass" class="form-control" placeholder="Enter your new password" required />
                    <button type="submit" class="btn btn_theme">Submit</button>
                </form>
            </div>

            <!-- OTP verification form will appear here after email submission -->
            <div id="otp-form" style="display:none;">
                <form action="/NGO_3/VerifyOtpServlet" method="post">
                    <input type="text" name="otp" class="form-control" placeholder="Enter OTP" required />
                    <input type="hidden" name="uemail" value="" /> <!-- Hidden field to pass email -->
                    <input type="password" name="newpass" class="form-control" placeholder="Enter new password" required />
                    <button type="submit" class="btn btn_theme">Verify OTP</button>
                </form>
            </div>

            <!-- Success/Error messages -->
            <div id="message"></div>
        </div>
    </section>

    <script>
        // Show message if any
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('message')) {
            showMessage(urlParams.get('message'), 'danger');  // You can change 'danger' to 'success' depending on the message.
        }

        // Handle success or error messages dynamically
        function showMessage(message, type) {
            let messageDiv = document.getElementById("message");
            messageDiv.innerHTML = `<div class="alert alert-${type}">${message}</div>`;
        }

        // Show OTP form after email submission
        if (urlParams.has('otp')) {
            document.getElementById("otp-form").style.display = "block";
        }
    </script>
</body>
</html>
