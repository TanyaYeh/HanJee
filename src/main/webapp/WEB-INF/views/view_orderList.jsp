<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <link rel="stylesheet" href="css/bootstrap.min.css">
                <link rel="stylesheet" href="css/templatemo.css">
                <link rel="stylesheet" href="css/custom.css">
                <link rel="stylesheet" href="css/fontawesome.min.css">
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
                <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
                <title>User Order List</title>
                <style>
                    #overview table {
                        width: 100%;
                        /* border-bottom: 5px dashed #d9d9d9; */
                    }

                    #overview table th {
                        padding: 5px;
                        border-bottom: 5px dashed #d9d9d9;
                    }

                    #overview table tr td {
                        padding: 5px;
                        width: 20%;
                        text-align: center;
                    }

                    #overview table tr td:nth-child(1) {
                        width: 30%;
                        text-align: center;
                    }

                    tr:nth-child(even) {
                        background: #89adce;
                    }

                    /* unvisited link */
                    a {
                        color: #27303C;
                    }

                    /* visited link */
                    a:visited {
                        color: #6C89A4;
                    }
                </style>
                <script>
                    function initShowOrderList() {
                        $("#nodata").show();
                        $("#orderList").hide();
                        $("#orderList").html(`<tr style="text-align: center;">
                            <th >訂單編號</th>
                            <th>訂單日期</th>
                            <th>出貨狀態</th>
                            <th>付款狀態</th>
                            <th>檢視訂單明細</th>
                        </tr>`);

                        $.ajax({
                            url: "showUserOrderList",
                            type: "POST",
                            async: false,
                            data: {

                            },
                            success: function (orderList) {
                                var orderListIsShow = false;
                                if (orderList.length != 0) {
                                    orderListIsShow = true;
                                    for (var i = 0; i < orderList.length; i++) {
                                        var order = orderList[i];
                                        var orderNumber = parseInt(order.ord_no);
                                        var orderId = order.ord_id;
                                        //先字串轉整數
                                        var ordDateInt = parseInt(`\${order.ord_date}`);
                                        //再使用new Date()轉換
                                        var ordDate = new Date(ordDateInt);

                                        var dateStr = ordDate.getFullYear() + "/" + ("0" + (ordDate.getMonth() + 1)).slice(-2) + "/" + ("0" + ordDate.getDate()).slice(-2) + " " + ("0" + ordDate.getHours()).slice(-2) + ":" + ("0" + ordDate.getMinutes()).slice(-2) + ":" + ("0" + ordDate.getSeconds()).slice(-2);

                                        var td = `<tr><td class="orderId">\${orderId}</td>
                                    <td>\${dateStr}</td><td>\${order.order_status}</td>
                                    <td>\${order.payment_status}</td>
                                    <td><a href="<c:url value='/orderDetail?ord_no=\${orderNumber}'/>" class="viewHref">檢視</a></td></tr>`
                                        $("#orderList").append(td);

                                    }
                                }
                                if (orderListIsShow) {

                                    $("#nodata").hide();
                                    $("#orderList").show();
                                }
                            }
                        })

                    }



                    $(document).ready(function () {
                        $("#orderListLink").hide();
                        initShowOrderList();

                    })

                </Script>
            </head>

            <body>
                <!-- 主頁的表頭 -->
                <div style="background-color:#4E7C99; margin: 0 auto;">
                    <jsp:include page="/fragment/Top.jsp" />
                </div>
                <br />
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3">
                            <!-- 商城的表頭 -->
                            <jsp:include page="/fragment/mall_Title.jsp"></jsp:include>
                        </div>
                        <div class="col-lg-9">

                            <div class="row pb-3">
                                <div class="col-lg-3">
                                    <h1>我的訂單</h1>
                                </div>
                            </div>
                            <div class="bg-light">

                                <div id="nodata" style="text-align: center;font-size: 30px!important;padding: 10px;">
                                    尚無訂單資料
                                </div>
                                <div id="overview">
                                    <table id="orderList" style="display: none;">

                                        <tr style="text-align: center;">
                                            <th>訂單編號</th>
                                            <th>訂單日期</th>
                                            <th>出貨狀態</th>
                                            <th>付款狀態</th>
                                            <th>檢視訂單明細</th>

                                        </tr>
                                    </table>
                                    <input type="button" value="返回" style="display:none ;" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>


                <script src="js/bootstrap.bundle.min.js"> </script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
                    crossorigin="anonymous"></script>
                <script src="js/templatemo.js"></script>
                <script src="js/custom.js"></script>
            </body>

            </html>