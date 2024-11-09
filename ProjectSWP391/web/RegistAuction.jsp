<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng ký tham gia đấu giá</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .countdown-timer {
                background: #fff;
                padding: 20px;
                margin-bottom: 20px;
            }

            .countdown-title {
                color: #666;
                margin-bottom: 15px;
                font-size: 16px;
            }

            .countdown-grid {
                display: grid;
                grid-template-columns: repeat(4, 1fr);
                gap: 10px;
                text-align: center;
            }

            .countdown-item {
                padding: 10px;
                background: #fff;
                border: 1px solid #eee;
            }

            .countdown-number {
                font-size: 24px;
                font-weight: bold;
                color: #333;
                margin-bottom: 5px;
            }

            .countdown-label {
                font-size: 12px;
                color: #666;
                text-transform: uppercase;
            }

            .auction-details {
                margin: 0;
                padding: 20px;
                background: #fff;
            }

            .auction-details dl {
                display: flex;
                justify-content: space-between;
                align-items: baseline;
                padding: 12px 0;
                border-bottom: 1px solid #eee;
                margin: 0;
            }

            .auction-details dt {
                color: #666;
                font-size: 15px;
                font-weight: normal;
            }

            .auction-details dd {
                color: #dc3545;
                font-weight: 500;
                text-align: right;
                margin: 0;
            }

            .register-button {
                display: block;
                width: 100%;
                padding: 15px;
                background: #c81e1e;
                color: white;
                text-align: center;
                border: none;
                border-radius: 5px;
                font-weight: bold;
                margin-top: 20px;
                cursor: pointer;
            }

            .register-button:hover {
                background: #a61818;
            }

            .image-gallery {
                margin-bottom: 20px;
            }

            .main-image {
                width: 100%;
                height: auto;
                margin-bottom: 10px;
            }

            .thumbnail-container {
                display: flex;
                gap: 10px;
            }

            .thumbnail {
                width: 80px;
                height: 80px;
                object-fit: cover;
                cursor: pointer;
                border: 2px solid transparent;
            }

            .thumbnail:hover {
                border-color: #dc3545;
            }

            /* Slider Styles */
            .slider-container {
                position: relative;
                margin-bottom: 20px;
            }

            .main-slider {
                position: relative;
                width: 100%;
                height: 400px;
                overflow: hidden;
                border-radius: 8px;
                margin-bottom: 10px;
            }

            .slide {
                position: absolute;
                width: 100%;
                height: 100%;
                opacity: 0;
                transition: opacity 0.5s ease-in-out;
            }

            .slide.active {
                opacity: 1;
            }

            .slide img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            /* Navigation Buttons */
            .slider-nav {
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                width: 40px;
                height: 40px;
                background: rgba(255, 255, 255, 0.7);
                border: none;
                border-radius: 50%;
                cursor: pointer;
                font-size: 20px;
                color: #333;
                z-index: 10;
                transition: background 0.3s ease;
            }

            .slider-nav:hover {
                background: rgba(255, 255, 255, 0.9);
            }

            .prev-btn {
                left: 10px;
            }

            .next-btn {
                right: 10px;
            }

            /* Dots Navigation */
            .slider-dots {
                position: absolute;
                bottom: 10px;
                left: 50%;
                transform: translateX(-50%);
                display: flex;
                gap: 8px;
                z-index: 10;
            }

            .dot {
                width: 10px;
                height: 10px;
                border-radius: 50%;
                background: rgba(255, 255, 255, 0.5);
                cursor: pointer;
                transition: background 0.3s ease;
            }

            .dot.active {
                background: white;
            }

            /* Thumbnails */
            .thumbnail-container {
                display: flex;
                gap: 10px;
                overflow-x: auto;
                padding: 10px 0;
            }

            .thumbnail {
                width: 80px;
                height: 60px;
                object-fit: cover;
                cursor: pointer;
                border: 2px solid transparent;
                border-radius: 4px;
                transition: border-color 0.3s ease;
            }

            .thumbnail.active {
                border-color: #0d6efd;
            }
        </style>
    </head>
    <body>
        <div style="margin-bottom: 10rem;">
            <jsp:include page="Header.jsp"></jsp:include>
            </div>

            <div class="container mt-4">
                <div class="row">
                    <div class="col-md-7">
                        <!-- Image Gallery -->
                        <div class="image-gallery">
                            <img src="${landlots.landlotimage[0].imageURL}" class="main-image" alt="Main Image"/>
                        <div class="thumbnail-container">
                            <c:forEach var="image" items="${landlots.landlotimage}">
                                <img src="${image.imageURL}" class="thumbnail" alt="Thumbnail"/>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col-md-5">
                    <!-- Countdown Timer -->
                    <div class="countdown-timer">
                        <div class="countdown-title">Thời gian đếm ngược bắt đầu trả giá:</div>
                        <p class="bid-time"  id="countdown">
                            
                        </p>
                        <div class="countdown-grid">
                            <div class="countdown-item">
                                <div class="countdown-number" id="days">12</div>
                                <div class="countdown-label">NGÀY</div>
                            </div>
                            <div class="countdown-item">
                                <div class="countdown-number" id="hours">01</div>
                                <div class="countdown-label">GIỜ</div>
                            </div>
                            <div class="countdown-item">
                                <div class="countdown-number" id="minutes">16</div>
                                <div class="countdown-label">PHÚT</div>
                            </div>
                            <div class="countdown-item">
                                <div class="countdown-number" id="seconds">43</div>
                                <div class="countdown-label">GIÂY</div>
                            </div>
                        </div>
                    </div>
                    <!-- Auction Details -->
                    <div clas="auction-block">
                        <div class="auction-details">
                            <dl>
                                <dt>Giá khởi điểm:</dt>
                                <dd>${landlots.startprice} VNĐ</dd>
                            </dl>
                            <dl>
                                <dt>Mã tài sản:</dt>
                                <dd>${landlots.landLotsID}</dd>
                            </dl>
