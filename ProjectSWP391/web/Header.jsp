<%-- 
    Document   : Header
    Created on : Sep 25, 2024, 11:48:06 AM
    Author     : TTT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div class="site-mobile-menu site-navbar-target">
            <div class="site-mobile-menu-header">
                <div class="site-mobile-menu-close">
                    <span class="icofont-close js-menu-toggle"></span>
                </div>
            </div>
            <div class="site-mobile-menu-body"></div>
        </div>

        <nav class="site-nav">
            <div class="container">
                <div class="menu-bg-wrap">
                    <div class="site-navigation">
                        <a href="homepage" class="logo m-0 float-start">Property</a>

                        <ul
                            class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end"
                            >
                            <li class="active"><a href="homepage">Home</a></li>
                            <c:if test="${sessionScope.user==null}">
                                <li><a href="sign_in.jsp">Đăng Nhập</a></li>
                            </c:if>
                            <c:if test="${sessionScope.user!=null}">
                                <li><a href="logout">Đăng Xuất</a></li>
                                <li class="active"><a href="profile?uID=${sessionScope.user.userID}">Hello ${user.fullName}</a></li>
                            </c:if>  
                            <c:if test="${sessionScope.user.role == 1}">    
                                <li class="has-children">
                                    <a href="profile?uID=${sessionScope.user.userID}">Admin</a>
                                    <ul class="dropdown">
                                        <li><a href="#">Buy Property</a></li>
                                        <li><a href="#">Sell Property</a></li>
                                        <li class="has-children">
                                            <a href="#">Dropdown</a>
                                            <ul class="dropdown">
                                                <li><a href="UserManagement">Quan li nguoi dung</a></li>
                                                <li><a href="AuctionManagement">Quản lý auction</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.user.role == 2}">    
                                <li class="has-children">
                                    <a href="profile?uID=${sessionScope.user.userID}">User</a>
                                    <ul class="dropdown">
                                        <li><a href="#">Buy Property</a></li>
                                        <li><a href="#">Sell Property</a></li>
                                        <li class="has-children">
                                            <a href="#">Dropdown</a>
                                            <ul class="dropdown">
                                                <li><a href="myAution">Xem phien dau gia</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                            </c:if>
                             <c:if test="${sessionScope.user.role == 3}">    
                                <li class="has-children">
                                    <a href="profile?uID=${sessionScope.user.userID}"> Staff</a>
                                    <ul class="dropdown">
                                        <li><a href="#">Buy Property</a></li>
                                        <li><a href="#">Sell Property</a></li>
                                        <li class="has-children">
                                            <a href="#">Dropdown</a>
                                            <ul class="dropdown">
                                                <li><a href="ManagerTime">Quản lí thời gian đấu giá</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                            </c:if>
                                  <c:if test="${sessionScope.user.role == 4}">    
                                <li class="has-children">
                                    <a href="profile?uID=${sessionScope.user.userID}"> Auctioneer</a>
                                    <ul class="dropdown">
                                        <li><a href="#">Buy Property</a></li>
                                        <li><a href="#">Sell Property</a></li>
                                        <li class="has-children">
                                            <a href="#">Dropdown</a>
                                            <ul class="dropdown">
                                                <li><a href="#">Xem phien dau gia</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                            </c:if>
                            <li><a href="#">Services</a></li>
                            <li><a href="AboutUs.jsp">Giới Thiệu</a></li>
                            <li><a href="Contact.jsp">Liên Hệ</a></li>
                        </ul>

                        <a
                            href="#"
                            class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none"
                            data-toggle="collapse"
                            data-target="#main-navbar"
                            >
                            <span></span>
                        </a>
                    </div>
                </div>
            </div>
        </nav>
    </body>
</html>
