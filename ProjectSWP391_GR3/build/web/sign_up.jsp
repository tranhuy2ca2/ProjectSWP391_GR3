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
    </head>

    <body class="d-flex justify-content-center align-items-center h-100 bg-light">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-5 col-md-7">
                    <!-- Card with shadow for better appearance -->
                    <div class="card p-4 shadow-lg border-0">
                        <div class="card-body">
                            <!-- Logo and link to home -->
                            <div class="text-center mb-4">
                                <img src="${pageContext.request.contextPath}/images/logo-daugia.png" alt="Logo" class="mb-3" style="width: 100px;">
                            </div>
                            <hr/><hr/>                            <hr/><hr/>
                            <hr/><hr/>
                            <hr/><hr/>

                            <!-- Sign Up Title -->
                            <h2 class="text-center mb-4">Đăng kí tài khoản đấu giá</h2>

                            <!-- Error Message -->
                            <p class="text-danger text-center">${err}</p>

                            <!-- Sign-up Form -->
                         <form action="${pageContext.request.contextPath}/Signup" method="post">


                                <div class="container mt-4">
                                    <div class="form-group mb-3">
                                        <label class="form-label">Tên đăng nhập*</label>
                                        <input class="form-control h_50" type="text" name="username" placeholder="Nhập tên đăng nhập" value="${username}" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="form-label">Họ và Tên*</label>
                                        <input class="form-control h_50" type="text" name="fullname" placeholder="Nhập họ tên của bạn" value="${fullname}" required>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <label class="form-label">Địa chỉ*</label>
                                            <input class="form-control h_50" type="text" name="address" placeholder="Nhập địa chỉ của bạn" value="${address}" required>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Số điện thoại*</label>
                                            <input class="form-control h_50" type="text" name="phone" placeholder="Nhập số điện thoại " value="${phone}" required>
                                        </div>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label class="form-label">Email*</label>
                                        <input class="form-control h_50" type="email" name="Email" placeholder="Nhập Email của bạn" value="${Email}" required>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <label class="form-label">Mật khẩu*</label>
                                            <input class="form-control h_50" type="password" name="password" placeholder="Nhập mật khẩu của bạn" required>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Xác nhận mật khẩu*</label>
                                            <input class="form-control h_50" type="password" name="repassword" placeholder="Nhập lại mật khẩu" required>
                                        </div>
                                    </div>



                                    <div class="form-group mb-3">
                                        <input type="checkbox" id="agreeTerms" name="agreeTerms" required>
                                        <label for="agreeTerms">Tôi đã đọc và đồng ý với <a href="terms.html">chính sách bảo mật</a> và <a href="terms.html"> điều khoản .</a></label>
                                    </div>

                                    <button class="btn btn-primary w-100 mt-3" type="submit">Đăng kí</button>
                            </form>

                            <!-- Alternative Sign In -->
                            <div class="text-center mt-4">
                                Đã có tài khoản? <a href="sign_in.jsp" class="text-primary">Đăng nhập</a>.
                            </div>

                            <!-- Divider for social login -->
                            <div class="d-flex align-items-center justify-content-center mt-4">
                                <hr class="w-25">
                                <span class="px-2 text-muted">hoặc</span>
                                <hr class="w-25">
                            </div>

                            <!-- Social Login Button -->
                            <div class="text-center mt-3">
                                <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:8080/Project_SWP391/loginGoogleHandler&response_type=code&client_id=260351764288-fighfnvm17mondoe94g4g7cpntuc7jlt.apps.googleusercontent.com&approval_prompt=force"
                                   class="btn btn-outline-secondary w-100 d-flex align-items-center justify-content-center">
                                    <i class="fab fa-google me-2"></i> Đăng nhập với Google
                                </a>
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
