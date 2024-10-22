<%-- 
    Document   : list_user
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
        <link href="./assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="./assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="./assets/css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="./css/confirmbox.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="https://suustore.com/assets/frontend/images/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <style>
            .profile .profile-card img {
                max-width: 200px;
            }
            .profile .profile-edit img {
                max-width: 300px;
            }
            .nav-item-a.dropdown:hover,
            .nav-item-a:hover {
                background-color: var(--color-primary-hover);
            }
        </style>
    </head>

    <body>
        <header class="header d-none d-lg-block">
            <jsp:include page="Header.jsp"></jsp:include>
            </header>

        <jsp:include page="SideBar.jsp"></jsp:include>

            <main id="main" class="main" style="margin-top: 40px">
                <div class="pagetitle">
                    <h1>Danh Sách Người Dùng</h1>
                </div><!-- End Page Title -->

                <section class="section profile" style="padding-top: 0rem">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="card">
                                <div class="card-body pt-3">
                                    <!-- Bordered Tabs -->
                                    <ul class="nav nav-tabs nav-tabs-bordered">
                                        <li class="nav-item">
                                            <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#userManagement">Danh Sách Người Dùng</button>
                                        </li>
                                    </ul>
                                    <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addUserModal">
                                        <i class="fas fa-plus"></i> Thêm Người Dùng
                                    </button>

                                    <div class="tab-content pt-2">
                                        <div class="tab-pane fade show active" id="userManagement">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <table class="table table-striped table-bordered">
                                                        <thead>
                                                            <tr>
                                                                <th>ID</th>
                                                                <th>Tên Hiển Thị</th>
                                                                <th>Email</th>
                                                                <th>Địa Chỉ</th>
                                                                <th>Số Điện Thoại</th>
                                                                <th>Chức vụ</th>                                                                
                                                                <th>Hành Động</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:forEach var="user" items="${usersr}">
                                                            <tr>
                                                                <td>${user.userID}</td>
                                                                <td>${user.userName}</td>
                                                                <td>${user.email}</td>
                                                                <td>${user.address}</td>
                                                                <td>${user.phone}</td>
                                                                <td>
                                                                    <c:choose>
                                                                        <c:when test="${user.role == 1}">Quản trị viên</c:when>
                                                                        <c:when test="${user.role == 2}">Khách hàng</c:when>
                                                                        <c:when test="${user.role == 3}">Nhân viên</c:when>
                                                                        <c:when test="${user.role == 4}">Nhà đấu giá</c:when>
                                                                        <c:when test="${user.role == 5}">Khách</c:when>
                                                                        
                                                                        <c:otherwise>Vai trò không xác định</c:otherwise>
                                                                    </c:choose>
                                                                </td>
                                                                <td>
                                                                    <button class="btn btn-primary btn-sm btn-edit" data-user-id="${user.userID}" data-user-name="${user.userName}" data-email="${user.email}" data-address="${user.address}" data-phone="${user.phone}" data-role="${user.role}">
                                                                        <i class="fas fa-edit"></i> Sửa
                                                                    </button>
                                                                    <form action="UserManagement" method="post" style="display: inline-block;" 
                                                                          onsubmit="return confirm('Bạn có chắc chắn muốn xóa người dùng này?');">
                                                                        <input type="hidden" name="userID" value="${user.userID}">
                                                                        <input type="hidden" name="action" value="delete">
                                                                        <button type="submit" class="btn btn-danger btn-sm">
                                                                            <i class="fas fa-trash-alt"></i> Xóa
                                                                        </button>
                                                                    </form>


                                                                </td>
                                                            </tr>
                                                        </c:forEach>

                                                        <c:if test="${empty usersr}">
                                                            <tr>
                                                                <td colspan="7">Không có người dùng nào.</td>
                                                            </tr>
                                                        </c:if>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div><!-- End Tab Content -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editUserModalLabel">Chỉnh Sửa Người Dùng</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="editUserForm" action="UserManagement" method="post">
                            <input type="hidden" name="action" value="edit"> <!-- Add action parameter -->
                            <input type="hidden" name="userID" id="userID"> <!-- User ID hidden field -->
                            <div class="mb-3">
                                <label for="userName" class="form-label">Tên Hiển Thị</label>
                                <input type="text" class="form-control" name="userName" id="userName" required>
                            </div>
                            <div class="mb-3">
                                <label for="fullName" class="form-label">Họ và Tên</label>
                                <input type="text" class="form-control" name="fullName" id="fullName" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" name="email" id="email" required>
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label">Số Điện Thoại</label>
                                <input type="text" class="form-control" name="phone" id="phone" required>
                            </div>
                            <div class="mb-3">
                                <label for="role" class="form-label">Chức vụ</label>
                                <select class="form-select" name="role" id="role" required>
                                    <option value="1">Quản trị viên</option>
                                    <option value="2">Khách hàng</option>
                                    <option value="3">Nhân viên</option>
                                    <option value="4">Nhà đấu giá</option>
                                    <option value="5">Khách</option>

                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="address" class="form-label">Địa Chỉ</label>
                                <input type="text" class="form-control" name="address" id="address" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Mật Khẩu</label>
                                <input type="password" class="form-control" name="password" id="password">
                                <small class="form-text text-muted">Để trống nếu không thay đổi mật khẩu.</small>
                            </div>
                            <button type="submit" class="btn btn-primary">Cập Nhật</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Add User Modal -->
        <div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addUserModalLabel">Thêm Người Dùng</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="addUserForm" action="UserManagement" method="post">
                            <input type="hidden" name="action" value="add">
                            <div class="mb-3">
                                <label for="newUserName" class="form-label">Tên Hiển Thị</label>
                                <input type="text" class="form-control" name="userName" id="newUserName" required>
                            </div>
                            <div class="mb-3">
                                <label for="newFullName" class="form-label">Họ và Tên</label>
                                <input type="text" class="form-control" name="fullName" id="newFullName" required>
                            </div>
                            <div class="mb-3">
                                <label for="newEmail" class="form-label">Email</label>
                                <input type="email" class="form-control" name="email" id="newEmail" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Mật Khẩu</label>
                                <input type="password" class="form-control" name="password" id="password" required>
                            </div>
                            <div class="mb-3">
                                <label for="newPhone" class="form-label">Số Điện Thoại</label>
                                <input type="text" class="form-control" name="phone" id="newPhone" required>
                            </div>
                            <div class="mb-3">
                                <label for="newRole" class="form-label">Chức vụ</label>
                                <select class="form-select" name="role" id="newRole" required>
                                    <option value="1">Quản trị viên</option>
                                    <option value="2">Khách hàng</option>
                                    <option value="3">Nhân viên</option>
                                    <option value="4">Nhà đấu giá</option>
                                    <option value="5">Khách</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="newAddress" class="form-label">Địa Chỉ</label>
                                <input type="text" class="form-control" name="address" id="newAddress" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Thêm Người Dùng</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <div id="footer" class="footer border-top pt-2">
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script>
          $(document).ready(function () {
              $('.btn-edit').on('click', function () {
                  const userID = $(this).data('user-id');
                  const userName = $(this).data('user-name');
                  const email = $(this).data('email');
                  const address = $(this).data('address');
                  const phone = $(this).data('phone');
                  const role = $(this).data('role');

                  $('#userID').val(userID);
                  $('#userName').val(userName);
                  $('#email').val(email);
                  $('#address').val(address);
                  $('#phone').val(phone);
                  $('#role').val(role);

                  $('#editUserModal').modal('show');
              });
          });
        </script>

    </body>
</html>
