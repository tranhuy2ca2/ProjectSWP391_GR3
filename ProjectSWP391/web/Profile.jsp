<%-- 
    Document   : Profile
    Created on : Jan 19, 2024, 8:31:14 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <link href="./assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" >
        <link href="./assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="./assets/css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="./css/confirmbox.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <link rel="preconnect" href="https://fonts.googleapis.com/">
        <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin="">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <link href="./assets/bootstrap.min.css" rel="stylesheet">

        <link rel="shortcut icon" href="https://suustore.com/assets/frontend/images/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="./assets/app.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
        <style>
            .profile .profile-card img {
                max-width: 200px;
            }
            .profile .profile-edit img {
                max-width: 300px;
            }
            .password-container {
                position: relative;
                width: 100%;
            }

            .password-container input {
                width: 100%;
                padding-right: 30px; /* Đảm bảo rằng có không gian cho biểu tượng */
            }

            .toggle-password {
                position: absolute;
                top: 50%;
                right: 10px; /* Điều chỉnh vị trí từ bên phải */
                transform: translateY(-50%);
                cursor: pointer;
            }
            .nav-item-a.dropdown:hover {
                background-color: var(--color-primary-hover);
            }
            .nav-item-a:hover {
                background-color: var(--color-primary-hover);
            }
        </style>
        <script src="./assets/jquery-1.11.3.min.js"></script>

    </head>

    <body>
        <header class="header d-none d-lg-block">
            <jsp:include page="Header.jsp"></jsp:include>
        </header>
            <!-- ======= Sidebar ======= -->
        <jsp:include page="SideBar.jsp"></jsp:include>
            <!-- End Sidebar-->

            <style>

                .badge.bg-danger {
                    color: white;
                    background-color: red;
                    border-radius: 50%;
                    padding: 0 5px;
                    font-size: 0.8em;
                    margin-left: 5px;
                }
            </style>

            <main id="main" class="main" style="margin-top: 40px">

                <div class="pagetitle">
                    <h1>Hồ sơ Dùng</h1>
                </div><!-- End Page Title -->

                <section class="section profile" style="padding-top: 0rem">
                    <div class="row">
                        <div class="col-xl-4">

                            <div class="card">
                                <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
                                    <h3 class="f-w-600">${user.fullName}</h3>
                                <h6 class="f-w-600">${user.rolename}</h6>
                            </div>
                        </div>

                    </div>

                    <div class="col-xl-8">

                        <div class="card">
                            <div class="card-body pt-3">
                                <!-- Bordered Tabs -->
                                <ul class="nav nav-tabs nav-tabs-bordered">

                                    <li class="nav-item">
                                        <button class="nav-link active" data-bs-toggle="tab"
                                                data-bs-target="#profile-overview">Chi Tiết Hồ Sơ Người Đọc</button>
                                    </li>

                                    <li class="nav-item">
                                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">Sửa Hồ Sơ Người Đọc</button>
                                    </li>

                                    <li class="nav-item">
                                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">Thay Đổi Mật Khẩu</button>
                                    </li>
                                    <li class="nav-item">
                                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-rechargemoney">Nạp tiền</button>
                                    </li>

                                </ul>
                                <div class="tab-content pt-2">
                                    <div class="tab-pane fade show active profile-overview" id="profile-overview">
                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Email</div>
                                            <div class="col-lg-9 col-md-8">${user.email==null?"Chưa có email":user.email}</div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Địa Chỉ</div>
                                            <div class="col-lg-9 col-md-8">${user.address==null?"Chưa có địa chỉ":user.address}</div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Số Điện Thoại</div>
                                            <div class="col-lg-9 col-md-8">${user.phone==null?"Chưa có số điện thoại":user.phone}</div>
                                        </div>

                                    </div>
                                    <div class="tab-pane fade profile-edit pt-3" id="profile-edit">
                                        <!-- Profile Edit Form -->
                                        <form action="updateprofile" method="post" onsubmit="return validateForm()">
                                            <div class="row mb-3" style="display: none">
                                                <label for="userID" class="col-md-4 col-lg-3 col-form-label">UserID</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="userID" type="text" class="form-control" id="userID" value="${user.userID==null?"Chưa có email":user.userID}" readonly="">
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <label for="fullname" class="col-md-4 col-lg-3 col-form-label">Tên Hiển Thị</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="fullname" type="text" class="form-control" id="fullname" value="${user.fullName==null?"Chưa có tên hiển thị":user.fullName}" required>
                                                    <div class="invalid-feedback">Tên hiển thị không được để trống hoặc chỉ chứa khoảng trắng.</div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <label for="email" class="col-md-4 col-lg-3 col-form-label">Email</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="email" type="email" class="form-control" id="email" value="${user.email==null?"Chưa có email":user.email}" required>
                                                    <div class="invalid-feedback">Email không được để trống hoặc chỉ chứa khoảng trắng.</div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <label for="address" class="col-md-4 col-lg-3 col-form-label">Địa Chỉ</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="address" type="text" class="form-control" id="address" value="${user.address==null?"Chưa có địa chỉ":user.address}">
                                                    <div class="invalid-feedback">Địa chỉ không được để trống hoặc chỉ chứa khoảng trắng.</div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <label for="phone" class="col-md-4 col-lg-3 col-form-label">Số Điện Thoại</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="phone" type="text" class="form-control" id="phone"
                                                           value="${user.phone == null ? 'Chưa có số điện thoại' : user.phone}"
                                                           pattern="[0-9]{9,11}"
                                                           required
                                                           title="Số điện thoại phải chứa từ 9 đến 11 chữ số"
                                                           oninput="validatePhone()">
                                                    <div class="invalid-feedback">
                                                        Số điện thoại phải từ 9 đến 11 chữ số.
                                                    </div>
                                                </div>
                                            </div>

                                            <script>
                                                function validatePhone() {
                                                    const phoneInput = document.getElementById('phone');
                                                    const phoneValue = phoneInput.value.trim();

                                                    // Kiểm tra nếu không phải là số hoặc độ dài không hợp lệ
                                                    if (!/^\d{9,11}$/.test(phoneValue)) {
                                                        phoneInput.setCustomValidity("Số điện thoại phải từ 9 đến 11 chữ số.");
                                                    } else {
                                                        phoneInput.setCustomValidity("");
                                                    }
                                                }

                                                // Kiểm tra và loại bỏ các khoảng trắng dư thừa trong mỗi trường nhập
                                                function trimInputFields() {
                                                    const fields = document.querySelectorAll("input[type='text'], input[type='email']");
                                                    fields.forEach(field => {
                                                        field.value = field.value.trim();
                                                    });
                                                }

                                                // Hàm kiểm tra toàn bộ form trước khi submit
                                                function validateForm() {
                                                    // Loại bỏ khoảng trắng dư thừa trước khi kiểm tra
                                                    trimInputFields();

                                                    // Lấy tất cả các trường cần kiểm tra
                                                    const fullname = document.getElementById('fullname').value;
                                                    const email = document.getElementById('email').value;
                                                    const address = document.getElementById('address').value;
                                                    const phone = document.getElementById('phone').value;

                                                    // Kiểm tra các trường bị bỏ trống hoặc chỉ chứa khoảng trắng
                                                    if (fullname === "" || email === "" || phone === "") {
                                                        alert("Các trường tên hiển thị, email và số điện thoại không được bỏ trống hoặc chỉ chứa khoảng trắng.");
                                                        return false; // Ngăn không cho submit form
                                                    }

                                                    return true; // Cho phép submit form nếu hợp lệ
                                                }
                                            </script>

                                            <div class="text-center">
                                                <button type="submit" class="btn btn-primary">Lưu Thay Đổi</button>
                                            </div>
                                        </form>
                                    </div>

                                    <div class="tab-pane fade pt-3" id="profile-settings">
                                    </div>

                                    <div class="tab-pane fade pt-3" id="profile-change-password">
                                        <!-- Change Password Form -->
                                        <form id="changePasswordForm" action="#" method="post">
                                            <div class="row mb-3">
                                                <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Mật Khẩu Cũ</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <div class="password-container">
                                                        <input class="form-control" type="password" id="currentPassword" name="oldpass" required>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">Mật Khẩu Mới</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <div class="password-container">
                                                        <input class="form-control" type="password" id="newPassword" name="newpass" minlength="6" required>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Xác Nhận Lại Mật Khẩu</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <div class="password-container">
                                                        <input class="form-control" type="password" id="confirmPassword" name="confirm" minlength="6" required>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="text-center">
                                                <button type="submit" class="btn btn-primary">Đổi Mật Khẩu</button>
                                            </div>
                                        </form>                                     
                                    </div>
                                    <div class="tab-pane fade pt-3" id="profile-rechargemoney">
                                        <!-- Rechagre Money Form -->
                                        <h3>Nạp tiền vào tài khoản</h3>                                       

                                    </div>
                                    </tbody>                                      
                                </div>
                            </div>
                        </div>
                    </div>
            </section>      

        </main><!-- End #main -->
        <div id="footer" class="footer border-top pt-2">
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>
        <!-- Vendor JS Files -->
        <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
