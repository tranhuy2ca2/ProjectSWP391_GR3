<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <title>Thiết Lập Thời Gian Đấu Giá</title>
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
    </head>

    <body>
        <header class="header d-none d-lg-block">
            <jsp:include page="Header.jsp"></jsp:include>
            </header>

        <jsp:include page="SideBar.jsp"></jsp:include>
            <div class="container mt-4" style="margin-left: 290px">
                <br/>
                <h2>Thiết Lập Thời Gian Đấu Giá</h2>
                  <c:if test="${not empty message}">
                                        <div class="alert alert-danger">
                                            ${message}
                                        </div>
                                    </c:if>
                <form action="ManagerTime" method="post" style="padding-top: 0rem">
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>Tên Lô Đất</th>
                                <th>Thời Gian Bắt Đầu</th>
                                <th>Thời Gian Kết Thúc</th>
                                <th>Hành Động</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="auction" items="${auctionList}">
                            <tr>
                                <td>${auction.landLotName}</td>
                                <td>
                                    <input type="datetime-local" name="startTime_${auction.auctionID}" 
                                           value="<fmt:formatDate value='${auction.startTime}' pattern='yyyy-MM-dd\'T\'HH:mm'/>" 
                                           class="form-control"/>
                                </td>
                                <td>
                                    <input type="datetime-local" name="endTime_${auction.auctionID}" 
                                           value="<fmt:formatDate value='${auction.endTime}' pattern='yyyy-MM-dd\'T\'HH:mm'/>" 
                                           class="form-control"/>
                                </td>
                                <td>
                                    <button type="submit" name="auctionID" value="${auction.auctionID}" 
                                            class="btn btn-primary">Cập Nhật</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </form>
        </div>
    </body>
</html>
