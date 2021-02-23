<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
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

                                    var div = `<div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
                                                        <div class="thumbnail" style="width: 320px; height: 340px">
                                                            <div class="caption" fixSch_no="\${detail_products.fixSch_no}">
                                                                <p>主題旅遊名稱:<span class="fixSch_name">\${detail_products.fixSch_name}</span></p>
                                                                <p>去程:<span class="fixSch_start">`+ dateStarStr + `(` + weekdayS + `)` + `</span></p>
                                                                <p>回程:<span class="fixSch_end">`+ dateEndStr + `(` + weekdayE + `)` + `</p>
                                                                <p>可賣數量:<span class="fixSch_available">\${detail_products.fixSch_available}</p> 
                                                                <p>總數量:<span class="fixSch_total">\${detail_products.fixSch_total}</p>
                                                                <p>價格(單價):<span class="fixSch_amount">\${detail_products.fixSch_amount}</p>
                                                                <p>上下架狀況(0||1):<span class="fixSch_pub">\${detail_products.fixSch_pub}</p>
                                                                <p><input type="button" value="增加至購物車" class="shoppingcart"/></p>
                                                            </div>
                                                        </div>
                                                </div>`;

                                    $("#detailFixSch").append(div);
                                    $(".fixSch_pub").parent().hide();
                                    var addBtnShow = $(".fixSch_pub").text();
                                    if (!detail_products.fixSch_pub || detail_products.fixSch_available == 0) {
                                        $(".shoppingcart").attr("disabled", "disabled");
                                    }
                                }

                            }

                        })

                        $("#detailFixSch").on("click", ".shoppingcart", function () {
                            var no = $(this).parents(".caption").attr("fixSch_no");
                            var fixSchQ = 1;
                            var fixSchUnitP = $(this).parents(".caption").find(".fixSch_amount").text();
                            var fixSchAmount = fixSchQ * fixSchUnitP;

                            var fixSch = {
                                "id":guid(),
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
                <div class="row" id="detailFixSch">

                </div>
            </body>

            </html>