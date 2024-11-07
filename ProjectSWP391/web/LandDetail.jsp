<%-- 
    Document   : LandDetail
    Created on : Oct 21, 2024, 3:58:16 PM
    Author     : FPTSHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
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

        <title>
            Chi Tiết Sản Phẩm
        </title>
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>

            <div
                class="hero page-inner overlay"
                style="background-image: url('images/hero_bg_3.jpg')"
                >
                <div class="container">
                    <div class="row justify-content-center align-items-center">
                        <div class="col-lg-9 text-center mt-5">

                            <h1 class="heading" data-aos="fade-up">
                                <!--5232 California AVE. 21BC-->
                            ${b.landLotName}
                        </h1>

                        <nav
                            aria-label="breadcrumb"
                            data-aos="fade-up"
                            data-aos-delay="200"
                            >
                            <ol class="breadcrumb text-center justify-content-center">
                                <li class="breadcrumb-item"><a href="HomePage.jsp">Home</a></li>
                                <li class="breadcrumb-item">
                                    <a href="properties.html">Properties</a>
                                </li>
                                <li
                                    class="breadcrumb-item active text-white-50"
                                    aria-current="page"
                                    >
                                    ${b.landLotName}
                                </li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>

        <div class="section">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-lg-7">
                        <div class="img-property-slide-wrap">
                            <div class="img-property-slide">
                                <img src="${b.landlotimage[0].imageURL}" alt="Image" class="img-fluid" />
                                <img src="${b.landlotimage[1].imageURL}" class="img-fluid" />
                                <img src="${b.landlotimage[2].imageURL}" class="img-fluid" />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <h2 class="heading text-primary">${b.landLotName}</h2>
                        <p class="meta">Mô Tả: ${b.landLotsID}</p>
                        <p class="text-black-50">
                            ${b.description}
                        </p>

                        <div class="d-block agent-box p-5">
                            <div class="img mb-4">
                                <img
                                    src="images/person_2-min.jpg"
                                    alt="Image"
                                    class="img-fluid"
                                    />
                            </div>
                            <div class="text">
                                <h3 class="mb-0">Alicia Huston</h3>
                                <div class="meta mb-3">Real Estate</div>
                                <p>
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                    Ratione laborum quo quos omnis sed magnam id ducimus saepe
                                </p>


                                <ul class="list-unstyled social dark-hover d-flex">
                                    <li class="me-1">
                                        <a href="#"><span class="icon-instagram"></span></a>
                                    </li>
                                    <li class="me-1">
                                        <a href="#"><span class="icon-twitter"></span></a>
                                    </li>
                                    <li class="me-1">
                                        <a href="#"><span class="icon-facebook"></span></a>
                                    </li>
                                    <li class="me-1">
                                        <a href="#"><span class="icon-linkedin"></span></a>
                                    </li>
                                </ul>
                            </div>
                            <c:if test="${sessionScope.user != null && sessionScope.user.role == 2}">
                                <form action="SaveAuction" method="post" onsubmit="saveFavorite(event, ${b.landLotsID})">
                                    <input type="hidden" name="landLotID" value="${b.landLotsID}" />
                                    <button type="submit" class="btn btn-secondary py-2 px-3">Lưu yêu thích</button>
                                </form>
                            </c:if>




                            <!-- <button type="submit" class="btn btn-lg btn-primary">Đăng kí tham gia đấu giá</button>-->
                            <a href="#" class="btn btn-lg btn-primary">Đăng kí tham gia đấu giá</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>

        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/navbar.js"></script>
        <script src="js/counter.js"></script>
        <script src="js/custom.js"></script>
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

    </script>
</body>
</html>

