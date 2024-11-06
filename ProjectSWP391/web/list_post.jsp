<%-- 
    Document   : list_post
    Created on : Nov 5, 2024, 10:08:38 PM
    Author     : Asus
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
        
    </head>
    <body>
            <header class="header d-none d-lg-block">
                <jsp:include page="Header.jsp"></jsp:include>
            </header>
            <jsp:include page="SideBar.jsp"></jsp:include>
            <main id="main" class="main" style="margin-top: 40px">
                    <div class="pagetitle">
                    <h1>Danh Sách Bài Đăng</h1>
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

                                            <div class="tab-content pt-2">
                                            <div class="tab-pane fade show active" id="AuctionManagement">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <table class="table table-striped table-bordered">
                                                            <thead>
                                                                <tr>
                                                                    <th>ID</th>
                                                                    <th>Người Bán</th>
                                                                    <th style="width: 100px">Tên Lô Đất</th>
                                                                    <th style="width: 100px">Địa Chỉ</th>
                                                                    <th>Diện Tích</t>
                                                                    <th style="width: 300px">Mô toả</th>
                                                                    <th>Giá Khởi Điểm</th>   
                                                                    <th>Ngày Tạo</th> 
                                                                    <th>Trạng Thái</th>
                                                                    <th style="width: 150px">Hành Động</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <!-- Lặp qua danh sách đấu giá -->
                                                                <c:forEach var="land" items="${landLotses}">
                                                                    <tr>
                                                                        <td>${land.landLotsID}</td>
                                                                        <td>${land.sellerID}</td>
                                                                        <td>${land.landLotName}</td>
                                                                        <td>${land.location}</td>
                                                                        <td>${land.area}</td>
                                                                        <td >${land.description}</td>
                                                                         <td>${land.startprice}</td>
                                                                        <td><fmt:formatDate value="${land.createdAt}" pattern="yyyy-MM-dd"/></td>
                                                                        <td>${land.status}</td>
                                                                        <td >
                                                                            <c:if  test="${land.status != 'Available' && land.status != 'Reject'}">
                                                                                <form action="PostManagement" method="post" style="display: inline-block;" 
                                                                                      onsubmit="return confirm('Bạn chắc chắn accept bài post này?');">
                                                                                    <input type="hidden" name="landLotsID" value="${land.landLotsID}">
                                                                                    <input type="hidden" name="timeCre" value="${land.createdAt}">
                                                                                     <input type="hidden" name="action" value="accept">
                                                                                    <button type="submit" class="btn btn-success btn-sm">
                                                                                        <i class="fas fa-edit"></i> Accept
                                                                                    </button>
                                                                                </form>
                                                                                <form action="PostManagement" method="post" style="display: inline-block; margin-top: 20px" 
                                                                                      onsubmit="return confirm('Bạn chắc chắn reject bài post này?');">
                                                                                    <input type="hidden" name="landLotsID" value="${land.landLotsID}">
                                                                                    <input type="hidden" name="timeCre" value="${land.createdAt}">
                                                                                     <input type="hidden" name="action" value="reject">
                                                                                    <button type="submit" class="btn btn-warning btn-sm">
                                                                                        <i class="fas fa-edit"></i> Reject
                                                                                    </button>
                                                                                </form>
                                                                                                                                                                     

                                                                            </c:if>
                                                                            
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                                <!-- Nếu không có đấu giá -->
                                                                <c:if test="${empty landLotses}">
                                                                    <tr>
                                                                        <td colspan="8">Không có bài dăng.</td>
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
    </body>
</html>
