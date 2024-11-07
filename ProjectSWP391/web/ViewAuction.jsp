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
            .table th, .table td, .pagetitle {
                text-align: center;
                vertical-align: middle;
            }
            .img-fluid {
                width: 100%;
                height: auto;
                object-fit: cover;
                border-radius: 10px;
            }

            .property-item {
                margin-bottom: 30px;
            }
            #scrollToTopBtn {
                display: none; /* Ẩn nút ban đầu */
                position: fixed;
                bottom: 20px;
                right: 30px;
                z-index: 99;
                font-size: 18px;
                border: none;
                outline: none;
                background-color: #28a745;
                color: white;
                cursor: pointer;
                padding: 15px;
                border-radius: 10px;
            }

            #scrollToTopBtn:hover {
                background-color: #555; /* Màu khi hover vào nút */
            }
            .pagination .page-item .page-link {
                border-radius: 50%;
                width: 40px;
                height: 40px;
                text-align: center;
                padding: 10px;
            }

            .pagination .page-item.active .page-link {
                background-color: #01384d;
                color: white;
                border-color: #01384d;
            }

            .pagination .page-item .page-link:hover {
                background-color: #f1f1f1;
            }
        </style>
    </head>
    <body>
        <button onclick="scrollToTop()" id="scrollToTopBtn" title="Lên đầu trang">
            ↑
        </button>
        <main id="main" class="main">
            <div class="pagetitle">
                <br/>
                <h1>Danh Sách tất cả Lô Đất</h1>
            </div><!-- End Page Title -->
            <div class="mb-3">
                <a href="homepage" class="btn btn-success">
                    Trở về Trang Chủ
                </a>
            </div>
            <section class="section profile">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="card">
                            <div class="card-body pt-3">
                                <div class="tab-content pt-2">
                                    <div class="tab-pane fade show active" id="LandLotList">
                                        <div class="row">
                                            <!-- Sử dụng grid layout để phân chia các lô đất thành các cột -->
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <div class="container">
                                                        <!-- Unified Search and Filter Form -->
                                                        <form action="SearchLandLot">
                                                            <div   class="d-flex align-items-center justify-content-between">
                                                                <div >
                                                                           <select class="form-control me-2" name="order">
                                                                             <option value="StartingPrice" ${requestScope.order == '1' ? 'selected' : ''}>Giá tăng dần</option>
                                                                             <option value="StartingPrice desc" ${requestScope.order == '2' ? 'selected' : ''}>Giá giảm dần</option>
                                                                             <option value="Area" ${requestScope.order == '3' ? 'selected' : ''}>Diện tích tăng dần</option>
                                                                             <option value="Area desc" ${requestScope.order == '4' ? 'selected' : ''}>Diện tích giảm dần</option>
                                                                         </select>
                                                                     </div>
                                                                    <div class="w-75">
                                                                            <input type="text" name="keyword" class="form-control me-2" placeholder="Search by name or land lots" value="${requestScope.keyword}">
                                                                     </div>
                                                                     <div>
                                                                         <button type="submit" class="btn btn-primary">Search & Filter</button>
                                                                     </div>
                                                            </div>
                                                        </form>
                                                        <div class="row mt-4">
                                                            <c:forEach var="land" items="${listlandlot}">
                                                                <div class="col-md-4">
                                                                    <div class="property-item">
                                                                        <a href="#" class="img">
                                                                            <c:if test="${not empty land.landlotimage}">
                                                                                <img  src="${land.landlotimage[0].imageURL}" alt="Image" class="img-fluid" style="  height: 350px" />
                                                                            </c:if>
                                                                            <c:if test="${empty land.landlotimage}">
                                                                                <img width="100%" 
                                                                                     src="default-image-url.jpg" 
                                                                                     alt="No Image Available" class="img-fluid" />
                                                                            </c:if>
                                                                        </a>

                                                                        <div class="property-content">
                                                                            <div class="price mb-2">
                                                                                <span>Giá Khởi Điểm - 
                                                                                    <fmt:formatNumber value="${land.startprice}" 
                                                                                                      type="currency" 
                                                                                                      currencySymbol="₫" 
                                                                                                      groupingUsed="true" />
                                                                                </span>
                                                                            </div>
                                                                            <div>
                                                                                <span class="d-block mb-2 text-black-50">
                                                                                    Vị Trí : ${land.location}
                                                                                </span>
                                                                                <span class="city d-block mb-3">
                                                                                    Tên Đất : ${land.landLotName} 
                                                                                </span>
                                                                                <div class="d-block d-flex align-items-center me-3">
                                                                                    <h3 class="icon-timelapse me-2"></h3>
                                                                                    <h3 class="caption">
                                                                                        <c:choose>
                                                                                            <c:when test="${land.status1 == 'Cancelled'}">đã huỷ</c:when>
                                                                                            <c:when test="${land.status1 == 'Completed'}">đã hoàn thành</c:when>
                                                                                            <c:when test="${land.status1 == 'Ongoing'}">đang diễn ra</c:when>
                                                                                            <c:otherwise>${land.status1}</c:otherwise>
                                                                                        </c:choose>
                                                                                    </h3>
                                                                                </div><br>
                                                                                <div class="d-block d-flex align-items-center me-3">
                                                                                    <span class="icon-area-chart me-2"></span>
                                                                                    <span class="caption">Diện Tích : ${land.area} m&sup2;</span>
                                                                                </div>
                                                                                <br>
                                                                                <div class="d-block d-flex align-items-center me-3">
                                                                                    <span class="icon-timer me-2"></span>
                                                                                    <span class="caption"> Ngày bắt đầu : ${land.startTime} <br> Ngày kết thúc : ${land.endTime}</span>
                                                                                </div><br>
                                                                                <c:if test="${not empty land.zoningtype}">
                                                                                    <span class="d-block d-flex align-items-center">
                                                                                        <span class="icon-book me-2"></span>
                                                                                        <span class="caption">Loại Đất :
                                                                                            <c:forEach var="zoning" items="${land.zoningtype}">
                                                                                                <span class="caption">${zoning.zoningDescription}, </span>
                                                                                            </c:forEach>   
                                                                                        </span>
                                                                                    </span>                                                      
                                                                                </c:if>
                                                                                <c:if test="${sessionScope.user.role == 2}">

                                                                                    <form action="SaveAuction" method="post" onsubmit="saveFavorite(event, ${land.landLotsID})">
                                                                                        <input type="hidden" name="landLotID" value="${land.landLotsID}" />
                                                                                        <button type="submit" class="btn btn-secondary py-2 px-3">Lưu yêu thích</button>
                                                                                    </form>
                                                                                </c:if>
