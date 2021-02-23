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
                <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
                <!-- Load fonts style after rendering the layout styles -->
                <link rel="stylesheet"
                    href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
                <link rel="stylesheet" href="css/fontawesome.min.css">
                
                <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
                <title>Show Dtail FixSch</title>
                <script>
                    function guid() {
                        function s4() {
                            return Math.floor((1 + Math.random()) * 0x10000)
                                .toString(16)
                                .substring(1);
                        }
                        return (

                            s4() +
                            s4() +
                            '-' +
                            s4() +
                            '-' +
                            s4() +
                            '-' +
                            s4() +
                            '-' +
                            s4() +
                            s4() +
                            s4()
                        );
                    }
                    function ToWeekday(day) {

                        var dayStr = "";
                        if (day.getDay() == 0) dayStr = "日"
                        if (day.getDay() == 1) dayStr = "一"
                        if (day.getDay() == 2) dayStr = "二"
                        if (day.getDay() == 3) dayStr = "三"
                        if (day.getDay() == 4) dayStr = "四"
                        if (day.getDay() == 5) dayStr = "五"
                        if (day.getDay() == 6) dayStr = "六"
                        return dayStr;

                    }
                    $(document).ready(function () {
                        let urlParams = new URLSearchParams(window.location.search);
                        var q = urlParams.get('fixSch_no');


                        $.ajax({
                            url: "show_detailfixSchedule",
                            type: "POST",
                            async: false,
                            data: {
                                fixSch_no: q
                            },
                            success: function (detail_list) {
                                $("#detailFixSch").html("");
                                for (var i = 0; i < detail_list.length; i++) {
                                    var detail_products = detail_list[i];
                                    var fixSch_productsStarInt = parseInt(`\${detail_products.fixSch_start}`);
                                    var fixSch_productsEndInt = parseInt(`\${detail_products.fixSch_end}`);
                                    var dateS = new Date(fixSch_productsStarInt);
                                    var dateStarStr = dateS.getFullYear() + "/" + ("0" + (dateS.getMonth() + 1)).slice(-2) + "/" + ("0" + dateS.getDate()).slice(-2);
                                    var dateE = new Date(fixSch_productsEndInt);
                                    var dateEndStr = dateE.getFullYear() + "/" + ("0" + (dateE.getMonth() + 1)).slice(-2) + "/" + ("0" + dateE.getDate()).slice(-2);
                                    var weekdayS = ToWeekday(dateS);
                                    var weekdayE = ToWeekday(dateE);
                                    var fixSch_discountStr = `\${detail_products.fixSch_discount}`;
                                    if (fixSch_discountStr == "null" || fixSch_discountStr == "1") {
                                        fixSch_discountStr = "現無折扣";
                                    } else {
                                        //轉折數
                                        fixSch_discountStr = `\${detail_products.fixSch_discount}` * 10 + "折";

                                    }

                                    var div = `
                                    <div class="col-lg-5 mt-5">
                                        <div class="card mb-3">
                                            <p><img style="width:100%;" src="\${detail_products.fixSch_img}"></p>
                                        </div>
                                    </div>

                                    <div class="col-lg-7 mt-5">
                                        <div class="card">
                                            <div class="card-body" fixSch_no="\${detail_products.fixSch_no}">
                                                <h1 class="h2 fixSch_name">\${detail_products.fixSch_name}</h1>
                                                <p class="h3 py-2 fixSch_amount">\${detail_products.fixSch_amount}元</p>
                                                <p class="h3 py-2">優惠折扣:<span class="fixSch_discount"><strong>`+ fixSch_discountStr + `</strong></span></p>
                                                <p class="py-2">
                                                    <i class="fa fa-star text-warning"></i>
                                                    <i class="fa fa-star text-warning"></i>
                                                    <i class="fa fa-star text-warning"></i>
                                                    <i class="fa fa-star text-warning"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <span class="list-inline-item text-dark">評價 4.8 | 36 留言</span>
                                                </p>
                                                <ul class="list-inline">
                                                    <li class="list-inline-item">
                                                        <h4>去程:</h4>
                                                    </li>
                                                    <li class="list-inline-item">
                                                        <p class="text-muted"><strong><span class="fixSch_start">`+ dateStarStr + `(` + weekdayS + `)` + `</span></strong></p>
                                                    </li>
                                                    <li class="list-inline-item">
                                                        <h4>回程:</h4>
                                                    </li>
                                                    <li class="list-inline-item">
                                                        <p class="text-muted"><strong><span class="fixSch_end">`+ dateEndStr + `(` + weekdayE + `)` + `</span></strong></p>
                                                    </li>
                                                </ul>
                                                <ul class="list-inline">
                                                    <li class="list-inline-item">
                                                        <h4>可賣數量:</h4>
                                                    </li>
                                                    <li class="list-inline-item">
                                                        <p class="text-muted"><strong><span class="fixSch_available">\${detail_products.fixSch_available}</span></strong></p>
                                                    </li>

                                                    <li class="list-inline-item">
                                                        <h4>總數量:</h4>
                                                    </li>
                                                    <li class="list-inline-item">
                                                        <p class="text-muted"><strong><span class="fixSch_total">\${detail_products.fixSch_total}</span></strong></p>
                                                    </li>

                                                </ul>
                                                <h4>行程內容:</h4>
                                                <p>\${detail_products.fixSch_description}</p>
                                                <p>上下架狀況(0||1):<span class="fixSch_pub">\${detail_products.fixSch_pub}</p>
                                                    <div class="row pb-3">
                                                        <div class="col d-grid">
                                                            <input type="button" value="增加至購物車" class="shoppingcart btn btn-success btn-lg" />
                                                        </div>
                                                    </div>
                                            </div>
                                        </div>
                                    </div>`;

                                    $("#detailFixSch").append(div);
                                    $(".fixSch_pub").parent().hide();
                                    var addBtnShow = $(".fixSch_pub").text();
                                    if (detail_products.fixSch_pub == 0 || detail_products.fixSch_available == 0) {
                                        $(".shoppingcart").attr("disabled", "disabled");
                                    }
                                }

                            }

                        })

                        $("#detailFixSch").on("click", ".shoppingcart", function () {
                            var no = $(this).parents(".card-body").attr("fixSch_no");
                            var fixSchQ = 1;
                            var fixSchUnitP = $(this).parents(".card-body").find(".fixSch_amount").text().replace("元", "");
                            var productDiscount = $(this).parents(".card-body").find(".fixSch_discount").text().replace("折", "");
                            //轉回小數
                            if (!productDiscount.includes("現無")) {
                                var productDiscountToFloat = productDiscount / 10;
                                var fixSchAmount = fixSchQ * fixSchUnitP * productDiscountToFloat;

                            } else if (productDiscount.includes("現無")) {
                                var fixSchAmount = fixSchQ * fixSchUnitP;
                            }


                            var fixSch = {
                                "id": guid(),
                                "no": no,
                                "ord_qui": fixSchQ,
                                "pro_amount": fixSchAmount
                            }
                            $.ajax({
                                url: "AddFixSchedule",
                                type: "POST",
                                async: false,
                                data: {
                                    AddFixSch: JSON.stringify(fixSch)

                                },
                                success: function (message) {
                                    alert(message);
                                }
                            })



                        })
                    })
                </script>
            </head>

            <body>
                <section class="bg-light">
                    <div class="container pb-5 p-25">
                        <div class="row" id="detailFixSch">

                        </div>
                    </div>
                </section>
            </body>

            </html>