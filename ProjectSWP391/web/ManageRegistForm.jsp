<%-- 
    Document   : ManageRegistForm
    Created on : Oct 31, 2024, 1:40:36 PM
    Author     : FPTSHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <link href="./assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="./assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="./assets/css/style.css" rel="stylesheet">
    </head>
    <body>
        <div>
            <jsp:include page="Header.jsp"></jsp:include>
        </div>
        <div class="col-md-9">
            <div class="content">
                <div class="stats">
                    <div class="stat">
                        <h3>0</h3>
                        <p>Yêu cầu tham gia đấu giá</p>
                    </div>
                    <div class="stat">
                        <h3>0</h3>
                        <p>Yêu cầu tham gia đấu giá được duyệt</p>
                    </div>
                    <div class="stat">
                        <h3>0</h3>
                        <p>Tài sản Trúng đấu giá</p>
                    </div>
                    <div class="stat">
                        <h3>0 ₫</h3>
                        <p>Tổng giá trị tài sản đã trúng đấu giá</p>
                    </div>
                </div>
                <div class="table-container">
                    <div class="d-flex justify-content-between mb-3">
                        <div>
                            <label for="entries">Xem</label>
                            <select id="entries" class="form-select form-select-sm" style="width: auto; display: inline-block;">
                                <option>10</option>
                                <option>25</option>
                                <option>50</option>
                                <option>100</option>
                            </select>
                            <span>mục</span>
                        </div>
                        <div>
                            <label for="search">Tìm:</label>
                            <input id="search" type="text" class="form-control form-control-sm" style="width: auto; display: inline-block;">
                        </div>
                    </div>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th>Tên tài sản</th>
                                <th>Trạng thái</th>
                                <th>Mã KH</th>
                                <th>Mở đấu giá</th>
                                <th>KQ trả giá</th>
                                <th>Chi tiết</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="7" class="text-center">Không có dữ liệu</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="d-flex justify-content-between">
                        <div>Đang xem 0 đến 0 trong tổng số 0 mục</div>
                        <div>
                            <button class="btn btn-sm btn-outline-secondary">Trước</button>
                            <button class="btn btn-sm btn-outline-secondary">Tiếp</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
