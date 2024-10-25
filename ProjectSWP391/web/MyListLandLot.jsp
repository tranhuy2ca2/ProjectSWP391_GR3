<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <style>
            .table td {
                width: 20%; /* Đặt chiều rộng 20% cho mỗi cột */
            }
            .detail {
                /* Điều chỉnh kích cỡ nội dung trong cột Detail */
                font-size: 13px;
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
                    <h1>Danh Sách Truyện Của Bạn Quản Lý</h1>
                </div>

                <section class="section">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <table class="table datatable">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>Tên đất</th>
                                                <th>Mô Tả</th>
                                                <th data-type="date" data-format="YYYY/DD/MM">Ngày Đăng</th>
                                                <th>Trạng Thái</th>
                                            </tr>
                                        </thead>                                        
                                        <tbody>
                                        <c:forEach items="${manageland}" var="b">
                                            <tr>
                                                <td style="width: 10%">
                                                    <a style="margin-right: 10px" href="javascript:void(0);">
                                                        <i class="material-icons" data-toggle="tooltip" title="Xóa Miếng Đất">&#xE872;</i>
                                                    </a>
                                                    <a style="margin-right: 10px" href="detailmylandlot?landlotid=${b.landLotsID}">
                                                        <i class="material-icons" data-toggle="tooltip" title="Xem chi tiết">visibility</i>
                                                    </a>
                                                    <a href="updatelandlot?landlotid=${b.landLotsID}">
                                                        <i class="material-icons" data-toggle="tooltip" title="Sửa Chi Tiết">&#xE254;</i>
                                                    </a>
                                                </td>
                                                <td class="title">${b.landLotName} <br> 

                                                </td>
                                                <td class="detail">
                                                    <div class="detail-content">
                                                        <span class="short-detail">${b.description.substring(0, 100)}...</span>
                                                        <span class="full-detail" style="display:none;">${b.description}</span>
                                                    </div>
                                                    <a href="javascript:void(0);" onclick="toggleDetail(this)" 
                                                       style="color: blue">Đọc thêm</a>
                                                </td>
                                                <td class="publishDate">${b.createdAt}</td>
                                                <td class="publishDate">${b.status}</td>
                                            </tr>
                                        </c:forEach>
                                        <c:if test="${not empty successMessage}">
                                        <script>
                                            alert("${successMessage}");
                                            <c:remove var="successMessage" scope="session"/>
                                        </script>
                                    </c:if>
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
        <script>
            function toggleDetail(link) {
                const detailContent = link.previousElementSibling;
                const shortDetail = detailContent.querySelector('.short-detail');
                const fullDetail = detailContent.querySelector('.full-detail');

                if (shortDetail.style.display === 'none') {
                    shortDetail.style.display = 'inline';
                    fullDetail.style.display = 'none';
                    link.textContent = 'Đọc thêm';
                } else {
                    shortDetail.style.display = 'none';
                    fullDetail.style.display = 'inline';
                    link.textContent = 'Thu gọn';
                }
            }
        </script>   
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