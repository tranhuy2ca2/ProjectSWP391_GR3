<%-- 
    Document   : Contact
    Created on : Oct 17, 2024, 1:14:55 AM
    Author     : TTT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="author" content="Untree.co" />
        <link rel="shortcut icon" href="favicon.png" />

        <meta name="description" content="" />
        <meta name="keywords" content="bootstrap, bootstrap5" />

        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap"
            rel="stylesheet"
            />

        <link rel="stylesheet" href="fonts/icomoon/style.css" />
        <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css" />

        <link rel="stylesheet" href="css/tiny-slider.css" />
        <link rel="stylesheet" href="css/aos.css" />
        <link rel="stylesheet" href="css/style.css" />

        <title>
            Property &mdash; Free Bootstrap 5 Website Template by Untree.co
        </title>
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>

            <div
                class="hero page-inner overlay"
                style="background-image: url('images/hero_bg_1.jpg')"
                >
                <div class="container">
                    <div class="row justify-content-center align-items-center">
                        <div class="col-lg-9 text-center mt-5">
                            <h1 class="heading" data-aos="fade-up">Liên Hệ Với Chúng Tôi</h1>

                            <nav
                                aria-label="breadcrumb"
                                data-aos="fade-up"
                                data-aos-delay="200"
                                >
                                <ol class="breadcrumb text-center justify-content-center">
                                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                    <li
                                        class="breadcrumb-item active text-white-50"
                                        aria-current="page"
                                        >
                                        Liên Hệ
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <div class="section">
                <div class="container">
                    <div class="row">
                        <div
                            class="col-lg-4 mb-5 mb-lg-0"
                            data-aos="fade-up"
                            data-aos-delay="100"
                            >
                            <div class="contact-info">
                                <div class="address mt-2">
                                    <i class="icon-room"></i>
                                    <h4 class="mb-2">Vị Trí:</h4>
                                    <p>
                                        Trường Đại Học FPT Hòa Lạc
                                    </p>
                                </div>

                                <div class="open-hours mt-4">
                                    <i class="icon-clock-o"></i>
                                    <h4 class="mb-2">Giờ Mở Cửa:</h4>
                                    <p>
                                        Thứ 2 - Thứ 6:<br />
                                        11:00 AM - 2300 PM
                                    </p>
                                </div>

                                <div class="email mt-4">
                                    <i class="icon-envelope"></i>
                                    <h4 class="mb-2">Email:</h4>
                                    <p>huytdqhe173448@fpt.edu.vn</p>
                                </div>

                                <div class="phone mt-4">
                                    <i class="icon-phone"></i>
                                    <h4 class="mb-2">Điện Thoại:</h4>
                                    <p>0346842677</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8" data-aos="fade-up" data-aos-delay="200">
                            <form action="contact" method="post">
                            <c:if test="${sessionScope.user == null}"> 
                                <!-- Form dành cho người dùng chưa đăng nhập -->
                                <div class="row">
                                    <div class="col-6 mb-3">
                                        <input name="username" type="text" class="form-control" placeholder="Tên Của Bạn" />
                                    </div>
                                    <div class="col-6 mb-3">
                                        <input name="email" type="email" class="form-control" placeholder="Email Của Bạn" />
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input name="subject" type="text" class="form-control" placeholder="Tiêu Đề" />
                                    </div>
                                    <div class="col-12 mb-3">
                                        <textarea name="detail" cols="30" rows="7" class="form-control" placeholder="Lời Nhắn"></textarea>
                                    </div>
                                    <div class="col-12">
                                        <input type="submit" value="Gửi" class="btn btn-primary" />
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.user != null}">  
                                <!-- Form dành cho người dùng đã đăng nhập -->
                                <div class="row">
                                    <div class="col-6 mb-3">
                                        <input name="username" type="text" value="${user.fullName}" class="form-control" 
                                               placeholder="Tên Của Bạn" readonly="" />
                                    </div>
                                    <div class="col-6 mb-3">
                                        <input name="email" type="email" value="${user.email}" class="form-control" 
                                               placeholder="Email Của Bạn" readonly="" />
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input name="subject" type="text" class="form-control" placeholder="Tiêu Đề" required="" />
                                    </div>
                                    <div class="col-12 mb-3">
                                        <textarea name="detail" cols="30" rows="7" class="form-control" required="" placeholder="Lời Nhắn"></textarea>
                                    </div>
                                    <div class="col-12">
                                        <input type="submit" value="Gửi" class="btn btn-primary" />
                                    </div>
                                </div>
                            </c:if>    
                        </form>
                    </div>

                    <!-- JavaScript để hiển thị alert khi gửi thành công -->
                    <script>
                        // Lấy URL hiện tại
                        const urlParams = new URLSearchParams(window.location.search);
                        // Kiểm tra tham số status
                        if (urlParams.get('status') === 'success') {
                            alert('Gửi thông tin liên hệ thành công!');
                        }
                    </script>
                </div>
            </div>
        </div>
        <!-- /.untree_co-section -->

        <jsp:include page="Footer.jsp"></jsp:include>

        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/navbar.js"></script>
        <script src="js/counter.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>