<%-- 
    Document   : AboutUs
    Created on : Oct 16, 2024, 7:27:55 PM
    Author     : TTT
--%>

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
            Thông tin về chúng tôi
        </title>
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>

            <div
                class="hero page-inner overlay"
                style="background-image: url('images/hero_bg_3.jpg')"
                >
                <div class="container">
                    <div class="row justify-content-center align-items-center">
                        <div class="col-lg-9 text-center mt-5">
                            <h1 class="heading" data-aos="fade-up">Giới thiệu nhóm</h1>

                            <nav
                                aria-label="breadcrumb"
                                data-aos="fade-up"
                                data-aos-delay="200"
                                >
                                <ol class="breadcrumb text-center justify-content-center">
                                    <li class="breadcrumb-item"><a href="homepage">Home</a></li>
                                    <li
                                        class="breadcrumb-item active text-white-50"
                                        aria-current="page"
                                        >
                                        Nhóm SWP391_GR3
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <div class="section">
                <div class="container">
                    <div class="row text-left mb-5">
                        <div class="col-12">
                            <h2 class="font-weight-bold heading text-primary mb-4">Nhóm SWP391_GR3 Dự Án Đấu Giá Đất</h2>
                        </div>
                        <div class="col-lg-6">
                            <p class="text-black-50">
                                Chào mừng bạn đến với dự án Đấu Giá Đất của nhóm SWP391_GR3! Chúng tôi là một nhóm các sinh viên đam mê 
                                công nghệ thông tin và lập trình, cùng nhau phát triển một nền tảng trực tuyến cho phép mọi người dễ dàng 
                                tham gia đấu giá các lô đất một cách minh bạch, nhanh chóng và hiệu quả.
                            </p>
                            <p class="text-black-50">
                                Dự án Đấu Giá Đất của chúng tôi hướng đến việc trở thành giải pháp tiên phong trong lĩnh vực đấu giá bất động 
                                sản trực tuyến. Chúng tôi mong muốn tạo ra một nền tảng giúp kết nối người mua và người bán một cách tiện lợi,
                                đảm bảo quyền lợi của cả hai bên thông qua các giao dịch minh bạch và an toàn.
                            </p>
                            <p class="text-black-50">
                                Nhóm SWP391_GR3 đang nỗ lực không ngừng để cải tiến và phát triển thêm nhiều tính năng mới cho nền tảng Đấu Giá 
                                Đất, nhằm mang lại trải nghiệm tốt nhất cho người dùng. Chúng tôi hy vọng có thể mở rộng dự án, không chỉ giới 
                                hạn ở các giao dịch trong nước mà còn vươn tầm ra quốc tế.
                                Cảm ơn bạn đã quan tâm và ủng hộ dự án của chúng tôi!
                            </p>
                        </div>
                        <div class="col-lg-6">
                            <p class="text-black-50">
                                Đội ngũ chuyên nghiệp: Nhóm SWP391_GR3 bao gồm các thành viên có kiến thức chuyên môn và kỹ năng lập trình vững 
                                vàng, cùng chung mục tiêu phát triển sản phẩm chất lượng cao. Minh bạch & Bảo mật: Chúng tôi cam kết cung cấp một
                                môi trường đấu giá minh bạch và bảo mật, giúp người dùng an tâm tham gia giao dịch. Tiện lợi & Hiệu quả: 
                                Giao diện thân thiện và các tính năng tiện ích giúp người dùng dễ dàng tìm kiếm, tham gia đấu giá và quản lý 
                                các lô đất.
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="section sec-testimonials bg-light">
                <div class="container">
                    <div class="row mb-5 align-items-center">
                        <div class="col-md-6">
                            <h2 class="font-weight-bold heading text-primary mb-4 mb-md-0">
                                Thành Viên Nhóm
                            </h2>
                        </div>
                        <div class="col-md-6 text-md-end">
                            <div id="testimonial-nav">
                                <span class="prev" data-controls="prev">Prev</span>

                                <span class="next" data-controls="next">Next</span>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-4"></div>
                    </div>
                    <div class="testimonial-slider-wrap">
                        <div class="testimonial-slider">
                            <div class="item">
                                <div class="testimonial">
                                    <img
                                        src="images/Huy.png"
                                        alt="Image"
                                        class="img-fluid rounded-circle w-25 mb-4"
                                        />
                                    <h3 class="h5 text-primary">Trần Đỗ Quang Huy</h3>

                                    <p>
                                        Ngành : SE1749.NET <br>
                                        Mã Số Sinh viên : HE173448<br>
                                        
                                    </p>

                                    <ul class="social list-unstyled list-inline dark-hover">
                                        <li class="list-inline-item">
                                            <a href="https://www.facebook.com/profile.php?id=100027337212211"><span class="icon-facebook"></span></a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="https://www.instagram.com/nkocbadboy/"><span class="icon-instagram"></span></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <div class="item">
                                <div class="testimonial">
                                    <img
                                        src="images/Quang.png"
                                        alt="Image"
                                        class="img-fluid rounded-circle w-25 mb-4"
                                        />
                                    <h3 class="h5 text-primary">Bùi Xuân Quang</h3>

                                    <p>
                                        Ngành : SE1749.NET <br>
                                        Mã Số Sinh viên : HE130876<br>
                                    </p>

                                    <ul class="social list-unstyled list-inline dark-hover">
                                        <li class="list-inline-item">
                                            <a href="#"><span class="icon-twitter"></span></a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#"><span class="icon-facebook"></span></a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#"><span class="icon-linkedin"></span></a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#"><span class="icon-instagram"></span></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <div class="item">
                                <div class="testimonial">
                                    <img
                                        src="images/Thai.png"
                                        alt="Image"
                                        class="img-fluid rounded-circle w-25 mb-4"
                                        />
                                    <h3 class="h5 text-primary">Phạm Huy Thái</h3>

                                    <p>
                                        Ngành : SE1749.NET <br>
                                        Mã Số Sinh viên : HE186421<br>
                                    </p>

                                    <ul class="social list-unstyled list-inline dark-hover">
                                        <li class="list-inline-item">
                                            <a href="#"><span class="icon-twitter"></span></a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#"><span class="icon-facebook"></span></a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#"><span class="icon-linkedin"></span></a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#"><span class="icon-instagram"></span></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <div class="item">
                                <div class="testimonial">
                                    <img
                                        src="images/Hoang.png"
                                        alt="Image"
                                        class="img-fluid rounded-circle w-25 mb-4"
                                        />
                                    <h3 class="h5 text-primary">Phạm Việt Hoàng</h3>

                                    <p>
                                        Ngành : SE1749.NET <br>
                                        Mã Số Sinh viên : HE170186<br>
                                    </p>

                                    <ul class="social list-unstyled list-inline dark-hover">
                                        <li class="list-inline-item">
                                            <a href="#"><span class="icon-twitter"></span></a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#"><span class="icon-facebook"></span></a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#"><span class="icon-linkedin"></span></a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#"><span class="icon-instagram"></span></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/navbar.js"></script>
        <script src="js/counter.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>
