<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <link href="./assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="./assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="./assets/css/style.css" rel="stylesheet">
        <style>
            label {
                margin-right: 30px;
            }
        </style>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var today = new Date();
                var day = String(today.getDate()).padStart(2, '0');
                var month = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
                var year = today.getFullYear();
                var todayDate = year + '-' + month + '-' + day;
                document.getElementById('datenewchap').value = todayDate;
            });
        </script>
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
                .checkbox-grid {
                    display: grid;
                    grid-template-columns: repeat(2, 1fr); /* 2 cột đều nhau */
                    gap: 10px; /* khoảng cách giữa các mục */
                }
                label {
                    display: block;
                }
                .image-container {
                    display: flex;
                    flex-wrap: wrap;
                    gap: 20px;
                }

                .image-item {
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    width: 45%; /* Đảm bảo rằng mỗi ảnh và input file chiếm gần một nửa hàng */
                }

                .img-thumbnail {
                    width: 100%;
                    height: auto;
                    margin-bottom: 10px;
                    border-radius: 8px;
                    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
                }

                .file-input {
                    width: 100%;
                    padding: 5px;
                }
            </style>
            <script>
                function toggleSubMenu(event) {
                    event.preventDefault();
                    var submenu = event.currentTarget.nextElementSibling;
                    submenu.classList.toggle('show');
                }
            </script>

            <main style="margin-top: 100px" id="main" class="main">

                <div class="pagetitle">
                    <h1>Chỉnh Sửa Miếng Đất</h1>
                </div><!-- End Page Title -->

                <section class="section contact" style="padding-top: 10px">
                    <div>
                        <div class="card p-4">
                            <form action="updatelandlot" method="post" onsubmit="return validateForm()" enctype="multipart/form-data">
                                <div class="row gy-4" >
                                    <div class="col-md-12" style="display: none">
                                        LandLotID 
                                        <input type="text" name="landlotid" id="title" value="${b.landLotsID}" class="form-control" readonly="" >
                                </div>
                                <div class="col-md-12">
                                    Tên mảnh đất
                                    <input type="text" name="title" id="title" value="${b.landLotName}" class="form-control">
                                </div>
                                <div class="col-md-12">
                                    Vị trí
                                    <input type="text" name="location" id="location" value="${b.location}" class="form-control">
                                </div>
                                <div class="col-md-12">
                                    Diện Tích (m&sup2;)
                                    <input type="number" name="area" id="area" value="${b.area}"  class="form-control">
                                </div>
                                <div class="col-md-12">
                                    Giá khởi điểm (Đơn Vị : Triệu Đồng ₫)
                                    <input type="text" name="startprice" id="startprice"
                                           value="${b.startprice}"
                                           class="form-control"/>
                                </div>
                                <div class="col-md-12">
                                    Ngày Đăng
                                    <input type="date" class="form-control" name="publishdate" id="datenewchap" readonly>
                                </div>
                                <div class="col-md-12">
                                    Ảnh hiện tại: 
                                </div>
                                <div class="col-md-12">
                                    <div class="image-container">
                                        <c:forEach items="${b.landlotimage}" var="la" varStatus="status">
                                            <div class="image-item">
                                                <p>Ảnh ${status.index + 1}</p> <!-- Hiển thị số thứ tự của ảnh -->
                                                <img src="${la.imageURL}" alt="Image" class="img-thumbnail"/>
                                                <input type="file" value="${la.imageURL}" name="file" class="file-input">
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <h5>Thể loại</h5>
                                    <div class="checkbox-grid">
                                        <c:forEach items="${listzoning}" var="la">
                                            <label>
                                                <input type="checkbox" name="zoningtype" value="${la.zoningID}"
                                                       <c:if test="${fn:contains(b.zoningtype, la.zoningID)}">checked</c:if> />
                                                ${la.zoningCode} - ${la.zoningDescription}
                                            </label>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    Mô tả
                                    <textarea class="form-control" name="detail" value="${b.description}"  id="detail" rows="6" 
                                              minlength="100" 
                                              >${b.description}</textarea>
                                </div>

                                <div class="col-md-12" style="display: none">
                                    Trạng Thái
                                    <input name="status" type="text" class="form-control" value="Waiting" readonly>
                                </div>
                                <div class="col-md-12 text-center">
                                    <button type="submit" style="background-color: #4154f1; color: #fff;
                                            padding: 10px 20px 10px 20px; border: none; border-radius: 5px" >
                                        Lưu Chỉnh Sửa
                                    </button>
                                </div>
                            </div>
                        </form>
                        <script>
                            function validateForm() {
                                var title = document.getElementById("title").value.trim();
                                var authorname = document.getElementById("authorname").value.trim();
                                var detail = document.getElementById("detail").value.trim();

                                if (title === "" || authorname === "" || detail === "") {
                                    alert("Please fill out all required fields.");
                                    return false;
                                }

                                return true;
                            }
                            function showNewImagePath(input) {
                                if (input.files && input.files[0]) {
                                    // Lấy phần tử nhập URL ảnh mới liền kề với input file
                                    var newImagePathInput = input.parentElement.nextElementSibling;
                                    newImagePathInput.value = input.files[0].name;
                                }
                            }
                        </script>
                    </div>
                </div>
            </section>
        </main><!-- End #main -->
        <div id="footer" class="footer border-top pt-2">
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
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
