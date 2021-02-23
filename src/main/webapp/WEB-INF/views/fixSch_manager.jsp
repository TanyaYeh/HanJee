<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <!DOCTYPE html>
            <html>

            <head>
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


                <title>FixSchedule Product Manager Page</title>
                <style>
                    #overViewData thead td {
                        white-space: nowrap;
                    }
                </style>
                <script>
                    function InitRightContent() {

                        $("#rightContext").hide();

                        $("#fixSch_name").val("");
                        //$("#fixSch_description").html("");
                        $("#fixSch_start").val("");
                        $("#fixSch_end").val("");
                        $("#fixSch_amount").val("");
                        $("#fixSch_discount").val("");
                        $("#fixSch_total").val("1");
                        $("#fixSch_available").val("1");
                        $("#fixSch_pub").val("0");
                        $("#fixSch_img").val("");
                        $("#viewImg").attr("src", "");
                        $("#fixSch_description").val("");

                    }

                    function GetProducts() {
                        $("#overViewtbody").html("");
                        $.ajax({
                            url: "GetFixSchProducts",
                            type: "POST",
                            async: false,
                            data: {
                                Search: $("#search").val().trim()

                            },
                            success: function (list) {
                                if (list.length > 0) {
                                    for (var i = 0; i < list.length; i++) {

                                        var data = list[i];

                                        var tr = $("<tr class='fixSchproductEdit'>");
                                        tr.attr("obj", JSON.stringify(data));
                                        tr.html(`
                                            <td>\${data.fixSch_no}</td>
                                            <td style="width:20%"><img src="\${data.fixSch_img}" style="width:100%"></td>
                                            <td>\${data.fixSch_name}</td>
                                            <td>\${data.fixSch_amount}</td>
                                        `);


                                        $("#overViewtbody").append(tr);


                                    }
                                } else {
                                    var tr = `<tr rowspan="4">
                                            <td>沒有資料</td>
                                           
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

                            GetProducts();

                        });
                        //新增按鈕事件
                        $("#addbtn").click(function () {
                            $("#rightContext").attr("productNo", "");
                            InitRightContent();
                            $("#rightContext").show();

                        });
                        //出發日期
                        $("#fixSch_start").datepicker({
                            "dateFormat": "yy/mm/dd"

                        });
                        $("#fixSch_end").datepicker({
                            "dateFormat": "yy/mm/dd"

                        });
                        //點擊TR 觸發編輯事件
                        $("#overViewtbody").on("click", ".fixSchproductEdit", function () {
                            InitRightContent();
                            var obj = JSON.parse($(this).attr("obj"));

                            $("#rightContext").attr("productNo", obj.fixSch_no);
                            $("#fixSch_name").val(obj.fixSch_name);

                            $("#fixSch_description").val(obj.fixSch_description);
                            $("#fixSch_amount").val(obj.fixSch_amount);
                            var dateStart = new Date(obj.fixSch_start);
                            var dateStartStr = dateStart.getFullYear() + "/" + ("0" + (dateStart.getMonth() + 1)).slice(-2) + "/" + ("0" + dateStart.getDate()).slice(-2);
                            var dateEnd = new Date(obj.fixSch_end);
                            var dateEndStr = dateEnd.getFullYear() + "/" + ("0" + (dateEnd.getMonth() + 1)).slice(-2) + "/" + ("0" + dateEnd.getDate()).slice(-2);
                            $("#fixSch_start").val(dateStartStr);
                            $("#fixSch_end").val(dateEndStr);
                            $("#fixSch_discount").val(obj.fixSch_discount);
                            $("#fixSch_total").val(obj.fixSch_total);
                            $("#fixSch_available").val(obj.fixSch_available);
                            $("#fixSch_pub").val(obj.fixSch_pub);
                            $("#fixSch_img").attr("imgBase", obj.fixSch_img);
                            $("#viewImg").attr("src", obj.fixSch_img);

                            $("#rightContext").show();

                        })

                        $("#uplaod_img").click(function () {

                            $("#fixSch_img").trigger("click");

                        });

                        //點擊上傳檔案
                        $("#fixSch_img").change(function (imgObj) {
                            //判斷圖片格式
                            var inputImg = imgObj.target;
                            if (inputImg.files && inputImg.files[0]) {
                                var reader = new window.FileReader();
                                reader.onload = function () {
                                    //data:image/jpeg;base64,/9j/4AAQSkZJRgABAQ
                                    var result = reader.result;
                                    //要拿,之後的才是base64
                                    //var templateFile = reader.result.split(',')[1];
                                    $("#viewImg").attr("src", result);
                                    $("#fixSch_img").attr("imgBase", result);
                                }
                                reader.readAsDataURL(inputImg.files[0]);
                                inputImg.value = "";
                            }
                        })
                        //儲存產品
                        $("#savePro").click(function () {
                            var fixSch_no = $("#rightContext").attr("productNo");
                            //驗證
                            var fixSch_name = $("#fixSch_name").val();
                            var fixSch_start = $("#fixSch_start").val();
                            var fixSch_end = $("#fixSch_end").val();
                            var fixSch_available = $("#fixSch_available").val();
                            var fixSch_total = $("#fixSch_total").val();
                            var fixSch_amount = $("#fixSch_amount").val();
                            var fixSch_discount = $("#fixSch_discount").val();
                            var fixSch_img = $("#fixSch_img").attr("imgBase");
                            console.log(fixSch_img);
                            var fixSch_pub = $("#fixSch_pub").val();
                            var fixSch_description = $("#fixSch_description").val();

                            //轉至ticket_product物件
                            var fixSchedule_product = {

                                fixSch_name: fixSch_name,
                                fixSch_start: fixSch_start,
                                fixSch_end: fixSch_end,
                                fixSch_available: fixSch_available,
                                fixSch_total: fixSch_total,
                                fixSch_amount: fixSch_amount,
                                fixSch_discount: fixSch_discount,
                                fixSch_img: fixSch_img,
                                fixSch_pub: fixSch_pub,
                                fixSch_description: fixSch_description
                            }

                            if (fixSch_no != "") {
                                //編輯模式
                                fixSchedule_product.fixSch_no = fixSch_no;
                                $.ajax({
                                    url: "UpdateFixSchProduct",
                                    type: "POST",
                                    async: false,
                                    data: {
                                        FixSchProductStr: JSON.stringify(fixSchedule_product)
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
                                    url: "AddFixSchProduct",
                                    type: "POST",
                                    async: false,
                                    data: {
                                        FixSchProduct: JSON.stringify(fixSchedule_product)

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

                        //測試鈕綁定
                        //新增
                        $("#testAdd").click(function () {
                            $("#fixSch_name").val("<司馬庫斯X那羅部落>新竹：巨木生態・與原民共舞・耆老祈福・田間導覽");
                            $("#fixSch_start").val("2021/01/27");
                            $("#fixSch_end").val("2021/01/28");
                            $("#fixSch_available").val("48");
                            $("#fixSch_total").val("60");
                            $("#fixSch_amount").val("4999");
                            $("#fixSch_discount").val("0.9");
                            $("#fixSch_pub").val("1");
                            $("#fixSch_description").val("位於臺灣新竹縣尖石鄉的泰雅族部落，早期族人過著無電力、無道路、自給自足、與世隔絕的生活，因而被稱為黑暗部落，直到部落長老與族人發現深山裡擁有數棵千年巨木，開始有絡繹不絕的遊客尋訪。");

                        })
                        //修改
                        $("#testUpdate").click(function () {
                            $("#fixSch_amount").val("10000");
                            $("#fixSch_discount").val("0.9");

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
                                    主題旅遊清單
                                </div>
                                <div class="card-body border-bottom">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <button id="addbtn" class="btn btn-primary">新增</button>

                                        </div>
                                        <div class="col-lg-6">
                                            <input class="form-control" type="text" maxlength="10" id="search"
                                                placeholder="請輸入欲查詢的主題關鍵字">
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <table class="table table-bordered table-hover" id="overViewData">
                                        <thead>
                                            <tr>
                                                <td>產品編號</td>
                                                <td>圖片</td>
                                                <td>產品名稱</td>
                                                <td>價格</td>
                                            </tr>
                                        </thead>
                                        <tbody id="overViewtbody">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6" style="display: none;" id="rightContext" productNo=""
                            style="display: none;">
                            <div class="card">
                                <div class="card-header">
                                    主題旅遊細節
                                </div>
                                <div class="card-body border-bottom">
                                    <div class="row">

                                        <div class="col-lg-12" style="text-align: right;">
                                            <button class="btn btn-primary" id="savePro">儲存</button>
                                        </div>
                                    </div>

                                </div>
                                <div class="card-body">

                                    <div class="form-group">
                                        <label>產品名稱</label>
                                        <input type="text" placeholder="輸入產品名稱" id="fixSch_name" class="form-control" />
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-lg-6">
                                            <label>去程</label>
                                            <input type="text" id="fixSch_start" class="form-control" />
                                        </div>

                                        <div class="form-group col-lg-6">
                                            <label>回程</label>
                                            <input type="text" id="fixSch_end" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-lg-6">
                                            <label>票價</label>
                                            <input type="text" placeholder="請輸入票價" maxlength="6" id="fixSch_amount"
                                                class="form-control" />
                                        </div>
                                        <div class="form-group col-lg-6">
                                            <label>優惠 (請輸入小數點折扣)</label>

                                            <input id="fixSch_discount" type="number" placeholder="1" step="0.01"
                                                placeholder="請輸入票價" max="1" class="form-control" />

                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-lg-6">
                                            <label>上架數量</label>

                                            <input type="number" min="1" max="200" id="fixSch_total"
                                                class="form-control">

                                        </div>
                                        <div class="form-group col-lg-6">
                                            <label>可購買數量</label>
                                            <input type="number" min="1" max="200" id="fixSch_available"
                                                class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>上下架狀態</label>
                                        <input type="number" min="0" max="1" id="fixSch_pub" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>產品描述</label>
                                        <textarea class="form-control" rows="4" placeholder="輸入產品描述"
                                            id="fixSch_description"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>
                                            <button id="uplaod_img" class="btn btn-primary">上傳照片</button>
                                            <input type="file" id="fixSch_img" accept="image/*" imgBase=""
                                                style="display: none;" />

                                        </label>
                                        <img id="viewImg" style="width:100%">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>


                
                <div class="row">
                    <div class="col-lg-6">

                        <button type="button" class="btn btn-warning" id="testAdd" >測試用新增</button>
                        <button type="button" class="btn btn-warning" id="testUpdate" >測試用修改</button>
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