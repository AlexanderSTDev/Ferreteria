<?php 
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['login'])==0)
    {   
header('location:login.php');
}
else{

?>

<!DOCTYPE html>
<html lang="en">
	<head>
		<!-- Meta -->
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<meta name="description" content="">
		<meta name="author" content="">
	    <meta name="keywords" content="MediaCenter, Template, eCommerce">
	    <meta name="robots" content="all">

	    <title>Historial de pedidos</title>
	    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
	    <link rel="stylesheet" href="assets/css/main.css">
	    <link rel="stylesheet" href="assets/css/green.css">
	    <link rel="stylesheet" href="assets/css/owl.carousel.css">
		<link rel="stylesheet" href="assets/css/owl.transitions.css">
		<!--<link rel="stylesheet" href="assets/css/owl.theme.css">-->
		<link href="assets/css/lightbox.css" rel="stylesheet">
		<link rel="stylesheet" href="assets/css/animate.min.css">
		<link rel="stylesheet" href="assets/css/rateit.css">
		<link rel="stylesheet" href="assets/css/bootstrap-select.min.css">

		<!-- Demo Purpose Only. Should be removed in production -->
		<link rel="stylesheet" href="assets/css/config.css">

		<link href="assets/css/green.css" rel="alternate stylesheet" title="Green color">
		<link href="assets/css/blue.css" rel="alternate stylesheet" title="Blue color">
		<link href="assets/css/red.css" rel="alternate stylesheet" title="Red color">
		<link href="assets/css/orange.css" rel="alternate stylesheet" title="Orange color">
		<link href="assets/css/dark-green.css" rel="alternate stylesheet" title="Darkgreen color">
		<link rel="stylesheet" href="assets/css/font-awesome.min.css">
		<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
		<link rel="shortcut icon" href="assets/images/favicon.ico">
	<script language="javascript" type="text/javascript">
var popUpWin=0;
function popUpWindow(URLStr, left, top, width, height)
{
 if(popUpWin)
{
if(!popUpWin.closed) popUpWin.close();
}
popUpWin = open(URLStr,'popUpWin', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=yes,width='+600+',height='+600+',left='+left+', top='+top+',screenX='+left+',screenY='+top+'');
}

</script>

	</head>
    <body class="cnt-home">
	
		
	
		<!-- ============================================== HEADER ============================================== -->
<header class="header-style-1">
<?php include('includes/top-header.php');?>
<?php include('includes/main-header.php');?>
<?php include('includes/menu-bar.php');?>
</header>
<!-- ============================================== HEADER : END ============================================== -->
<div class="breadcrumb">
	<div class="container">
		<div class="breadcrumb-inner">
			<ul class="list-inline list-unstyled">
				<li><a href="#">Home</a></li>
				<li class='active'>Historial de pedidos</li>
			</ul>
		</div><!-- /.breadcrumb-inner -->
	</div><!-- /.container -->
</div><!-- /.breadcrumb -->

<div class="main-header">
		<div class="container">
			<div class="row">
				<div class="">
	
</div>
<div class="col-xs-12 col-sm-12 col-md-6 top-search-holder">
<div class="search-area">
    <form name="search" method="post" action="">
        <div class="control-group">
			<div class="form-input">
				
				<input class="search-field" placeholder="Busca aquí tu pedido" name="product" required="required" />
				<input class="search-field" type="date" name="search_date" placeholder="Fecha de inicio" />
				<!-- <input class="search-field" type="date" name="end_date" placeholder="Fecha de fin" /> -->
				<button class="search-button" type="submit" name="search"></button>    
			</div>
        </div>
    </form>
</div><!-- /.search-area -->
<label class="info-title" for="guia" style="font-size: 13px; color: rgb(255,0,0); margin-top: 10px;">Asegurese de ingresar el nombre con la fecha.  *</label>

<div class="body-content outer-top-xs">
	<div class="container">
		<div class="row inner-bottom-sm">
			<div class="shopping-cart">
				<div class="col-md-12 col-sm-12 shopping-cart-table ">
	<div class="table-responsive">
<form name="cart" method="post">	

		<table class="table table-bordered">
			<thead>
				<tr>
					<th class="cart-romove item">#</th>
					<th class="cart-description item">Imagen</th>
					<th class="cart-product-name item">Nombre del producto</th>
			
					<th class="cart-qty item">Cantidad</th>
					<th class="cart-sub-total item">Precio por unidad</th>
					<th class="cart-sub-total item">Costo de envío</th>
					<th class="cart-total item">Total General</th>
					<th class="cart-total item">Método de pago</th>
					<th class="cart-description item">Fecha de orden</th>
					<th class="cart-total last-item">Acción</th>
				</tr>
			</thead><!-- /thead -->
			
			<tbody>

			<?php
                                    // Verificar si se realizó una búsqueda
                                    if (isset($_POST['search'])) {
										$search = mysqli_real_escape_string($con, $_POST['product']);
										$search_date = mysqli_real_escape_string($con, $_POST['search_date']);
									
										$sql = "SELECT products.productImage1 as pimg1, products.productName as pname, products.id as proid, orders.productId as opid, orders.quantity as qty, products.productPrice as pprice, products.shippingCharge as shippingcharge, orders.paymentMethod as paym, orders.orderDate as odate, orders.id as orderid FROM orders JOIN products ON orders.productId = products.id WHERE orders.userId = '" . $_SESSION['id'] . "' AND orders.paymentMethod IS NOT NULL";
									
										// Agregar condiciones para filtrar por nombre de producto
										if (!empty($search)) {
											$sql .= " AND products.productName LIKE '%$search%'";
										}
									
										// Agregar condiciones para filtrar por fecha
										if (!empty($search_date)) {
											$sql .= " AND DATE(orders.orderDate) = '$search_date'";
										}
									
										$query = mysqli_query($con, $sql);
									} else {
										// Consulta original sin filtro de búsqueda
										$query = mysqli_query($con, "SELECT products.productImage1 as pimg1, products.productName as pname, products.id as proid, orders.productId as opid, orders.quantity as qty, products.productPrice as pprice, products.shippingCharge as shippingcharge, orders.paymentMethod as paym, orders.orderDate as odate, orders.id as orderid FROM orders JOIN products ON orders.productId = products.id WHERE orders.userId = '" . $_SESSION['id'] . "' AND orders.paymentMethod IS NOT NULL");
									}

                                    $cnt = 1;
                                    while ($row = mysqli_fetch_array($query)) {
                                    ?>
				<tr>
					<td><?php echo $cnt;?></td>
					<td class="cart-image">
						<a class="entry-thumbnail" href="detail.html">
						    <img src="admin/productimages/<?php echo $row['proid'];?>/<?php echo $row['pimg1'];?>" alt="" width="84" height="146">
						</a>
					</td>
					<td class="cart-product-name-info">
						<h4 class='cart-product-description'><a href="product-details.php?pid=<?php echo $row['opid'];?>">
						<?php echo $row['pname'];?></a></h4>
						
						
					</td>
					<td class="cart-product-quantity">
						<?php echo $qty=$row['qty']; ?>   
		            </td>
					<td class="cart-product-sub-total"><?php echo $price=$row['pprice']; ?>  </td>
					<td class="cart-product-sub-total"><?php echo $shippcharge=$row['shippingcharge']; ?>  </td>
					<td class="cart-product-grand-total"><?php echo (($qty*$price)+$shippcharge);?></td>
					<td class="cart-product-sub-total"><?php echo $row['paym']; ?>  </td>
					<td class="cart-product-sub-total"><?php echo $row['odate']; ?>  </td>
					
					<td>
 <a href="javascript:void(0);" onClick="popUpWindow('track-order.php?oid=<?php echo htmlentities($row['orderid']);?>');" title="Track order">
					Seguir pedido</td>
				</tr>
<?php $cnt=$cnt+1;} ?>
				
			</tbody><!-- /tbody -->
		</table><!-- /table -->
		
	</div>
</div>

		</div><!-- /.shopping-cart -->
		</div> <!-- /.row -->
		</form>
		<!-- ============================================== BRANDS CAROUSEL ============================================== -->
<?php echo include('includes/brands-slider.php');?>
<!-- ============================================== BRANDS CAROUSEL : END ============================================== -->	</div><!-- /.container -->
</div><!-- /.body-content -->
<?php include('includes/footer.php');?>

	<script src="assets/js/jquery-1.11.1.min.js"></script>
	
	<script src="assets/js/bootstrap.min.js"></script>
	
	<script src="assets/js/bootstrap-hover-dropdown.min.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>
	
	<script src="assets/js/echo.min.js"></script>
	<script src="assets/js/jquery.easing-1.3.min.js"></script>
	<script src="assets/js/bootstrap-slider.min.js"></script>
    <script src="assets/js/jquery.rateit.min.js"></script>
    <script type="text/javascript" src="assets/js/lightbox.min.js"></script>
    <script src="assets/js/bootstrap-select.min.js"></script>
    <script src="assets/js/wow.min.js"></script>
	<script src="assets/js/scripts.js"></script>

	<!-- For demo purposes – can be removed on production -->
	
	<script src="switchstylesheet/switchstylesheet.js"></script>
	
	<script>
		$(document).ready(function(){ 
			$(".changecolor").switchstylesheet( { seperator:"color"} );
			$('.show-theme-options').click(function(){
				$(this).parent().toggleClass('open');
				return false;
			});
		});

		$(window).bind("load", function() {
		   $('.show-theme-options').delay(2000).trigger('click');
		});
	</script>
	<!-- For demo purposes – can be removed on production : End -->
</body>
</html>
<?php } ?>