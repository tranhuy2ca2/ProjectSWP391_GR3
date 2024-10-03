<%-- 
    Document   : SideBar
    Created on : Aug 26, 2024, 10:50:24 AM
    Author     : TTT
--%>
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

                <li class="nav-item">
                    <i class="bi bi-grid"></i>
                    <span>Dashboard</span>
                </li><!-- End Dashboard Nav -->

                <li class="nav-item">
                    <a class="nav-link collapsed" href="profile">
                        <i class="bi bi-person"></i>
                        <span>Profile</span>
                    </a>
                </li><!-- End Profile Page Nav -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#">
                        <i class="bi bi-book"></i>
                        <span>Ðăng Tin</span>
                    </a>
                </li>
        </aside>   
    </body>
</html>
