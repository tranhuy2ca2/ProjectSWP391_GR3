<%-- 
    Document   : HomePage
    Created on : Sep 23, 2024, 4:16:00 PM
    Author     : TTT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="author" content="Untree.co" />
        <link rel="shortcut icon" href="favicon.png" />

        <meta name="description" content="" />
        <meta name="keywords" content="bootstrap, bootstrap5" />

        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap"
            rel="stylesheet"
            />

        <link rel="stylesheet" href="fonts/icomoon/style.css" />
        <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css" />

        <link rel="stylesheet" href="css/tiny-slider.css" />
        <link rel="stylesheet" href="css/aos.css" />
        <link rel="stylesheet" href="css/style.css" />
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>

            <div class="hero">
                <div class="hero-slide">
                    <div
                        class="img overlay"
                        style="background-image: url('images/hero_bg_3.jpg')"
                        ></div>
                    <div
                        class="img overlay"
                        style="background-image: url('images/hero_bg_2.jpg')"
                        ></div>
                    <div
                        class="img overlay"
                        style="background-image: url('images/hero_bg_1.jpg')"
                        ></div>
                </div>

                <div class="container">
                    <div class="row justify-content-center align-items-center">
                        <div class="col-lg-9 text-center">
                            <h1 class="heading" data-aos="fade-up">
                                Easiest way to find your dream home
                            </h1>
                            <form
                                action="SearchLandLot"
                                class="narrow-w form-search d-flex align-items-stretch mb-3"
                                data-aos="fade-up"
                                data-aos-delay="200"
                                >
                                <input
                                    type="text"
                                    name="keyword"
                                    class="form-control px-4"
                                    placeholder="Your ZIP code or City. e.g. New York"
                                    />
                                <button type="submit" class="btn btn-primary">Search</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="section">
                <div class="container">
                    <div class="row mb-5 align-items-center">
                        <div class="col-lg-6">
                            <h2 class="font-weight-bold text-primary heading">
                                Popular Properties
                            </h2>

                        </div>
                        <div class="col-lg-6 text-lg-end">
                            <p>
                                <a href="ViewAuction"
                                   class="btn btn-primary text-white py-3 px-4"
                                   >View all properties</a
                                >
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="property-slider-wrap">
                                <div class="property-slider">
                                <c:forEach var="land" items="${listlandlot}">
                                    <div class="property-item">
                                        <a href="#" class="img">
                                            <c:if test="${not empty land.landlotimage}">
                                                <img width="100%" style="margin-bottom: 100px" 
                                                     src="${land.landlotimage[0].imageURL}" alt="Image" class="img-fluid" />
                                            </c:if>
                                            <c:if test="${empty land.landlotimage}">
                                                <img width="100%" style="margin-bottom: 100px" 
                                                     src="default-image-url.jpg" alt="No Image Available" class="img-fluid" />
                                            </c:if>
                                        </a>

                                        <div class="property-content">
                                            <div class="price mb-2">
                                                <span>Giá Khởi Điểm - 
                                                    <fmt:formatNumber value="${land.startprice}" type="currency" 
                                                                      currencySymbol="₫" groupingUsed="true" />
                                                </span>
                                            </div>
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
                                            <div>
                                                <span class="d-block mb-2 text-black-50">Vị Trí : ${land.location}</span>
                                                <span class="city d-block mb-3">Tên Đất : ${land.landLotName}</span>

                                                <div class="d-block d-flex align-items-center me-3">
                                                    <span class="icon-area-chart me-2"></span>
                                                    <span class="caption"> Diện Tích : ${land.area} m&sup2;</span>
                                                </div><br>
                                                <div class="d-block d-flex align-items-center me-3">
                                                    <span class="icon-timer me-2"></span>
                                                    <span class="alert-light"> Ngày bắt đầu : ${land.startTime} <br> Ngày kết thúc : ${land.endTime}</span>
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
                                                <form id="saveAuctionForm_${land.landLotsID}" action="SaveAuction" method="post">
                                                    <input type="hidden" name="landLotID" value="${land.landLotsID}" />
                                                    <button type="submit" onclick="saveFavorite(event, '${land.landLotsID}')" class="btn btn-secondary py-2 px-3">Lưu yêu thích</button>
                                                </form>

                                                <br/>
                                                <a href="landdetail?landlotid=${land.landLotsID}" 
                                                   class="btn btn-primary py-2 px-3">Xem chi tiết</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>

                            <div
                                id="property-nav"
                                class="controls"
                                tabindex="0"
                                aria-label="Carousel Navigation"
                                >
                                <span
                                    class="prev"
                                    data-controls="prev"
                                    aria-controls="property"
                                    tabindex="-1"
                                    >Prev</span
                                >
                                <span
                                    class="next"
                                    data-controls="next"
                                    aria-controls="property"
                                    tabindex="-1"
                                    >Next</span
                                >
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>


        <section class="features-1">
            <div class="container">
                <div class="row">
                    <div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="300">
                        <div class="box-feature">
                            <span class="flaticon-house"></span>
                            <h3 class="mb-3">Our Properties</h3>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                                Voluptates, accusamus.
                            </p>
                            <p><a href="#" class="learn-more">Learn More</a></p>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="500">
                        <div class="box-feature">
                            <span class="flaticon-building"></span>
                            <h3 class="mb-3">Property for Sale</h3>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                                Voluptates, accusamus.
                            </p>
                            <p><a href="#" class="learn-more">Learn More</a></p>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="400">
                        <div class="box-feature">
                            <span class="flaticon-house-3"></span>
                            <h3 class="mb-3">Real Estate Agent</h3>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                                Voluptates, accusamus.
                            </p>
                            <p><a href="#" class="learn-more">Learn More</a></p>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="600">
                        <div class="box-feature">
                            <span class="flaticon-house-1"></span>
                            <h3 class="mb-3">House for Sale</h3>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                                Voluptates, accusamus.
                            </p>
                            <p><a href="#" class="learn-more">Learn More</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="Footer.jsp"></jsp:include>
            <script src="js/bootstrap.bundle.min.js"></script>
            <script src="js/tiny-slider.js"></script>
            <script src="js/aos.js"></script>
            <script src="js/navbar.js"></script>
            <script src="js/counter.js"></script>
            <script src="js/custom.js"></script>

            <script>
                                    function saveFavorite(event, landLotID) {
    event.preventDefault(); // Prevent the default form submission

    const form = event.target.closest('form'); // Get the form element
    const formData = new FormData(form); // Get the form data

    formData.append('landLotID', landLotID); // Add landLotID to FormData

    const data = {};
    formData.forEach((value, key) => {
        data[key] = value;
    });

    // AJAX request
    $.ajax({
        url: form.action,
        type: 'POST',
        data: data,
        success: function(response) {
            const result = JSON.parse(response);

            if (result.status === "success") {
                alert(result.message); // Display success message
                const button = form.querySelector('button');
                button.classList.remove('btn-secondary');
                button.classList.add('btn-danger');
                button.innerText = 'Bỏ lưu';
            } else {
                alert(result.message); // Display failure message if save failed
            }
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
            alert("An error occurred while processing your request.");
        }
    });
}

        </script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


    </body>
</html>