<<<<<<< HEAD
                                                                                <a href="landdetail?landlotid=${land.landLotsID}" class="btn btn-primary py-2 px-3">See details</a>
=======
                                                                                <a href="landdetail?landlotid=${land.landLotsID}"  class="btn btn-primary py-2 px-3">See details</a>
>>>>>>> 92175cdbebc250a135a3ae27bcc030b6af079488
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                        <!-- Nếu danh sách lô đất trống -->
                                                        <c:if test="${empty listlandlot}">
                                                            <p>Không có lô đất nào.</p>
                                                        </c:if>
                                                    </div>
                                                </div>

                                                <nav aria-label="Page navigation example">
                                                    <ul class="pagination justify-content-center">
                                                        <li class="page-item">
                                                            <a class="page-link" href="?page=${currentPage - 1}" aria-label="Previous">
                                                                <span aria-hidden="true">&laquo;</span>
                                                            </a>
                                                        </li>
                                                        <c:forEach begin="1" end="${totalPages}" var="i">
                                                            <li class="page-item <c:if test='${i == currentPage}'>active</c:if>">
                                                                <a class="page-link" href="?page=${i}">
                                                                    ${i}
                                                                </a>
                                                            </li>
                                                        </c:forEach>
                                                        <li class="page-item">
                                                            <a class="page-link" href="?page=${currentPage + 1}" aria-label="Next">
                                                                <span aria-hidden="true">&raquo;</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </nav>

                                            </div><!-- End Tab Content -->
                                        </div>
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
        <script>
                                                                                    // Hiển thị nút khi lướt xuống quá 100px
                                                                                    window.onscroll = function () {
                                                                                        scrollFunction()
                                                                                    };

                                                                                    function scrollFunction() {
                                                                                        var scrollBtn = document.getElementById("scrollToTopBtn");
                                                                                        if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
                                                                                            scrollBtn.style.display = "block"; // Hiển thị nút
                                                                                        } else {
                                                                                            scrollBtn.style.display = "none"; // Ẩn nút
                                                                                        }
                                                                                    }

                                                                                    // Hàm để cuộn về đầu trang
                                                                                    function scrollToTop() {
                                                                                        document.body.scrollTop = 0; // Dành cho Safari
                                                                                        document.documentElement.scrollTop = 0; // Dành cho Chrome, Firefox, IE và Opera
                                                                                    }
        </script>
        <script>
            function saveFavorite(event, landLotID) {
                event.preventDefault(); // Prevent default form submission

                const form = event.target.closest('form');
                const formData = new FormData(form);

                $.ajax({
                    url: form.action,
                    type: 'POST',
                    data: {landLotID: landLotID},
                    success: function (response) {
                        if (typeof response === "string") {
                            response = JSON.parse(response); // Ensure response is parsed if returned as string
                        }

                        if (response.status === "success") {
                            alert(response.message); // Display success message
                            const button = form.querySelector('button');
                            button.classList.remove('btn-secondary');
                            button.classList.add('btn-danger');
                        } else {
                            alert(response.message); // Display failure message if save failed
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error('Error:', error);
                        alert("An error occurred while processing your request.");
                    }
                });
            }
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </body>
</html>
