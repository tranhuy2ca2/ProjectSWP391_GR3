<%-- 
    Document   : list_auction
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
                    <h1>Danh Sách Đấu Giá</h1>
                </div><!-- End Page Title -->

                <section class="section profile" style="padding-top: 0rem">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="card">
                                <div class="card-body pt-3">
                                    <!-- Bordered Tabs -->
                                    <ul class="nav nav-tabs nav-tabs-bordered">
                                        <li class="nav-item">
                                            <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#AuctionManagement">Danh Sách Đấu Giá</button>
                                        </li>
                                    </ul>
                                    <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addAuctionModal">
                                        <i class="fas fa-plus"></i> Thêm Đấu Giá
                                    </button>

                                    <div class="tab-content pt-2">
                                    <%-- Hiển thị thông báo lỗi (nếu có) --%>
                                    <c:if test="${not empty message}">
                                        <div class="alert alert-danger">
                                            ${message}
                                        </div>
                                    </c:if>
                                    <div class="tab-pane fade show active" id="AuctionManagement">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <table class="table table-striped table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Tên Lô Đất</th>
                                                            <th>Người Tổ Chức</th>
                                                            <th>Người Thắng</th>
                                                            <th>Thời Gian Bắt Đầu</th>
                                                            <th>Thời Gian Kết Thúc</th>
                                                            <th>Trạng Thái</th>                                                                
                                                            <th>Hành Động</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <!-- Lặp qua danh sách đấu giá -->
                                                        <c:forEach var="auction" items="${auctions}">
                                                            <tr>
                                                                <td>${auction.auctionID}</td>
                                                                <td>${auction.landLotName}</td>
                                                                <td>${auction.auctioneerName}</td>
                                                                <td>
                                                                    <c:choose>
                                                                        <c:when test="${not empty auction.winnerName}">
                                                                            ${auction.winnerName}
                                                                        </c:when>
                                                                        <c:otherwise>Chưa có</c:otherwise>
                                                                    </c:choose>
                                                                </td>
                                                                <td><fmt:formatDate value="${auction.startTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                                                                <td><fmt:formatDate value="${auction.endTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                                                                <td>${auction.status}</td>
                                                                <td>
                                                                    <button class="btn btn-primary btn-sm btn-edit" 
                                                                            data-auction-id="${auction.auctionID}" 
                                                                            data-start-time="${auction.startTime}" 
                                                                            data-end-time="${auction.endTime}" 
                                                                            data-status="${auction.status}">
                                                                        <i class="fas fa-edit"></i> Sửa
                                                                    </button>


                                                                    <form action="AuctionManagement" method="post" style="display: inline-block;" 
                                                                          onsubmit="return confirm('Bạn có chắc chắn muốn xóa đấu giá này?');">
                                                                        <input type="hidden" name="auctionID" value="${auction.auctionID}">
                                                                        <input type="hidden" name="action" value="delete">
                                                                        <button type="submit" class="btn btn-danger btn-sm">
                                                                            <i class="fas fa-trash-alt"></i> Xóa
                                                                        </button>
                                                                    </form>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>

                                                        <!-- Nếu không có đấu giá -->
                                                        <c:if test="${empty auctions}">
                                                            <tr>
                                                                <td colspan="8">Không có đấu giá nào.</td>
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

        <!-- Modal thêm đấu giá -->
        <div class="modal fade" id="addAuctionModal" tabindex="-1" aria-labelledby="addAuctionModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addAuctionModalLabel">Thêm Đấu Giá</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="addAuctionForm" action="AuctionManagement" method="post">
                            <input type="hidden" name="action" value="add">
                            <!-- Các trường dữ liệu cho đấu giá -->
                            <div class="mb-3">
                                <select class="form-control" name="landLotName" id="landLotName" required>
                                    <option value="">Chọn Lô Đất▼</option>
                                    <c:forEach var="landLot" items="${landLotNames}">
                                        <option value="${landLot}">${landLot}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-3">
                                <select class="form-control" name="auctioneerName" id="auctioneerName" required>
                                    <option value="">Chọn Người Tổ Chức▼</option>
                                    <c:forEach var="auctioneer" items="${auctioneerNames}">
                                        <option value="${auctioneer}">${auctioneer}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-3">
                                <select class="form-control" name="winnerName" id="winnerName">
                                    <option value="">Chọn Người Chiến thắng▼</option>
                                     <option value="Chưa có">Chưa có</option>
                                    <c:forEach var="winner" items="${winnerNames}">
                                        <option value="${winner}">${winner}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="startTime" class="form-label">Thời Gian Bắt Đầu</label>
                                <input type="datetime-local" class="form-control" name="startTime" id="startTime" required>
                            </div>
                            <div class="mb-3">
                                <label for="endTime" class="form-label">Thời Gian Kết Thúc</label>
                                <input type="datetime-local" class="form-control" name="endTime" id="endTime" required>
                            </div>
                            <div class="mb-3">
                                <label for="status" class="form-label">Trạng Thái</label>
                                <select class="form-control" name="status" id="status" required>
                                    <option value="Ongoing">Đang diễn ra</option>
                                    <option value="Completed">Hoàn tất</option>
                                    <option value="Cancelled">Đã hủy</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Thêm Đấu Giá</button>
                        </form>

                    </div>
                </div>
            </div>
        </div>
        <!-- Modal sửa đấu giá -->
        <div class="modal fade" id="editAuctionModal" tabindex="-1" aria-labelledby="editAuctionModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editAuctionModalLabel">Sửa Đấu Giá</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="editAuctionForm" action="AuctionManagement" method="post">
                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" name="auctionID" id="editAuctionID">

                            <!-- Chỉ hiện các trường thời gian và trạng thái -->
                            <div class="mb-3">
                                <label for="editStartTime" class="form-label">Thời Gian Bắt Đầu</label>
                                <input type="datetime-local" class="form-control" name="startTime" id="editStartTime" required>
                            </div>
                            <div class="mb-3">
                                <label for="editEndTime" class="form-label">Thời Gian Kết Thúc</label>
                                <input type="datetime-local" class="form-control" name="endTime" id="editEndTime" required>
                            </div>
                            <div class="mb-3">
                                <label for="editStatus" class="form-label">Trạng Thái</label>
                                <select class="form-control" name="status" id="editStatus" required>
                                    <option value="Ongoing">Đang diễn ra</option>
                                    <option value="Completed">Hoàn tất</option>
                                    <option value="Cancelled">Đã hủy</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Lưu Thay Đổi</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>



        <div id="footer" class="footer border-top pt-2">
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const editButtons = document.querySelectorAll('.btn-edit');

                editButtons.forEach(button => {
                    button.addEventListener('click', function () {
                        const auctionID = this.getAttribute('data-auction-id');
                        const startTime = this.getAttribute('data-start-time');
                        const endTime = this.getAttribute('data-end-time');
                        const status = this.getAttribute('data-status');

                        // Set values into the modal's form fields
                        document.getElementById('editAuctionID').value = auctionID;
                        document.getElementById('editStartTime').value = startTime.replace(' ', 'T');
                        document.getElementById('editEndTime').value = endTime.replace(' ', 'T');
                        document.getElementById('editStatus').value = status;

                        // Debugging: Log values to ensure they are correct
                        console.log('Auction ID:', auctionID);
                        console.log('Start Time:', startTime);
                        console.log('End Time:', endTime);
                        console.log('Status:', status);

                        // Show the modal
                        $('#editAuctionModal').modal('show');
                    });
                });
            });
        </script>


        <!-- Vendor JS Files -->
        <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>
</html>