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
            /* Center-align text in table header cells */
            th {
                text-align: center;
            }

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

            /* Button Style for Rectangular Appearance */
            .btn-respond {
                border-radius: 0; /* Remove rounded corners */
                padding: 10px 20px; /* Increase padding for a more rectangular shape */
            }

            .btn-respond:hover {
                background-color: #007bff; /* Change background color on hover */
                transition: background-color 0.3s ease; /* Smooth transition */
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
                <h1>Danh Sách FeedBack</h1>
            </div><!-- End Page Title -->

            <section class="section profile" style="padding-top: 0rem">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="card">
                            <div class="card-body pt-3">
                                <!-- Bordered Tabs -->
                                <ul class="nav nav-tabs nav-tabs-bordered">
                                    <li class="nav-item">

                                        <div class="tab-pane fade show active" id="AuctionManagement">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <table class="table table-striped table-bordered">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 150px">Tên Mảnh Đất</th>
                           
                                                                <th>Địa Điểm</th>
                                                                <th>Bắt Đầu</th>
                                                                <th>Kết Thúc</th>
                                                                <th style="width: 250px">Trạng Thái</th>
                                                                <th>ID Người Thắng</th>
                                                    
                                                                <th style="width: 150px">Tham Gia</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <!-- Loop through the listContacts collection and display each contact's information -->
                                                            <c:forEach var="aution" items="${autions}">
                                                                <tr>
                                                                    <td>${aution.landLots.landLotName}</td>
                                                  
                                                                    <td>${aution.landLots.location}</td>
                                                                    <td>${aution.startTime}</td>
                                                                    <td>${aution.endTime}</td>
                                                                    <td>${aution.status}</td>
                                                                    <td>${aution.winnerID}</td>
                                     
                                                                    <td>
                                                                        <!-- Phản Hồi Button -->
                                                                       
                                                                            <button type="button" class="btn btn-primary btn-sm btn-respond" >
                                                                            Đấu Giá
                                                                        </button>
                                                    
                                                                        
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div><!-- End Tab Content -->
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <div id="footer" class="footer border-top pt-2">
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>

    

        <!-- Vendor JS Files -->
        <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
