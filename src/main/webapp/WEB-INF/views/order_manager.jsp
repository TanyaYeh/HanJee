<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
                    integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
                    crossorigin="anonymous">

                <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
                <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
                <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0/themes/smoothness/jquery-ui.css">

                <script
                    src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/jquery-ui-timepicker-addon.min.js"></script>

                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/jquery-ui-timepicker-addon.min.css">
                <title>Order Manager Page</title>

                <script>
                    function InitRightContent() {

                        $("#rightContext").hide();
                        $("#schTitle").hide();
                        $("#ticketTitle").hide();
                        $("#fixSchTitle").hide();
                        $("#insuranceTitle").hide();


                        $("#updateTime").text("");
                        $("#schTitle").html("");
                        $("#ticketTitle").html("");
                        $("#fixSchTitle").html("");
                        $("#insuranceTitle").html("");
                        $("#totalAmount").text("");
                        $("#taxAmount").text("");
                        $("#name").val("");
                        $("#phone").val("");
                        $("#add").val("");
                        $("#note").val("");

                        $("#schTitle").html(`
                        <thead>
                                <tr>
                                    <td colspan="2">自由行</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>行程編號</td>
                                    <td style="width:130px">總價</td>
                                </tr>
                            </tbody>
                        `);
                        $("#ticketTitle").html(`
                        <thead>
                                <tr>
                                    <td colspan="3">車票資訊</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>起點站到終點站</td>
                                    <td style="width:130px">數量</td>
                                    <td style="width:130px">總價</td>
                                </tr>
                            </tbody>`);
                        $("#fixSchTitle").html(`
                        <thead>
                                <tr>
                                    <td colspan="3">主題旅遊資訊</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>主題旅遊名稱</td>
                                    <td style="width:130px">數量</td>
                                    <td style="width:130px">總價</td>
                                </tr>
                            </tbody>
                        `);
                        $("#insuranceTitle").html(`
                        <thead>
                                <tr>
                                    <td colspan="3">旅遊保險</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>保單號碼</td>
                                    <td>計畫別</td>
                                    <td style="width:130px">總價</td>
                                </tr>
                            </tbody>
                        `);


                    }
                    function formatTime(timeformDb) {
                        var updateInt = parseInt(timeformDb);
                        var date = new Date(updateInt);
                        var dateStr = date.getFullYear() + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + ("0" + date.getDate()).slice(-2) + " " + ("0" + date.getHours()).slice(-2) + ":" + ("0" + date.getMinutes()).slice(-2) + ":" + ("0" + date.getSeconds()).slice(-2);
                        return dateStr;
                    }
                    function GetOrders() {
                        $("#overViewtbody").html("");

                        $.ajax({
                            url: "GetOrders",
                            type: "POST",
                            async: false,
                            data: {
                                Search: $("#search").val().trim()

                            },
                            success: function (list) {
                                if (list.length > 0) {
                                    for (var i = 0; i < list.length; i++) {

                                        var data = list[i];

                                        var tr = $("<tr class='orderEdit'>");
                                        tr.attr("obj", JSON.stringify(data));

                                        formatdateStr = formatTime(`\${data.update_time}`);
                                        tr.html(`
                                                <td>\${data.ord_id}</td>
                                                <td>\${data.total_amount}</td>
                                                <td>\${data.recipient}</td>
                                                <td>\${data.recipient_phone}</td>
                                                <td>\${data.recipient_address}</td>
                                                <td>`+ formatdateStr + `</td>
                                               
                                            `);


                                        $("#overViewtbody").append(tr);
                                    }
                                } else {
                                    var tr = `<tr>
                                            <td colspan="7">沒有資料</td>
                                           
                                        </tr>`
                                    $("#overViewtbody").append(tr);
                                }

                            }
                        })
                    }
                    $(document).ready(function () {
                        GetOrders();
                        $("#rightContext").hide();
                        $("#search").keyup(function () {
                            GetOrders();

                        })
                        //點擊TR 觸發編輯事件
                        $("#overViewtbody").on("click", ".orderEdit", function () {
                            InitRightContent();

                            var obj = JSON.parse($(this).attr("obj"));
                            $.ajax({
                                url: "show_detailOrder",
                                type: "POST",
                                async: false,
                                data: {
                                    Ord_no: obj.ord_no

                                },
                                success: function (orderDetail) {
                                    var scheduleIsShow = false;
                                    var ticketIsShow = false;
                                    var fixSchIsShow = false;
                                    var insuranceIsShow = false;
                                    var totalAmount = 0;

                                    for (var i = 0; i < orderDetail.products.length; i++) {
                                        var data = orderDetail.products[i];
                                        var name = data.name;
                                        var quantity = parseInt(data.ord_qui);
                                        var amount = parseInt(data.pro_amount);
                                        totalAmount += amount;
                                        if (data.type == "scheduleBean") {
                                            scheduleIsShow = true;
                                            var td = `
                                        <tr>
                                            <td>\${name}</td>
                                            <td>\${amount}</td>
                                        </tr>
                                        `;
                                            $("#schTitle").append(td);
                                            $("#schTitle").show();

                                        }
                                        if (data.type == "ticket") {
                                            ticketIsShow = true;
                                            var td = `
                                        <tr>
                                            <td>\${name}</td>
                                            <td>\${quantity}</td>
                                            <td>\${amount}</td>
                                        </tr>
                                    `;

                                            $("#ticketTitle").append(td);
                                            $("#ticketTitle").show();



                                        }
                                        if (data.type == "fixSchedule") {
                                            fixSchIsShow = true;
                                            var td = `
                                        <tr>
                                            <td>\${name}</td>
                                            <td>\${quantity}</td>
                                            <td>\${amount}</td>
                                        </tr>
                                    `;

                                            $("#fixSchTitle").append(td);
                                            $("#fixSchTitle").show();



                                        }

                                        if (data.type == "insurance") {
                                            insuranceIsShow = true;
                                            var td = `
                                        <tr>
                                            <td>\${'100'}</td>
                                            <td>\${name}</td>
                                            <td>\${amount}</td>
                                        </tr>
                                    `;

                                            $("#insuranceTitle").append(td);
                                            $("#insuranceTitle").show();



                                        }


                                        

                                    }


                                    $("#updateTime").text(formatTime(obj.update_time));
                                    $("#rightContext").attr("orderno", obj.ord_no);
                                    $("#totalAmount").text(totalAmount);
                                    $("#taxAmount").text(Math.ceil(totalAmount * 1.05));
                                    $("#name").val(obj.recipient);
                                    $("#phone").val(obj.recipient_phone);
                                    $("#add").val(obj.recipient_address);
                                    $("#note").val(obj.note);
                                }

                            })
                            $("#rightContext").show();




                        })

                        //更新訂單
                        $("#save").click(function () {

                            $.ajax({
                                url: "Update_Order",
                                type: "POST",
                                async: false,
                                data: {

                                    Name: $("#name").val().trim(),
                                    Phone: $("#phone").val().trim(),
                                    Add: $("#add").val().trim(),
                                    Note: $("#note").val().trim(),
                                    Ord_no: $("#rightContext").attr("orderno")
                                }, success: function (result) {
                                    if (result.includes("成功")) {
                                        GetOrders();
                                        InitRightContent();
                                        $("#rightContext").hide();
                                    } else {
                                        $("#rightContext").show();
                                    }
                                    alert(result);

                                }


                            })


                        });
                        //取消訂單
                        $("#delete").click(function () {


                            if (confirm('確定要刪除此筆訂單嗎？')) {
                                $.ajax({
                                    url: "delete_Order",
                                    type: "POST",
                                    async: false,
                                    data: {
                                        Ord_no: $("#rightContext").attr("orderno")
                                    }, success: function (result) {
                                        if (result.includes("成功")) {
                                            GetOrders();
                                            InitRightContent();
                                        } else {

                                        }
                                        alert(result);

                                    }


                                })
                            }



                        });

                        $("#testInput").click(function () {
                            $("#name").val("葉潔蓉");
                            $("#phone").val("0987654321");
                            $("#add").val("台北市大同區長安西路52巷18號");
                            $("#note").val("更改收件資訊");

                        })


                    })
                </script>
            </head>

            <body>
                <div class="container-fluid py-md-3 pl-md-5">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header">
                                    訂單清單
                                </div>
                                <div class="card-body border-bottom">
                                    <div class="row">

                                        <div class="col-lg-8">
                                            <input type="text" id="search" class="form-control"
                                                placeholder="請輸入欲查詢的訂單編號/收件人" style="width:360px;">
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <table class="table table-bordered table-hover" id="overViewData">
                                        <thead>
                                            <tr>
                                                <td>訂單編號</td>
                                                <td>金額</td>
                                                <td>收件人</td>
                                                <td>電話</td>
                                                <td>地址</td>
                                                <td>更新時間</td>
                                                
                                            </tr>
                                        </thead>
                                        <tbody id="overViewtbody">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6" id="rightContext" orderno="" style="display: none;">
                            <div class="card">
                                <div class="card-header">
                                    檢視訂單細節
                                </div>
                                <div class="card-body border-bottom">
                                    <div class="row">

                                        <div class="col-lg-12" style="text-align: right;">
                                            <button class="btn btn-primary" id="save">儲存</button>
                                            <button class="btn btn-danger" id="delete">取消此筆訂單</button>
                                        </div>


                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="form-row">

                                        <div class="form-group col-lg-12">
                                            <label>購買明細</label>
                                            <div>
                                                <table id="schTitle" class="table table-bordered "
                                                    style="display: none;">
                                                    <thead>
                                                        <tr>
                                                            <td colspan="2">自由行</td>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>行程編號</td>
                                                            <td style="width:130px">總價</td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                                <table id="ticketTitle" class="table table-bordered "
                                                    style="display: none;">
                                                    <thead>
                                                        <tr>
                                                            <td colspan="3">車票資訊</td>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>起點站到終點站</td>
                                                            <td style="width:130px">數量</td>
                                                            <td style="width:130px">總價</td>
                                                        </tr>
                                                    </tbody>
                                                </table>


                                                <table id="fixSchTitle" class="table table-bordered "
                                                    style="display: none;">
                                                    <thead>
                                                        <tr>
                                                            <td colspan="3">主題旅遊資訊</td>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>主題旅遊名稱</td>
                                                            <td style="width:130px">數量</td>
                                                            <td style="width:130px">總價</td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                                <table id="insuranceTitle" class="table table-bordered "
                                                    style="display: none;">
                                                    <thead>
                                                        <tr>
                                                            <td colspan="3">旅遊保險</td>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>保單號碼</td>
                                                            <td>計畫別</td>
                                                            <td style="width:130px">總價</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>

                                        </div>
                                        <div class="form-group col-lg-12">
                                            <table class="table table-bordered">

                                                <tr>
                                                    <td>總計</td>
                                                    <td id="totalAmount" style="width: 130px;"></td>

                                                </tr>
                                                <tr>
                                                    <td>含稅價格</td>
                                                    <td id="taxAmount"></td>
                                                </tr>
                                            </table>
                                            <table class="table table-borderless">
                                                <tr>
                                                    <td style="width:110px;">收件人</td>
                                                    <td><input type="text" id="name" class="form-control"/></td>
                                                </tr>
                                                <tr>
                                                    <td>電話</td>
                                                    <td><input type="text" id="phone" class="form-control"/></td>
                                                </tr>
                                                <tr>
                                                    <td>地址</td>
                                                    <td><input type="text" id="add" class="form-control"/></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <label>註記</label>
                                                        <textarea placeholder="請輸入" class="form-control" rows="10"
                                                            id="note">

                                                                </textarea>
                                                    </td>
                                                </tr>
                                            </table>

                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                </div>








                </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <input type="button" value="測試用修改訂單" id="testInput" />

                    </div>

                    <div class="col-lg-6">

                        <a href="<c:url value='/tw/hanjee/managerback'/>">回管理員首頁</a>
                    </div>
                </div>
            </body>

            </html>