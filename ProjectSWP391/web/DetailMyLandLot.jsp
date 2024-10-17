<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    <h1>Chi Tiết Miếng Đất</h1>
                </div><!-- End Page Title -->

                <section class="section contact" style="padding-top: 10px">
                    <div>
                        <div class="card p-4">
                            <div class="row gy-4">
                                <div class="col-md-12">
                                    Tên mảnh đất
                                    <input type="text" name="title" id="title" value="${b.landLotName}" class="form-control" readonly="">
                            </div>
                            <div class="col-md-12">
                                Vị trí
                                <input type="text" name="location" id="location" value="${b.location}" class="form-control" readonly="">
                            </div>
                            <div class="col-md-12">
                                Diện Tích (m&sup2;)
                                <input type="number" name="area" id="area" value="${b.area}"  class="form-control" readonly="">
                            </div>
                            <div class="col-md-12">
                                Giá khởi điểm (Đơn Vị : Triệu Đồng ₫)
                                <fmt:formatNumber value="${b.startprice}" type="number" maxFractionDigits="0" />
                                <input type="text" name="startprice" id="startprice"
                                       value="<fmt:formatNumber value='${b.startprice}' type='number' maxFractionDigits='0'/>"
                                       class="form-control" readonly="" />
                            </div>
                            <div class="col-md-12">
                                Ngày Đăng
                                <input type="date" class="form-control" name="publishdate" id="datenewchap" readonly>
                            </div>
                            <div class="col-md-12">
                                Ảnh : 
                            </div>
                            <div class="col-md-12">
                                <c:forEach items="${b.landlotimage}" var="la">
                                    <img width="500px" style="margin-bottom: 100px" 
                                         src="${la.imageURL}" alt="Image" class="img-fluid" />
                                </c:forEach>
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
                                          readonly="" minlength="100" 
                                          >${b.description}</textarea>
                            </div>

                            <div class="col-md-12" style="display: none">
                                Trạng Thái
                                <input name="status" type="text" class="form-control" value="Waiting" readonly>
                            </div>
                            <div class="col-md-12 text-center">
                                <a href="updatelandlot?landlotid=${b.landLotsID}" style="background-color: #4154f1; color: #fff;
                                   padding: 10px 20px 10px 20px; border: none; border-radius: 5px" >
                                    Chỉnh Sửa
                                </a>
                            </div>
                        </div>
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
