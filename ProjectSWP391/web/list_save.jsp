<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <link href="./assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="./assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="./assets/css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="./css/confirmbox.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="https://suustore.com/assets/frontend/images/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <style>
            .profile .profile-card img {
                max-width: 200px;
            }
            .profile .profile-edit img {
                max-width: 300px;
            }
            .nav-item-a.dropdown:hover,
            .nav-item-a:hover {
                background-color: var(--color-primary-hover);
            }
        </style>
        <title>Danh sách yêu thích</title>
    </head>
    <body>
        <header class="header d-none d-lg-block">
            <jsp:include page="Header.jsp"></jsp:include>
            </header>

        <jsp:include page="SideBar.jsp"></jsp:include>
            <main id="main" class="main" style="margin-top: 40px">
                <div class="pagetitle">
                    <h1>Danh sách các mảnh đất yêu thích</h1>
                </div><!-- End Page Title -->

            <c:if test="${not empty savedLandLots}">
                <table class="table table-striped table-bordered">
                    <thead class="thead-dark">
                        <tr>
                            <th>Tên Đất</th>
                            <th>Vị Trí</th>
                            <th>Diện Tích (m&sup2;)</th>
                            <th>Mô Tả</th>
                            <th>Giá Khởi Điểm (Đơn Vị : Triệu Đồng ₫)</th>
                            <th>Hành Động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="land" items="${savedLandLots}">
                            <tr>
                                <td>${land.landLotName}</td>
                                <td>${land.location}</td>
                                <td>${land.area}</td>
                                <td>${land.description}</td>
                                <td  type='number' maxFractionDigits='0'>${land.startprice}</td>
                                <td>
                                    <form id="unsaveForm_${land.landLotsID}" action="UnsaveAuction" method="post" onsubmit="return unsaveFavorite(event, ${land.landLotsID});">
                                        <input type="hidden" name="landLotID" value="${land.landLotsID}" />
                                        <button type="submit" class="btn btn-danger btn-sm">Bỏ lưu</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>

            <c:if test="${empty savedLandLots}">
                <p>Không có mảnh đất nào trong danh sách yêu thích.</p>
            </c:if>
        </main>
<div id="footer" class="footer border-top pt-2">
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>
        <script>
             function unsaveFavorite(event, landLotID) {
        event.preventDefault();
        const form = event.target.closest('form');

        $.ajax({
            url: form.action,
            type: 'POST',
            data: { landLotID: landLotID },
            success: function (response) {
                const result = JSON.parse(response);
                if (result.status === "success") {
                    alert(result.message);
                    form.closest('tr').remove(); // Remove row from the table
                } else {
                    alert(result.message);
                }
            },
            error: function (xhr, status, error) {
                console.error('Error:', error);
                alert("An error occurred while processing your request.");
            }
        });
    }
        </script>
    </body>
</html>
