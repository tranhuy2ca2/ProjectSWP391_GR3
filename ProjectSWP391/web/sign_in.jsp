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
        <!-- Thư viện CSS của Toastr -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <!-- Thư viện JavaScript của Toastr -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
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
                                    <div class="inputForm">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="20"
                                            viewBox="0 0 32 32"
                                            height="20"
                                            >
                                        <g data-name="Layer 3" id="Layer_3">
                                        <path d="M12 12c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm0 2c-3.33 0-10 1.67-10 5v2h20v-2c0-3.33-6.67-5-10-5z"/>

                                        </g>
                                        </svg>
                                        <input class="form-control h_50 input" type="username" name="username" placeholder="Nhập username của bạn" 
                                               value="${cookie.cuser.value}" required>
                                    </div>
                                </div>

                                <div class="form-group mb-3">
                                    <label class="form-label d-flex justify-content-between">
                                        Mật khẩu* 
                                        <a class="span" href="resetpassword?action=customer">Quên mật khẩu?</a>
                                    </label>
                                    <div class="inputForm">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="20"
                                            viewBox="-64 0 512 512"
                                            height="20"
                                            >
                                        <path
                                            d="m336 512h-288c-26.453125 0-48-21.523438-48-48v-224c0-26.476562 21.546875-48 48-48h288c26.453125 0 48 21.523438 48 48v224c0 26.476562-21.546875 48-48 48zm-288-288c-8.8125 0-16 7.167969-16 16v224c0 8.832031 7.1875 16 16 16h288c8.8125 0 16-7.167969 16-16v-224c0-8.832031-7.1875-16-16-16zm0 0"
                                            ></path>
                                        <path
                                            d="m304 224c-8.832031 0-16-7.167969-16-16v-80c0-52.929688-43.070312-96-96-96s-96 43.070312-96 96v80c0 8.832031-7.167969 16-16 16s-16-7.167969-16-16v-80c0-70.59375 57.40625-128 128-128s128 57.40625 128 128v80c0 8.832031-7.167969 16-16 16zm0 0"
                                            ></path>
                                        </svg>
                                        <input class="form-control h_50 input" type="password" name="password" placeholder="Nhập mật khẩu của bạn" 
                                               value="${cookie.cpass.value}" required>
                                    </div>
                                </div>

                                <div class="pass-link">
                                    <input type="checkbox" ${(cookie.crem != null ? 'checked' : '')} name="rem" value="ON"/> Nhớ tài khoản  
                                </div>
                                <button class="btn btn-primary w-100 mt-3 button-submit" type="submit">Đăng nhập <i class="fas fa-sign-in-alt ms-2"></i></button>
                            </form>

                            <div class="text-center mt-3">
                                Don't have an account? <a class="span" href="sign_up.jsp">Đăng kí</a>
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
        <script>
            $(document).ready(function () {
                // Kiểm tra message từ Servlet
                var message = '${requestScope.report}';
                if (message) {
                    toastr.success(message);  // Hoặc toastr.error(), toastr.info() tùy theo loại thông báo
                }
            });
        </script>
    </body>

</html>