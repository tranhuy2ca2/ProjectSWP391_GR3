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
                                <img src="images/logo.png" alt="Logo" class="mb-3" style="width: 100px;">
                            </div>

                            <!-- Sign In Title -->
                            <h2 class="text-center mb-4">Đăng nhập vào đấu giá</h2>
                            <p class="text-danger text-center" style="color: red">${mess}</p>
                            <% 
                                String signupSuccess = (String) session.getAttribute("signupSuccess");
                                if (signupSuccess != null) {
                            %>
                            <div class="alert alert-success text-center">
                                <%= signupSuccess %>
                            </div>
                            <%
                                    // Remove the attribute after displaying the message
                                    session.removeAttribute("signupSuccess");
                                }
                            %>

                            <!-- Sign-in Form -->
                            <form action="login" method="post">
                                <input type="hidden" name="type" value="form">

                                <div class="form-group mb-3">
                                    <label class="form-label">Tài Khoản của bạn*</label>
                                    <input class="form-control h_50" type="username" name="username" placeholder="Nhập username của bạn" 
                                           value="${cookie.cuser.value}" required>
                                </div>

                                <div class="form-group mb-3">
                                    <label class="form-label d-flex justify-content-between">
                                        Mật khẩu* 
                                        <a class="forgot-pass-link" href="forgot?action=customer">Quên mật khẩu?</a>
                                    </label>
                                    <input class="form-control h_50" type="password" name="password" placeholder="Nhập mật khẩu của bạn" 
                                           value="${cookie.cpass.value}" required>
                                </div>
                                <div class="pass-link">
                                    <input type="checkbox" ${(cookie.crem != null ? 'checked' : '')} name="rem" value="ON"/> Nhớ tài khoản  
                                </div>
                                <button class="btn btn-primary w-100 mt-3" type="submit">Đăng nhập <i class="fas fa-sign-in-alt ms-2"></i></button>
                            </form>

                            <div class="text-center mt-3">
                                New to Auction? <a class="text-primary" href="sign_up.jsp">Đăng kí</a>
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
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/OwlCarousel/owl.carousel.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/night-mode.js"></script>
    </body>

</html>