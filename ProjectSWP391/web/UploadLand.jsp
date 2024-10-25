<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
                    <h1>Đăng Tin</h1>
                </div><!-- End Page Title -->

                <section class="section contact" style="padding-top: 10px">
                    <div>
                        <div class="card p-4">
                            <form action="uploadlandlot" method="post" onsubmit="return validateForm()" enctype="multipart/form-data">
                            <c:if test="${not empty mess}">
                                <script>
                                    alert("${mess}");
                                </script>
                            </c:if>
                            <div class="row gy-4">
                                <div class="col-md-12">
                                    Tên mảnh đất
                                    <input type="text" name="title" id="title" class="form-control" required>
                                </div>
                                <div class="col-md-12">
                                    Vị trí
                                    <input type="text" name="location" id="location" class="form-control" required>
                                </div>
                                <div class="col-md-12">
                                    Diện Tích
                                    <input type="number" name="area" id="area" class="form-control" required>
                                </div>
                                <div class="col-md-12">
                                    Giá khởi điểm
                                    <input type="text" name="startprice" id="startprice" class="form-control" required>
                                </div>
                                <div class="col-md-12">
                                    Ngày Đăng
                                    <input type="date" class="form-control" name="publishdate" id="datenewchap" readonly="">
                                </div>
                                <div class="col-md-12">
                                    Ảnh minh họa (*Bạn cần tối thiểu 3 ảnh)<br>
                                    Ảnh 1: <input type="file" class="form-control" name="file" required> 
                                    Ảnh 2: <input type="file" class="form-control" name="file" required> 
                                    Ảnh 3: <input type="file" class="form-control" name="file" required> 
                                </div>
                                <div class="col-md-12">
                                    <h5>Thể loại</h5>
                                    <div class="checkbox-grid">
                                        <c:forEach items="${listzoning}" var="la">
                                            <label>
                                                <input type="checkbox" name="zoningtype" value="${la.zoningID}"
                                                       <c:if test="${fn:contains(zoningtypeID, la.zoningID)}">checked</c:if>
                                                           >
                                                ${la.zoningCode} - ${la.zoningDescription}
                                            </label>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    Mô tả
                                    <textarea class="form-control" name="detail" id="detail" rows="6" required minlength="100" 
                                              placeholder="Tóm tắt cho lô đất..">${detail}</textarea>
                                </div>

                                <div class="col-md-12" style="display: none">
                                    Trạng Thái
                                    <input name="status" type="text" class="form-control" value="Waiting" readonly>
                                </div>
                                <div class="col-md-12 text-center">
                                    <button type="submit" style="background-color: #4154f1; color: #fff;
                                            padding: 10px 20px 10px 20px; border: none; border-radius: 5px" >Đăng Tin</button>
                                    <button type="reset" style="background-color: #4154f1; color: #fff;
                                            padding: 10px 20px 10px 20px; border: none; border-radius: 5px">
                                        Hủy
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
