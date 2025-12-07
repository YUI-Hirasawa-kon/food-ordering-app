<%@page import="Demo.MinPath"%>
<%@page import="Demo.MenuItems"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%
    // Session Expired 页面 - 保持不变
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Food Ordering System - Session Expired</title>
        <link rel="stylesheet" href="w3.css" type="text/css">
    </head>
    <body class="w3-light-grey w3-display-container" style="height:100vh">
        <div class="w3-display-middle w3-center w3-card-4 w3-white w3-animate-top w3-padding-64" style="width:100%; max-width:400px;">
            <h2 class="w3-text-red"><b>Session Expired</b></h2>
            <p class="w3-large">Please sign in again to continue ordering from the Food Ordering System.</p>
            <br>
            <a href="index.jsp" class="w3-button w3-teal w3-round">Sign In</a>
        </div>
    </body>
</html>
<%} else {
    // 实例化 MinPath Bean (尽管我们不再调用其 addItemToOrder 方法)
    // jsp:useBean id="test" class="Demo.MinPath" 在下面 HTML 部分定义
    DecimalFormat df = new DecimalFormat("#.00");
    double total = 0.0;

    // 获取用户在 success.jsp 中选择的菜单项ID
    String[] items = request.getParameterValues("chk1");

    // 如果没有选择任何项目，重定向回菜单页
    if (items == null || items.length == 0) {
        response.sendRedirect("success.jsp");
        return;
    }

    // 修复 1: 存储 items 数组到 Session，供 post.jsp 使用。
    // 这取代了报错的 path.addItemToOrder(session, itemId) 方法。
    session.setAttribute("selected_items_ids", items);

    // 修复 2: 改用 String[] 数组存储项目名称和价格，以避免 MenuItems 的方法调用错误
    ArrayList<String[]> selectedItems = new ArrayList<>();

    // 假设菜单映射
    // 1: Classic Beef Burger, HKD 38.00
    // ...
    // 9: Small Fries & Soft Drink Set, HKD 35.00

    for (String itemId : items) {
        int id = Integer.parseInt(itemId);
        String itemName = "";
        double itemPrice = 0.0;

        // --- 菜单本土化和价格更新 ---
        switch (id) {
            case 1: itemName = "Classic Beef Burger"; itemPrice = 38.00; break;
            case 2: itemName = "Signature Chicken Burger"; itemPrice = 45.00; break;
            case 3: itemName = "Spicy Fish Fillet Burger"; itemPrice = 52.00; break;
            case 4: itemName = "Double Cheeseburger"; itemPrice = 40.00; break;
            case 5: itemName = "McPork Burger"; itemPrice = 42.00; break;
            case 6: itemName = "Big Mac Style Burger"; itemPrice = 48.00; break;
            case 7: itemName = "Premium Truffle Burger"; itemPrice = 60.00; break;
            case 8: itemName = "Small Fries & Soft Drink Set"; itemPrice = 35.00; break;
            default: continue;
        }

        // 累加总价
        total += itemPrice;

        // 修复 3: 不再使用 MenuItems 对象，而是使用 String[] 存储数据
        // index 0: Item Name, index 1: Formatted Price
        String[] itemData = {itemName, df.format(itemPrice)};
        selectedItems.add(itemData);
    }
%>
<html>
    <head>
        <title>Food Ordering System - Your Cart</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="w3.css" type="text/css">
        <style>
            /* 保持 active 导航样式 */
            .active-menu-link {
                color: black !important;
                padding:12px;
                background-color:transparent;
                font-size:20px;
                border: 2px solid black;
                border-radius:10px;
            }
        </style>
        <script>
            function toggleFunction() {
                // 用于响应式菜单，目前保持为空
            }
        </script>
    </head>
    <body class="w3-light-grey">
        <jsp:useBean id="test" class="Demo.MinPath" />

        <div id="header" class="w3-white w3-border-bottom">
            <div class="w3-content w3-bar" style="max-width:1200px">
                <a href="success.jsp" class="w3-bar-item w3-xxlarge w3-text-teal" style="padding-top:20px; padding-bottom:20px; text-decoration:none;">Food Ordering System</a>

                <div class="w3-right w3-hide-small w3-padding-small">
                    <a href="success.jsp" class="w3-bar-item w3-button w3-large w3-hover-text-teal">Menu</a>
                    <a href="#" class="w3-bar-item w3-button w3-large w3-hover-text-teal">Locations</a>
                    <a href="#" class="w3-bar-item w3-button w3-large w3-hover-text-teal">Promotions</a>
                    <a href="#" class="w3-bar-item w3-button w3-large w3-hover-text-teal">About us</a>
                    <a href="logout.jsp" class="w3-bar-item w3-button w3-large w3-text-red w3-hover-text-dark-grey">Log out <i>(<%out.print(session.getAttribute("userid"));%>)</i></a>
                </div>
            </div>
        </div>

        <div class="w3-content w3-container w3-padding-32" style="max-width:800px">
            <h2 class="w3-center w3-text-teal w3-margin-bottom">Your Order Summary</h2>

            <form method="post" action="post.jsp">
                <table class="w3-table-all w3-card-4 w3-hoverable">
                    <tr class="w3-teal">
                        <th>#</th>
                        <th>Item</th>
                        <th class="w3-right-align">Price (HKD)</th> </tr>

                    <%
                    int count = 1;
                    // 修复 4: 更改循环变量类型并使用数组索引获取数据
                    for (String[] itemData : selectedItems) {
                    %>
                    <tr>
                        <td><%= count++ %></td>
                        <td><%= itemData[0] %></td> <td class="w3-right-align"><%= itemData[1] %></td> </tr>
                    <% } %>

                    <tr class="w3-light-grey w3-large">
                        <td colspan="2"><b>Total</b></td>
                        <td class="w3-right-align w3-text-red"><b>HKD <%= df.format(total) %></b></td> </tr>
                </table>

                <h3 class="w3-text-teal w3-margin-top">Delivery Details</h3>
                <div class="w3-white w3-card-4 w3-padding-large w3-margin-bottom">
                    <p>
                        <label class="w3-text-grey">Delivery Address</label>
                        <input class="w3-input w3-border" type="text" name="address" value="" placeholder="e.g. Flat A, 12/F, Tower 1, Hong Kong" required/>
                    </p>
                    <p>
                        <label class="w3-text-grey">Payment Method</label>
                        <select class="w3-select w3-border" name="payment">
                            <option value="Cash">Cash on Delivery (HKD)</option>
                            <option value="CreditCard">Credit Card (Online Payment)</option>
                            <option value="AliPay">AliPay HK</option>
                            <option value="WeChatPay">WeChat Pay HK</option>
                        </select>
                    </p>
                    <p>
                        <label class="w3-text-grey">Additional Notes</label>
                        <textarea class="w3-input w3-border" name="notes" rows="3" placeholder="e.g. Extra ketchup, No pickles, Leave at front door..."></textarea>
                    </p>
                </div>

                <div class="w3-margin-top w3-padding-16">
                    <input type="submit" value="Confirm Order & Proceed to Payment" class="w3-button w3-teal w3-hover-green w3-xlarge w3-round-large w3-block" />
                </div>
            </form>

            <p class="w3-center w3-margin-top">
                <a href="success.jsp" class="w3-text-teal w3-hover-text-blue">&lt;&lt; Continue Shopping / Modify Order</a>
            </p>
        </div>

        <footer class="w3-container w3-center w3-padding-32 w3-light-grey w3-margin-top">
            <p>Food Ordering System</p>
        </footer>

    </body>
</html>
<%
    }
%>
