<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .nav-link.active {
                background-color: #c5d7f2;
                color: black/* Màu khi mục được chọn */
                    /* Các thuộc tính khác nếu cần */
            }
        </style>
    </head>
    <body>
        <aside style="margin-top: 40px" id="sidebar" class="sidebar">
            <ul class="sidebar-nav" id="sidebar-nav">
                <!-- Other general menu items (visible to all users) -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="profile">
                        <i class="bi bi-person"></i>
                        <span>Profile</span>
                    </a>
                </li>

                <!-- Menu items visible to admin only (role = 1) -->
                <c:if test="${sessionScope.user != null && sessionScope.user.role == 1}">
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="UserManagement">
                            <i class="bi bi-book"></i>
                            <span>Quản lý người dùng</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="#">
                            <i class="bi bi-book"></i>
                            <span>Quản lý auction</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.user != null && sessionScope.user.role == 2}">
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="#">
                            <i class="bi bi-book"></i>
                            <span>Xem phien dau gia</span>
                        </a>
                    </li>

                </c:if>
                <c:if test="${sessionScope.user != null && sessionScope.user.role == 3}">
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="#">
                            <i class="bi bi-book"></i>
                            <span>Xem dau gia</span>
                        </a>
                    </li>

                </c:if>
                <c:if test="${sessionScope.user != null && sessionScope.user.role == 4}">
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="#">
                            <i class="bi bi-book"></i>
                            <span>Xem phien dau gia</span>
                        </a>
                    </li>

                </c:if>
                <c:if test="${sessionScope.user != null && sessionScope.user.role == 5}">
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="#">
                            <i class="bi bi-book"></i>
                            <span>Xem phien dau gia</span>
                        </a>
                    </li>

                </c:if>
            </ul>
        </aside>   
    </body>
</html>
