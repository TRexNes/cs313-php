<?php
session_start();
$products = array("Drag1" => 19.99, "Drag2" => 10.99, "Drag3" => 12.99);
if($_GET["remove"])
{
  if (isset($_SESSION["in_cart"][$_GET["remove"]]))
  {
    unset($_SESSION["in_cart"][$_GET["remove"]]);
    $_SESSION["total"]--;
  }
}
if($_GET["add"] && $_GET["item"])
{
  $_SESSION["in_cart"][$_GET["item"]] = $_GET["add"];
}
$cart = array();
$_SESSION["total"] = 0;
$_SESSION["total_cost"] = 0;
foreach ($_SESSION["in_cart"] as $item => $qty) 
{
  $cart[$item] = $qty;
  $_SESSION["total"] += $qty;
  $_SESSION["total_cost"] += $products[$item] * $qty;
}
?>

<!DOCTYPE html>
<head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://use.fontawesome.com/22207e5600.js"></script>
  <link rel="stylesheet" type="text/css" href="style.css">
  <link rel="stylesheet" type="text/css" href="store.css">
</head>
<html>
  <body>
    <div id="header">
      <h1>Cart</h1>

      <ul>
		<li><a href="../homePage313.html">Home</a></li>
		<li><a href="../index.html">Assignments</a></li>
		<li><a id="current-page" href="">Current Week03 - Store</a></li>
	  </ul>
    </div>

    <div id="bodyCart">
      <?php
          if (count($cart) > 0)
          {
            echo "<table>";
            echo "<thead>";
            echo "<tr>";
            echo "  <td></td>";
            echo "  <td>Item</td>";
            echo "  <td>Price</td>";
            echo "  <td>Qty</td>";
            echo "  <td></td>";
            echo "</tr>";
            echo "</thead>";
            foreach ($cart as $item => $qty)
            {
              echo "<tr>";
              echo "<td><img height='50px' src='../img/".$item.".jpg'></td>";
              echo "<td>".$item."</td>";
              echo "<td>".$products[$item]."</td>";
              echo "<td>";
              echo "<input type='number' value=".$qty." name='qty' min='1' max='5' onchange=\"self.location='cart.php?item=".$item."&add='+this.value\">";
              echo "</td>";
              echo "<td><a id='remove' href='?remove=".$item."'>Remove</td>";
              echo "</tr>";
            }
            echo "<tr>";
            echo "<td>Total</td>";
            echo "<td></td>";
            echo "<td>".$_SESSION["total_cost"]."-</td>";
            echo "<td>".$_SESSION["total"]."</td>";
            echo "<td><a id='confirm' href='checkout.php'>Checkout</a><td>";
            echo "</tr>";
            echo "</table>";
          }
          else
          {
            echo "There is nothing in your cart";
          }
      ?>

    </div>
  </body>
</html>