<!--                            <dl>
                                <dt>Thời gian mở đăng ký:</dt>
                                <dd>${openTime}</dd>
                            </dl>
                            <dl>
                                <dt>Thời gian kết thúc đăng ký:</dt>
                                <dd>${closeTime}</dd>
                            </dl>-->
                            <dl>
                                <dt>Phí đăng ký tham gia đấu giá:</dt>
                                <dd>1.000.000 VNĐ</dd>
                            </dl>

                            <!--                            <dl>
                                                            <dt>Bước giá:</dt>
                                                            <dd></dd>
                                                        </dl>
                                                        <dl>
                                                            <dt>Số bước giá tối đa/ lần trả:</dt>
                                                            <dd></dd>
                                                        </dl>
                                                        <dl>
                                                            <dt>Tiền đặt trước:</dt>
                                                            <dd></dd>
                                                        </dl>-->
                            <dl>
                                <dt>Phương thức đấu giá:</dt>
                                <dd>Trả giá lên và liên tục</dd>
                            </dl>
                            <dl>
                                <dt>Nơi xem tài sản:</dt>
                                <dd>Theo TBĐG</dd>
                            </dl>
                            <dl>
                                <dt>Thời gian xem tài sản:</dt>
                                <dd>${auction.startTime}</dd>
                            </dl>
                        </div>

                            <form id="auctionForm" action="RegisterAuction" method="post">
                            <input type="hidden" name="landLotId" value="${landlots.landLotsID}">
                            <div class="form-check mb-3">
                                <input class="form-check-input" type="checkbox" id="agreeRules" name="agreeRules" required>
                                <label class="form-check-label" for="agreeRules">
                                    Tôi đã đọc và đồng ý với quy chế đấu giá trên.
                                </label>
                            </div>
                            <div class="form-check mb-3">
                                <input class="form-check-input" type="checkbox" id="waiveInterest" name="waiveInterest" required>
                                <label class="form-check-label" for="waiveInterest">
                                    Tôi tự nguyện không nhận tiền lãi phát sinh từ khoản tiền đặt trước.
                                </label>
                            </div>
                            <div class="form-check mb-3">
                                <input class="form-check-input" type="checkbox" id="understandAsset" name="understandAsset" required>
                                <label class="form-check-label" for="understandAsset">
                                    Tôi đã hiểu rõ về tài sản đấu giá và không có ý kiến gì về việc xem tài sản đấu giá.
                                </label>
                            </div>
                            <button  onclick="registerHandler()" class="btn btn-lg btn-primary">Xác nhận tham gia đấu giá</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <br><br>
        <jsp:include page="Footer.jsp"></jsp:include>     
           <script>
            const auctionEndTime = new Date("${auction.startTime}").getTime();
            function updateCountdown() {
                const now = new Date().getTime();
                const timeLeft = auctionEndTime - now;

                if (timeLeft > 0) {
                    const days = Math.floor(timeLeft / (1000 * 60 * 60 * 24));
                    const hours = Math.floor((timeLeft % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                    const minutes = Math.floor((timeLeft % (1000 * 60 * 60)) / (1000 * 60));
                    const seconds = Math.floor((timeLeft % (1000 * 60)) / 1000);

                    document.getElementById("days").innerHTML = days;
                    document.getElementById("hours").innerHTML = hours;
                    document.getElementById("minutes").innerHTML = minutes;
                    document.getElementById("seconds").innerHTML = seconds;
                } else {
                    document.getElementById("days").innerHTML = "0";
                    document.getElementById("hours").innerHTML = "0";
                    document.getElementById("minutes").innerHTML = "0";
                    document.getElementById("seconds").innerHTML = "0";
                }
            }

            setInterval(updateCountdown, 1000);
            
             function registerHandler(){
                        const  frm = document.getElementById("auctionForm");
                        const  balance = ${requestScope.balance};
                        console.log("balace", balance);
                        if(balance < 1000000){
                            window.alert("Số dư tài khoản không đủ ( ít nhất 1.000.000))");    
                             event.preventDefault();
                         }
        }
        </script>
    </body>
</html>