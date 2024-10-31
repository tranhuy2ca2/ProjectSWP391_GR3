<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="h-100">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, shrink-to-fit=9">
        <meta name="description" content="Gambolthemes">
        <meta name="author" content="Gambolthemes">
        <title>Auction - Hệ thống đấu giá đất</title>

        <!-- Stylesheets -->
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/vendor/unicons-2.0.1/css/unicons.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/responsive.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/night-mode.css" rel="stylesheet">

        <!-- Vendor Stylesheets -->
        <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/vendor/OwlCarousel/assets/owl.carousel.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
        <style>
            /* From Uiverse.io by KapeParaguay */
            .form {
                display: flex;
                flex-direction: column;
                gap: 10px;
                background: linear-gradient(45deg, red, yellow);
                padding: 30px;
                width: 450px;
                border-radius: 20px;
                font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
                    Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
                transition: background 0.3s ease;
            }

            .form:hover {
                background: linear-gradient(45deg, yellow, red);
            }

            ::placeholder {
                font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
                    Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
            }

            .form button {
                align-self: flex-end;
            }

            .flex-column > label {
                color: #151717;
                font-weight: 600;
            }

            .inputForm {
                border: 1.5px solid #ecedec;
                border-radius: 10em;
                height: 50px;
                display: flex;
                align-items: center;
                padding-left: 10px;
                transition: 0.2s ease-in-out;
                background-color: white;
            }

            .input {
                margin-left: 10px;
                border-radius: 10rem;
                border: none;
                width: 100%;
                height: 100%;
            }

            .input:focus {
                outline: none;
            }

            .inputForm:focus-within {
                border: 1.5px solid #2d79f3;
            }

            .flex-row {
                display: flex;
                flex-direction: row;
                align-items: center;
                gap: 10px;
                justify-content: space-between;
            }

            .flex-row > div > label {
                font-size: 14px;
                color: black;
                font-weight: 400;
            }

            .span {
                font-size: 14px;
                margin-left: 5px;
                color: white;
                font-weight: 500;
                cursor: pointer;
            }

            .button-submit {
                position: relative;
                display: inline-block;
                padding: 15px 30px;
                text-align: center;
                letter-spacing: 1px;
                text-decoration: none;
                background: transparent;
                transition: ease-out 0.5s;
                border: 2px solid;
                border-radius: 10em;
                box-shadow: inset 0 0 0 0 red;
                margin: 20px 0 10px 0;
                color: white;
                font-size: 15px;
                font-weight: 500;
                height: 50px;
                width: 100%;
                cursor: pointer;
            }

            .button-submit:hover {
                color: white;
                box-shadow: inset 0 -100px 0 0 darkorange;
            }

            .button-submit:active {
                transform: scale(0.9);
            }

            .p {
                text-align: center;
                color: black;
                font-size: 14px;
                margin: 5px 0;
            }

            .btn {
                margin-top: 10px;
                width: 100%;
                height: 50px;
                border-radius: 10em;
                display: flex;
                justify-content: center;
                align-items: center;
                font-weight: 500;
                gap: 10px;
                border: 1px solid #ededef;
                background-color: white;
                cursor: pointer;
                transition: 0.2s ease-in-out;
            }

            .btn:hover {
                border: 1px solid #2d79f3;
            }

        </style>
    </head>

    <body class="d-flex justify-content-center align-items-center h-100 bg-light" style=" background-image: url('images/2406_hinh-nen-xanh-la-cay-cho-may-tinh43.jpg'); 
             background-size: cover; 
             background-position: center; 
             background-repeat: no-repeat;">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-5 col-md-7">
                    <!-- Card with shadow for better appearance -->
                    <div class="card p-4 shadow-lg border-0 form">
                        <div class="card-body">
                            <!-- Logo and link to home -->
                            <div class="text-center mb-4">
                                <img src="${pageContext.request.contextPath}/images/logo-daugia.png" alt="Logo" class="mb-3" style="width: 100px;">
                            </div>
                            <br/><br/>                            
                            <br/><br/> 
                            <br/><br/> 
                            <br/><br/> 
                            <!-- Sign Up Title -->
                            <h2 class="text-center mb-4">Đăng kí tài khoản đấu giá</h2>

                            <!-- Error Message -->
                            <p class="text-danger text-center">${err}</p>

                            <!-- Sign-up Form -->
                            <form action="${pageContext.request.contextPath}/Signup" method="post">


                                <div class="container mt-4">
                                    <div class="form-group mb-3">
                                        <label class="form-label">Tên đăng nhập*</label>
                                        <input class="form-control h_50" type="text" name="username" 
                                               placeholder="Nhập tên đăng nhập" value="${username}" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="form-label">Họ và Tên*</label>
                                        <input class="form-control h_50" type="text" name="fullname" 
                                               placeholder="Nhập họ tên của bạn" value="${fullname}" required>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <label class="form-label">Địa chỉ*</label>
                                            <input class="form-control h_50" type="text" name="address" 
                                                   placeholder="Nhập địa chỉ của bạn" value="${address}" required>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Số điện thoại*</label>
                                            <input class="form-control h_50" type="text" name="phone" 
                                                   placeholder="Nhập số điện thoại " value="${phone}" required>
                                            <small class="form-text text-muted">Số điện thoại phải là 10 chữ số và bắt đầu bằng số 0</small>
                                        </div>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label class="form-label">Email*</label>
                                        <input class="form-control h_50" type="email" name="Email" 
                                               placeholder="Nhập Email của bạn" value="${Email}" required>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <label class="form-label">Mật khẩu*</label>
                                            <input class="form-control h_50" type="password" name="password" 
                                                   placeholder="Nhập mật khẩu của bạn" required>
                                            <small class="form-text text-muted">
                                                Mật khẩu từ 8 đến 20 kí tự bao gồm ít nhất chữ cái thường, chữ hoa, số, và có 1 ký tự đặc biệt
                                            </small>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Xác nhận mật khẩu*</label>
                                            <input class="form-control h_50" type="password" name="repassword" 
                                                   placeholder="Nhập lại mật khẩu" required>
                                        </div>
                                    </div>



                                    <div class="form-group mb-3">
                                        <input type="checkbox" id="agreeTerms" name="agreeTerms" required>
                                        <label for="agreeTerms">Tôi đã đọc và đồng ý với <a href="terms.html">chính sách bảo mật</a> và 
                                            <a href="terms.html"> điều khoản .</a></label>
                                    </div>

                                    <button class="btn btn-primary w-100 mt-3 button-submit" type="submit">Đăng kí</button>
                            </form>

                            <!-- Alternative Sign In -->
                            <div class="text-center mt-4">
                                Đã có tài khoản? <a href="sign_in.jsp" class="span">Đăng nhập</a>.
                            </div>
                        </div>
                    </div>

                    <div class="text-center mt-3">
                        <p class="text-muted">© 2024 Hệ thống đấu giá đất</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- JavaScript Files -->
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/OwlCarousel/owl.carousel.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/night-mode.js"></script>
    </body>

</html>
