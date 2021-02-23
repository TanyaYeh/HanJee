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
                <title>FixSchdule_product</title>
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
                <style>

                </style>
                <script src="js/jquery-migrate-1.2.1.min.js"></script>
                <script src="js/bootstrap.bundle.min.js"></script>
                <script src="js/templatemo.js"></script>
                <script src="js/custom.js"></script>
                <script>
                    var clickCount = 0;

                    $(document).ready(function () {
                        var count=0;
                        $("#fixScheduleLink").hide();
                        $("#searchFixSch").click(function () {
                            var fixSch_name = $("#inputSch_name").val().trim();
                            $.ajax({
                                url: "show_fixSchedule",
                                type: "POST",
                                async: false,
                                data: {
                                    FixSch_name: fixSch_name

                                },
                                success: function (fixSchedule_list) {
                                    
                                    $("#fixSchduleList").html("");
                                    
                                    if (fixSchedule_list.length != 0) {
                                        for (var i = 0; i < fixSchedule_list.length; i++) {
                                            var fixSch_products = fixSchedule_list[i];
                                            var fixSch_discountStr = `\${fixSch_products.fixSch_discount}`;
                                            if (fixSch_discountStr == "null" || fixSch_discountStr == "1") {
                                                fixSch_discountStr = "現無折扣";
                                            } else {
                                                //轉折數
                                                fixSch_discountStr = `\${fixSch_products.fixSch_discount}` * 10 + "折";

                                            }

                                            var div = `
                                                        <div class="col-12 col-md-4 mb-4" fixSch_no="\${fixSch_products.fixSch_no}">
                                                            <div class="card h-100">
                                                                <p>
                                                                <img style="width:100%;" src="\${fixSch_products.fixSch_img}" class="card-img-top"></p>
                                                                <div class="card-body">
                                                                    <ul class="list-unstyled d-flex justify-content-between">
                                                                        <li>
                                                                            <i class="text-warning fa fa-star"></i>
                                                                            <i class="text-warning fa fa-star"></i>
                                                                            <i class="text-warning fa fa-star"></i>
                                                                            <i class="text-muted fa fa-star"></i>
                                                                            <i class="text-muted fa fa-star"></i>
                                                                        </li>
                                                                        <li class="text-muted text-right"><span class="fixSch_amount">\${fixSch_products.fixSch_amount}元</span></li>
                                                                        <li class="text-muted text-right"><span class="fixSch_discount">`+ fixSch_discountStr + `</li>
                                                                    </ul>
                                                                    <span class="fixSch_name h2 text-decoration-none text-dark">\${fixSch_products.fixSch_name}</span>
                                                                     
                                                                    <p>
                                                                        <a href="<c:url value='/showFixSchDetail?fixSch_no=\${fixSch_products.fixSch_no}'/>" target="_blank" class="viewFixSchDetail"><input type="button" value="查看更多資訊" class="viewFixSchDetail"></a>
                                                                    </p>                                                                                                                                 
                                                                </div>
                                                            </div>
                                                        </div>`;


                                            var img = `<a href="<c:url value='/showFixSchDetail?fixSch_no=\${fixSch_products.fixSch_no}'/>" target="_blank" class="viewFixSchDetail"><img class="img-fluid" src="\${fixSch_products.fixSch_img}" alt="\${fixSch_products.fixSch_name}"></a>`;
                                            
                                            $("#fixSchduleList").append(div);
                                            //只取4個行程放廣告這邊會有問題~
                                            if(count==0){
                                                $("#carousel-" + i).append(img);
                                                
                                            }
                                            $("#inputSch_name").val("");
                                        }
                                        

                                    } else {

                                        var div1 = `<div>查無資料</div>`;
                                        $("#fixSchduleList").append(div1);
                                        $("#inputSch_name").val("");
                                    }
                                    count++;

                                }
                            })

                        })
                        $("#searchFixSch").trigger("click");
                    })


                </script>
            </head>

            <body>
                <!-- 主頁的表頭 -->
                <div style="background-color:#4E7C99; margin: 0 auto;">
                    <jsp:include page="/fragment/Top.jsp" />
                </div>
                <br>
                <div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-bs-slide-to="0" data-bs-target="#template-mo-zay-hero-carousel" class=""></li>
                        <li data-bs-slide-to="1" data-bs-target="#template-mo-zay-hero-carousel" class=""></li>
                        <li data-bs-slide-to="2" data-bs-target="#template-mo-zay-hero-carousel" class=""></li>
                        <li data-bs-slide-to="3" data-bs-target="#template-mo-zay-hero-carousel" class=""></li>
                    </ol>

                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="container">
                                <div class="row p-5">
                                    <div class="mx-auto col-md-8 col-lg-6 order-lg-last" id="carousel-0">

                                    </div>
                                    <div class="col-lg-6 mb-0 d-flex align-items-center">
                                        <div class="text-align-left align-self-center">
                                            <h1 class="h1 text-success"><b>HanJee</b> Travel</h1>
                                            <h3 class="h2">【網美養成計畫】櫻舞紛飛．武陵櫻花季.浪漫秘境酒莊.無菜單料理.壯圍沙丘.入住網美飯店2日</h3>
                                            <p>
                                                一年一度武陵櫻花季，山櫻花、粉紅佳人接力綻放，沉浸浪漫粉紅花海；落坐里山田野中，嚐一口產地直送的在地鮮味；零距離親近梅花鹿，無辜又可愛的神情超療癒；獨一無二手作生活器皿彩繪，希冀新的一年盛裝更多美好。
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="container">
                                <div class="row p-5">
                                    <div class="mx-auto col-md-8 col-lg-6 order-lg-last" id="carousel-1">

                                    </div>
                                    <div class="col-lg-6 mb-0 d-flex align-items-center">
                                        <div class="text-align-left">
                                            <h1 class="h1 text-success"><b>HanJee</b> Travel</h1>
                                            <h3 class="h2">《賀歲迎春》星夢郵輪～探索夢號【高雄/花蓮】假期4天3夜</h3>
                                            <p>
                                                <strong>春節航程</strong> 海上年貨大街辦年貨樂趣多 開春書法春聯教學 海上團圓年夜飯(僅2/10出發適用)
                                                還有更多過年習俗精彩活動，邀請旅客一起登船，體驗最難忘的海上新年。
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="container">
                                <div class="row p-5">
                                    <div class="mx-auto col-md-8 col-lg-6 order-lg-last" id="carousel-2">

                                    </div>
                                    <div class="col-lg-6 mb-0 d-flex align-items-center">
                                        <div class="text-align-left align-self-center">
                                            <h1 class="h1 text-success"><b>HanJee</b> Travel</h1>
                                            <h3 class="h2">【花蓮x台東】在地美食．溫泉．大地美景．單車漫遊3日『挑戰型』</h3>
                                            <p>
                                                美味的原民料理、在地特有食材的饗宴、夜間滿天的星空、在飯店房間內就可以暖心泡湯～ 過年就是要放鬆好享受！
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="container">
                                <div class="row p-5">
                                    <div class="mx-auto col-md-8 col-lg-6 order-lg-last" id="carousel-3">

                                    </div>
                                    <div class="col-lg-6 mb-0 d-flex align-items-center">
                                        <div class="text-align-left align-self-center">
                                            <h1 class="h1 text-success"><b>HanJee</b> Travel</h1>
                                            <h3 class="h2">武界部落：雲的故鄉・武界之泉摩摩納爾瀑布・日月潭湖光山色・日系唯美風建築・天泉奈米牛奶浴2日</h3>
                                            <p>
                                                位於臺灣新竹縣尖石鄉的泰雅族部落，早期族人過著無電力、無道路、自給自足、與世隔絕的生活，因而被稱為黑暗部落，直到部落長老與族人發現深山裡擁有數棵千年巨木，開始有絡繹不絕的遊客尋訪。
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev text-decoration-none w-auto ps-3"
                        href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
                        <i class="fas fa-chevron-left"></i>
                    </a>
                    <a class="carousel-control-next text-decoration-none w-auto pe-3"
                        href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
                        <i class="fas fa-chevron-right"></i>
                    </a>
                </div>

                <div class="container py-5">
                    <div class="row">
                        <div class="col-lg-3">
                            <!-- 商城的表頭 -->
                            <jsp:include page="/fragment/mall_Title.jsp"></jsp:include>
                        </div>
                        <div class="col-lg-9">
                            <input type="text" id="inputSch_name" placeholder="請輸入欲查詢的主題關鍵字"
                                style="width:360px;" /><input type="button" value="搜尋" id="searchFixSch" />
                            <section class="bg-light">
                                <div class="container py-5">
                                    <div class="row text-center py-3">
                                        <div class="col-lg-6 m-auto">
                                            <h1 class="h1">主題旅遊清單</h1>
                                            <p>
                                                不知假期要去哪？沒關係，超熱門票券、訂房、自由行都在這，跟著推薦準沒錯，來趟說走就走的旅行，讓你買的划算玩得開心。
                                            </p>
                                        </div>
                                    </div>

                                    <div class="row" id="fixSchduleList">


                                    </div>






                                </div>
                            </section>
                        </div>

                    </div>

                </div>
                <!-- 行程細節 -->
                <!-- <p class="card-text">
                    \${fixSch_products.fixSch_description}
                    </p> -->

<a href="<c:url value='/tw/hanjee/managerback'/>">回管理員首頁</a>
            </body>

            </html>