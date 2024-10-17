<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh Sách Lô Đất</title>
        <style>
            .table th, .table td {
                text-align: center;
                vertical-align: middle;
            }
            .img-thumbnail {
                max-width: 100px;
                height: auto;
            }
        </style>
    </head>
    <body>

        <main id="main" class="main">
            <div class="pagetitle">
                <h1>Danh Sách Lô Đất</h1>
            </div><!-- End Page Title -->

            <section class="section profile">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="card">
                            <div class="card-body pt-3">
                                <div class="tab-content pt-2">
                                    <div class="tab-pane fade show active" id="LandLotList">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <table class="table table-striped table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Tên Lô Đất</th>
                                                            <th>Địa Điểm</th>
                                                            <th>Diện Tích (m²)</th>
                                                            <th>Mô Tả</th>
                                                            <th>Giá Khởi Điểm</th>
                                                            <th>Ngày Tạo</th>
                                                            <th>Trạng Thái</th>
                                                            <th>Hình Ảnh</th>
                                                            <th>Ngày Tải Lên</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="landLot" items="${landLotsList}">
                                                            <!-- Đếm số lượng hình ảnh -->
                                                            <c:set var="landlotimageSize" value="${fn:length(landLot.landlotimage)}" />

                                                            <!-- Nếu có hình ảnh -->
                                                            <c:if test="${landlotimageSize > 0}">
                                                                <!-- Lặp qua các hình ảnh cho mỗi lô đất -->
                                                                <c:forEach var="image" items="${landLot.landlotimage}" varStatus="status">
                                                                    <tr>
                                                                        <c:if test="${status.index == 0}">
                                                                            <td rowspan="${landlotimageSize}">${landLot.landLotName}</td>
                                                                            <td rowspan="${landlotimageSize}">${landLot.location}</td>
                                                                            <td rowspan="${landlotimageSize}">${landLot.area}</td>
                                                                            <td rowspan="${landlotimageSize}">${landLot.description}</td>
                                                                            <td rowspan="${landlotimageSize}">
                                                                                <fmt:formatNumber value="${landLot.startprice}" type="currency" currencySymbol="₫" groupingUsed="true" />
                                                                            </td>
                                                                            <td rowspan="${landlotimageSize}">
                                                                                <fmt:formatDate value="${landLot.createdAt}" pattern="yyyy-MM-dd" />
                                                                            </td>
                                                                            <td rowspan="${landlotimageSize}">${landLot.status}</td>
                                                                        </c:if>
                                                                        <td>
                                                                            <img src="${image.imageURL}" alt="LandLot Image" class="img-thumbnail"/>
                                                                        </td>
                                                                        <td>
                                                                            <fmt:formatDate value="${image.uploadDate}" pattern="yyyy-MM-dd" />
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>

                                                            </c:if>

                                                            <!-- Nếu không có hình ảnh, hiển thị thông tin lô đất mà không có cột hình ảnh -->
                                                            <c:if test="${landlotimageSize == 0}">
                                                                <tr>
                                                                    <td>${landLot.landLotName}</td>
                                                                    <td>${landLot.location}</td>
                                                                    <td>${landLot.area}</td>
                                                                    <td>${landLot.description}</td>
                                                                    <td>
                                                                        <fmt:formatNumber value="${landLot.startprice}" type="currency" currencySymbol="₫" groupingUsed="true" />
                                                                    </td>
                                                                    <td><fmt:formatDate value="${landLot.createdAt}" pattern="yyyy-MM-dd" /></td>
                                                                    <td>${landLot.status}</td>
                                                                    <td colspan="2">Không có hình ảnh nào</td>
                                                                </tr>
                                                            </c:if>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>

                                                <!-- Nếu danh sách lô đất trống -->
                                                <c:if test="${empty landLotsList}">
                                                    <p>Không có lô đất nào.</p>
                                                </c:if>

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

        <div id="footer" class="footer border-top pt-2">
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
