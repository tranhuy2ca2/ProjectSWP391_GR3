<%-- 
    Document   : Auction
    Created on : Nov 5, 2024, 8:13:36 PM
    Author     : FPTSHOP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>
            Phòng Đấu Giá
        </title>
        <link crossorigin="anonymous" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" rel="stylesheet"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
        <style>
            body {
                background-color: #f8f9fa;
            }
            .breadcrumb {
                background-color: transparent;
                padding: 0;
                margin-bottom: 0;
            }
            .breadcrumb-item + .breadcrumb-item::before {
                content: ">";
            }
            .product-image {
                width: 100%;
                height: auto;
            }
            .product-thumbnail {
                width: 100px;
                height: auto;
                cursor: pointer;
            }
            .auction-info {
                background-color: #f8f9fa;
                padding: 20px;
                border: 1px solid #ddd;
            }
            .auction-info h5 {
                color: #dc3545;
            }
            .auction-info .current-bid {
                color: #dc3545;
                font-size: 1.5rem;
            }
            .auction-info .next-bid {
                color: #dc3545;
                font-size: 1.25rem;
            }
            .auction-info .bid-time {
                color: white;
                font-size: 1.25rem;
            }
            .auction-info .bid-status {
                color: white;
                font-size: 1.25rem;
            }
            .auction-info .bid-input {
                border: 2px solid #dc3545;
                padding: 5px;
                width: 100%;
                text-align: right;
            }
            .auction-info .bid-button {
                background-color: #dc3545;
                color: white;
                width: 100%;
                padding: 10px;
                border: none;
            }
            .nav-tabs .nav-link {
                color: #dc3545;
            }
            .nav-tabs .nav-link.active {
                background-color: #dc3545;
                color: white;
            }
            .divider {
                border-top: 1px solid white;
                margin: 10px 0;
            }
        </style>
    </head>
    <body>
        <header class="header d-none d-lg-block" style="margin-bottom: 10rem;">
            <jsp:include page="Header.jsp"></jsp:include>
            </header>
            <div class="container mt-3">
<!--                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="homepage">
                                Trang chủ
                            </a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="#">
                                Tài sản đặc sắc
                            </a>
                        </li>
                        <li aria-current="page" class="breadcrumb-item active">
                            Phòng Đấu Giá
                        </li>
                    </ol>
                </nav>-->
                <div class="row">
                    <div class="col-md-7">
                          <div class="image-gallery">
                              <img src="${landlots.landlotimage[0].imageURL}" width="600" class="main-image" alt="Main Image"/>
                        <div class="thumbnail-container">
                            <c:forEach var="image" items="${landlots.landlotimage}">
                                <img src="${image.imageURL}" class="thumbnail" alt="Thumbnail" width="200"/>
                            </c:forEach>
                        </div>
                    </div>
                    </div>
                    <div class="col-md-5 auction-info">
                        <h5>
                            Đấu giá ${landlots.landLotName}
                    </h5>
                    <p>
                        Mã tài sản: ${landlots.landLotsID}
                    </p>
                    <p>
                        <strong>
                            Giá khởi điểm: ${landlots.startprice} VNĐ
                        </strong>
                    </p>
                    <p>
                        Thời gian bắt đầu đấu giá
                    </p>
                    <p>
                        ${auction.startTime}
                    </p>
                    <p>
                        Thời gian kết thúc đấu giá
                    </p>
                    <p>
                        ${auction.endTime}
                    </p>
                    <div class="d-flex align-items-center mb-3">
                        <img alt="Profile picture of auctioneer Huynh Phuong" class="rounded-circle me-2" height="50" src="https://storage.googleapis.com/a1aa/image/jQADNqYO4DarK5c27pkJ5IEq3zbTbJjHYvk1fhLf8zjZy9tTA.jpg" width="50"/>
                        <div>
                            <p class="mb-0">
                                Đấu giá viên điều hành: Phạm Huy Thái
                            </p>
                            <p class="mb-0">
                                75765867 - cập nhật ngày 1/11/2024
                            </p>
                        </div>
                    </div>
                    <div class="bg-danger text-white p-3 mb-3">
                        <p class="bid-time"  id="countdown">
                            
                        </p>
                        <div class="divider"></div>
                        <p class="mb-0">
                            Lượt đặt giá cuối của bạn
                        </p>
                        <p class="bid-status">
                            <c:if test="${requestScope.mymaxbids != null}">
                                ${mymaxbids}
                            </c:if> 
                            <c:if test="${requestScope.mymaxbids == null}">
                                0
                            </c:if>
                        </p>
                    </div>
                    <p class="current-bid">
                        Giá hiện tại
                    </p>
                    <p class="current-bid">
                         <c:if test="${requestScope.maxAuction != null}">
                                ${maxAuction}
                            </c:if> 
                            <c:if test="${requestScope.maxAuction == null}">
                                0
                            </c:if>
                    </p>
                    <form action="Auction" method="post" >
                        <input type="hidden" name="auctionId" value="${auction.auctionID}" />
                        <input type="hidden" name="landLotsID" value="${landlots.landLotsID}" />
                          <div class="mb-3">
                        <label class="form-label" for="bidAmount">
                            GIÁ CỦA BẠN
                        </label>
                              <input class="form-control bid-input" name="bidAmount"  id="bidAmount" type="number" />
                    </div>
                    <button class="btn bid-button">
                        Đặt giá
                    </button>
                    </form>
                    <button class="btn btn-secondary w-100 mt-2">
                        Rời phòng đấu giá
                    </button>
                </div>
            </div>
            <ul class="nav nav-tabs mt-3">
                <li class="nav-item">
                    <a class="nav-link active" href="#">
                        Mô tả
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        Quy chế đấu giá
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        Hồ sơ pháp lý
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        Hỏi - đáp
                    </a>
                </li>
            </ul>
        </div>
        <script>
            function changeImage(src) {
                document.getElementById('mainImage').src = src;
            }
        </script>
        <script>
            const auctionEndTime = new Date("${auction.endTime}").getTime();
            
            function updateCountdown() {
                const now = new Date().getTime();
                const timeLeft = auctionEndTime - now;

                if (timeLeft > 0) {
                    // Calculate days, hours, minutes, and seconds
                    const days = Math.floor(timeLeft / (1000 * 60 * 60 * 24));
                    const hours = Math.floor((timeLeft % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                    const minutes = Math.floor((timeLeft % (1000 * 60 * 60)) / (1000 * 60));
                    const seconds = Math.floor((timeLeft % (1000 * 60)) / 1000);

                    // Display the countdown in the HTML
                    document.getElementById("countdown").innerHTML = 
                        `Đấu giá sẽ kết thúc sau: ` + days +  ` ngày ` +  hours + ` giờ ` + minutes + ` phút `  +seconds+` giây`;
                } else {
                    // When the countdown ends
                    document.getElementById("countdown").innerHTML = "Đấu giá đã kết thúc.";
                }
            }

            // Update the countdown every 1 second
            setInterval(updateCountdown, 1000);
        </script>
        <jsp:include page="Footer.jsp"></jsp:include>    
    </body>
</html>
