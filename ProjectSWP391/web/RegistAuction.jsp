<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng ký tham gia đấu giá</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>

        <script>
            $(document).ready(function () {
                // Check if the 'success' parameter is in the URL
                var urlParams = new URLSearchParams(window.location.search);
                if (urlParams.has('success') && urlParams.get('success') === 'true') {
                    // Display the success message
                    alert("Bạn đã đăng ký đấu giá thành công!");
                }
            });
        </script>
    </head>
    <body>
        <div>
            <jsp:include page="Header.jsp"></jsp:include>
            </div>
            <br><br>
            <div class="container mt-4">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="container">
                            <div class="card">
                                <div class="row">
                                    <aside class="col-sm-7 border-right">
                                        <article class="gallery-wrap"> 
                                            <div class="img-big-wrap">
                                                <div><a href="#"><img src="${b.mainImageURL}" style="max-width: 100%; height: auto;"></a></div>
                                        </div>
                                        <div class="img-small-wrap">
                                            <c:forEach var="image" items="${b.imageList}">
                                                <div class="item-gallery">
                                                    <img src="${b.imageURL}">
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </article>
                                </aside>
                                <aside class="col-sm-5">
                                    <article class="card-body p-5">
                                        <h3 class="title mb-3">${landLot.landLotName}</h3> <!-- Tên Mảnh Đất -->
                                        <p class="price-detail-wrap"> 
                                            <span class="price h3 text-warning"> 
                                                <span class="currency">Giá khởi điểm (Đơn Vị: Triệu Đồng): </span>
                                                <span class="num">${b.startPrice}</span>
                                            </span> 
                                        </p>

                                        <!-- New asset details -->
                                        <dl class="item-property">
                                            <p><strong>Mã tài sản:</strong> <span>${b.landLotsID}</span></p>
                                            <p><strong>Thời gian mở đăng ký:</strong> <span>${b.openTime}</span></p>
                                            <p><strong>Thời gian kết thúc đăng ký:</strong> <span>${landLot.closeTime}</span></p>
                                            <p><strong>Phí đăng ký tham gia đấu giá:</strong> <span>0 VNĐ</span></p>
                                            <p><strong>Bước giá:</strong> <span>${landLot.auctionStep}</span></p>
                                            <p><strong>Số bước giá tối đa/ lần trả:</strong> <span>${landLot.maxSteps}</span></p>
                                            <p><strong>Tiền đặt trước:</strong> <span>${landLot.deposit}</span></p>
                                            <p><strong>Phương thức đấu giá:</strong> <span>${landLot.auctionMethod}</span></p>
                                            <p><strong>Tên chủ tài sản:</strong> <span>${landLot.ownerName}</span></p>
                                            <p><strong>Nơi xem tài sản:</strong> <span>${b.viewingLocation}</span></p>
                                            <p><strong>Thời gian xem tài sản:</strong> <span>${landLot.viewingTime}</span></p>
                                            <p><strong>Thời gian bắt đầu trả giá:</strong> <span>${landLot.bidStartTime}</span></p>
                                            <p><strong>Thời gian kết thúc trả giá:</strong> <span>${landLot.bidEndTime}</span></p>
                                            <p><strong>Mô tả:</strong> <span>${b.description}</span></p>
                                        </dl>
                                        <hr>

                                        <!-- Registration form with checkboxes -->
                                        <form id="auctionForm" action="registerAuction" method="POST">
                                            <input type="hidden" name="landLotId" value="${landLot.landLotsID}">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="agreeRules" name="agreeRules" required>
                                                <label class="form-check-label" for="agreeRules">
                                                    Tôi đã đọc và đồng ý với quy chế đấu giá trên.
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="waiveInterest" name="waiveInterest" required>
                                                <label class="form-check-label" for="waiveInterest">
                                                    Tôi tự nguyện không nhận tiền lãi phát sinh từ khoản tiền đặt trước.
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="understandAsset" name="understandAsset" required>
                                                <label class="form-check-label" for="understandAsset">
                                                    Tôi đã hiểu rõ về tài sản đấu giá và không có ý kiến gì về việc xem tài sản đấu giá.
                                                </label>
                                            </div>
                                            <button type="submit" class="btn btn-lg btn-primary">Xác nhận tham gia đấu giá</button>
                                        </form>
                                    </article>
                                </aside>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br><br>
        <jsp:include page="Footer.jsp"></jsp:include>        
    </body>
</html>
