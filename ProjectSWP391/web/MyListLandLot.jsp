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
                                                <th class="col-1 text-center">STT</th>
                                                <th class="col-3 text-center">Tiêu Đề</th>
                                                <th class="col-3 text-center">Nội Dung</th>
                                                <th class="col-3 text-center" data-type="date" data-format="YYYY/DD/MM">Ngày Đăng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listfeedback}" var="b" varStatus="status">
                                            <tr>
                                                <td class="col-1 text-center">${status.index + 1}</td>
                                                <td class="col-3 text-center">${b.subject}</td>
                                                <td class="col-3 text-center">${b.detail}</td>
                                                <td class="col-3 text-center">${b.createAt}</td>
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