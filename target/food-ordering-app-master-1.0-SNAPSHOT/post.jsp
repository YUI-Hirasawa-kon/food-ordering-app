<%@page import="Demo.MinPath"%>
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
    // 获取订单详情
    String address = request.getParameter("address");
    String payment = request.getParameter("payment");
    String notes = request.getParameter("notes"); // 备注信息，仅用于显示/日志

    // 从 Session 获取订单项目ID数组
    String[] items = (String[])session.getAttribute("selected_items_ids");

    // 确保 items 不为空，否则重定向
    if (items == null || items.length == 0) {
        response.sendRedirect("success.jsp");
        return;
    }

    // 初始化变量和格式化工具
    DecimalFormat df = new DecimalFormat("#.00");
    double total = 0.0;
%>
<html>
    <head>
        <title>Food Ordering System - Order Success</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="w3.css" type="text/css">
    </head>
    <body class="w3-light-grey">
        <jsp:useBean id="test" class="Demo.MinPath" />

        <div id="header" class="w3-white w3-border-bottom">
            <div class="w3-content w3-bar" style="max-width:1200px">
                <a href="success.jsp" class="w3-bar-item w3-xxlarge w3-text-teal" style="padding-top:20px; padding-bottom:20px; text-decoration:none;">Food Ordering System</a>
                <div class="w3-right w3-hide-small w3-padding-small">
                    <a href="logout.jsp" class="w3-bar-item w3-button w3-large w3-text-red w3-hover-text-dark-grey">Log out <i>(<%out.print(session.getAttribute("userid"));%>)</i></a>
                </div>
            </div>
        </div>

        <div class="w3-content w3-container w3-padding-64" style="max-width:800px">
            <div class="w3-card-4 w3-white w3-padding-32 w3-center">
                <h1 class="w3-text-teal w3-xxlarge">Order Placed Successfully!</h1>
                <p class="w3-large w3-text-grey">Thank you for ordering with Food Ordering System.</p>

                <%
                    String uid = session.getAttribute("userid").toString();

                    for (String itemId : items) {
                        int id = Integer.parseInt(itemId);
                        double itemPrice = 0.0;

                        switch (id) {
                            case 1: itemPrice = 38.00; break;
                            case 2: itemPrice = 45.00; break;
                            case 3: itemPrice = 52.00; break;
                            case 4: itemPrice = 40.00; break;
                            case 5: itemPrice = 42.00; break;
                            case 6: itemPrice = 48.00; break;
                            case 7: itemPrice = 60.00; break;
                            case 8: itemPrice = 35.00; break;
                            default: continue;
                        }

                        total += itemPrice;

                        test.insert_history(uid, itemId);
                    }

                    session.removeAttribute("selected_items_ids");
                %>

                <div class="w3-left-align w3-margin-top w3-padding w3-border-top w3-light-grey">
                    <h3 class="w3-text-teal">Order Details</h3>
                    <p class="w3-large">Total Amount: <b class="w3-text-red">HKD <%= df.format(total) %></b></p>
                    <hr>
                    <p><b>Delivery Address:</b> <%= address %></p>
                    <p><b>Payment Method:</b> <%= payment %></p>
                    <p><b>Notes:</b> <%= (notes != null && !notes.trim().isEmpty()) ? notes : "N/A" %></p>
                </div>

                <div class="w3-margin-top">
                    <a href="success.jsp" class="w3-button w3-teal w3-hover-green w3-large w3-round-large">Back to Menu</a>
                    <a href="logout.jsp" class="w3-button w3-red w3-hover-dark-grey w3-large w3-round-large">Log Out</a>
                </div>
            </div>
        </div>

        <footer class="w3-container w3-center w3-padding-32 w3-light-grey w3-margin-top">
            <p>Food Ordering System by Gemini &copy; Hong Kong</p>
        </footer>
    </body>
</html>
<%
    }
%>
