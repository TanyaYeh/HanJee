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
                <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">

                <title>View Shoppingcart</title>

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
                    var nameFlag = false;
                    var phoneFlag = false;
                    var addFlag = false;
                    function IV_no() {


                        function Random(chars, length) {
                            var randomstring = '';
                            for (var i = 0; i < length; i++) {
                                var rnum = Math.floor(Math.random() * chars.length);
                                randomstring += chars.substring(rnum, rnum + 1);
                            }
                            return randomstring;
                        }
                        return (

                            Random("ABCDEFGHIJKLMNOPQRSTUVWXTZ", 2) + "-" + Random("0123456789", 8)

                        );
                    }
                    function initshowShoppingcart() {
                        $("#nodata").show();
                        $("#total_table").hide();
                        $("#totalAmount").text(0);
                        $("#includeTaxAmount").text(0);
                        $("#sendShoppingcart").hide();
                        $("#schedule_shoppingcart").hide();
                        $("#ticket_shoppingcart").hide();
                        $("#fix_schudle").hide();
                        $("#user_input_data").hide();
                        $("#receiveName").val("");
                        $("#receivePhone").val("");
                        $("#receiveAdd").val("");
                        $("#insurance").hide();
                        $("#sendBtnTb").hide();
                    }
                    function showShoppingcart() {
                        initshowShoppingcart();
                        $("#schedule_shoppingcart").html(`
                        <tr>
                            <th colspan="4">自由行</th>
                        </tr>
                        <tr>
                            <td ><strong>行程編號</strong></td>
                            <td ><strong>數量</strong></td>
                            <td ><strong>總價</strong></td>
                            <td ><strong>刪除</strong></td>
                        </tr>
                        `);
                        $("#ticket_shoppingcart").html(`<tr>
                            <th colspan="4">車票資訊</th>
                        </tr>
                        <tr>
                            
                            <td ><strong>起點到終點站</strong></td>
                            <td ><strong>數量</strong></td>
                            <td ><strong>總價</strong></td>
                            <td ><strong>刪除</strong></td>
                        </tr>`);
                        $("#fix_schudle").html(`<tr>
                            <th colspan="4">主題旅遊資訊</th>
                        </tr>
                        <tr>
                            
                            <td ><strong>主題旅遊名稱</strong></td>
                            <td ><strong>數量</strong></td>
                            <td ><strong>總價</strong></td>
                            <td ><strong>刪除</strong></td>
                        </tr>`);

                        $("#insurance").html(`<tr>
                            <th colspan="4">旅遊保險</th>
                        </tr>
                        <tr>
                            
                            <td ><strong>計畫別</strong></td>
                            <td ><strong>保單號碼</strong></td>
                            <td ><strong>總價</strong></td>
                            <td ><strong>刪除</strong></td>
                        </tr>`);


                        $.ajax({
                            url: "show_Shoppingcart",
                            type: "POST",
                            async: false,
                            success: function (shoppingcart_list) {
                                var scheduleIsShow = false;
                                var ticketIsShow = false;
                                var fixSchIsShow = false;
                                var insuranceIsShow = false;
                                var totalAmount = 0;
                                // console.log(shoppingcart_list);
                                for (var i = 0; i < shoppingcart_list.length; i++) {
                                    var data = shoppingcart_list[i];
                                    var name = data.name;
                                    var number = parseInt(data.no);
                                    var quantity = parseInt(data.ord_qui);
                                    var amount = parseInt(data.pro_amount);
                                    totalAmount += amount;
                                    var taxAmount = Math.ceil(totalAmount * 1.05);
                                    if (data.type == "scheduleBean") {
                                        scheduleIsShow = true;
                                        var td = `
                                        <tr>                                         
                                            <td >
                                                <a href="<c:url value='/'/>"><strong>\${name}</strong></a>
                                            </td>
          s                                  <td >
                                                <strong>1</strong>
                                            </td>
                                            <td >
                                                <strong>\${amount}</strong>
                                            </td>
                                            <td >
                                            <button type="button"  session='scheduleBean'  class='btn btn-danger del' shoppingId="\${data.id}">
                                            <span class="glyphicon glyphicon-remove"></span> Remove
                                            </button></td>
                
                                        </tr>
                                        `;

                                        $("#schedule_shoppingcart").append(td);
                                        $("#schedule_shoppingcart").show();


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
                                            
                                            <td ><strong>\${amount}</strong></td>
                                            <td >
                                            <button type="button" class="btn btn-danger del" session='ticket' shoppingId="\${data.id}">
                                                <span class="glyphicon glyphicon-remove"></span> Remove
                                            </button></td>
                                        </tr>
                                    `;

                                        $("#ticket_shoppingcart").append(td);
                                        $("#ticket_shoppingcart").show();



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
                                            
                                            <td ><strong>\${amount}</strong></td>
                                            <td  >
                                            <button type="button" class="btn btn-danger del" session='fixSchedules' shoppingId="\${data.id}">
                                                <span class="glyphicon glyphicon-remove"></span> Remove
                                            </button></td>
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
                                                <strong>\${data.no}</strong>
                                            </td>
                                            <td >
                                                <strong>\${amount}</strong>
                                            </td>
                                            <td>
                                                <button type="button" class="btn btn-danger del" session='insurances' shoppingId="\${data.id}">
                                                    <span class="glyphicon glyphicon-remove"></span> Remove
                                                </button>
                                            </td>
                                        </tr>
                                    `;
                                        $("#insurance").append(td);
                                        $("#insurance").show();


                                    }
                                }
                                if (scheduleIsShow || ticketIsShow || fixSchIsShow || insuranceIsShow) {
                                    $("#nodata").hide();
                                    $("#sendBtnTb").show();
                                    $("#sendShoppingcart").show();
                                    $("#user_input_data").show();
                                    $("#total_table").show();
                                    $("#totalAmount").text(totalAmount);
                                    $("#includeTaxAmount").text(taxAmount);
                                }


                            }
                        })

                    }

                    $(document).ready(function () {
                        $("#shoppingcartLink").hide();


                        showShoppingcart();

                        $("#overview").on("click", ".del", function () {

                            var session = $(this).attr("session");
                            var shoppingId = $(this).attr("shoppingId");

                            $.ajax({
                                url: "delShopping",
                                type: "POST",
                                async: false,
                                data: {
                                    Session: session,
                                    ShoppingId: shoppingId
                                },
                                success: function (message) {
                                    showShoppingcart();
                                    alert(message);

                                }
                            })

                        })
                        //判斷使用者輸入的值是否符合要求
                        //收件人
                        $("#receiveName").keyup(function () {
                            var receiveName = $("#receiveName").val().trim();
                            var receiveNameLength = receiveName.length;
                            if (receiveName != "") {
                                //&& receivePhone != "" && receiveAdd != ""
                                if (receiveNameLength >= 2) {
                                    if (/^[\u4e00-\u9fa5]+$/.test(receiveName)) {
                                        $("#nameSp").text("");
                                        $("#nameSp").text("輸入正確");
                                        nameFlag = true;
                                    } else {
                                        $("#nameSp").text("");
                                        $("#nameSp").text("輸入姓名必須全為中文字");
                                        nameFlag = false;
                                    }
                                } else {
                                    $("#nameSp").text("");
                                    $("#nameSp").text("輸入姓名必須至少兩個字");
                                    nameFlag = false;

                                }
                            } else {

                                $("#nameSp").text("");
                                $("#nameSp").text("請輸入收件姓名");
                                nameFlag = false;
                            }
                        })
                        //收件電話
                        $("#receivePhone").keyup(function () {

                            var receivePhone = $("#receivePhone").val().trim();
                            var receivePhoneLength = receivePhone.length;
                            if (receivePhone != "") {
                                if (receivePhoneLength == 10) {

                                    if ((/^09[123456789]{8}$/.test(receivePhone))) {
                                        $("#phoneSp").text("");
                                        $("#phoneSp").text("輸入正確");
                                        phoneFlag = true;
                                    } else {

                                        $("#phoneSp").text("");
                                        $("#phoneSp").text("請輸入開頭為09的手機號碼");
                                        phoneFlag = false;
                                    }
                                } else {
                                    $("#phoneSp").text("");
                                    $("#phoneSp").text("請輸入10位手機號碼");
                                    phoneFlag = false;
                                }
                            } else {
                                $("#phoneSp").text("");
                                $("#phoneSp").text("請輸入收件電話");
                                phoneFlag = false;
                            }
                        })
                        //收件地址
                        $("#receiveAdd").keyup(function () {
                            var receiveAdd = $("#receiveAdd").val().trim();
                            if (receiveAdd != "") {

                                $("#addSp").text("");
                                $("#addSp").text("輸入正確");
                                addFlag = true;


                            } else {
                                $("#addSp").text("");
                                $("#addSp").text("請輸入收件地址");
                                addFlag = false;
                            }
                        })



                        $("#sendShoppingcart").click(function () {

                            var check = $("#new32").prop("checked");
                            if(!check){
                                alert("請確認閱讀「報名須知」與「旅遊契約書」");
                                return;
                            }

                            var receiveName = $("#receiveName").val().trim();
                            var receivePhone = $("#receivePhone").val().trim();
                            var receiveAdd = $("#receiveAdd").val().trim();
                            var ivNumber = null;
                            var includeTaxAmount = $("#includeTaxAmount").text();
                            if (nameFlag && phoneFlag && addFlag) {
                                $.ajax({
                                    url: "insert_order",
                                    type: "POST",
                                    async: false,
                                    data: {
                                        ReceiveName: receiveName,
                                        ReceivePhone: receivePhone,
                                        ReceiveAdd: receiveAdd,
                                        IvNumber: IV_no(),
                                        IncludeTaxAmount: includeTaxAmount

                                    },
                                    success: function (result) {
                                        alert(result);
                                        if (result == "訂購成功") {
                                            showShoppingcart();
                                        }


                                    }

                                })

                            } else {
                                alert("請檢視輸入資料");
                            }

                        })
                        $("#inputUserInfo").click(function () {
                            $("#receiveName").val("葉潔蓉");
                            $("#receivePhone").val("0987654321");
                            $("#receiveAdd").val("台北市信義路三段153號10樓");

                            $("#receiveName").trigger("keyup");
                            $("#receivePhone").trigger("keyup");
                            $("#receiveAdd").trigger("keyup");

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
                                    <h1>我的購物車</h1>
                                </div>
                            </div>

                            <div class="bg-light">
                                <div id="nodata" style="text-align: center;font-size: 30px!important;padding: 10px;">
                                    尚無訂單資料
                                </div>

                                <div id="overview">
                                    <table id="schedule_shoppingcart" style="display: none;">
                                        <tr>
                                            <th colspan="4">自由行</th>
                                        </tr>
                                        <tr>
                                            <td>行程編號</td>
                                            <td>數量</td>
                                            <td>總價</td>
                                            <td>刪除</td>

                                        </tr>

                                    </table>
                                    <table id="ticket_shoppingcart" style="display: none;">
                                        <tr>
                                            <th colspan="4">車票資訊</th>
                                        </tr>
                                        <tr>

                                            <td>起點到終點站</td>
                                            <td>數量</td>
                                            <td>總價</td>
                                            <td>刪除</td>
                                        </tr>

                                    </table>
                                    <table id="fix_schudle" style="display: none;">

                                        <tr>
                                            <th colspan="4">主題旅遊資訊</th>
                                        </tr>
                                        <tr>

                                            <td>主題旅遊名稱</td>
                                            <td>數量</td>
                                            <td>總價</td>
                                            <td>刪除</td>
                                        </tr>
                                    </table>

                                    <table id="insurance" style="display: none;">

                                        <tr>
                                            <th colspan="4">旅遊保險</th>
                                        </tr>
                                        <tr>

                                            <td>計畫別</td>
                                            <td>保單號碼</td>
                                            <td>總價</td>
                                            <td>刪除</td>

                                        </tr>
                                    </table>
                                </div>
                                <div style="padding: 10px;">
                                    <table id="total_table" style="display:none;margin-right:100px;float: right;">
                                        <tr>
                                            <td>總計</td>
                                            <td id="totalAmount"></td>
                                        </tr>
                                        <tr>
                                            <td>含稅價格</td>
                                            <td id="includeTaxAmount"></td>
                                        </tr>

                                    </table>

                                    <table id="user_input_data" style="display: none;">
                                        <tr>
                                            <td>收件者:</td>
                                            <td><input type="text" id="receiveName" /><span id="nameSp"></span></td>
                                        </tr>
                                        <tr>
                                            <td>電話:</td>
                                            <td><input type="text" id="receivePhone" /><span id="phoneSp"></span></td>
                                        </tr>
                                        <tr>
                                            <td>地址:</td>
                                            <td><input type="text" id="receiveAdd" /><span id="addSp"></span></td>
                                        </tr>

                                    </table>
                                </div>

                                <div id="accordionExample">
                                    <div class="card">
                                        <div class="card-header" id="headingOne">
                                            <h2 class="mb-0">
                                                <button class="btn btn-link" type="button" data-toggle="collapse"
                                                    data-target="#collapseOne" aria-expanded="true"
                                                    aria-controls="collapseOne">
                                                    購買須知
                                                </button>
                                            </h2>
                                        </div>
                                        <div id="collapseOne" class="collapse" aria-labelledby="headingOne"
                                            data-parent="#accordionExample">
                                            <div class="card-body">
                                                <ol>
                                                    <li>「可賣」定義：目前團位數減已付訂金及待付訂之訂單人數。待付訂指「24小時內將付訂金者」，故人數可能異動，請注意。</li>
                                                    <li>售價尚未公布的團體旅遊，在報名完成後會有服務人員與您聯繫，並在售價公佈時主動聯絡告知。</li>
                                                    <li>訂單報名完成，訂單保留24小時，請在下訂單後24小時內的上班時間繳交訂金或團費，在繳付訂金前旅遊契約書尚未生效。</li>
                                                    <li>訂單候補，表示目前已無可賣團位。當有待付訂顧客超過24小時未付訂金，其名額將自動依序排給候補顧客使用，並由服務人主動聯絡告知。
                                                    </li>
                                                    <li>若因匯率調整或因成本調漲，本公司於收到訂金或團費前保留調整團費之權利。</li>
                                                    <li>報名完成並繳交訂金或團費後，旅遊契約書即產生效力，若變更或取消行程，依契約書內容辦理。</li>
                                                    <li>團體旅遊或團體自由行，報名簽約人數需達旅遊契約書內之組團旅遊最低人數方可成行。</li>
                                                    <li>國外旅遊報名時，請確認護照之有效期限在行程回國日起算六個月以上，申辦新護照者約需七日。簽證工作天視各地區而定。</li>
                                                    <li>若為孕婦或罹患重大疾病者，請直接向本公司承辦人員辦理報名，並告知個人狀況，如未事先告知而致無法成行或衍生其他問題，需自行負責。
                                                    </li>
                                                    <li>當團行程內容若有特殊優惠折扣，服務人員會於您訂單確認寄出後，主動幫您扣除，並於聯絡時告知。</li>
                                                </ol>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header" id="headingTwo">
                                            <h2 class="mb-0">
                                                <button class="btn btn-link collapsed" type="button"
                                                    data-toggle="collapse" data-target="#collapseTwo"
                                                    aria-expanded="false" aria-controls="collapseTwo">
                                                    旅遊契約書
                                                </button>
                                            </h2>
                                        </div>
                                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
                                            data-parent="#accordionExample">
                                            <div class="card-body">
                                                <div class="cd_gpct cd_header">
                                                    <div class="title">國內團體旅遊定型化契約書</div>
                                                    <div class="announce">
                                                        <div>中華民國105年12月12日觀業字第1050922838號函修正</div>
                                                    </div>
                                                </div>
                                                <div class="cd_gpct cd_wrapper">
                                                    <div class="cd_gpbx top">
                                                        <div class="title">立契約書人</div>
                                                        <div class="content">
                                                            <div class="name-info">
                                                                <div class="title">旅客（以下稱甲方）：</div>
                                                                <span
                                                                    class="name">姓名_______________________________</span><span>。等共____________人</span>
                                                            </div>
                                                            <div class="name-info">
                                                                <div class="title">緊急聯絡人：</div>
                                                                <span
                                                                    class="name">姓名_______________________________</span><span>。；與旅客關係：____________。；電話：____________。</span>
                                                            </div>
                                                            <div class="lion">旅行業
                                                                (以下稱乙方)：公司名稱：雄獅旅行社股份有限公司；負責人：王文傑；營業所：台北市石潭路151號9樓。</div>
                                                            <div class="review-date">
                                                                (本契約審閱期間一日，______年______月______日由甲方攜回審閱)</div>
                                                        </div>
                                                    </div>
                                                    <div class="cd_content">
                                                        <div class="cd_title">甲乙雙方同意就本旅遊事項，依下列規定辦理。</div>
                                                        <div class="cd_topic">第一條（國內旅遊之意義）</div>
                                                        <div>本契約所謂國內旅遊，指在臺灣、澎湖、金門、馬祖及其他自由地區之我國疆域範圍內之旅遊。</div>
                                                        <div class="cd_topic">第二條（適用之範圍及順序）</div>
                                                        <div>甲乙雙方關於本旅遊之權利義務，依本契約條款之約定定之；本契約中未約定者，適用中華民國有關法令之規定。</div>
                                                        <div class="cd_topic">第三條（旅遊團名稱、旅遊行程及廣告責任）</div>
                                                        <div>本旅遊團名稱為：</div>
                                                        <div class="cd_notice">2021/2/10 <span
                                                                class="symbol">◎</span>【春節環島第二人折4000】大橘大利橘之鄉DIY．大農大富油菜花．池上爆米香．佛陀紀念館新春祈福．山上人家櫻花季5日
                                                        </div>
                                                        <div class="cd_list">
                                                            <li>一、旅遊地區（國家、城市或觀光地點）：<span class="cd_notice">台灣環島</span>
                                                            </li>
                                                            <li>二、行程（啟程出發地點、回程之終止地點、日期、交通工具、住宿旅館、餐飲、遊覽、安排購物行程及其所附隨之服務說明）：______________________________
                                                            </li>
                                                        </div>
                                                        <div>
                                                            與本契約有關之附件、廣告、宣傳文件、行程表或說明會之說明內容均視為本契約內容之一部分。乙方應確保廣告內容之真實，對甲方所負之義務不得低於廣告之內容。
                                                        </div>
                                                        <div>第一項記載得以所刊登之廣告、宣傳文件、行程表或說明會之說明內容代之。</div>
                                                        <div>未記載第一項內容或記載之內容與刊登廣告、宣傳文件、行程表或說明會之說明記載不符者，以最有利於旅客之內容為準。
                                                        </div>
                                                        <div class="cd_topic"> 第四條（集合及出發時地）</div>
                                                        <div>
                                                            甲方應於民國_____年_____月_____日_____時_____分於_____準時集合出發(請依說明會確認時間)。
                                                            甲方未準時到約定地點集合致未能出發，亦未能中途加入旅遊者，視為甲方任意解除契約，乙方得依第十二條之約定，行使損害賠償請求權。
                                                        </div>
                                                        <div class="cd_topic">第五條（旅遊費用及其付款方式）</div>
                                                        <div>除雙方有特別約定者外，甲方應依下列約定繳付團費新臺幣____________元：</div>
                                                        <div class="cd_list">
                                                            <li>
                                                                一、簽訂本契約時，甲方應以______(現金、信用卡、轉帳等方式)繳付新臺幣
                                                                <span class="cd_notice">
                                                                    8,000
                                                                </span>元。
                                                            </li>
                                                            <li>二、其餘款項以______(現金、信用卡、轉帳等方式)於出發前三日或說明會時繳清。</li>
                                                        </div>
                                                        <div>前項之特別約定，除經雙方同意並記載於本契約第三十二條，雙方不得以任何名義要求增減旅遊費用。</div>
                                                        <div class="cd_topic">第六條 (旅客怠於給付旅遊費用之效力)</div>
                                                        <div>
                                                            因可歸責於甲方之事由，怠於給付旅遊費用者，乙方得定相當期限催告甲方給付，甲方逾期不為給付者，乙方得終止契約。甲方應賠償之費用，依第十二條約定辦理；乙方如有其他損害，並得請求賠償。
                                                        </div>
                                                        <div class="cd_topic">第七條 (旅客協力義務)</div>
                                                        <div>
                                                            旅遊需甲方之行為始能完成，而甲方不為其行為者，乙方得定相當期限，催告甲方為之。甲方逾期不為其行為者，乙方得終止契約，並得請求賠償因契約終止而生之損害。<br>
                                                            旅遊開始後，乙方依前項規定終止契約時，甲方得請求乙方墊付費用將其送回原出發地。於到達後，由甲方附加年利率<u>5</u>％利息償還乙方。
                                                        </div>
                                                        <div class="cd_topic">第八條（旅遊費用所涵蓋之項目）</div>
                                                        <div>甲方依第五條約定繳納之旅遊費用，除雙方依第三十二條另有約定外，應包括下列項目：</div>
                                                        <div class="cd_list">
                                                            <li>一、代辦證件之行政規費：乙方代理甲方辦理所須證件之規費。</li>
                                                            <li>二、交通運輸費：旅程所需各種交通運輸之費用。</li>
                                                            <li>三、餐飲費：旅程中所列應由乙方安排之餐飲費用。</li>
                                                            <li>四、住宿費：旅程中所需之住宿旅館之費用，如甲方需要單人房，經乙方同意安排者，甲方應補繳所需差額。</li>
                                                            <li>五、遊覽費用：旅程中所列之一切遊覽費用及入場門票費等。</li>
                                                            <li>六、接送費：旅遊期間機場、港口、車站等與旅館間之一切接送費用。</li>
                                                            <li>七、行李費：團體行李往返機場、港口、車站等與旅館間之一切接送費用及團體行李接送人員之小費，行李數量之重量依航空公司規定辦理。
                                                            </li>
                                                            <li>八、稅捐：機場服務稅捐及團體餐宿稅捐等。</li>
                                                            <li>九、服務費：隨團服務人員之報酬及其他乙方為甲方安排服務人員之報酬。</li>
                                                            <li>十、保險費：責任保險及履約保證保險。</li>
                                                        </div>
                                                        <div>
                                                            前項第二款交通運輸費及第五款遊覽費用，其費用於契約簽訂後經政府機關或經營管理業者公布調高或調低時，應由甲方補足，或由乙方退還。
                                                        </div>
                                                        <div>
                                                            第一項第二款至第五款之年長者門票減免、兒童住宿不佔床及各項優惠等，詳如附件。如契約相關文件均未記載者，甲方得請求如實退還差額。
                                                        </div>
                                                        <div class="cd_topic">第九條（旅遊費用所未涵蓋項目）</div>
                                                        <div>除雙方依第三十二條另有約定外，第五條之旅遊費用，不包括下列項目：</div>
                                                        <div class="cd_list">
                                                            <li>一、非本旅遊契約所列行程之一切費用。</li>
                                                            <li>二、甲方個人費用：如自費行程費用、行李超重費、飲料及酒類、洗衣、電話、網際網路使用費、私人交通費、行程外陪同購物之報酬、自由活動費、個人傷病醫療費、宜自行給與提供個人服務者（如旅館客房服務人員）之小費或尋回遺失物費用及報酬。
                                                            </li>
                                                            <li>三、未列入旅程之機票及其他有關費用。</li>
                                                            <li>四、建議給予司機或隨團服務人員之小費。</li>
                                                            <li>五、保險費：甲方自行投保旅行平安險之費用。</li>
                                                            <li>六、其他由乙方代辦代收之費用。</li>
                                                        </div>
                                                        <div>前項第二款、第四款建議給予之小費，乙方應於出發前，說明各觀光地區小費收取狀況及約略金額。</div>

                                                        <div class="cd_topic">第十條（組團旅遊最低人數） </div>
                                                        <div>
                                                            本旅遊團須有<span class="cd_notice"> 30
                                                            </span>人以上簽約參加始組成。如未達前定人數，乙方應於預訂出發之_____日前（至少七日，如未記載時，視為七日）通知甲方解除契約，怠於通知致甲方受損害者，乙方應賠償甲方損害。
                                                        </div>
                                                        <div>前項組團人數如未記載者，視為無最低組團人數；其保證出團者，亦同。</div>
                                                        <div>乙方依第一項規定解除契約後，得依下列方式之一，返還或移作依第二款成立之新旅遊契約之旅遊費用：</div>
                                                        <div class="cd_list">
                                                            <li>一、退還甲方已交付之全部費用。但乙方已代繳之行政規費得予扣除。</li>
                                                            <li>二、
                                                                徵得甲方同意，訂定另一旅遊契約，將依第一項解除契約應返還甲方之全部費用，移作該另訂之旅遊契約之費用全部或一部。如有超出之賸餘費用，應退還甲方。
                                                            </li>
                                                        </div>
                                                        <div class="cd_topic">第十一條（因可歸責於旅行業之事由致無法成行）</div>
                                                        <div>
                                                            因可歸責於乙方之事由，致旅遊活動無法成行者，乙方於知悉旅遊活動無法成行時，應即通知甲方且說明其事由，並退還甲方已繳之旅遊費用。前項情形，乙方怠於通知者，應賠償甲方依旅遊費用之全部計算之違約金。<br>
                                                            乙方已為第一項通知者，則按通知到達甲方時，距出發日期時間之長短，依下列規定計算其應賠償甲方之違約金：
                                                        </div>
                                                        <div class="cd_list">
                                                            <li>一、通知於出發日前第四十一日以前到達者，賠償旅遊費用百分之五。</li>
                                                            <li>二、通知於出發日前第三十一日至第四十日以內到達者，賠償旅遊費用百分之十。</li>
                                                            <li>三、通知於出發日前第二十一日至第三十日以內到達者，賠償旅遊費用百分之二十。</li>
                                                            <li>四、通知於出發日前第二日至第二十日以內到達者，賠償旅遊費用百分之三十。</li>
                                                            <li>五、通知於出發日前一日到達者，賠償旅遊費用百分之五十。</li>
                                                            <li>六、通知於出發當日以後到達者，賠償旅遊費用百分之一百。</li>
                                                        </div>
                                                        <div>甲方如能證明其所損害超過前項各款基準者，得就其實際損害請求賠償。</div>
                                                        <div class="cd_topic">第十二條（出發前旅客任意解除契約及其責任）</div>
                                                        <div>甲方於旅遊活動開始前得解除契約。但應於乙方提供收據後，繳交行政規費，並依列基準賠償：</div>
                                                        <div class="cd_list">
                                                            <li>一、旅遊開始前第四十一日以前解除契約者，賠償旅遊費用百分之五。</li>
                                                            <li>二、旅遊開始前第三十一日至第四十日以內解除契約者，賠償旅遊費用百分之十。</li>
                                                            <li>三、旅遊開始前第二十一日至第三十日以內解除契約者，賠償旅遊費用百分之二十。</li>
                                                            <li>四、旅遊開始前第二日至第二十日以內解除契約者，賠償旅遊費用百分之三十。</li>
                                                            <li>五、旅遊開始前一日解除契約者，賠償旅遊費用百分之五十。</li>
                                                            <li>六、旅遊開始日或開始後解除契約或未通知不參加者，賠償旅遊費用百分之一百。</li>
                                                        </div>
                                                        <div>前項規定作為損害賠償計算基準之旅遊費用，應先扣除行政規費後計算之。</div>
                                                        <div>乙方如能證明其所受損害超過第一項之基準者，得就其實際損害請求賠償。</div>
                                                        <div class="cd_topic">第十三條（出發前有法定原因解除契約）</div>
                                                        <div>因不可抗力或不可歸責於雙方當事人之事由，致本契約之全部或一部無法履行時，任何一方得解除契約，且不負損害賠償責任。
                                                        </div>
                                                        <div>前項情形，乙方應提出已代繳之行政規費或履行本契約已支付之全部必要費用之單據，經核實後予以扣除，並將餘款退還甲方。
                                                        </div>
                                                        <div>
                                                            任何一方知悉旅遊活動無法成行時，應即通知他方並說明其事由；其怠於通知致他方受有損害時，應負賠償責任。<br>
                                                            為維護本契約旅遊團體之安全與利益，乙方依第一項為解除契約後，應為有利於旅遊團體之必要措置。
                                                        </div>
                                                        <div class="cd_topic">第十四條（出發前有客觀風險事由解除契約）</div>
                                                        <div>
                                                            出發前，本旅遊團所前往旅遊地區之一，有事實足認危害旅客生命、身體、健康、財產安全之虞者，準用前條之規定，得解除契約。但解除之一方，應按旅遊費用百分之______補償他方（不得超過百分之五）。
                                                        </div>
                                                        <div class="cd_topic">第十五條（證照之保管及返還）</div>
                                                        <div>
                                                            乙方代理甲方處理旅遊所需之手續，應妥慎保管甲方之各項證件；如有遺失或毀損，應即主動補辦。如致甲方受損害時，應賠償甲方之損害。
                                                        </div>
                                                        <div>前項證件，乙方及其受僱人應以善良管理人之注意保管之；甲方得隨時取回，乙方及其受僱人不得拒絕。</div>
                                                        <div class="cd_topic">第十六條（旅客之變更權）</div>
                                                        <div>
                                                            甲方於旅遊開始<u>21</u>日前，因故不能參加旅遊者，得變更由第三人參加旅遊。乙方非有正當理由者，不得拒絕。<br>
                                                            前項情形，如因而增加費用，乙方得請求該變更後之第三人給付；如減少費用，甲方不得請求返還。甲方並應於接到乙方通知後<u>2</u>日內協同該第三人到乙方營業處所辦理契約承擔手續。<br>
                                                            承受本契約之第三人，與甲乙雙方辦理承擔手續完畢起，承繼甲方基於本契約一切權利義務。
                                                        </div>
                                                        <div class="cd_topic">第十七條（旅行業務之轉讓）</div>
                                                        <div>
                                                            乙方於出發前如將本契約變更轉讓予其他旅行業者，應經甲方書面同意。甲方如不同意者，得解除契約，乙方應即時將甲方已繳之全部旅遊費用退還；甲方受有損害者，並得請求賠償。<br>
                                                            甲方於出發後始發覺或被告知本契約已轉讓其他旅行業，乙方應賠償甲方全部旅遊費用百分之五之違約金；甲方受有損害者，並得請求賠償。受讓之旅行業或其履行輔助人，關於旅遊義務之履行，有故意或過失時，甲方亦得請求讓與之旅行業者負責。
                                                        </div>
                                                        <div class="cd_list"></div>
                                                        <div class="cd_topic">第十八條（旅程內容之實現及例外）</div>
                                                        <div>
                                                            旅程中之食宿、交通、旅程、觀光點及遊覽項目等，應依本契約所訂等級與內容辦理，甲方不得要求變更，但乙方同意甲方之要求而變更者，不在此限，惟其所增加之費用應由甲方負擔。除非有本契約第十三條或第二十一條之情事，乙方不得以任何名義或理由變更旅遊內容。<br>
                                                            因可歸責於乙方之事由，致未達本契約所定旅程、交通、食宿或遊覽項目等事宜時，甲方得請求乙方賠償各該差額二倍之違約金。乙方應提出前項差額計算之說明，如未提出差額計算之說明時，其違約金之計算至少為全部旅遊費用之百分之五。<br>
                                                            甲方受有損害者，另得請求損害賠償。
                                                        </div>

                                                        <div class="cd_topic">第十九條（因可歸責於旅行業之事由致行程延誤）</div>
                                                        <div>
                                                            因可歸責於乙方之事由，致延誤行程時，乙方應即徵得甲方之書面同意，繼續安排未完成之旅遊活動或安排甲方返回。<br>
                                                            乙方怠於安排時，甲方得搭乘相當等級之交通工具自行返回出發地，其所支付之費用，應由乙方負擔。<br>
                                                            第一項延誤行程期間，甲方所支出之食宿或其他必要費用，應由乙方負擔。甲方並得請求依全部旅費除以全部旅遊日數乘以延誤行程日數計算之違約金。延誤行程時數在五小時以上未滿一日者，以一日計算。<br>
                                                            依第一項約定，安排甲方返回時，另應按實計算賠償甲方未完成旅程之費用及由出發地點到第一旅遊地與最後旅遊地返回之交通費用。甲方受有損害者，並得請求賠償。
                                                        </div>
                                                        <div class="cd_topic">第二十條（旅行業棄置或留滯旅客）</div>
                                                        <div>
                                                            乙方於旅遊途中，因故意棄置或留滯甲方時，除應負擔棄置或留滯期間甲方支出之食宿及其他必要費用，按實計算退還甲方未完成旅程之費用，及由出發地至第一旅遊地與最後旅遊地返回之交通費用外，並應至少賠償依全部旅遊費用除以全部旅遊日數乘以棄置或留滯日數後相同金額五倍之違約金。<br>
                                                            乙方於旅遊途中，因重大過失有前項棄置或留滯甲方情事時，乙方除應依前項規定負擔相關費用外，並應至少賠償依前項規定計算之三倍違約金。<br>
                                                            乙方於旅遊途中，因過失有第一項棄置或留滯甲方情事時，乙方除應依前項規定負擔相關費用外，並應賠償依第一項規定計算之一倍違約金。<br>
                                                            前三項情形之棄置或留滯甲方之時間，在五小時以上未滿一日者，以一日計算；乙方並應儘速依預訂旅程安排旅遊活動，或安排甲方返回。<br>
                                                            甲方受有損害者，另得請求賠償。
                                                        </div>
                                                        <div class="cd_topic">第二十一條（旅遊途中因非可歸責於旅行業之事由致旅遊內容變更）</div>
                                                        <div>
                                                            旅遊中因不可抗力或不可歸責於乙方之事由，致無法依預定之旅程、交通、食宿或遊覽項目等履行時，為維護旅遊團體之安全及利益，乙方得變更旅程、遊覽項目或更換食宿、旅程；其因此所增加之費用，不得向甲方收取，所減少之費用，應退還甲方。
                                                        </div>
                                                        <div>
                                                            甲方不同意前項變更旅程時，得終止契約，並得請求乙方墊付費用將其送回原出發地，於到達後附加年利率<u>5</u>％利息償還乙方。
                                                        </div>
                                                        <div class="cd_topic">第二十二條（責任歸屬與協辦）</div>
                                                        <div>
                                                            旅遊期間，因不可歸責於乙方之事由，致甲方搭乘飛機、輪船、火車、捷運、纜車等大眾運輸工具所受之損害者，應由各該提供服務之業者直接對甲方負責。但乙方應盡善良管理人之注意，協助甲方處理。
                                                        </div>
                                                        <div class="cd_topic">第二十三條（出發後旅客任意終止契約）</div>
                                                        <div>
                                                            甲方於旅遊活動開始後，中途離隊退出旅遊活動時，不得要求乙方退還旅遊費用。但乙方因甲方退出旅遊活動後，應可節省或無須支付之費用，應退還甲方。<br>
                                                            前項情形，乙方並應為甲方安排脫隊後返回出發地之住宿及交通，其費用由甲方負擔。
                                                        </div>
                                                        <div>甲方於旅遊活動開始後，未能及時參加依本契約所排定之行程者，視為自願放棄其權利，不得向乙方要求退費或任何補償。
                                                        </div>
                                                        <div class="cd_topic">第二十四條（旅客終止契約後之回程安排）</div>
                                                        <div>
                                                            甲方於旅遊活動開始後，怠於配合乙方完成旅遊所需之行為致影響後續旅遊行程，而終止契約者，甲方得請求乙方墊付費用將其送回原出發地，於到達後附加利息償還之，乙方不得拒絕。<br>
                                                            前項情形，乙方因甲方退出旅遊活動後，應可節省或無須支出之費用，應退還甲方。<br>
                                                            乙方因第一項事由所受之損害，得向甲方請求賠償。
                                                        </div>
                                                        <div class="cd_topic">第二十五條（旅行業之協助處理義務）</div>
                                                        <div>甲方在旅遊中發生身體或財產上之事故時，乙方應盡善良管理人之注意為必要之協助及處理。</div>
                                                        <div>前項之事故，係因非可歸責於乙方之事由所致者，其所生之費用，由甲方負擔。</div>
                                                        <div class="cd_topic">第二十六條（旅行業應投保責任保險及履約保證保險）</div>
                                                        <div>乙方應依主管機關之規定投保責任保險及履約保證保險。責任保險投保金額：</div>
                                                        <div class="cd_list">
                                                            <li>一、■依法令規定。</li>
                                                            <li>二、□高於法令規定，金額為：</li>
                                                            （一）每一旅客意外死亡新臺幣_______________元。<br>
                                                            （二）每一旅客因意外事故所致體傷之醫療費用新臺幣_______________元。<br>
                                                            （三）國內旅遊善後處理費用新臺幣_______________元。<br>
                                                            （四）每一旅客旅遊文件遺失重置費用新臺幣_______________元。
                                                        </div>
                                                        <div>
                                                            乙方如未依前項規定投保者，於發生旅遊事故或不能履約之情形，乙方應以主管機關規定最低投保金額計算其應理賠金額之三倍作為賠償金額。<br>
                                                            乙方應於出團前，告知甲方有關投保旅行業責任保險之保險公司名稱及其連絡方式，以備甲方查詢。
                                                        </div>
                                                        <div class="cd_topic">第二十七條（購物及瑕疵損害之處理方式）</div>
                                                        <div>
                                                            甲方於旅遊活動開始後，怠於配合乙方完成旅遊所需之行為致影響後續旅遊行程，而終止契約者，甲方得請求乙方墊付費用將其送回原出發地，於到達後附加利息償還之，乙方不得拒絕。<br>
                                                            前項情形，乙方因甲方退出旅遊活動後，應可節省或無須支出之費用，應退還甲方。<br>
                                                            乙方因第一項事由所受之損害，得向甲方請求賠償。
                                                        </div>
                                                        <div class="cd_topic">第二十八條（誠信原則）</div>
                                                        <div>
                                                            甲乙雙方應以誠信原則履行本契約。乙方依旅行業管理規則之規定，委託他旅行業代為招攬時，不得以未直接收甲方繳納費用，或以非直接招攬甲方參加本旅遊，或以本契約實際上非由乙方參與簽訂為抗辯。
                                                        </div>
                                                        <div class="cd_topic">第二十九條（消費爭議處理）</div>
                                                        <div>
                                                            本契約履約過程中發生爭議時，乙方應即主動與甲方協商解決之。<br>
                                                            乙方消費爭議處理申訴（客服）電子信箱： <u>member@liontravel.com</u><br>
                                                            乙方對甲方之消費爭議申訴，應於三個營業日內專人聯繫處理，並依據消費者保護法之規定，自申訴之日起十五日內妥適處理之。<br>雙方經協商後仍無法解決爭議時，甲方得向交通部觀光局、直轄市或各縣（市）消費者保護官、直轄市或各縣（市）消費者爭議調解委員會、中華民國旅行業品質保障協會或鄉（鎮、市、區）公所調解委員會提出調解（處）申請，乙方除有正當理由外，不得拒絕出席調解（處）會。
                                                        </div>
                                                        <div class="cd_topic">第三十條（個人資料之保護）</div>
                                                        <div>
                                                            <p>
                                                                乙方因履行本契約之需要，於代辦證件、安排交通工具、住宿、餐飲、遊覽及其所附隨服務之目的內，甲方同意乙方得依法規規定蒐集、處理、傳輸及利用其個人資料。<br>
                                                                甲方：■同意。□不同意（甲方如不同意，乙方將無法提供本契約之旅遊服務）。（二者擇一勾選；未勾選者，視為不同意）
                                                            </p>
                                                            <p>
                                                                甲方簽名： _________<br>
                                                                前項甲方之個人資料乙方負有保密義務，非經甲方書面同意或依法規規定，不得將其個人資料提供予第三人。<br>
                                                                第一項旅客個人資料蒐集之特定目的消失或旅遊終了時，乙方應主動或依甲方之請求，刪除、停止處理或利用甲方個人資料。但因執行職務或業務所必須或經甲方書面同意，不在此限。<br>
                                                                乙方發現第一項甲方個人資料遭竊取、竄改、毀損、滅失或洩漏時，應即向主管機關通報，並立即查明發生原因及責任歸屬，且依實際狀況採取必要措施。<br>
                                                                前項情形，乙方應以書面、簡訊或其他適當方式通知甲方，使其可得知悉各該事實及乙方已採取之處理措施、客服電話窗口等資訊。
                                                            </p>
                                                        </div>
                                                        <div class="cd_topic">第三十一條（合意管轄法院之約定）</div>
                                                        <div>
                                                            甲、乙雙方就本契約有關之爭議，以中華民國之法律為準據法。<br>
                                                            因本契約發生訴訟時，甲乙雙方同意以<u> 台灣士林
                                                            </u>地方法院為第一審管轄法院，但不得排除消費者保護法第四十七條或民事訴訟法第四百三十六條之九規定之小額訴訟管轄法院之適用。
                                                        </div>

                                                        <div class="cd_topic">第三十二條（其他協議事項）</div>
                                                        <div>甲乙雙方同意遵守下列各項：</div>
                                                        <div class="cd_list">
                                                            <li>一、甲方□同意□不同意乙方將其姓名提供給其他同團旅客。</li>
                                                            <li>二、本契約之旅遊費用項目除個人機票(FIT)外，均以團體票或團體人數方式計價，遇個別身分優惠情形(如半票、不占床等)無價差，恕不另退費。
                                                            </li>
                                                            <li>三、甲方旅客如未滿15歲或70歲以上，依保險公司規定每一旅客意外死亡、殘廢最高投保金額為新臺幣200萬元，意外醫療保額為新台幣20萬(實支實付)。
                                                            </li>
                                                            <li>四、旅遊費用不包含 </li>
                                                            <div class="cd_notice_ml">護照費用</div>
                                                            <div class="cd_notice_ml">簽證費用</div>
                                                            <div class="cd_notice_ml">台灣機場稅</div>
                                                            <div class="cd_notice_ml">國外機場稅</div>
                                                            <div class="cd_notice_ml">中正/小港機場接送費</div>
                                                            <div class="cd_notice_ml">燃油費</div>
                                                            <div class="cd_notice_ml">服務人員小費</div>
                                                            <div class="cd_notice_ml cd_notice_mb">機場(碼頭)與旅館間接送費</div>
                                                        </div>
                                                        <div class="cd_note">
                                                            前項協議事項，如有變更本契約其他條款之規定，除經交通部觀光局核准外，其約定無效，但有利於甲方者，不在此限。</div>
                                                    </div>
                                                    <div class="cd_gpbx bottom">
                                                        <div class="title">訂約人</div>
                                                        <div class="customer">
                                                            <div class="item">
                                                                <div>甲方：</div>
                                                            </div>
                                                            <div class="item">
                                                                <div>住（居）所地址：</div>
                                                            </div>
                                                            <div class="item">
                                                                <div>身份證字號(統一編號)：</div>
                                                            </div>
                                                            <div class="item">
                                                                <div>電話或傳真：</div>
                                                            </div>
                                                        </div>
                                                        <div class="company">
                                                            <div class="item">
                                                                <div class="title">乙方(公司名稱)：</div>
                                                                <div>雄獅旅行社股份有限公司</div>
                                                            </div>
                                                            <div class="item">
                                                                <div class="title">註冊編號：</div>
                                                                <div>交觀綜字第２０１６號 </div>
                                                            </div>
                                                            <div class="item">
                                                                <div class="title">負責人：</div>
                                                                <div>王文傑 </div>
                                                            </div>
                                                            <div class="item">
                                                                <div class="title">住址：</div>
                                                                <div>台北市石潭路151號9樓 </div>
                                                            </div>
                                                            <div class="item">
                                                                <div class="title">電話或傳真：</div>
                                                                <div>(02)8793-9000</div>
                                                            </div>
                                                            <div class="item">
                                                                <div class="title">團號：</div>
                                                                <div>21TN210RT1-T </div>
                                                            </div>
                                                        </div>
                                                        <div class="company-alt">
                                                            <div class="item">
                                                                <div class="title">乙方委託之旅行業副署：</div>
                                                                <div>（本契約如係綜合或甲種旅行業自行組團而與旅客簽約者，下列各項免填）</div>
                                                            </div>
                                                            <div class="item">
                                                                <div>公司名稱：</div>
                                                            </div>
                                                            <div class="item">
                                                                <div>註冊編號：</div>
                                                            </div>
                                                            <div class="item">
                                                                <div>負責人：</div>
                                                            </div>
                                                            <div class="item">
                                                                <div>住址：</div>
                                                            </div>
                                                            <div class="item">
                                                                <div>
                                                                    電話或<span class="title">傳真</span>：
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="date">
                                                            <div class="item">
                                                                <div class="title">簽約時間：</div>
                                                                <div class="note">
                                                                    <span>中華民國　　　　　年　　　　月　　　　日
                                                                    </span>(如未記載，以首次交付金額之日為簽約日期)
                                                                </div>
                                                            </div>
                                                            <div class="item place">
                                                                <div class="title">簽約地點：</div>
                                                                <div class="note">（如未記載，以甲方住（居）所地為簽約地點）</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div>
                                    <section class="section-preview" style="text-align: center;padding: 50px;">

                                        <div class="form-check" style="position: relative;">
                                            <input type="checkbox" style="position: absolute;"
                                                class="form-check-input filled-in" id="new32">
                                            <label class="form-check-label small text-uppercase card-link-secondary"
                                                for="new32" style="color: red;">我已經閱讀了「報名須知」與「旅遊契約書」，並同意其內容。</label>
                                        </div>

                                    </section>
                                </div>

                                <div style="display:none;" id="sendBtnTb">
                                    <div class="row">
                                        <div class="col-xl-6">
                                            <a href="<c:url value='/product_Index'/>">
                                                <button type="button" class="btn btn-default" id="goback">
                                                    <i class="fas fa-cart-plus"></i> 繼續購物
                                                </button>
                                            </a>
                                        </div>
                                        <div class="col-xl-6" style="text-align: right;">
                                            <button type="button" class="btn btn-success" id="sendShoppingcart" style="display: none;    margin-right: 10px;
                                            margin-bottom: 10px;">
                                                結帳 <i class="fas fa-caret-right"></i></span>
                                            </button>
                                        </div>
                                    </div>

                                </div>






                            </div>
                        </div>
                    </div>
                    <input type="button" value="測試用輸入鍵" id="inputUserInfo" />
                </div>

                <script src="js/bootstrap.bundle.min.js"> </script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
                    crossorigin="anonymous"></script>
                <script src="js/templatemo.js"></script>
                <script src="js/custom.js"></script>
            </body>

            </html>