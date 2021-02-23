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

                <title>Product Manager Page</title>
                <style>
                    .nodata {
                        text-align: center;
                        font-size: 45px;
                        color: red;
                    }

                    #overViewData thead td {
                        white-space: nowrap;
                    }
                </style>
                <script>
                    function InitRightContent() {

                        $("#rightContext").hide();

                        $("#pro_name").val("--select--");
                        $("#pro_cat").html(` <option value="--select--">--select--</option>`);
                        $("#pro_cat").val("--select--");
                        $("#StartStation").val("");
                        $("#EndStation").val("");
                        $("#pro_date").val("");
                        $("#pro_amount").val("");
                        $("#pro_discount").val("1");
                        $("#pro_sto").val("1");
                        $("#pro_pub").val("0");

                    }
                    function GetProducts() {
                        $("#overViewtbody").html("");
                        $.ajax({
                            url: "GetProducts",
                            type: "POST",
                            async: false,
                            data: {
                                Search: $("#search").val().trim()

                            },
                            success: function (list) {
                                if (list.length > 0) {
                                    for (var i = 0; i < list.length; i++) {

                                        var data = list[i];

                                        var tr = $("<tr class='productEdit'>");
                                        tr.attr("obj", JSON.stringify(data));
                                        tr.html(`
                                            <td>\${data.pro_no}</td>
                                            <td>\${data.pro_name}</td>
                                            <td>\${data.pro_start}</td>
                                            <td>\${data.pro_end}</td>
                                            <td>\${data.pro_cat}</td>
                                            <td>\${data.pro_amount}</td>
                                        `);




                                        $("#overViewtbody").append(tr);


                                    }
                                } else {
                                    var tr = `<tr >
                                            <td colspan="6" class="nodata">沒有資料</td>
                                           
                                        </tr>`
                                    $("#overViewtbody").append(tr);
                                }
                            }
                        })



                    }
                    $(document).ready(function () {
                        //初始化
                        //initDbData();
                        //頁面一進來 呼叫
                        GetProducts();
                        //搜尋打字時呼叫
                        $("#search").keyup(function () {
                            $("#rightContext").hide();
                            GetProducts();

                        });
                        //新增按鈕事件
                        $("#addbtn").click(function () {
                            $("#rightContext").attr("productNo", "");
                            InitRightContent();
                            $("#rightContext").show();

                        });
                        //票種改變事件
                        $("#pro_name").change(function () {
                            var name = $(this).val();
                            $("#pro_cat").html(` <option value="--select--">--select--</option>`);
                            $("#pro_cat").val("--select--");
                            if (name == "台鐵") {
                                var option1 = `<option value="全票">全票</option><option value="孩童票">孩童票</option><option value="敬老票">敬老票</option>`;
                                $("#pro_cat").append(option1);
                            } else if (name == "高鐵") {
                                var option2 = `<option value="全票">全票</option><option value="孩童票/敬老票/愛心票">孩童票/敬老票/愛心票</option><option value="團體票">團體票</option>`;
                                $("#pro_cat").append(option2)
                            }
                        });
                        //出發日期
                        $("#pro_date").datetimepicker({
                            "dateFormat": "yy/mm/dd",
                            "timeFormat": "HH:mm"
                        });
                        //點擊TR 觸發編輯事件
                        $("#overViewtbody").on("click", ".productEdit", function () {
                            InitRightContent();
                            var obj = JSON.parse($(this).attr("obj"));

                            $("#rightContext").attr("productNo", obj.pro_no);
                            $("#pro_name").val(obj.pro_name);
                            $("#pro_cat").html(` <option value="--select--">--select--</option>`);
                            $("#pro_cat").val("--select--");

                            if (obj.pro_name == "台鐵") {
                                var option1 = `<option value="全票">全票</option><option value="孩童票">孩童票</option><option value="敬老票">敬老票</option>`;
                                $("#pro_cat").append(option1);
                            } else if (obj.pro_name == "高鐵") {
                                var option2 = `<option value="全票">全票</option><option value="孩童票/敬老票/愛心票">孩童票/敬老票/愛心票</option><option value="團體票">團體票</option>`;
                                $("#pro_cat").append(option2)
                            }

                            $("#pro_cat").val(obj.pro_cat);
                            $("#StartStation").val(obj.pro_start);
                            $("#EndStation").val(obj.pro_end);
                            var date = new Date(obj.pro_date);
                            var dateStr = date.getFullYear() + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + ("0" + date.getDate()).slice(-2) + " " + ("0" + date.getHours()).slice(-2) + ":" + ("0" + date.getMinutes()).slice(-2)

                            $("#pro_date").val(dateStr);


                            $("#pro_amount").val(obj.pro_amount);
                            $("#pro_discount").val(obj.pro_discount);
                            $("#pro_sto").val(obj.pro_sto);
                            $("#pro_pub").val(obj.pro_pub);
                            $("#rightContext").show();

                        })




                        //儲存產品
                        $("#savePro").click(function () {
                            var productNo = $("#rightContext").attr("productNo");
                            //驗證
                            var pro_name = $("#pro_name").val();
                            var pro_cat = $("#pro_cat").val();
                            var pro_start = $("#StartStation").val();
                            var pro_end = $("#EndStation").val();
                            var pro_date = $("#pro_date").val();
                            var pro_amount = $("#pro_amount").val();
                            var pro_discount = $("#pro_discount").val();
                            var pro_sto = $("#pro_sto").val();
                            var pro_pub = $("#pro_pub").val();


                            //轉至ticket_product物件
                            var ticket_product = {

                                pro_name: pro_name,
                                pro_cat: pro_cat,
                                pro_start: pro_start,
                                pro_end: pro_end,
                                pro_date: pro_date,
                                pro_amount: pro_amount,
                                pro_discount: pro_discount,
                                pro_sto: pro_sto,
                                pro_pub: pro_pub,

                            }
                            if (productNo != "") {
                                //編輯模式
                                ticket_product.pro_no = productNo;
                                $.ajax({
                                    url: "UpdateProduct",
                                    type: "POST",
                                    async: false,
                                    data: {
                                        Product: JSON.stringify(ticket_product)

                                    },
                                    success: function (result) {
                                        if (result.includes("成功")) {
                                            $("#rightContext").hide();
                                            GetProducts();
                                        }
                                        alert(result);

                                    }
                                })

                            } else {
                                //新增模式
                                $.ajax({
                                    url: "AddProduct",
                                    type: "POST",
                                    async: false,
                                    data: {
                                        Product: JSON.stringify(ticket_product)

                                    },
                                    success: function (result) {
                                        if (result.includes("成功")) {
                                            $("#rightContext").hide();
                                            GetProducts();
                                        }
                                        alert(result);
                                    }
                                })
                            }



                        });

                        $("#inputAdd").click(function () {

                            $("#StartStation").val("彰化");
                            $("#EndStation").val("嘉義");
                            $("#pro_amount").val(250);
                            $("#pro_date").val("2021/02/15 07:28");
                            $("#pro_discount").val("0.8");
                            $("#pro_sto").val(100);
                            $("#pro_pub").val(1);
                        })
                        $("#inputUpdate").click(function () {
                            $("#pro_discount").val("0.6");
                            $("#pro_sto").val(100);
                            $("#pro_pub").val(1);
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
                                    車票清單
                                </div>
                                <div class="card-body border-bottom">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <button id="addbtn" class="btn btn-primary">新增</button>

                                        </div>
                                        <div class="col-lg-6">
                                            <input type="text" id="search" class="form-control"
                                                placeholder="請輸入欲查詢的起運/終點站/票券名稱/票種">
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <table class="table table-bordered table-hover" id="overViewData">
                                        <thead>
                                            <tr>
                                                <td>產品編號</td>
                                                <td>產品名稱</td>
                                                <td>起運站</td>
                                                <td>終點站</td>
                                                <td>票種</td>
                                                <td>票價</td>
                                            </tr>
                                        </thead>
                                        <tbody id="overViewtbody">
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6" id="rightContext" productNo="" style="display: none;">
                            <div class="card">
                                <div class="card-header">
                                    車票細節
                                </div>
                                <div class="card-body border-bottom">
                                    <div class="row">

                                        <div class="col-lg-12" style="text-align: right;">
                                            <button class="btn btn-primary" id="savePro">儲存</button>
                                        </div>
                                    </div>

                                </div>
                                <div class="card-body">
                                    <div class="form-row">
                                        <div class="form-group col-lg-6">
                                            <label>產品名稱</label>
                                            <select class="form-control" id="pro_name">
                                                <option value="--select--">--select--</option>
                                                <option value="台鐵">台鐵</option>
                                                <option value="高鐵">高鐵</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-lg-6">
                                            <label>票種</label>
                                            <select class="form-control" id="pro_cat">
                                                <option value="--select--">--select--</option>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-lg-6">
                                            <label>起始站</label>
                                            <input type="text" placeholder="輸入起始站" maxlength="15" id="StartStation"
                                                class="form-control" />
                                        </div>
                                        <div class="form-group col-lg-6">
                                            <label>終點站</label>
                                            <input type="text" placeholder="輸入終點站" maxlength="15" id="EndStation"
                                                class="form-control" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>出發日期</label>
                                        <input type="text" id="pro_date" class="form-control" />
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-lg-6">
                                            <label>票價</label>
                                            <input type="text" placeholder="請輸入票價" maxlength="4" id="pro_amount"
                                                class="form-control" />
                                        </div>
                                        <div class="form-group col-lg-6">
                                            <label>優惠 (請輸入小數點折扣)</label>

                                            <input id="pro_discount" type="number" placeholder="1" step="0.01"
                                                placeholder="請輸入票價" max="1" class="form-control" />

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>上架數量</label>
                                        <input type="number" min="1" max="99" id="pro_sto" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>上架狀態</label>
                                        <input type="number" min="0" max="1" id="pro_pub" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="display: flex;">
                    <div class="rightContext" style="width:50%;display: none;" id="rightContext" productNo="">
                        <table class="inputTable" id="inputTable">
                            <tr>
                                <td>上架數量</td>
                                <td><input type="number" min="1" max="99" id="pro_sto"></td>
                            </tr>
                            <tr>
                                <td>上下架狀態</td>
                                <td><input type="number" min="0" max="1" id="pro_pub"></td>
                            </tr>
                            <tr>
                                <td><input type="button" value="Save" id="savePro" /></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <button type="button" class="btn btn-warning" id="inputAdd">測試用新增</button>

                        <button type="button" class="btn btn-warning" id="inputUpdate">測試用修改</button>
                    </div>
                    <div class="col-lg-6">
                        <a href="<c:url value='/tw/hanjee/managerback'/>">回管理員首頁</a>

                    </div>

                </div>


                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
                    crossorigin="anonymous"></script>
            </body>

            </html>