<%@ page import="Demo.MinPath"%>
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
%>
<html>
    <head>
        <title>Food Ordering System - Menu</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="w3.css" type="text/css">
        <link rel="stylesheet" href="style.css" type="text/css">

        <style>

            .active-menu-link {
                color: black !important;
                padding:12px;
                background-color:transparent;
                font-size:20px;
                border: 2px solid black;
                border-radius:10px;
            }
            #wish{
                padding:10px;
                font-size:30px;
            }
            input[type="checkbox"] {
                width: 30px;
                height: 30px;
            }
        </style>

        <script>
            var b = 0;
            function update_value(chk_bx) {
                if (chk_bx.checked)
                {
                    var a = "checked";
                    b += 1;
                } else {
                    var a = "not checked";
                    if (b > 0) {
                        b -= 1;
                    } else if (b == 0) {
                        b = 0;
                    }
                }
                if (b == 0)
                {
                    document.getElementById('wish').innerHTML = '<img src="Images/shopping-cart.png" height=40 width=40>&nbsp&nbsp0';
                } else {
                    document.getElementById('wish').innerHTML = '<img src="Images/shopping-cart.png" height=40 width=40>&nbsp&nbsp' + b + '';
                }
            }

            function toggleFunction() {
            }
        </script>
    </head>
    <body class="w3-light-grey">
        <jsp:useBean id="test" class="Demo.MinPath" />

        <div id="header" class="w3-white w3-border-bottom">
            <div class="w3-content w3-bar" style="max-width:1200px">

                <a href="success.jsp" class="w3-bar-item w3-xxlarge w3-text-teal" style="padding-top:20px; padding-bottom:20px; text-decoration:none;">Food Ordering System</a>

                <div class="w3-right w3-padding-24 w3-bar-item w3-hide-small">
                    <span id="wish" class="w3-tag w3-teal w3-round-large"><img src="Images/shopping-cart.png" height=30 width=30>&nbsp; 0</span>
                </div>

                <div class="w3-right w3-hide-small">
                    <a href="#" class="w3-bar-item w3-button w3-large active-menu-link">Menu</a>
                    <a href="#" class="w3-bar-item w3-button w3-large w3-hover-text-teal">Locations</a>
                    <a href="#" class="w3-bar-item w3-button w3-large w3-hover-text-teal">Promotions</a>
                    <a href="#" class="w3-bar-item w3-button w3-large w3-hover-text-teal">About us</a>
                    <a href="logout.jsp" class="w3-bar-item w3-button w3-large w3-text-red w3-hover-text-dark-grey">Log out <i>(<%out.print(session.getAttribute("userid"));%>)</i></a>
                </div>

                <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="toggleFunction()">&#9776;</a>

            </div>
        </div>

        <form method="post" action="order.jsp">

            <div class="w3-content w3-container w3-padding-32" style="max-width:1200px">
                <h2 class="w3-center w3-text-teal w3-margin-bottom">Our Signature Burgers</h2>

                <div class="w3-row-padding w3-center w3-margin-top">

                    <div class="w3-quarter w3-container w3-margin-bottom">
                        <div class="w3-card-4 w3-white">
                            <img src="Images/items/Classic Beef Burger.png" style="width:100%; height:240px; object-fit: cover;" alt="Classic Beef Burger">
                            <div class="w3-container w3-padding-16">
                                <h4 class="w3-text-teal"><b>Cheeseburger</b></h4>
                                <p>HKD 16.50</p>
                                <input class="w3-check w3-teal" type="checkbox" name="chk1" value="1" onchange="update_value(this);">
                                <label class="w3-validate">Select</label>
                            </div>
                        </div>
                    </div>

                    <div class="w3-quarter w3-container w3-margin-bottom">
                        <div class="w3-card-4 w3-white">
                            <img src="Images/items/Signature Chicken Burger.png" style="width:100%; height:240px; object-fit: cover;" alt="Signature Chicken Burger">
                            <div class="w3-container w3-padding-16">
                                <h4 class="w3-text-teal"><b>Chicken Filet Burger</b></h4>
                                <p>HKD 15.50</p>
                                <input class="w3-check w3-teal" type="checkbox" name="chk1" value="2" onchange="update_value(this);">
                                <label class="w3-validate">Select</label>
                            </div>
                        </div>
                    </div>

                    <div class="w3-quarter w3-container w3-margin-bottom">
                        <div class="w3-card-4 w3-white">
                            <img src="Images/items/Spicy Fish Fillet Burger.png" style="width:100%; height:240px; object-fit: cover;" alt="Spicy Fish Fillet Burger">
                            <div class="w3-container w3-padding-16">
                                <h4 class="w3-text-teal"><b>Fish Fillet Burger</b></h4>
                                <p>HKD 14.00</p>
                                <input class="w3-check w3-teal" type="checkbox" name="chk1" value="3" onchange="update_value(this);">
                                <label class="w3-validate">Select</label>
                            </div>
                        </div>
                    </div>

                    <div class="w3-quarter w3-container w3-margin-bottom">
                        <div class="w3-card-4 w3-white">
                            <img src="Images/items/Double Cheeseburger.png" style="width:100%; height:240px; object-fit: cover;" alt="Double Cheeseburger">
                            <div class="w3-container w3-padding-16">
                                <h4 class="w3-text-teal"><b>Double Cheeseburger</b></h4>
                                <p>HKD 23.50</p>
                                <input class="w3-check w3-teal" type="checkbox" name="chk1" value="4" onchange="update_value(this);">
                                <label class="w3-validate">Select</label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="w3-row-padding w3-center w3-margin-top">
                    <div class="w3-quarter w3-container w3-margin-bottom">
                        <div class="w3-card-4 w3-white">
                            <img src="Images/items/McPork Burger.png" style="width:100%; height:240px; object-fit: cover;" alt="McPork Burger">
                            <div class="w3-container w3-padding-16">
                                <h4 class="w3-text-teal"><b>Sausage McMuffin with Egg Burger</b></h4>
                                <p>HKD 22.50</p>
                                <input class="w3-check w3-teal" type="checkbox" name="chk1" value="5" onchange="update_value(this);">
                                <label class="w3-validate">Select</label>
                            </div>
                        </div>
                    </div>

                    <div class="w3-quarter w3-container w3-margin-bottom">
                        <div class="w3-card-4 w3-white">
                            <img src="Images/items/Big Mac Style Burger.png" style="width:100%; height:240px; object-fit: cover;" alt="Big Mac Style Burger">
                            <div class="w3-container w3-padding-16">
                                <h4 class="w3-text-teal"><b>Big Mac Burger</b></h4>
                                <p>HKD 25.00</p>
                                <input class="w3-check w3-teal" type="checkbox" name="chk1" value="6" onchange="update_value(this);">
                                <label class="w3-validate">Select</label>
                            </div>
                        </div>
                    </div>

                    <div class="w3-quarter w3-container w3-margin-bottom">
                        <div class="w3-card-4 w3-white">
                            <img src="Images/items/Premium Truffle Burger.png" style="width:100%; height:240px; object-fit: cover;" alt="Premium Truffle Burger">
                            <div class="w3-container w3-padding-16">
                                <h4 class="w3-text-teal"><b>Cheesy Champignon Angus Burger</b></h4>
                                <p>HKD 33.00</p>
                                <input class="w3-check w3-teal" type="checkbox" name="chk1" value="7" onchange="update_value(this);">
                                <label class="w3-validate">Select</label>
                            </div>
                        </div>
                    </div>



                <div class="w3-row-padding w3-center w3-margin-top">
                    <div class="w3-quarter w3-container w3-margin-bottom">
                        <div class="w3-card-4 w3-white">
                            <img src="Images/items/Small Fries & Soft Drink Set.png" style="width:100%; height:240px; object-fit: cover;" alt="Small Fries & Soft Drink Set">
                            <div class="w3-container w3-padding-16">
                                <h4 class="w3-text-teal"><b>Small Fries & Soft Drink Set</b></h4>
                                <p>HKD 20.00</p>
                                <input class="w3-check w3-teal" type="checkbox" name="chk1" value="8" onchange="update_value(this);">
                                <label class="w3-validate">Select</label>
                            </div>
                        </div>
                    </div>
                    
                    <div class="w3-quarter w3-container w3-margin-bottom"></div>
                    <div class="w3-quarter w3-container w3-margin-bottom"></div>
                </div>

                <div class="w3-content w3-margin-top w3-padding-24" style="max-width:400px;">
                    <input type="submit" value="Add to Cart" class="w3-button w3-teal w3-hover-green w3-xlarge w3-round-large w3-block" />
                </div>
            </div>

        </form>

        <footer class="w3-container w3-center w3-padding-32 w3-light-grey w3-margin-top">
            <p>Food Ordering System</p>
        </footer>

    </body>
</html>
<%
    }
%>
