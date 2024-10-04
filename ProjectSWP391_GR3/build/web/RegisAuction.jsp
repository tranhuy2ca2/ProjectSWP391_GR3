<%-- 
    Document   : RegisAuction
    Created on : Oct 3, 2024, 2:16:26 PM
    Author     : FPTSHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Danh sách tài sản - Lạc Việt Auction</title>
       <meta property="og:image" content="/images/logo-dau-gia-lac-viet.png" />
<link rel="icon" href="/favicon.ico" type="image/gif" sizes="20x20">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/all.css">

<link rel="stylesheet" href="css/bootstrap.min.css">

<link rel="stylesheet" href="css/boxicons.min.css">

<link rel="stylesheet" href="css/bootstrap-icons.css">

<link rel="stylesheet" href="css/jquery-ui.css">

<link rel="stylesheet" href="css/swiper-bundle.min.css">

<link rel="stylesheet" href="css/slick-theme.css">
<link rel="stylesheet" href="css/slick.css">

<link rel="stylesheet" href="css/nice-select.css">

<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/odometer.css">

<link rel="stylesheet" href="css/style.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">

<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css" rel="stylesheet" type="text/css" />


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" type='text/css' media='all' />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
<link rel="stylesheet" href="/css/sweetalert2.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.2/css/jquery.dataTables.css">
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script>
    var systemURL = "https://lacvietauction.vn/";
    var currentServerDatetimeValue = new Date("10/03/2024 02:20:45 PM");
