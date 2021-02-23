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
                <title>Show Order Detail</title>
                <style>
                    #overview table {
                        width: 100%;
                        border-bottom: 5px dashed #d9d9d9;
                    }

                    #overview table th {
                        padding: 5px;
                    }

                    #overview table tr td {
                        padding: 5px;
                        width: 20%;
                        text-align: center;
                    }

                    #overview table tr td:nth-child(1) {
                        width: 40%;
                        text-align: center;
                    }
                </style>
                <script>
                    function initShowOrderList() {
                        $("#nodata").show();
                        $("#overview").hide();
                        $("#receiveName").text("");
                        $("#receivePhone").text("");
                        $("#receiveAdd").text("");
                        $("#ivNumber").text("");
                        $("#totalAmount").text("");
                        $("#includeTaxAmount").text("");
                        $("#sendBtnTb").hide();


                        $("#schedule").html(`
                        <tr>
                            <th colspan="3">自由行</th>
                        </tr>
                        <tr>
                            <td ><strong>行程編號</strong></td>
                            <td ><strong>數量</strong></td>
                            <td ><strong>總價</strong></td>
                        </tr>
                        `);
                        $("#ticket").html(`<tr>
                            <th colspan="3">車票資訊</th>
                        </tr>
                        <tr>

                            <td ><strong>起點到終點站</strong></td>
                            <td ><strong>數量</strong></td>
                            <td ><strong>總價</strong></td>
                        </tr>
                        `);
                        $("#fix_schudle").html(`<tr>
                            <th colspan="3">主題旅遊資訊</th>
                        </tr>
                        <tr>

                            <td ><strong>主題旅遊名稱</strong></td>
                            <td ><strong>數量</strong></td>
                            <td ><strong>總價</strong></td>
                        </tr>`);
                        $("#insurance").html(`<tr>
                            <th colspan="3">旅遊保險</th>
                        </tr>
                        <tr>
                            <td ><strong>計畫別</strong></td>
                            <td ><strong>數量</strong></td>
                            <td ><strong>總價</strong></td>
                        </tr>`)

                    }
                    $(document).ready(function () {
                        initShowOrderList();
                        let urlParams = new URLSearchParams(window.location.search);
                        var q = urlParams.get('ord_no');
                        if (q == "" || q === undefined) {
                            $("#nodata").show();
                        } else {
                            $("#nodata").hide();
                            $.ajax({
                                url: "show_detailOrder",
                                type: "POST",
                                async: false,
                                data: {
                                    Ord_no: q
                                },
                                success: function (detail) {
                                    if (detail.recipient == null) {
                                        $("#nodata").show();
                                        $("#overview").hide();
                                        return;
                                    }

                                    var ticketIsShow = false;
                                    var fixSchIsShow = false;
                                    var insuranceIsShow = false;
                                    var scheduleIsShow = false;
                                    $("#receiveName").text(detail.recipient);
                                    $("#receivePhone").text(detail.recipient_phone);
                                    $("#receiveAdd").text(detail.recipient_address);
                                    $("#ivNumber").text(detail.iv_number);
                                    var totalAmount = 0;



                                    for (var i = 0; i < detail.products.length; i++) {
                                        var data = detail.products[i];
                                        var name = data.name;
                                        var quantity = parseInt(data.ord_qui);
                                        var amount = parseInt(data.pro_amount);
                                        totalAmount += amount;
                                        if (data.type == "scheduleBean") {
                                            scheduleIsShow = true;
                                            var td = `
                                        <tr>
                                            <td>
                                                <strong>\${name}</strong>
                                            </td>
                                            <td >
                                                <strong>1</strong>
                                            </td>
                                            <td >
                                                <strong>\${amount}</strong>
                                            </td>
                                        </tr>
                                        `;

                                            $("#schedule").append(td);
                                            $("#schedule").show();

                                        }
                                        if (data.type == "ticket") {
                                            ticketIsShow = true;
                                            var td = `
                                        <tr>
                                            <td >
                                            	<strong>\${name}</strong>
                                            </td>
                                            <td >
                                            <strong>\${quantity}</strong>
                                            </td>
                                            
                                            <td ><strong>\${amount}</strong>
                                            </td>
                                            
                                        </tr>
                                    `;


                                            $("#ticket").append(td);
                                            $("#ticket").show();



                                        }
                                        if (data.type == "fixSchedule") {
                                            fixSchIsShow = true;
                                            var td = `
                                        <tr>
                                            <td  >
                                            	<strong>\${name}</strong>
                                            </td>
                                            <td  >
                                            <strong>\${quantity}</strong>
                                            </td>
                                            
                                            <td ><strong>\${amount}</strong>
                                            </td>
                                            
                                        </tr>
                                    `;

                                            $("#fix_schudle").append(td);
                                            $("#fix_schudle").show();



                                        }
                                        if (data.type == "insurance") {
                                            insuranceIsShow = true;
                                            var td = `
                                        <tr>
                                            <td  >
                                                <strong>\${name}</strong>
                                            </td>
                                            <td  >
                                                <strong>1</strong>
                                            </td>
                                            <td >
                                                <strong>\${amount}</strong>
                                            </td>
                                        </tr>
                                    `;

                                            $("#insurance").append(td);
                                            $("#insurance").show();



                                        }
                                    }
                                    if (scheduleIsShow || ticketIsShow || fixSchIsShow || insuranceIsShow) {
                                        $("#nodata").hide();
                                        $("#totalAmount").text(totalAmount);
                                        $("#includeTaxAmount").text(Math.ceil(totalAmount * 1.05));
                                        $("#total_table").show();
                                        $("#overview").show();
                                        $("#iv_table").show();
                                        $("#user_input_data").show();
                                        $("#sendBtnTb").show();
                                    }
                                }
                            });
                        }
                        //產生qrcode
                    
                        document.querySelector('#qrc').addEventListener("click",
                            function () {
                                fetch("qrCode", {
                                    method: "POST"
                                }).then(function (response) {
                                    return response.blob(); //將回應轉成二進制物件
                                }).then(function (data) {
                                    console.log(data);
                                    let img = document.createElement('IMG')
                                    img.src = URL.createObjectURL(data); //創立一個暫時的圖片路徑

                                    document.querySelector('#qrcode_here').appendChild(img);
                                })
                            })
                    })

                </script>
            </head>

            <body>
                <!-- 主頁的表頭 -->
                <div style="background-color:#4E7C99; margin: 0 auto;">
                    <jsp:include page="/fragment/Top.jsp" />
                </div>
                <br>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3">
                            <!-- 商城的表頭 -->
                            <jsp:include page="/fragment/mall_Title.jsp"></jsp:include>
                        </div>
                        <div class="col-lg-9">

                            <div class="row pb-3">
                                <div class="col-lg-3">
                                    <h1>訂單資訊</h1>
                                </div>
                            </div>

                            <div class="bg-light">
                                <div id="nodata" style="text-align: center;font-size: 30px!important;padding: 10px;">
                                    查無此訂單資料
                                </div>
                                <div id="overview">
                                    <table id="iv_table" style="display:none;margin-right:100px;float: left;">
                                        <tr>
                                            <td>發票號碼</td>
                                            <td id="ivNumber"></td>
                                        </tr>

                                    </table>
                                    <table id="user_input_data" style="display: none;">
                                        <tr>
                                            <td>收件者:</td>
                                            <td id="receiveName"></td>
                                        </tr>
                                        <tr>
                                            <td>電話:</td>
                                            <td id="receivePhone"></td>
                                        </tr>
                                        <tr>
                                            <td>地址:</td>
                                            <td id="receiveAdd"></td>
                                        </tr>

                                    </table>

                                    <table id="schedule" style="display: none;">
                                        <tr>
                                            <th colspan="3">自由行</th>
                                        </tr>
                                        <tr>
                                            <td>行程編號</td>
                                            <td>數量</td>
                                            <td>總價</td>
                                        </tr>
                                    </table>

                                    <table id="ticket" style="display: none;">

                                        <tr>
                                            <th colspan="3">車票資訊</th>
                                        </tr>
                                        <tr>

                                            <td>起點到終點站</td>
                                            <td>數量</td>
                                            <td>總價</td>
                                        </tr>

                                    </table>

                                    <table id="fix_schudle" style="display: none;">

                                        <tr>
                                            <th colspan="3">主題旅遊資訊</th>
                                        </tr>
                                        <tr>

                                            <td>主題旅遊名稱</td>
                                            <td>數量</td>
                                            <td>總價</td>
                                        </tr>
                                    </table>

                                    <table id="insurance" style="display: none;">

                                        <tr>
                                            <th colspan="3">旅遊保險</th>
                                        </tr>
                                        <tr>
                                            <td>保單號碼</td>
                                            <td>計畫別</td>
                                            <td>總價</td>
                                        </tr>
                                    </table>
                                    <div style="padding: 10px;">
                                        <table id="total_table" style="display:none;margin-right:100px;float: left;">
                                            <tr>
                                                <td></td>
                                                <td><strong>總計</strong></td>
                                                <strong>
                                                    <td id="totalAmount"></td>
                                                </strong>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><strong>含稅價格</strong></td>
                                                <strong>
                                                    <td id="includeTaxAmount"></td>
                                                </strong>
                                            </tr>

                                        </table>

                                    </div>
                                </div>

                                <div style="display:none;" id="sendBtnTb">
                                    <div class="row">
                                        <div class="col-xl-6" >
                                            <button type="button" class="btn btn-default" id="qrc">
                                                <i class="fas fa-qrcode"></i> 點我產生QR Code
                                            </button>
                                            <div id="qrcode_here">

                                            </div>
                                            
                                        </div>
                                        <div class="col-xl-6" style="text-align: right;">
                                            <a href="<c:url value='index_orderList'/>">
                                                <button type="button" class="btn btn-success"
                                                    style="margin-right: 10px;margin-bottom: 10px;">
                                                    返回 <i class="fas fa-caret-right"></i></span>
                                                </button>
                                            </a>
                                        </div>
                                    </div>

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