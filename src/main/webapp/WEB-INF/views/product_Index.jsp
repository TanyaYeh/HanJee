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

                <!-- Load fonts style after rendering the layout styles -->
                <link rel="stylesheet"
                    href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
                <link rel="stylesheet" href="css/fontawesome.min.css">

                <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
                <title>Ticket_product</title>
                <style>
                    #searchTable td {
                        padding-right: 10px;
                    }
                </style>
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
                    $(document).ready(function () {
                        $("#ticketLink").hide();
                        var selectText = "--請選擇--";
                        var selectVal = "--select--";


                        $("#pro_start").append("<option value=" + selectVal + ">" + selectText + "</option>");
                        $("#pro_end").append("<option value=" + selectVal + ">" + selectText + "</option>");
                        $("#pro_date").append("<option value=" + selectVal + ">" + selectText + "</option>");



                        $("#searchTicketProduct").click(function () {
                            var pickPro_start = $("#pro_start").find("option:selected").text();
                            var pickPro_end = $("#pro_end").find("option:selected").text();
                            var pickPro_date = $("#pro_date").find("option:selected").text();



                            $.ajax({
                                url: "Ticket_product_SearchBySED",
                                type: "POST",
                                async: false,
                                data: {
                                    PickPro_star: pickPro_start,
                                    PickPro_end: pickPro_end,
                                    PickPro_date: pickPro_date
                                },
                                success: function (list_search) {
                                    $("#ticketList").html("");
                                    if (list_search.length != 0) {
                                        for (var i = 0; i < list_search.length; i++) {
                                            var ticket_products = list_search[i];
                                            var ticket_productsInt = parseInt(`\${ticket_products.pro_date}`);
                                            var date = new Date(ticket_productsInt);
                                            var dateStr = date.getFullYear() + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + ("0" + date.getDate()).slice(-2) + " " + ("0" + date.getHours()).slice(-2) + ":" + ("0" + date.getMinutes()).slice(-2) + ":" + ("0" + date.getSeconds()).slice(-2);
                                            var pro_discountStr = `\${ticket_products.pro_discount}`;
                                            if (pro_discountStr == "null" || pro_discountStr == "1") {
                                                pro_discountStr = "現無折扣";
                                            } else {
                                                //轉折數
                                                pro_discountStr = `\${ticket_products.pro_discount}` * 10 + "折";

                                            }
                                            var div = `
                                                <div class="col-lg-4" >
                                                       <div class="card mb-4 product-wap rounded-0">
                                                            <div  class="card-body" pro_no="\${ticket_products.pro_no}">
                                                                <p><span class="pro_name">\${ticket_products.pro_name}</p>
                                                                <p>票種:<span class="pro_cat">\${ticket_products.pro_cat}</span></p>
                                                                <p>起運站:<span class="pro_start">\${ticket_products.pro_start}</span></p>
                                                                <p>終點站:<span class="pro_end">\${ticket_products.pro_end}</p>
                                                                <p>出發日期:<span class="pro_date">`+ dateStr + `</p>
                                                                      
                                                                <p>票價:<span class="pro_amount">\${ticket_products.pro_amount}元</p>
                                                                <p>優惠:<span class="pro_discount">`+ pro_discountStr + `</p>
                                                                <p count="\${ticket_products.pro_sto}">目前在庫數量: \${ticket_products.pro_sto}張</p>
                                                                <p><input type="number" class="quantity" name="quantity" min="0" max="\${ticket_products.pro_sto}"></p>
                                                                <p>上下架狀況(0||1):<span class="pro_pub">\${ticket_products.pro_pub}</p>
                                                                <p><input type="button" value="增加至購物車" class="shoppingcart" id="\${ticket_products.pro_no}"/></p>
                                                            </div>
                                                        </div>
                                                </div>`;
                                            $("#ticketList").append(div);
                                            $(".pro_pub").parent().hide();
                                            var addBtnShow = $(".pro_pub").text();
                                            if (!ticket_products.pro_pub || ticket_products.pro_sto == 0) {
                                                $(`#\${ticket_products.pro_no}`).attr("disabled", "disabled");
                                            }

                                        }

                                    } else {
                                        var div1 = `<div>查無資料</div>`
                                        $("#ticketList").append(div1);
                                    }
                                }
                            });
                        })
                        $.ajax({
                            url: "Ticket_product_ShowData",
                            type: "POST",
                            async: false,
                            success: function (list) {

                                var pro_starts = [];
                                var pro_ends = [];
                                var pro_dates = [];

                                for (var i = 0; i < list.length; i++) {
                                    //var pro_no = list[i].pro_no;
                                    var pro_start = list[i].pro_start;
                                    var pro_end = list[i].pro_end;
                                    var pro_date = list[i].pro_date;
                                    //篩選掉重複的選項
                                    if (pro_starts.indexOf(pro_start) < 0) {
                                        var optionStart = "<option value=" + pro_start + ">" + pro_start + "</option>";
                                        $("#pro_start").append(optionStart);
                                        pro_starts.push(pro_start)
                                    }
                                    if (pro_ends.indexOf(pro_end) < 0) {
                                        var optionEnd = "<option value=" + pro_end + ">" + pro_end + "</option>";
                                        $("#pro_end").append(optionEnd);
                                        pro_ends.push(pro_end)
                                    }

                                    if (pro_dates.indexOf(pro_date) < 0) {
                                        var date = new Date(pro_date);
                                        var dateStr = date.getFullYear() + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + ("0" + date.getDate()).slice(-2) + " " + ("0" + date.getHours()).slice(-2) + ":" + ("0" + date.getMinutes()).slice(-2) + ":" + ("0" + date.getSeconds()).slice(-2);
                                        var optionDate = "<option value=" + dateStr + " Timestamp=" + pro_date + ">" + dateStr + "</option>";
                                        $("#pro_date").append(optionDate);
                                        pro_dates.push(pro_date)
                                    }




                                }
                                $("#searchTicketProduct").trigger("click");

                            }
                        })
                        $("#ticketList").on("click", ".shoppingcart", function () {
                            var no = $(this).parents(".card-body").attr("pro_no");
                            var productQ = $(this).parents(".card-body").find(".quantity").val();
                            var productUnitP = $(this).parents(".card-body").find(".pro_amount").text().replace("元", "");
                            var productDiscount = $(this).parents(".card-body").find(".pro_discount").text().replace("折", "");
                            //轉回小數
                            if (!productDiscount.includes("現無")) {
                                var productDiscountToFloat = productDiscount / 10;
                                var productAmount = productQ * productUnitP * productDiscountToFloat;

                            } else if (productDiscount.includes("現無")) {
                                var productAmount = productQ * productUnitP;
                            }

                            if (productQ == "" || productQ == 0) {
                                alert("請輸入數量");
                                $(this).parents(".card-body").find(".quantity").val("");
                            } else {
                                var ticket = {
                                    "id": guid(),
                                    "no": no,
                                    "ord_qui": productQ,
                                    "pro_amount": productAmount
                                }
                                $.ajax({
                                    url: "AddTicket_product",
                                    type: "POST",
                                    async: false,
                                    data: {
                                        AddProduct: JSON.stringify(ticket)

                                    },
                                    success: function (message) {
                                        alert(message);
                                        $(".quantity").val("");
                                    }
                                })
                            }
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
                            <jsp:include page="/fragment/mall_Title.jsp"></jsp:include>


                        </div>
                        <div class="col-lg-9">


                            <div class="row pb-3">
                                <div class="col-lg-3">
                                    <h1>車票清單</h1>

                                </div>
                                <div class="col-lg-9">
                                    <table id="searchTable">
                                        <tr>
                                            <td>起點站:</td>
                                            <td><select id="pro_start" class="form-select">
                                                </select></td>
                                            <td>終點站:</td>
                                            <td><select id="pro_end" class="form-select">
                                                </select></td>
                                            <td>日期:</td>
                                            <td><select id="pro_date" class="form-select">
                                                </select></td>
                                            <td> <button type="button" class="btn btn-success" id="searchTicketProduct">
                                                    搜尋
                                                </button></td>
                                        </tr>
                                    </table>




                                </div>
                            </div>


                            <div class="row" id="ticketList">
                            </div>

                        </div>

                    </div>
                    <!-- 左側功能列 -->










                </div>




                <script src="js/bootstrap.bundle.min.js"> </script>

                <script src="js/templatemo.js"></script>
                <script src="js/custom.js"></script>



            </body>

            </html>