</script>
<script src="js/jquery-3.6.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/auctionCore.js"></script>
<script src="js/novaticUtil.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script type='text/javascript' src='js/jquery.countdown.minc58b.js?ver=1.2.33'></script>
<script type='text/javascript' src='js/jquery.countdown.languagec58b.js?ver=1.2.33'></script>
    </head>
    <body>
        <div class="mobile-search">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-11">
                        <label>Nhập từ khóa tìm kiếm tài sản...</label>
                        <input type="text" placeholder="Tìm kiếm" id="key-searching">
                    </div>
                    <div class="col-1 d-flex justify-content-end align-items-center">
                        <div class="search-cross-btn style-3">
                            <i class="bi bi-x"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <header style="background: white; width: 100%" class="scroll-down-header">
            <header class="container header-area style-3">
                <div class="header-logo">
                    <a href="/"><img alt="image" src="/files/frontend/images/core/logo-dau-gia-lac-viet.png"></a>
                </div>
                <div class="main-menu">
                    <div class="mobile-logo-area d-lg-none d-flex justify-content-between align-items-center">
                        <div class="mobile-logo-wrap ">
                            <a href="/"><img alt="image" src="/files/frontend/images/core/logo-dau-gia-lac-viet.png" height="50"></a>
                        </div>
                        <div class="menu-close-btn">
                            <i class="bi bi-x-lg"></i>
                        </div>
                    </div>
                    <div class="mobile-menu-form mb-5" id="loginMobile">
                        <div class="input-with-btn d-flex flex-column">
                            <ul class="menu-list" style="width:100%;">
                                <li class="menu-item-has-children">
                                    <a href="#" class="drop-down">${username}</a><i class="bx bx-caret-down dropdown-icon"></i>
                                    <ul class="submenu">
                                        <li>
                                            <a onclick="TabSelectAccount('#ho-so')">
                                                <svg width="12" height="12" viewBox="0 0 30 30" id="_03_-_Account" data-name="03 - Account" xmlns="http://www.w3.org/2000/svg">
                                                <path id="Path_217" data-name="Path 217" d="M16,1a8,8,0,1,0,8,8A8,8,0,0,0,16,1Zm0,2a6,6,0,1,1-6,6A6,6,0,0,1,16,3Z" transform="translate(-1 -1)" fill-rule="evenodd" />
                                                <path id="Path_218" data-name="Path 218" d="M16,19.2c-5.657,0-10.558,1.175-13,2.82A3.865,3.865,0,0,0,1,25.1a3.865,3.865,0,0,0,2,3.08C5.442,29.825,10.343,31,16,31s10.558-1.175,13-2.82a3.865,3.865,0,0,0,2-3.08,3.865,3.865,0,0,0-2-3.08C26.558,20.375,21.657,19.2,16,19.2Zm0,2a26.973,26.973,0,0,1,10.867,1.909,5.8,5.8,0,0,1,1.694,1.132,1.06,1.06,0,0,1,0,1.718,5.8,5.8,0,0,1-1.694,1.132A26.973,26.973,0,0,1,16,29,26.973,26.973,0,0,1,5.133,27.091a5.8,5.8,0,0,1-1.694-1.132,1.06,1.06,0,0,1,0-1.718,5.8,5.8,0,0,1,1.694-1.132A26.973,26.973,0,0,1,16,21.2Z" transform="translate(-1 -1)" fill-rule="evenodd" />
                                                </svg>
                                                Thông tin cá nhân
                                            </a>
                                        </li>
                                        <li>
                                            <a onclick="TabSelectAccount('#thong-bao')">
                                                <svg fill="#000000" width="12" height="12" viewBox="0 0 36 36" version="1.1" preserveAspectRatio="xMidYMid meet" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                                <title>bell-line</title>
                                                <path class="clr-i-outline clr-i-outline-path-1" d="M32.51,27.83A14.4,14.4,0,0,1,30,24.9a12.63,12.63,0,0,1-1.35-4.81V15.15A10.81,10.81,0,0,0,19.21,4.4V3.11a1.33,1.33,0,1,0-2.67,0V4.42A10.81,10.81,0,0,0,7.21,15.15v4.94A12.63,12.63,0,0,1,5.86,24.9a14.4,14.4,0,0,1-2.47,2.93,1,1,0,0,0-.34.75v1.36a1,1,0,0,0,1,1h27.8a1,1,0,0,0,1-1V28.58A1,1,0,0,0,32.51,27.83ZM5.13,28.94a16.17,16.17,0,0,0,2.44-3,14.24,14.24,0,0,0,1.65-5.85V15.15a8.74,8.74,0,1,1,17.47,0v4.94a14.24,14.24,0,0,0,1.65,5.85,16.17,16.17,0,0,0,2.44,3Z"></path>
                                                <path class="clr-i-outline clr-i-outline-path-2" d="M18,34.28A2.67,2.67,0,0,0,20.58,32H15.32A2.67,2.67,0,0,0,18,34.28Z"></path>
                                                <rect x="0" y="0" width="36" height="36" fill-opacity="0" />
                                                </svg>
                                                Thông báo
                                            </a>
                                        </li>
                                        <li>
                                            <a onclick="TabSelectAccount('#lich-bieu')">
                                                <svg width="12" height="12" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                                <path fill="#454242" d="M5.67326018,0 C6.0598595,0 6.37326018,0.31324366 6.37326018,0.699649298 L6.373,2.009 L13.89,2.009 L13.8901337,0.708141199 C13.8901337,0.321735562 14.2035343,0.00849190182 14.5901337,0.00849190182 C14.976733,0.00849190182 15.2901337,0.321735562 15.2901337,0.708141199 L15.29,2.009 L18,2.00901806 C19.1045695,2.00901806 20,2.90399995 20,4.00801605 L20,18.001002 C20,19.1050181 19.1045695,20 18,20 L2,20 C0.8954305,20 0,19.1050181 0,18.001002 L0,4.00801605 C0,2.90399995 0.8954305,2.00901806 2,2.00901806 L4.973,2.009 L4.97326018,0.699649298 C4.97326018,0.31324366 5.28666085,0 5.67326018,0 Z M1.4,7.742 L1.4,18.001002 C1.4,18.3322068 1.66862915,18.6007014 2,18.6007014 L18,18.6007014 C18.3313708,18.6007014 18.6,18.3322068 18.6,18.001002 L18.6,7.756 L1.4,7.742 Z M6.66666667,14.6186466 L6.66666667,16.284778 L5,16.284778 L5,14.6186466 L6.66666667,14.6186466 Z M10.8333333,14.6186466 L10.8333333,16.284778 L9.16666667,16.284778 L9.16666667,14.6186466 L10.8333333,14.6186466 Z M15,14.6186466 L15,16.284778 L13.3333333,16.284778 L13.3333333,14.6186466 L15,14.6186466 Z M6.66666667,10.6417617 L6.66666667,12.3078931 L5,12.3078931 L5,10.6417617 L6.66666667,10.6417617 Z M10.8333333,10.6417617 L10.8333333,12.3078931 L9.16666667,12.3078931 L9.16666667,10.6417617 L10.8333333,10.6417617 Z M15,10.6417617 L15,12.3078931 L13.3333333,12.3078931 L13.3333333,10.6417617 L15,10.6417617 Z M4.973,3.408 L2,3.40831666 C1.66862915,3.40831666 1.4,3.67681122 1.4,4.00801605 L1.4,6.343 L18.6,6.357 L18.6,4.00801605 C18.6,3.67681122 18.3313708,3.40831666 18,3.40831666 L15.29,3.408 L15.2901337,4.33697436 C15.2901337,4.72338 14.976733,5.03662366 14.5901337,5.03662366 C14.2035343,5.03662366 13.8901337,4.72338 13.8901337,4.33697436 L13.89,3.408 L6.373,3.408 L6.37326018,4.32848246 C6.37326018,4.7148881 6.0598595,5.02813176 5.67326018,5.02813176 C5.28666085,5.02813176 4.97326018,4.7148881 4.97326018,4.32848246 L4.973,3.408 Z" />
                                                </svg>
                                                Lịch biểu
                                            </a>
                                        </li>
                                        <li>
                                            <a onclick="TabSelectAccount('#dau-gia-cua-toi')">
                                                <svg fill="#000000" width="12" height="12" viewBox="0 0 32 32" version="1.1" xmlns="http://www.w3.org/2000/svg">
                                                <title>auction</title>
                                                <path d="M11.623 7.603l6.062 3.5c0.479 0.276 1.090 0.112 1.365-0.366 0.277-0.478 0.113-1.090-0.365-1.365l-6.062-3.5c-0.479-0.276-1.090-0.112-1.366 0.365s-0.112 1.089 0.366 1.366zM17.186 11.969l-6.062-3.5-3.5 6.062 6.062 3.5 3.5-6.062zM6.123 17.129l6.062 3.5c0.478 0.276 1.090 0.112 1.365-0.366s0.112-1.090-0.365-1.365l-6.062-3.5c-0.479-0.276-1.090-0.112-1.366 0.365-0.277 0.478-0.112 1.090 0.366 1.366zM27.012 19.951l-11.076-5.817-1 1.732 10.576 6.683c0.717 0.414 1.635 0.169 2.049-0.549s0.168-1.635-0.549-2.049zM16.033 25c0-0.553-0.448-1-1-1h-9c-0.553 0-1 0.447-1 1 0 0.552 0 1 0 1l-1.033-0.021 0.033 1.021h13l0.047-0.958-0.984-0.042c0 0-0.063-0.448-0.063-1z"></path>
                                                </svg>
                                                Đấu giá của tôi
                                            </a>
                                        </li>
                                        <li>
                                            <a onclick="TabSelectAccount('#lich-su-dau-gia')">
                                                <svg fill="#000000" width="12" height="12" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M3,12.2928932 L3,12 C3,7.02943725 7.02943725,3 12,3 C16.9705627,3 21,7.02943725 21,12 C21,16.9705627 16.9705627,21 12,21 C9.83094568,21 7.7795552,20.2294045 6.16280756,18.8505586 C5.45850266,18.2498909 4.84967664,17.5439447 4.359624,16.7587075 C4.21342347,16.5244426 4.2848137,16.2160145 4.51907855,16.069814 C4.75334339,15.9236134 5.06177151,15.9950037 5.20797204,16.2292685 C5.64372413,16.9274972 6.1852566,17.5554151 6.81171475,18.089691 C8.24914371,19.3156047 10.071062,20 12,20 C16.418278,20 20,16.418278 20,12 C20,7.581722 16.418278,4 12,4 C7.581722,4 4,7.581722 4,12 L4,12.2928932 L5.14644661,11.1464466 C5.34170876,10.9511845 5.65829124,10.9511845 5.85355339,11.1464466 C6.04881554,11.3417088 6.04881554,11.6582912 5.85355339,11.8535534 L3.85355339,13.8535534 C3.65829124,14.0488155 3.34170876,14.0488155 3.14644661,13.8535534 L1.14644661,11.8535534 C0.951184464,11.6582912 0.951184464,11.3417088 1.14644661,11.1464466 C1.34170876,10.9511845 1.65829124,10.9511845 1.85355339,11.1464466 L3,12.2928932 Z M15.6969596,13.0404275 C15.9507745,13.1492053 16.0683503,13.4431448 15.9595725,13.6969596 C15.8507947,13.9507745 15.5568552,14.0683503 15.3030404,13.9595725 L11.8030404,12.4595725 C11.6717691,12.4033134 11.5708217,12.2936038 11.5256584,12.1581139 L10.0256584,7.65811388 C9.93833446,7.39614222 10.0799145,7.11298224 10.3418861,7.02565835 C10.6038578,6.93833446 10.8870178,7.07991446 10.9743416,7.34188612 L12.4033381,11.6288754 L15.6969596,13.0404275 Z" />
                                                </svg>
                                                Lịch sử đấu giá
                                            </a>
                                        </li>
                                        <li>
                                            <a onclick="TabSelectAccount('#tai-lieu-cua-toi')">
                                                <svg fill="#000000" width="12" height="12" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M20,6.52897986 L20,19.5010024 C20,20.8817143 18.8807119,22.0010024 17.5,22.0010024 L6.5,22.0010024 C5.11928813,22.0010024 4,20.8817143 4,19.5010024 L4,4.50100238 C4,3.1202905 5.11928813,2.00100238 6.5,2.00100238 L15.4720225,2.00100238 C15.6047688,1.99258291 15.7429463,2.03684187 15.8535534,2.14744899 L19.8535534,6.14744899 C19.9641605,6.25805611 20.0084195,6.39623363 20,6.52897986 Z M15,3.00100238 L6.5,3.00100238 C5.67157288,3.00100238 5,3.67257525 5,4.50100238 L5,19.5010024 C5,20.3294295 5.67157288,21.0010024 6.5,21.0010024 L17.5,21.0010024 C18.3284271,21.0010024 19,20.3294295 19,19.5010024 L19,7.00100238 L15.5,7.00100238 C15.2238576,7.00100238 15,6.77714475 15,6.50100238 L15,3.00100238 Z M16,3.70810916 L16,6.00100238 L18.2928932,6.00100238 L16,3.70810916 Z M8.5,10 C8.22385763,10 8,9.77614237 8,9.5 C8,9.22385763 8.22385763,9 8.5,9 L15.5,9 C15.7761424,9 16,9.22385763 16,9.5 C16,9.77614237 15.7761424,10 15.5,10 L8.5,10 Z M8.5,13 C8.22385763,13 8,12.7761424 8,12.5 C8,12.2238576 8.22385763,12 8.5,12 L15.5,12 C15.7761424,12 16,12.2238576 16,12.5 C16,12.7761424 15.7761424,13 15.5,13 L8.5,13 Z M8.5,16 C8.22385763,16 8,15.7761424 8,15.5 C8,15.2238576 8.22385763,15 8.5,15 L13.5,15 C13.7761424,15 14,15.2238576 14,15.5 C14,15.7761424 13.7761424,16 13.5,16 L8.5,16 Z" />
                                                </svg>
                                                Tài liệu
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:Logout();">
                                                <svg width="12" height="12" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                                <path fill="#555" d="M10.2392344,0 C13.3845587,0 16.2966635,1.39466883 18.2279685,3.74426305 C18.4595621,4.02601608 18.4134356,4.43777922 18.124942,4.66396176 C17.8364485,4.89014431 17.4148346,4.84509553 17.183241,4.5633425 C15.5035716,2.51988396 12.9739849,1.30841121 10.2392344,1.30841121 C5.32416443,1.30841121 1.33971292,5.19976806 1.33971292,10 C1.33971292,14.8002319 5.32416443,18.6915888 10.2392344,18.6915888 C13.0144533,18.6915888 15.5774656,17.443711 17.2546848,15.3485857 C17.4825482,15.0639465 17.9035339,15.0136047 18.1949827,15.2361442 C18.4864315,15.4586837 18.5379776,15.8698333 18.3101142,16.1544725 C16.3816305,18.5634688 13.4311435,20 10.2392344,20 C4.58426141,20 8.8817842e-14,15.5228475 8.8817842e-14,10 C8.8817842e-14,4.4771525 4.58426141,0 10.2392344,0 Z M17.0978642,7.15999289 L19.804493,9.86662172 C20.0660882,10.1282169 20.071043,10.5473918 19.8155599,10.802875 L17.17217,13.4462648 C16.9166868,13.701748 16.497512,13.6967932 16.2359168,13.435198 C15.9743215,13.1736028 15.9693667,12.7544279 16.2248499,12.4989447 L17.7715361,10.9515085 L7.46239261,10.9518011 C7.0924411,10.9518011 6.79253615,10.6589032 6.79253615,10.2975954 C6.79253615,9.93628766 7.0924411,9.64338984 7.46239261,9.64338984 L17.7305361,9.64250854 L16.1726778,8.08517933 C15.9110825,7.82358411 15.9061278,7.40440925 16.1616109,7.14892607 C16.4170941,6.89344289 16.836269,6.89839767 17.0978642,7.15999289 Z" />
                                                </svg>
                                                Đăng xuất
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>

                        </div>
                    </div>
                    <ul class="menu-list">
                        <li class="menu-item-has-children">
                            <a href="/danh-muc-tai-san" class="drop-down">
                                T&#xE0;i s&#x1EA3;n &#x111;&#x1EA5;u gi&#xE1;
                            </a>
                            <i class='bx bx-plus dropdown-icon'></i>
                            <ul class="submenu">
                                <li>
                                    <a href="/danh-muc-tai-san/1000070-tai-san-thanh-ly">
                                        T&#xE0;i s&#x1EA3;n nh&#xE0; n&#x1B0;&#x1EDB;c
                                    </a>
                                </li>
                                <li>
                                    <a href="/danh-muc-tai-san/1000071-bat-dong-san">
                                        B&#x1EA5;t &#x111;&#x1ED9;ng s&#x1EA3;n
                                    </a>
                                </li>
                                <li>
                                    <a href="/danh-muc-tai-san/1000072-phuong-tien-xe-co">
                                        Ph&#x1B0;&#x1A1;ng ti&#x1EC7;n - xe c&#x1ED9;
                                    </a>
                                </li>
                                <li>
                                    <a href="/danh-muc-tai-san/1000073-suu-tam-nghe-thuat">
                                        S&#x1B0;u t&#x1EA7;m - ngh&#x1EC7; thu&#x1EAD;t
                                    </a>
                                </li>
                                <li>
                                    <a href="/danh-muc-tai-san/1000074-hang-hieu-xa-xi">
                                        H&#xE0;ng hi&#x1EC7;u xa x&#x1EC9;
                                    </a>
                                </li>
                                <li>
                                    <a href="/danh-muc-tai-san/1000075-tang-vat-bi-tich-thu">
                                        Tang v&#x1EAD;t b&#x1ECB; t&#x1ECB;ch thu
                                    </a>
                                </li>
                                <li>
                                    <a href="/danh-muc-tai-san/1000076-tai-san-khac">
                                        T&#xE0;i s&#x1EA3;n kh&#xE1;c
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="#" class="drop-down">Cu&#x1ED9;c &#x111;&#x1EA5;u gi&#xE1;</a><i class='bx bx-plus dropdown-icon'></i>
                            <ul class="submenu">
                                <li><a href='/danh-sach-dau-gia/sap-dien-ra'>Cuộc đấu giá sắp đấu giá</a></li><li><a href='/danh-sach-dau-gia/dang-dien-ra'>Cuộc đấu giá đang diễn ra</a></li><li><a href='/danh-sach-dau-gia/da-ket-thuc'>Cuộc đấu giá đã kết thúc</a></li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="#" class="drop-down">Tin t&#x1EE9;c</a><i class='bx bx-plus dropdown-icon'></i>
                            <ul class="submenu">
                                <li><a href='/danh-muc-tin-tuc/thong-bao'>Thông báo</a></li><li><a href='/danh-muc-tin-tuc/thong-bao-dau-gia'>Thông báo đấu giá</a></li><li><a href='/tin-tuc'>Tin khác</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="/gioi-thieu">Gi&#x1EDB;i thi&#x1EC7;u</a>
                        </li>
                        <li>
                            <a href="/lien-he">Li&#xEA;n h&#x1EC7;</a>
                        </li>
                    </ul>
                    <div class="mobile-changelang" >
                        <button class="mobile-changelang-btn" onclick="changeLanguage('en-US', '/danh-muc-tai-san/1000071-bat-dong-san')">Tiếng Anh<img class="mobile-changelang-img" src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Flag_of_the_United_Kingdom_%281-2%29.svg/1200px-Flag_of_the_United_Kingdom_%281-2%29.svg.png" alt="image"></button>
                    </div>
                    <div class="d-lg-none d-block">
                        <form class="mobile-menu-form mb-5">
                            <div class="input-with-btn d-flex flex-column">
                                <input type="text" placeholder="Nhập từ khóa tìm kiếm tài sản..." id="key-searching-mobile">
                                <button type="button" class="eg-btn btn--primary3 btn--sm" style="text-transform: none; margin-top: 10px;" onclick="FilterMobile()">Tìm kiếm tài sản</button>
                            </div>
                        </form>

                    </div>
                </div>
                <div class="nav-right d-flex align-items-center">

                    <input id="lang" style="display:none;" value="vi-VI" />
                    <div class="topbar-right" style="display: none;">
                        <ul class="topbar-right-list">
                            <li>
                                <span class="current-language-text"style="font-size: 16px;">VI</span><img class="img-language-current"src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Flag_of_Vietnam.svg/1200px-Flag_of_Vietnam.svg.png" alt="image">
                                <ul class="topbar-sublist">
                                    <li class="vie-lang" onclick="changeLanguage('vi-VN', '/danh-muc-tai-san/1000071-bat-dong-san')"><span>Tiếng Việt</span><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Flag_of_Vietnam.svg/1200px-Flag_of_Vietnam.svg.png" alt="image"></li>
                                    <li class="eng-lang"onclick="changeLanguage('en-US', '/danh-muc-tai-san/1000071-bat-dong-san')"> <span>English</span><img style=""src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Flag_of_the_United_Kingdom_%281-2%29.svg/1200px-Flag_of_the_United_Kingdom_%281-2%29.svg.png" alt="image"></li>
                                </ul>
                            </li>
                        </ul>
                    </div> 
                    <div id="server-time-clock" data-v-65fff26b="" aria-haspopup="true" class="wrapper-AtBcr u-isActionable u-textLeft u-inlineBlock u-borderNone u-textBold u-textNoWrap Arrange Arrange--middle u-userLauncherColor">
                        <div id="time-part1">14:20:46</div>
                        <div id="date-part1">Th&#x1B0;&#x301; N&#x103;m, 03/10/2024</div>
                    </div>

                    <div class="search-btn">
                        <i class="bi bi-search"></i>
                    </div>

                    <div class="dropdown">
                        <div class="eg-btn btn--primary3 header-btn dropbtn" id="account-info">
                            <a href="javascript:void(0)">
                                <i class="fa-solid fa-user"></i> ngaitom2004
                            </a>
                        </div>
                        <div class="dropdown-content">

                            <a onclick="TabSelectAccount('#ho-so')">
                                <svg width="12" height="12" viewBox="0 0 30 30" id="_03_-_Account" data-name="03 - Account" xmlns="http://www.w3.org/2000/svg">
                                <path id="Path_217" data-name="Path 217" d="M16,1a8,8,0,1,0,8,8A8,8,0,0,0,16,1Zm0,2a6,6,0,1,1-6,6A6,6,0,0,1,16,3Z" transform="translate(-1 -1)" fill-rule="evenodd" />
                                <path id="Path_218" data-name="Path 218" d="M16,19.2c-5.657,0-10.558,1.175-13,2.82A3.865,3.865,0,0,0,1,25.1a3.865,3.865,0,0,0,2,3.08C5.442,29.825,10.343,31,16,31s10.558-1.175,13-2.82a3.865,3.865,0,0,0,2-3.08,3.865,3.865,0,0,0-2-3.08C26.558,20.375,21.657,19.2,16,19.2Zm0,2a26.973,26.973,0,0,1,10.867,1.909,5.8,5.8,0,0,1,1.694,1.132,1.06,1.06,0,0,1,0,1.718,5.8,5.8,0,0,1-1.694,1.132A26.973,26.973,0,0,1,16,29,26.973,26.973,0,0,1,5.133,27.091a5.8,5.8,0,0,1-1.694-1.132,1.06,1.06,0,0,1,0-1.718,5.8,5.8,0,0,1,1.694-1.132A26.973,26.973,0,0,1,16,21.2Z" transform="translate(-1 -1)" fill-rule="evenodd" />
                                </svg>
                                Thông tin cá nhân
                            </a>
                            <a onclick="TabSelectAccount('#thong-bao')">
                                <svg fill="#000000" width="12" height="12" viewBox="0 0 36 36" version="1.1" preserveAspectRatio="xMidYMid meet" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                <title>bell-line</title>
                                <path class="clr-i-outline clr-i-outline-path-1" d="M32.51,27.83A14.4,14.4,0,0,1,30,24.9a12.63,12.63,0,0,1-1.35-4.81V15.15A10.81,10.81,0,0,0,19.21,4.4V3.11a1.33,1.33,0,1,0-2.67,0V4.42A10.81,10.81,0,0,0,7.21,15.15v4.94A12.63,12.63,0,0,1,5.86,24.9a14.4,14.4,0,0,1-2.47,2.93,1,1,0,0,0-.34.75v1.36a1,1,0,0,0,1,1h27.8a1,1,0,0,0,1-1V28.58A1,1,0,0,0,32.51,27.83ZM5.13,28.94a16.17,16.17,0,0,0,2.44-3,14.24,14.24,0,0,0,1.65-5.85V15.15a8.74,8.74,0,1,1,17.47,0v4.94a14.24,14.24,0,0,0,1.65,5.85,16.17,16.17,0,0,0,2.44,3Z"></path>
                                <path class="clr-i-outline clr-i-outline-path-2" d="M18,34.28A2.67,2.67,0,0,0,20.58,32H15.32A2.67,2.67,0,0,0,18,34.28Z"></path>
                                <rect x="0" y="0" width="36" height="36" fill-opacity="0" />
                                </svg>
                                Thông báo
                            </a>
                            <a onclick="TabSelectAccount('#lich-bieu')">
                                <svg width="12" height="12" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path fill="#454242" d="M5.67326018,0 C6.0598595,0 6.37326018,0.31324366 6.37326018,0.699649298 L6.373,2.009 L13.89,2.009 L13.8901337,0.708141199 C13.8901337,0.321735562 14.2035343,0.00849190182 14.5901337,0.00849190182 C14.976733,0.00849190182 15.2901337,0.321735562 15.2901337,0.708141199 L15.29,2.009 L18,2.00901806 C19.1045695,2.00901806 20,2.90399995 20,4.00801605 L20,18.001002 C20,19.1050181 19.1045695,20 18,20 L2,20 C0.8954305,20 0,19.1050181 0,18.001002 L0,4.00801605 C0,2.90399995 0.8954305,2.00901806 2,2.00901806 L4.973,2.009 L4.97326018,0.699649298 C4.97326018,0.31324366 5.28666085,0 5.67326018,0 Z M1.4,7.742 L1.4,18.001002 C1.4,18.3322068 1.66862915,18.6007014 2,18.6007014 L18,18.6007014 C18.3313708,18.6007014 18.6,18.3322068 18.6,18.001002 L18.6,7.756 L1.4,7.742 Z M6.66666667,14.6186466 L6.66666667,16.284778 L5,16.284778 L5,14.6186466 L6.66666667,14.6186466 Z M10.8333333,14.6186466 L10.8333333,16.284778 L9.16666667,16.284778 L9.16666667,14.6186466 L10.8333333,14.6186466 Z M15,14.6186466 L15,16.284778 L13.3333333,16.284778 L13.3333333,14.6186466 L15,14.6186466 Z M6.66666667,10.6417617 L6.66666667,12.3078931 L5,12.3078931 L5,10.6417617 L6.66666667,10.6417617 Z M10.8333333,10.6417617 L10.8333333,12.3078931 L9.16666667,12.3078931 L9.16666667,10.6417617 L10.8333333,10.6417617 Z M15,10.6417617 L15,12.3078931 L13.3333333,12.3078931 L13.3333333,10.6417617 L15,10.6417617 Z M4.973,3.408 L2,3.40831666 C1.66862915,3.40831666 1.4,3.67681122 1.4,4.00801605 L1.4,6.343 L18.6,6.357 L18.6,4.00801605 C18.6,3.67681122 18.3313708,3.40831666 18,3.40831666 L15.29,3.408 L15.2901337,4.33697436 C15.2901337,4.72338 14.976733,5.03662366 14.5901337,5.03662366 C14.2035343,5.03662366 13.8901337,4.72338 13.8901337,4.33697436 L13.89,3.408 L6.373,3.408 L6.37326018,4.32848246 C6.37326018,4.7148881 6.0598595,5.02813176 5.67326018,5.02813176 C5.28666085,5.02813176 4.97326018,4.7148881 4.97326018,4.32848246 L4.973,3.408 Z" />
                                </svg>
                                Lịch biểu
                            </a>
                            <a onclick="TabSelectAccount('#dau-gia-cua-toi')">
                                <svg fill="#000000" width="12" height="12" viewBox="0 0 32 32" version="1.1" xmlns="http://www.w3.org/2000/svg">
                                <title>auction</title>
                                <path d="M11.623 7.603l6.062 3.5c0.479 0.276 1.090 0.112 1.365-0.366 0.277-0.478 0.113-1.090-0.365-1.365l-6.062-3.5c-0.479-0.276-1.090-0.112-1.366 0.365s-0.112 1.089 0.366 1.366zM17.186 11.969l-6.062-3.5-3.5 6.062 6.062 3.5 3.5-6.062zM6.123 17.129l6.062 3.5c0.478 0.276 1.090 0.112 1.365-0.366s0.112-1.090-0.365-1.365l-6.062-3.5c-0.479-0.276-1.090-0.112-1.366 0.365-0.277 0.478-0.112 1.090 0.366 1.366zM27.012 19.951l-11.076-5.817-1 1.732 10.576 6.683c0.717 0.414 1.635 0.169 2.049-0.549s0.168-1.635-0.549-2.049zM16.033 25c0-0.553-0.448-1-1-1h-9c-0.553 0-1 0.447-1 1 0 0.552 0 1 0 1l-1.033-0.021 0.033 1.021h13l0.047-0.958-0.984-0.042c0 0-0.063-0.448-0.063-1z"></path>
                                </svg>
                                Đấu giá của tôi
                            </a>
                            <a onclick="TabSelectAccount('#lich-su-dau-gia')">
                                <svg fill="#000000" width="12" height="12" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path d="M3,12.2928932 L3,12 C3,7.02943725 7.02943725,3 12,3 C16.9705627,3 21,7.02943725 21,12 C21,16.9705627 16.9705627,21 12,21 C9.83094568,21 7.7795552,20.2294045 6.16280756,18.8505586 C5.45850266,18.2498909 4.84967664,17.5439447 4.359624,16.7587075 C4.21342347,16.5244426 4.2848137,16.2160145 4.51907855,16.069814 C4.75334339,15.9236134 5.06177151,15.9950037 5.20797204,16.2292685 C5.64372413,16.9274972 6.1852566,17.5554151 6.81171475,18.089691 C8.24914371,19.3156047 10.071062,20 12,20 C16.418278,20 20,16.418278 20,12 C20,7.581722 16.418278,4 12,4 C7.581722,4 4,7.581722 4,12 L4,12.2928932 L5.14644661,11.1464466 C5.34170876,10.9511845 5.65829124,10.9511845 5.85355339,11.1464466 C6.04881554,11.3417088 6.04881554,11.6582912 5.85355339,11.8535534 L3.85355339,13.8535534 C3.65829124,14.0488155 3.34170876,14.0488155 3.14644661,13.8535534 L1.14644661,11.8535534 C0.951184464,11.6582912 0.951184464,11.3417088 1.14644661,11.1464466 C1.34170876,10.9511845 1.65829124,10.9511845 1.85355339,11.1464466 L3,12.2928932 Z M15.6969596,13.0404275 C15.9507745,13.1492053 16.0683503,13.4431448 15.9595725,13.6969596 C15.8507947,13.9507745 15.5568552,14.0683503 15.3030404,13.9595725 L11.8030404,12.4595725 C11.6717691,12.4033134 11.5708217,12.2936038 11.5256584,12.1581139 L10.0256584,7.65811388 C9.93833446,7.39614222 10.0799145,7.11298224 10.3418861,7.02565835 C10.6038578,6.93833446 10.8870178,7.07991446 10.9743416,7.34188612 L12.4033381,11.6288754 L15.6969596,13.0404275 Z" />
                                </svg>
                                Lịch sử đấu giá
                            </a>
                            <a onclick="TabSelectAccount('#tai-lieu-cua-toi')">
                                <svg fill="#000000" width="12" height="12" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path d="M20,6.52897986 L20,19.5010024 C20,20.8817143 18.8807119,22.0010024 17.5,22.0010024 L6.5,22.0010024 C5.11928813,22.0010024 4,20.8817143 4,19.5010024 L4,4.50100238 C4,3.1202905 5.11928813,2.00100238 6.5,2.00100238 L15.4720225,2.00100238 C15.6047688,1.99258291 15.7429463,2.03684187 15.8535534,2.14744899 L19.8535534,6.14744899 C19.9641605,6.25805611 20.0084195,6.39623363 20,6.52897986 Z M15,3.00100238 L6.5,3.00100238 C5.67157288,3.00100238 5,3.67257525 5,4.50100238 L5,19.5010024 C5,20.3294295 5.67157288,21.0010024 6.5,21.0010024 L17.5,21.0010024 C18.3284271,21.0010024 19,20.3294295 19,19.5010024 L19,7.00100238 L15.5,7.00100238 C15.2238576,7.00100238 15,6.77714475 15,6.50100238 L15,3.00100238 Z M16,3.70810916 L16,6.00100238 L18.2928932,6.00100238 L16,3.70810916 Z M8.5,10 C8.22385763,10 8,9.77614237 8,9.5 C8,9.22385763 8.22385763,9 8.5,9 L15.5,9 C15.7761424,9 16,9.22385763 16,9.5 C16,9.77614237 15.7761424,10 15.5,10 L8.5,10 Z M8.5,13 C8.22385763,13 8,12.7761424 8,12.5 C8,12.2238576 8.22385763,12 8.5,12 L15.5,12 C15.7761424,12 16,12.2238576 16,12.5 C16,12.7761424 15.7761424,13 15.5,13 L8.5,13 Z M8.5,16 C8.22385763,16 8,15.7761424 8,15.5 C8,15.2238576 8.22385763,15 8.5,15 L13.5,15 C13.7761424,15 14,15.2238576 14,15.5 C14,15.7761424 13.7761424,16 13.5,16 L8.5,16 Z" />
                                </svg>
                                Tài liệu
                            </a>
                            <a href="javascript:Logout();">
                                <svg width="12" height="12" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path fill="#555" d="M10.2392344,0 C13.3845587,0 16.2966635,1.39466883 18.2279685,3.74426305 C18.4595621,4.02601608 18.4134356,4.43777922 18.124942,4.66396176 C17.8364485,4.89014431 17.4148346,4.84509553 17.183241,4.5633425 C15.5035716,2.51988396 12.9739849,1.30841121 10.2392344,1.30841121 C5.32416443,1.30841121 1.33971292,5.19976806 1.33971292,10 C1.33971292,14.8002319 5.32416443,18.6915888 10.2392344,18.6915888 C13.0144533,18.6915888 15.5774656,17.443711 17.2546848,15.3485857 C17.4825482,15.0639465 17.9035339,15.0136047 18.1949827,15.2361442 C18.4864315,15.4586837 18.5379776,15.8698333 18.3101142,16.1544725 C16.3816305,18.5634688 13.4311435,20 10.2392344,20 C4.58426141,20 8.8817842e-14,15.5228475 8.8817842e-14,10 C8.8817842e-14,4.4771525 4.58426141,0 10.2392344,0 Z M17.0978642,7.15999289 L19.804493,9.86662172 C20.0660882,10.1282169 20.071043,10.5473918 19.8155599,10.802875 L17.17217,13.4462648 C16.9166868,13.701748 16.497512,13.6967932 16.2359168,13.435198 C15.9743215,13.1736028 15.9693667,12.7544279 16.2248499,12.4989447 L17.7715361,10.9515085 L7.46239261,10.9518011 C7.0924411,10.9518011 6.79253615,10.6589032 6.79253615,10.2975954 C6.79253615,9.93628766 7.0924411,9.64338984 7.46239261,9.64338984 L17.7305361,9.64250854 L16.1726778,8.08517933 C15.9110825,7.82358411 15.9061278,7.40440925 16.1616109,7.14892607 C16.4170941,6.89344289 16.836269,6.89839767 17.0978642,7.15999289 Z" />
                                </svg>
                                Đăng xuất
                            </a>
                        </div>
                    </div>



                    <div class="mobile-menu-btn d-lg-none d-block">
                        <i class='bx bx-menu'></i>
                    </div>
                </div>
            </header>
        </header>
        <div id="loginModal" class="modal fade" role="dialog" tabindex="-1">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="form-wrapper">
                            <div class="modal-header-custom">
                                <ul id="navTabs" class="nav nav-tabs" style="border-bottom: unset;">
                                    <li id="closeLoginModalContainer"><a data-toggle="modal" data-dismiss="modal" id="closeLoginModal" onclick="closeModalLogin()" style="color: black;"><i id="btnCloseLoginModal" class="fa fa-times"></i></a></li>
                                </ul>
                            </div>
                            <div class="form-title">
                                <div style=" " class="loginLogoContainer">
                                    <img src="/files/frontend/images/core/logo-dau-gia-lac-viet.png" style="" class="loginLogo">
                                </div>
                                <p>B&#x1EA1;n ch&#x1B0;a c&#xF3; t&#xE0;i kho&#x1EA3;n? <a href="sign_up.jsp">&#x110;&#x103;ng k&#xFD; ngay</a></p>
                            </div>
                            <form onsubmit="return Login(event);" class="w-100">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-inner">
                                            <label>T&#xEA;n &#x111;&#x103;ng nh&#x1EAD;p / Email</label>
                                            <input id="user_login" type="text" placeholder="Nh&#x1EAD;p t&#xEA;n &#x111;&#x103;ng nh&#x1EAD;p/Email">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-inner">
                                            <label>M&#x1EAD;t kh&#x1EA9;u</label>
                                            <input type="password" name="password" id="user_pass" placeholder="M&#x1EAD;t kh&#x1EA9;u">
                                            <i class="bi bi-eye-slash" id="togglePassword"></i>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-agreement form-inner d-flex justify-content-between flex-wrap">
                                            <a href="/quen-mat-khau" class="forgot-pass">Qu&#xEA;n m&#x1EAD;t kh&#x1EA9;u?</a>
                                        </div>
                                    </div>
                                </div>
                                <button class="account-btn" type="submit">&#x110;&#x103;ng nh&#x1EAD;p</button>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="live-auction-section pb-120">
            <img alt="image" src="/LVT/assets/images/bg/section-bg.png" class="img-fluid section-bg-top" />
            <img alt="image" src="/LVT/assets/images/bg/section-bg.png" class="img-fluid section-bg-bottom" />
            <div class="container">
                <div class="row high-padding">
                    <div class="col-lg-3 col-md-4 sidebar-content">
                        <div class="blog-widget-item fadeInUp" data-wow-duration="1.5s" data-wow-delay=".2s" style="visibility: visible; animation-duration: 1.5s; animation-name: fadeInUp;">
                            <div class="search-area">
                                <div class="sidebar-widget-title">
                                    <div class="sidebar-widget-title-text">
                                        <h4>T&#xEC;m ki&#x1EBF;m</h4>
                                        <span class="hight-light"></span>
                                    </div>
                                    <div class="sidebar-widget-title-tools">
                                        <div class="filter-mobile">
                                            <div class="dropdown">
                                                <button class="btn btn-default filter-button-mobile" id="dropdownMenuClickableInside" type="button" data-bs-toggle="dropdown" data-bs-auto-close="false" onclick="nstSliderMobile()">
                                                    <p>
                                                        B&#x1ED9; L&#x1ECD;c
                                                    </p>
                                                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M3.29701 5.2338C3.52243 4.27279 4.27279 3.52243 5.2338 3.29701V3.29701C6.06663 3.10165 6.93337 3.10165 7.7662 3.29701V3.29701C8.72721 3.52243 9.47757 4.27279 9.70299 5.2338V5.2338C9.89835 6.06663 9.89835 6.93337 9.70299 7.7662V7.7662C9.47757 8.72721 8.72721 9.47757 7.7662 9.70299V9.70299C6.93337 9.89835 6.06663 9.89835 5.2338 9.70299V9.70299C4.27279 9.47757 3.52243 8.72721 3.29701 7.7662V7.7662C3.10166 6.93337 3.10166 6.06663 3.29701 5.2338V5.2338Z" stroke="#363853" stroke-width="1.5" />
                                                    <path d="M3.29701 16.2338C3.52243 15.2728 4.27279 14.5224 5.2338 14.297V14.297C6.06663 14.1017 6.93337 14.1017 7.7662 14.297V14.297C8.72721 14.5224 9.47757 15.2728 9.70299 16.2338V16.2338C9.89835 17.0666 9.89835 17.9334 9.70299 18.7662V18.7662C9.47757 19.7272 8.72721 20.4776 7.7662 20.703V20.703C6.93337 20.8983 6.06663 20.8983 5.2338 20.703V20.703C4.27279 20.4776 3.52243 19.7272 3.29701 18.7662V18.7662C3.10166 17.9334 3.10166 17.0666 3.29701 16.2338V16.2338Z" stroke="#363853" stroke-width="1.5" />
                                                    <path d="M14.297 5.2338C14.5224 4.27279 15.2728 3.52243 16.2338 3.29701V3.29701C17.0666 3.10165 17.9334 3.10165 18.7662 3.29701V3.29701C19.7272 3.52243 20.4776 4.27279 20.703 5.2338V5.2338C20.8983 6.06663 20.8983 6.93337 20.703 7.7662V7.7662C20.4776 8.72721 19.7272 9.47757 18.7662 9.70299V9.70299C17.9334 9.89835 17.0666 9.89835 16.2338 9.70299V9.70299C15.2728 9.47757 14.5224 8.72721 14.297 7.7662V7.7662C14.1017 6.93337 14.1017 6.06663 14.297 5.2338V5.2338Z" stroke="#363853" stroke-width="1.5" />
                                                    <path d="M14.297 16.2338C14.5224 15.2728 15.2728 14.5224 16.2338 14.297V14.297C17.0666 14.1017 17.9334 14.1017 18.7662 14.297V14.297C19.7272 14.5224 20.4776 15.2728 20.703 16.2338V16.2338C20.8983 17.0666 20.8983 17.9334 20.703 18.7662V18.7662C20.4776 19.7272 19.7272 20.4776 18.7662 20.703V20.703C17.9334 20.8983 17.0666 20.8983 16.2338 20.703V20.703C15.2728 20.4776 14.5224 19.7272 14.297 18.7662V18.7662C14.1017 17.9334 14.1017 17.0666 14.297 16.2338V16.2338Z" stroke="#363853" stroke-width="1.5" />
                                                    </svg>
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuClickableInside">
                                                    <div class="dropdown-item">
                                                        <div class="filter-mobile-title">
                                                            <h4>
                                                                Tr&#x1EA1;ng th&#xE1;i
                                                            </h4>
                                                            <span class="hight-light"></span>
                                                        </div>
                                                        <label class="containercheckbox">
                                                            T&#x1EA5;t c&#x1EA3;
                                                            <input type="checkbox" class="status-checkall" name="checkbox-status" value="0"  />
                                                            <span class="checkmark"></span>
                                                        </label>
                                                        <label class="containercheckbox">
                                                            S&#x1EAF;p di&#x1EC5;n ra
                                                            <input type="checkbox" class="checkbox-status" name="checkbox-status" value="1" />
                                                            <span class="checkmark"></span>
                                                        </label>
                                                        <label class="containercheckbox">
                                                            &#x110;ang di&#x1EC5;n ra
                                                            <input type="checkbox" class="checkbox-status" name="checkbox-status" value="2" />
                                                            <span class="checkmark"></span>
                                                        </label>
                                                        <label class="containercheckbox">
                                                            &#x110;&#xE3; k&#x1EBF;t th&#xFA;c
                                                            <input type="checkbox" class="checkbox-status" name="checkbox-status" value="3" />
                                                            <span class="checkmark"></span>
                                                        </label>
                                                    </div>
                                                    <div class="dropdown-item">
                                                        <div class="filter-mobile-title">
                                                            <h4>H&#xEC;nh th&#x1EE9;c &#x111;&#x1EA5;u gi&#xE1;</h4>
                                                            <span class="hight-light"></span>
                                                        </div>
                                                        <div class="blog-widget-body">
                                                            <form>
                                                                <div class="form-inner">
                                                                    <label class="containercheckbox">
                                                                        &#x110;&#x1EA5;u gi&#xE1; t&#xE0;i s&#x1EA3;n c&#xF4;ng
                                                                        <input type="checkbox" class="checkbox-type" name="checkbox-status" value="1000001" />
                                                                        <div class="checkmark"></div>
                                                                    </label>
                                                                    <label class="containercheckbox">
                                                                        &#x110;&#x1EA5;u gi&#xE1; t&#x1EF1; nguy&#x1EC7;n
                                                                        <input type="checkbox" class="checkbox-type" name="checkbox-status" value="1000002" />
                                                                        <div class="checkmark"></div>
                                                                    </label>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="blog-widget-body">
                                    <form>
                                        <div class="form-inner">
                                            <div class="filter-search">
                                                <input type="search" id="filterKeyword" class="search-field" placeholder='Nh&#x1EAD;p t&#x1EEB; kh&#xF3;a...' value="" name="s" />
                                            </div>
                                            <div class="filter-date" style="">
                                                <div class="filter-date-body" style="display: flex; gap: 5px; margin-bottom: 15px;">
                                                    <div class="from-date-container">
                                                        <label style="font-weight: 600;">T&#x1EEB; ng&#xE0;y</label>
                                                        <div id="fromDate" class="input-group date datepicker" data-date-format="mm-dd-yyyy" style="padding:0">
                                                            <span class="input-group-addon" style="background-color: white; border: unset; border-bottom: 1px solid #e5ecef; border-radius: 0; padding: 5px; "><i class="fa-solid fa-calendar"></i></span>
                                                            <input class="form-control" type="text" style="border: none; border-bottom: 1px solid #e5ecef; box-shadow: unset; border-radius: 0;" />
                                                        </div>
                                                    </div>
                                                    <div class="to-date-container">
                                                        <label style="font-weight: 600;">&#x110;&#x1EBF;n ng&#xE0;y</label>
                                                        <div id="toDate" class="input-group date datepicker" data-date-format="mm-dd-yyyy" style="padding:0">
                                                            <span class="input-group-addon" style="background-color: white; border: unset; border-bottom: 1px solid #e5ecef; border-radius: 0; padding: 5px; "><i class="fa-solid fa-calendar"></i></span>
                                                            <input class="form-control" type="text" style="border: none; border-bottom: 1px solid #e5ecef; box-shadow: unset; border-radius: 0;" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class=" " style="">
                                                    <input type="button" class="button Buttonbtn" id="btnFilterCategory" value='L&#x1ECD;c' />
                                                    <input id="btnCleanFilterCategory" type="button" style="display:none" class="button Buttonbtn" value="B&#x1ECF; L&#x1ECD;c" />
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <aside id="Auction-Property-Category" class="widget woocommerce widget_product_categories">
                            <div class="blog-widget-item fadeInUp" data-wow-duration="1.5s" data-wow-delay=".2s" style="visibility: visible; animation-duration: 1.5s; animation-delay: 0.2s; animation-name: fadeInUp;">
                                <div class="search-area">
                                    <div class="sidebar-widget-title">
                                        <h4>Tr&#x1EA1;ng th&#xE1;i t&#xE0;i s&#x1EA3;n</h4>
                                        <span class="hight-light"></span>
                                    </div>
                                    <div class="blog-widget-body">
                                        <form>
                                            <div class="form-inner">
                                                <label class="containercheckbox">
                                                    T&#x1EA5;t c&#x1EA3; <span id="count-all"></span>
                                                    <input type="checkbox" class="status-checkall" name="checkbox-status" value="0" />
                                                    <span class="checkmark"></span>
                                                </label>
                                                <label class="containercheckbox">
                                                    S&#x1EAF;p di&#x1EC5;n ra
                                                    <input type="checkbox" class="checkbox-status" name="checkbox-status" value="1" checked=checked />
                                                    <span class="checkmark"></span>
                                                </label>
                                                <label class="containercheckbox">
                                                    &#x110;ang di&#x1EC5;n ra
                                                    <input type="checkbox" class="checkbox-status" name="checkbox-status" value="2" />
                                                    <span class="checkmark"></span>
                                                </label>
                                                <label class="containercheckbox">
                                                    &#x110;&#xE3; k&#x1EBF;t th&#xFA;c
                                                    <input type="checkbox" class="checkbox-status" name="checkbox-status" value="3" />
                                                    <span class="checkmark"></span>
                                                </label>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </aside>
                        <aside id="Category-child" class="widget woocommerce widget_recent_auctions">
                            <div class="blog-widget-item fadeInUp" data-wow-duration="1.5s" data-wow-delay=".2s" style="visibility: visible; animation-duration: 1.5s; animation-delay: 0.2s; animation-name: fadeInUp;">
                                <div class="search-area">
                                    <div class="sidebar-widget-title">
                                        <h4>Tài sản mới</h4>
                                        <span class="hight-light"></span>
                                    </div>
                                    <div class="blog-widget-body">
                                        <form>
                                            <div class="form-inner">
                                                <ul class="product_list_widget">
                                                    <li style="visibility: visible; animation-duration: 1.5s; animation-delay: 1.2s; animation-name: fadeInDown;">
                                                        <a href="/tai-san-dau-gia/1003095-01-xe-o-to-con-nhan-hieu-kia,-dong-xe-spectra;-bien-so-dang-ky:-31a-6249">
                                                            <img width="200" height="200" data-src="" class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image lazy" alt="" sizes="(max-width: 200px) 100vw, 200px" style="height:70px;" /><span class="ellipsis2"> 01 xe &#xF4; t&#xF4; con nh&#xE3;n hi&#x1EC7;u KIA, d&#xF2;ng xe SPECTRA; Bi&#x1EC3;n s&#x1ED1; &#x111;&#x103;ng k&#xFD;: 31A-6249</span>
                                                        </a> <span class="auction-price starting-bid" data-auction-id="5868" data-bid="" data-status="future"><span class="starting auction">Giá khởi điểm:</span> <span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol novaticPrice">52.020.000</span> VN&#x110;</span></span>
                                                    </li>
                                                    <li style="visibility: visible; animation-duration: 1.5s; animation-delay: 1.2s; animation-name: fadeInDown;">
                                                        <a href="/tai-san-dau-gia/1003094-01-xe-o-to-loai-05-cho-ngoi,-nhan-hieu-ford-focus,-bien-kiem-soat:-36b-2969,-xuat-xu:-viet-nam,-nam-san-xuat:-2010">
                                                            <img width="200" height="200" data-src="" class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image lazy" alt="" sizes="(max-width: 200px) 100vw, 200px" style="height:70px;" /><span class="ellipsis2"> 01 xe &#xF4; t&#xF4; lo&#x1EA1;i 05 ch&#x1ED7; ng&#x1ED3;i, nh&#xE3;n hi&#x1EC7;u FORD FOCUS, bi&#x1EC3;n ki&#x1EC3;m so&#xE1;t: 36B-2969, xu&#x1EA5;t x&#x1EE9;: Vi&#x1EC7;t Nam, n&#x103;m s&#x1EA3;n xu&#x1EA5;t: 2010</span>
                                                        </a> <span class="auction-price starting-bid" data-auction-id="5868" data-bid="" data-status="future"><span class="starting auction">Giá khởi điểm:</span> <span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol novaticPrice">112.000.000</span> VN&#x110;</span></span>
                                                    </li>
                                                    <li style="visibility: visible; animation-duration: 1.5s; animation-delay: 1.2s; animation-name: fadeInDown;">
                                                        <a href="/tai-san-dau-gia/1003092-xe-o-to-nhan-hieu-toyota-hiace-2.0,-bks:-80b-2030-do-van-phong-trung-uong-dang-quan-ly">
                                                            <img width="200" height="200" data-src="" class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image lazy" alt="" sizes="(max-width: 200px) 100vw, 200px" style="height:70px;" /><span class="ellipsis2"> Xe &#xF4; t&#xF4; nh&#xE3;n hi&#x1EC7;u Toyota Hiace 2.0, BKS: 80B-2030 do V&#x103;n ph&#xF2;ng Trung &#x1B0;&#x1A1;ng &#x110;&#x1EA3;ng qu&#x1EA3;n l&#xFD;</span>
                                                        </a> <span class="auction-price starting-bid" data-auction-id="5868" data-bid="" data-status="future"><span class="starting auction">Giá khởi điểm:</span> <span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol novaticPrice">10.500.000</span> VN&#x110;</span></span>
                                                    </li>

                                                </ul>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </aside>
                    </div>
                    <div class="col-lg-9 col-md-8">
                        <div class="view-list">
                            <select id="FilterSort">
                                <option value="1">M&#x1EDB;i &#x2192; C&#x169;</option>
                                <option value="2">C&#x169; &#x2192; M&#x1EDB;i</option>
                            </select>
                            <div class="view-mode">
                                <button onclick="myFunctionList('list')" class="DateTimeFilter-ListButton"><i class="fas fa-list" style="color: lightgray;"></i></button>
                                <button onclick="myFunctionList('grid')" class="DateTimeFilter-BorderButton"><i class="fas fa-border-all" style="color: rgb(0, 0, 0);"></i></button>
                            </div>
                        </div>
                        <div class="row gy-4 mb-60 d-flex list-item">
                            <div class="col-lg-4 col-md-12 col-sm-12 item-property " data-id="1001221" data-openingprice="39000000" data-propertystatusid="1000004" data-createdtime="02/07/2021 14:20:42">
                                <div data-wow-duration="1.5s" data-wow-delay="0.2s" class="eg-card auction-card1 animate-up">
                                    <div class="auction-img">
                                        <a href="/tai-san-dau-gia/1001221-diem-x6---thua-06-thon-nguyen-khe"><img class="auction-img-background lazy" alt="image" data-src="https://lacvietauction.vn/auctionDev/thumbs/1001210/Image/&#x1EA2;nh T&#xE0;i s&#x1EA3;n/N&#x103;m 2021/&#x110;&#xF4;ng Anh T7/X6 Nguy&#xEA;n Kh&#xEA;.jpg" /></a>
                                        <div class="auction-timer">
                                            <div class="countdown" id="timer6">
                                                <h4>
                                                    <span>Đã kết thúc </span>
                                                </h4>
                                            </div>
                                        </div>
                                        <div class="author-area">
                                            <div class="author-emo">
                                                <img alt="image" src="https://data.lvo.vn/media/upload/1001768/Logo/LOGO-LVAuction.png" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="auction-content">
                                        <h4><a class="ellipsis4" href="/tai-san-dau-gia/1001221-diem-x6---thua-06-thon-nguyen-khe">&#x110;i&#x1EC3;m X6 - Th&#x1EED;a 06 th&#xF4;n Nguy&#xEA;n Kh&#xEA;</a></h4>
                                        <p>Giá khởi điểm : <span style="color: #b41712">39.000.000</span><span style="font-size:14px;"> VN&#x110;/m&#xB2;</span></p>
                                        <p>Trạng thái : <span class="auctio-status auction-done-success">&#x110;&#xE3; k&#x1EBF;t th&#xFA;c th&#xE0;nh c&#xF4;ng</span></p>
                                        <p>Ngày kết thúc : <span>18/07/2021 10:50</span></p>
                                        <div class="auction-card-bttm">
                                            <a href="/tai-san-dau-gia/1001221-diem-x6---thua-06-thon-nguyen-khe" class="eg-btn btn--primary btn--sm">Chi tiết</a>
                                            <div class="share-area">
                                                <ul class="social-icons d-flex">
                                                    <li><a style="cursor:pointer" onclick="hrefShare('https://www.facebook.com/sharer/sharer.php?u=https://lacvietauction.vn//tai-san-dau-gia/1001221-diem-x6---thua-06-thon-nguyen-khe')"><i class="bx bxl-facebook"></i></a></li>
                                                </ul>
                                                <div>
                                                    <div class="share-btn"><i class='bx bxs-share-alt'></i></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12 col-sm-12 item-property " data-id="1001208" data-openingprice="45000000" data-propertystatusid="1000004" data-createdtime="02/07/2021 11:49:16">
                                <div data-wow-duration="1.5s" data-wow-delay="0.2s" class="eg-card auction-card1 animate-up">
                                    <div class="auction-img">
                                        <a href="/tai-san-dau-gia/1001208-diem-x4---thua-05-thon-nguyen-khe"><img class="auction-img-background lazy" alt="image" data-src="https://lacvietauction.vn/auctionDev/thumbs/1001210/Image/&#x1EA2;nh T&#xE0;i s&#x1EA3;n/N&#x103;m 2021/&#x110;&#xF4;ng Anh T7/X4 Nguy&#xEA;n Kh&#xEA;.jpg" /></a>
                                        <div class="auction-timer">
                                            <div class="countdown" id="timer6">
                                                <h4>
                                                    <span>Đã kết thúc </span>
                                                </h4>
                                            </div>
                                        </div>
                                        <div class="author-area">
                                            <div class="author-emo">
                                                <img alt="image" src="https://data.lvo.vn/media/upload/1001768/Logo/LOGO-LVAuction.png" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="auction-content">
                                        <h4><a class="ellipsis4" href="/tai-san-dau-gia/1001208-diem-x4---thua-05-thon-nguyen-khe">&#x110;i&#x1EC3;m X4 - Th&#x1EED;a 05 th&#xF4;n Nguy&#xEA;n Kh&#xEA;</a></h4>
                                        <p>Giá khởi điểm : <span style="color: #b41712">45.000.000</span><span style="font-size:14px;"> VN&#x110;/m&#xB2;</span></p>
                                        <p>Trạng thái : <span class="auctio-status auction-done-success">&#x110;&#xE3; k&#x1EBF;t th&#xFA;c th&#xE0;nh c&#xF4;ng</span></p>
                                        <p>Ngày kết thúc : <span>18/07/2021 09:50</span></p>
                                        <div class="auction-card-bttm">
                                            <a href="/tai-san-dau-gia/1001208-diem-x4---thua-05-thon-nguyen-khe" class="eg-btn btn--primary btn--sm">Chi tiết</a>
                                            <div class="share-area">
                                                <ul class="social-icons d-flex">
                                                    <li><a style="cursor:pointer" onclick="hrefShare('https://www.facebook.com/sharer/sharer.php?u=https://lacvietauction.vn//tai-san-dau-gia/1001208-diem-x4---thua-05-thon-nguyen-khe')"><i class="bx bxl-facebook"></i></a></li>
                                                </ul>
                                                <div>
                                                    <div class="share-btn"><i class='bx bxs-share-alt'></i></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12 col-sm-12 item-property " data-id="1001205" data-openingprice="45000000" data-propertystatusid="1000004" data-createdtime="02/07/2021 11:46:16">
                                <div data-wow-duration="1.5s" data-wow-delay="0.2s" class="eg-card auction-card1 animate-up">
                                    <div class="auction-img">
                                        <a href="/tai-san-dau-gia/1001205-diem-x4---thua-02-thon-nguyen-khe"><img class="auction-img-background lazy" alt="image" data-src="https://lacvietauction.vn/auctionDev/thumbs/1001210/Image/&#x1EA2;nh T&#xE0;i s&#x1EA3;n/N&#x103;m 2021/&#x110;&#xF4;ng Anh T7/X4 Nguy&#xEA;n Kh&#xEA;.jpg" /></a>
                                        <div class="auction-timer">
                                            <div class="countdown" id="timer6">
                                                <h4>
                                                    <span>Đã kết thúc </span>
                                                </h4>
                                            </div>
                                        </div>
                                        <div class="author-area">
                                            <div class="author-emo">
                                                <img alt="image" src="https://data.lvo.vn/media/upload/1001768/Logo/LOGO-LVAuction.png" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="auction-content">
                                        <h4><a class="ellipsis4" href="/tai-san-dau-gia/1001205-diem-x4---thua-02-thon-nguyen-khe">&#x110;i&#x1EC3;m X4 - Th&#x1EED;a 02 th&#xF4;n Nguy&#xEA;n Kh&#xEA;</a></h4>
                                        <p>Giá khởi điểm : <span style="color: #b41712">45.000.000</span><span style="font-size:14px;"> VN&#x110;/m&#xB2;</span></p>
                                        <p>Trạng thái : <span class="auctio-status auction-done-success">&#x110;&#xE3; k&#x1EBF;t th&#xFA;c th&#xE0;nh c&#xF4;ng</span></p>
                                        <p>Ngày kết thúc : <span>18/07/2021 09:35</span></p>
                                        <div class="auction-card-bttm">
                                            <a href="/tai-san-dau-gia/1001205-diem-x4---thua-02-thon-nguyen-khe" class="eg-btn btn--primary btn--sm">Chi tiết</a>
                                            <div class="share-area">
                                                <ul class="social-icons d-flex">
                                                    <li><a style="cursor:pointer" onclick="hrefShare('https://www.facebook.com/sharer/sharer.php?u=https://lacvietauction.vn//tai-san-dau-gia/1001205-diem-x4---thua-02-thon-nguyen-khe')"><i class="bx bxl-facebook"></i></a></li>
                                                </ul>
                                                <div>
                                                    <div class="share-btn"><i class='bx bxs-share-alt'></i></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12 col-sm-12 item-property " data-id="1001204" data-openingprice="51000000" data-propertystatusid="1000004" data-createdtime="02/07/2021 11:44:21">
                                <div data-wow-duration="1.5s" data-wow-delay="0.2s" class="eg-card auction-card1 animate-up">
                                    <div class="auction-img">
                                        <a href="/tai-san-dau-gia/1001204-diem-x4---thua-01-thon-nguyen-khe"><img class="auction-img-background lazy" alt="image" data-src="https://lacvietauction.vn/auctionDev/thumbs/1001210/Image/&#x1EA2;nh T&#xE0;i s&#x1EA3;n/N&#x103;m 2021/&#x110;&#xF4;ng Anh T7/X4 Nguy&#xEA;n Kh&#xEA;.jpg" /></a>
                                        <div class="auction-timer">
                                            <div class="countdown" id="timer6">
                                                <h4>
                                                    <span>Đã kết thúc </span>
                                                </h4>
                                            </div>
                                        </div>
                                        <div class="author-area">
                                            <div class="author-emo">
                                                <img alt="image" src="https://data.lvo.vn/media/upload/1001768/Logo/LOGO-LVAuction.png" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="auction-content">
                                        <h4><a class="ellipsis4" href="/tai-san-dau-gia/1001204-diem-x4---thua-01-thon-nguyen-khe">&#x110;i&#x1EC3;m X4 - Th&#x1EED;a 01 th&#xF4;n Nguy&#xEA;n Kh&#xEA;</a></h4>
                                        <p>Giá khởi điểm : <span style="color: #b41712">51.000.000</span><span style="font-size:14px;"> VN&#x110;/m&#xB2;</span></p>
                                        <p>Trạng thái : <span class="auctio-status auction-done-success">&#x110;&#xE3; k&#x1EBF;t th&#xFA;c th&#xE0;nh c&#xF4;ng</span></p>
                                        <p>Ngày kết thúc : <span>18/07/2021 09:30</span></p>
                                        <div class="auction-card-bttm">
                                            <a href="/tai-san-dau-gia/1001204-diem-x4---thua-01-thon-nguyen-khe" class="eg-btn btn--primary btn--sm">Chi tiết</a>
                                            <div class="share-area">
                                                <ul class="social-icons d-flex">
                                                    <li><a style="cursor:pointer" onclick="hrefShare('https://www.facebook.com/sharer/sharer.php?u=https://lacvietauction.vn//tai-san-dau-gia/1001204-diem-x4---thua-01-thon-nguyen-khe')"><i class="bx bxl-facebook"></i></a></li>
                                                </ul>
                                                <div>
                                                    <div class="share-btn"><i class='bx bxs-share-alt'></i></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12 col-sm-12 item-property " data-id="1001353" data-openingprice="147240000" data-propertystatusid="1000004" data-createdtime="06/09/2021 14:36:30">
                                <div data-wow-duration="1.5s" data-wow-delay="0.2s" class="eg-card auction-card1 animate-up">
                                    <div class="auction-img">
                                        <a href="/tai-san-dau-gia/1001353-lo-so-04---khu-tay-nha-ong-trac,-xom-7,-xa-dong-trung"><img class="auction-img-background lazy" alt="image" data-src="https://lacvietauction.vn/auctionDev/thumbs/1001210/Image/N&#x103;m_2021/X&#xE3; &#x110;&#xF4;ng Trung/L&#xF4; s&#x1ED1; 04 - X&#xF3;m 7.jpg" /></a>
                                        <div class="auction-timer">
                                            <div class="countdown" id="timer6">
                                                <h4>
                                                    <span>Đã kết thúc </span>
                                                </h4>
                                            </div>
                                        </div>
                                        <div class="author-area">
                                            <div class="author-emo">
                                                <img alt="image" src="https://data.lvo.vn/media/upload/1001768/Logo/LOGO-LVAuction.png" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="auction-content">
                                        <h4><a class="ellipsis4" href="/tai-san-dau-gia/1001353-lo-so-04---khu-tay-nha-ong-trac,-xom-7,-xa-dong-trung">L&#xF4; s&#x1ED1; 04 - X&#xF3;m 7, x&#xE3; &#x110;&#xF4;ng Trung, Khu T&#xE2;y nh&#xE0; &#xF4;ng Tr&#x1EAF;c</a></h4>
                                        <p>Giá khởi điểm : <span style="color: #b41712">147.240.000</span><span style="font-size:14px;"> VN&#x110;</span></p>
                                        <p>Trạng thái : <span class="auctio-status auction-done-success">&#x110;&#xE3; k&#x1EBF;t th&#xFA;c th&#xE0;nh c&#xF4;ng</span></p>
                                        <p>Ngày kết thúc : <span>14/09/2021 09:40</span></p>
                                        <div class="auction-card-bttm">
                                            <a href="/tai-san-dau-gia/1001353-lo-so-04---khu-tay-nha-ong-trac,-xom-7,-xa-dong-trung" class="eg-btn btn--primary btn--sm">Chi tiết</a>
                                            <div class="share-area">
                                                <ul class="social-icons d-flex">
                                                    <li><a style="cursor:pointer" onclick="hrefShare('https://www.facebook.com/sharer/sharer.php?u=https://lacvietauction.vn//tai-san-dau-gia/1001353-lo-so-04---khu-tay-nha-ong-trac,-xom-7,-xa-dong-trung')"><i class="bx bxl-facebook"></i></a></li>
                                                </ul>
                                                <div>
                                                    <div class="share-btn"><i class='bx bxs-share-alt'></i></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12 col-sm-12 item-property " data-id="1001352" data-openingprice="158520000" data-propertystatusid="1000004" data-createdtime="06/09/2021 14:35:35">
                                <div data-wow-duration="1.5s" data-wow-delay="0.2s" class="eg-card auction-card1 animate-up">
                                    <div class="auction-img">
                                        <a href="/tai-san-dau-gia/1001352-lo-so-03---khu-tay-nha-ong-trac,-xom-7,-xa-dong-trung"><img class="auction-img-background lazy" alt="image" data-src="https://lacvietauction.vn/auctionDev/thumbs/1001210/Image/N&#x103;m_2021/X&#xE3; &#x110;&#xF4;ng Trung/L&#xF4; s&#x1ED1; 03 - X&#xF3;m 7.jpg" /></a>
                                        <div class="auction-timer">
                                            <div class="countdown" id="timer6">
                                                <h4>
                                                    <span>Đã kết thúc </span>
                                                </h4>
                                            </div>
                                        </div>
                                        <div class="author-area">
                                            <div class="author-emo">
                                                <img alt="image" src="https://data.lvo.vn/media/upload/1001768/Logo/LOGO-LVAuction.png" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="auction-content">
                                        <h4><a class="ellipsis4" href="/tai-san-dau-gia/1001352-lo-so-03---khu-tay-nha-ong-trac,-xom-7,-xa-dong-trung">L&#xF4; s&#x1ED1; 03 - X&#xF3;m 7, x&#xE3; &#x110;&#xF4;ng Trung, Khu T&#xE2;y nh&#xE0; &#xF4;ng Tr&#x1EAF;c</a></h4>
                                        <p>Giá khởi điểm : <span style="color: #b41712">158.520.000</span><span style="font-size:14px;"> VN&#x110;</span></p>
                                        <p>Trạng thái : <span class="auctio-status auction-done-success">&#x110;&#xE3; k&#x1EBF;t th&#xFA;c th&#xE0;nh c&#xF4;ng</span></p>
                                        <p>Ngày kết thúc : <span>14/09/2021 09:35</span></p>
                                        <div class="auction-card-bttm">
                                            <a href="/tai-san-dau-gia/1001352-lo-so-03---khu-tay-nha-ong-trac,-xom-7,-xa-dong-trung" class="eg-btn btn--primary btn--sm">Chi tiết</a>
                                            <div class="share-area">
                                                <ul class="social-icons d-flex">
                                                    <li><a style="cursor:pointer" onclick="hrefShare('https://www.facebook.com/sharer/sharer.php?u=https://lacvietauction.vn//tai-san-dau-gia/1001352-lo-so-03---khu-tay-nha-ong-trac,-xom-7,-xa-dong-trung')"><i class="bx bxl-facebook"></i></a></li>
                                                </ul>
                                                <div>
                                                    <div class="share-btn"><i class='bx bxs-share-alt'></i></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12 col-sm-12 item-property " data-id="1001351" data-openingprice="153240000" data-propertystatusid="1000004" data-createdtime="06/09/2021 14:34:30">
                                <div data-wow-duration="1.5s" data-wow-delay="0.2s" class="eg-card auction-card1 animate-up">
                                    <div class="auction-img">
                                        <a href="/tai-san-dau-gia/1001351-lo-so-02---khu-tay-nha-ong-trac,-xom-7,-xa-dong-trung"><img class="auction-img-background lazy" alt="image" data-src="https://lacvietauction.vn/auctionDev/thumbs/1001210/Image/N&#x103;m_2021/X&#xE3; &#x110;&#xF4;ng Trung/L&#x1ED1; s&#x1ED1; 02 - X&#xF3;m 7.jpg" /></a>
                                        <div class="auction-timer">
                                            <div class="countdown" id="timer6">
                                                <h4>
                                                    <span>Đã kết thúc </span>
                                                </h4>
                                            </div>
                                        </div>
                                        <div class="author-area">
                                            <div class="author-emo">
                                                <img alt="image" src="https://data.lvo.vn/media/upload/1001768/Logo/LOGO-LVAuction.png" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="auction-content">
                                        <h4><a class="ellipsis4" href="/tai-san-dau-gia/1001351-lo-so-02---khu-tay-nha-ong-trac,-xom-7,-xa-dong-trung">L&#xF4; s&#x1ED1; 02 - X&#xF3;m 7, x&#xE3; &#x110;&#xF4;ng Trung, Khu T&#xE2;y nh&#xE0; &#xF4;ng Tr&#x1EAF;c</a></h4>
                                        <p>Giá khởi điểm : <span style="color: #b41712">153.240.000</span><span style="font-size:14px;"> VN&#x110;</span></p>
                                        <p>Trạng thái : <span class="auctio-status auction-done-success">&#x110;&#xE3; k&#x1EBF;t th&#xFA;c th&#xE0;nh c&#xF4;ng</span></p>
                                        <p>Ngày kết thúc : <span>14/09/2021 09:30</span></p>
                                        <div class="auction-card-bttm">
                                            <a href="/tai-san-dau-gia/1001351-lo-so-02---khu-tay-nha-ong-trac,-xom-7,-xa-dong-trung" class="eg-btn btn--primary btn--sm">Chi tiết</a>
                                            <div class="share-area">
                                                <ul class="social-icons d-flex">
                                                    <li><a style="cursor:pointer" onclick="hrefShare('https://www.facebook.com/sharer/sharer.php?u=https://lacvietauction.vn//tai-san-dau-gia/1001351-lo-so-02---khu-tay-nha-ong-trac,-xom-7,-xa-dong-trung')"><i class="bx bxl-facebook"></i></a></li>
                                                </ul>
                                                <div>
                                                    <div class="share-btn"><i class='bx bxs-share-alt'></i></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12 col-sm-12 item-property " data-id="1001350" data-openingprice="154440000" data-propertystatusid="1000004" data-createdtime="06/09/2021 14:33:09">
                                <div data-wow-duration="1.5s" data-wow-delay="0.2s" class="eg-card auction-card1 animate-up">
                                    <div class="auction-img">
                                        <a href="/tai-san-dau-gia/1001350-lo-so-01---khu-tay-nha-ong-trac,-xom-7,-xa-dong-trung"><img class="auction-img-background lazy" alt="image" data-src="https://lacvietauction.vn/auctionDev/thumbs/1001210/Image/N&#x103;m_2021/X&#xE3; &#x110;&#xF4;ng Trung/L&#xF4; s&#x1ED1; 01 - X&#xF3;m 7.jpg" /></a>
                                        <div class="auction-timer">
                                            <div class="countdown" id="timer6">
                                                <h4>
                                                    <span>Đã kết thúc </span>
                                                </h4>
                                            </div>
                                        </div>
                                        <div class="author-area">
                                            <div class="author-emo">
                                                <img alt="image" src="https://data.lvo.vn/media/upload/1001768/Logo/LOGO-LVAuction.png" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="auction-content">
                                        <h4><a class="ellipsis4" href="/tai-san-dau-gia/1001350-lo-so-01---khu-tay-nha-ong-trac,-xom-7,-xa-dong-trung">L&#xF4; s&#x1ED1; 01 - X&#xF3;m 7, x&#xE3; &#x110;&#xF4;ng Trung, Khu T&#xE2;y nh&#xE0; &#xF4;ng Tr&#x1EAF;c, </a></h4>
                                        <p>Giá khởi điểm : <span style="color: #b41712">154.440.000</span><span style="font-size:14px;"> VN&#x110;</span></p>
                                        <p>Trạng thái : <span class="auctio-status auction-done-success">&#x110;&#xE3; k&#x1EBF;t th&#xFA;c th&#xE0;nh c&#xF4;ng</span></p>
                                        <p>Ngày kết thúc : <span>14/09/2021 09:25</span></p>
                                        <div class="auction-card-bttm">
                                            <a href="/tai-san-dau-gia/1001350-lo-so-01---khu-tay-nha-ong-trac,-xom-7,-xa-dong-trung" class="eg-btn btn--primary btn--sm">Chi tiết</a>
                                            <div class="share-area">
                                                <ul class="social-icons d-flex">
                                                    <li><a style="cursor:pointer" onclick="hrefShare('https://www.facebook.com/sharer/sharer.php?u=https://lacvietauction.vn//tai-san-dau-gia/1001350-lo-so-01---khu-tay-nha-ong-trac,-xom-7,-xa-dong-trung')"><i class="bx bxl-facebook"></i></a></li>
                                                </ul>
                                                <div>
                                                    <div class="share-btn"><i class='bx bxs-share-alt'></i></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12 col-sm-12 item-property " data-id="1001349" data-openingprice="250050000" data-propertystatusid="1000004" data-createdtime="06/09/2021 14:30:35">
                                <div data-wow-duration="1.5s" data-wow-delay="0.2s" class="eg-card auction-card1 animate-up">
                                    <div class="auction-img">
                                        <a href="/tai-san-dau-gia/1001349-lo-so-02---khu-cua-nha-ong-thuc,-xom-6,-xa-dong-trung"><img class="auction-img-background lazy" alt="image" data-src="https://lacvietauction.vn/auctionDev/thumbs/1001210/Image/N&#x103;m_2021/X&#xE3; &#x110;&#xF4;ng Trung/L&#xF4; s&#x1ED1; 02 - X&#xF3;m 6.jpg" /></a>
                                        <div class="auction-timer">
                                            <div class="countdown" id="timer6">
                                                <h4>
                                                    <span>Đã kết thúc </span>
                                                </h4>
                                            </div>
                                        </div>
                                        <div class="author-area">
                                            <div class="author-emo">
                                                <img alt="image" src="https://data.lvo.vn/media/upload/1001768/Logo/LOGO-LVAuction.png" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="auction-content">
                                        <h4><a class="ellipsis4" href="/tai-san-dau-gia/1001349-lo-so-02---khu-cua-nha-ong-thuc,-xom-6,-xa-dong-trung">L&#xF4; s&#x1ED1; 02 - X&#xF3;m 6, x&#xE3; &#x110;&#xF4;ng Trung, Khu c&#x1EED;a nh&#xE0; &#xF4;ng Th&#x1EE5;c,</a></h4>
                                        <p>Giá khởi điểm : <span style="color: #b41712">250.050.000</span><span style="font-size:14px;"> VN&#x110;</span></p>
                                        <p>Trạng thái : <span class="auctio-status auction-done-success">&#x110;&#xE3; k&#x1EBF;t th&#xFA;c th&#xE0;nh c&#xF4;ng</span></p>
                                        <p>Ngày kết thúc : <span>14/09/2021 09:20</span></p>
                                        <div class="auction-card-bttm">
                                            <a href="/tai-san-dau-gia/1001349-lo-so-02---khu-cua-nha-ong-thuc,-xom-6,-xa-dong-trung" class="eg-btn btn--primary btn--sm">Chi tiết</a>
                                            <div class="share-area">
                                                <ul class="social-icons d-flex">
                                                    <li><a style="cursor:pointer" onclick="hrefShare('https://www.facebook.com/sharer/sharer.php?u=https://lacvietauction.vn//tai-san-dau-gia/1001349-lo-so-02---khu-cua-nha-ong-thuc,-xom-6,-xa-dong-trung')"><i class="bx bxl-facebook"></i></a></li>
                                                </ul>
                                                <div>
                                                    <div class="share-btn"><i class='bx bxs-share-alt'></i></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <nav class="pagination-wrap">
                                <div class="manage-auction-pagination"></div>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function hrefShare(href) {
                window.open(href, "mywindow", "location=0,menubar=0,status=0,scrollbars=0,width=650,height=691");
            }
        </script>
        <script defer src="https://static.cloudflareinsights.com/beacon.min.js/vcd15cbe7772f49c399c6a5babf22c1241717689176015" integrity="sha512-ZpsOmlRQV6y907TI0dKBHq9Md29nnaEIPlkf84rnaERnq6zvWvPUqr2ft8M1aS28oN72PdrCzSjY4U6VaAw1EQ==" data-cf-beacon='{"rayId":"8ccb2be2e89fdd8a","version":"2024.8.0","r":1,"token":"0f1d4e39a6864c7d895e0b9ada569046","serverTiming":{"name":{"cfExtPri":true,"cfL4":true}}}' crossorigin="anonymous"></script>
    </body>
</html>
