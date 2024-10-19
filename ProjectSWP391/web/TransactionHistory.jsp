<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html >

    <head>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta charset="utf-8">
        <title>My List Comic</title>
        <link href="./assets/vendor/simple-datatables/style.css" rel="stylesheet">
        <link href="./assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="./assets/css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="css/ManagerProduct.css">
        <style>
            .table td {
                width: 20%; /* Đặt chiều rộng 20% cho mỗi cột */
            }
            .detail {
                /* Điều chỉnh kích cỡ nội dung trong cột Detail */
                font-size: 13px;
            }
            .transaction-type-1 {
                background-color: #d1e7dd; /* Màu xanh lá nhạt */
            }

            .transaction-type-2 {
                background-color: #f8d7da; /* Màu đỏ nhạt */
            }

            .transaction-type-3 {
                background-color: #cff4fc; /* Màu xanh dương nhạt */
            }

            .transaction-type-4 {
                background-color: #fff3cd; /* Màu vàng nhạt */
            }
        </style>
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
        <jsp:include page="SideBar.jsp"></jsp:include>

            <style>

                .badge.bg-danger {
                    color: white;
                    background-color: red;
                    border-radius: 50%;
                    padding: 0 5px;
                    font-size: 0.8em;
                    margin-left: 5px;
                }
                .table td {
                    width: 20%; /* Đặt chiều rộng 20% cho mỗi cột */
                }
                .detail {
                    /* Điều chỉnh kích cỡ nội dung trong cột Detail */
                    font-size: 13px;
                }
                .transaction-type-1 {
                    background-color: #d1e7dd; /* Màu xanh lá nhạt */
                }

                .transaction-type-2 {
                    background-color: #f8d7da; /* Màu đỏ nhạt */
                }

                .transaction-type-3 {
                    background-color: #cff4fc; /* Màu xanh dương nhạt */
                }

                .transaction-type-4 {
                    background-color: #fff3cd; /* Màu vàng nhạt */
                }
            </style>
            <script>
                function toggleSubMenu(event) {
                    event.preventDefault();
                    var submenu = event.currentTarget.nextElementSibling;
                    submenu.classList.toggle('show');
                }
            </script>


            <main style="margin-top: 20px" id="main" class="main">

                <div class="pagetitle">
                    <h1>Lịch Sử Giao Dịch</h1>
                </div>

                <section class="section">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <table class="table datatable">
                                        <thead>
                                            <tr>
                                                <th class="col-1 text-center">STT</th>
                                                <th class="col-3 text-center">Loại giao dịch</th>
                                                <th class="col-3 text-center">Số tiền giao dịch</th>
                                                <th class="col-3 text-center" data-type="date" data-format="YYYY/DD/MM">Publish Date</th>
                                            </tr>
                                        </thead>                                        
                                        <tbody>
                                        <c:forEach items="${transaction}" var="tran" varStatus="status">
                                            <tr> 
                                                <td class="col-1 text-center">${status.index + 1}</td>
                                                <td class="col-3 text-center">
                                                    <c:choose>
                                                        <c:when test="${tran.transactiontypeID == 1}">
                                                            <span class="transaction-type-1">Nạp tiền</span>
                                                        </c:when> 
                                                        <c:when test="${tran.transactiontypeID == 2}">
                                                            <span class="transaction-type-2">Rút tiền</span>
                                                        </c:when>
                                                    </c:choose>
                                                </td>
                                                <td class="col-3 text-center">
                                                    <fmt:formatNumber value="${tran.money}" pattern="#,##0.##"/>đ
                                                </td>
                                                <td class="col-3 text-center">${tran.publishdate}</td>                                     
                                            </tr>
                                        </c:forEach>
                                    </tbody>                                      
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <div id="footer" class="footer border-top pt-2">
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>
        <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
        <script src="assets/vendor/tinymce/tinymce.min.js"></script>
        <script src="assets/js/main.js"></script>
        <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/chart.js/chart.umd.js"></script>
        <script src="assets/vendor/echarts/echarts.min.js"></script>
        <script src="assets/vendor/quill/quill.min.js"></script>
        <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
        <script src="assets/vendor/tinymce/tinymce.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
    </body>

</html>