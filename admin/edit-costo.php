
<?php
session_start();
include('include/config.php');
if(strlen($_SESSION['alogin'])==0)
	{	
header('location:index.php');
}
else{
date_default_timezone_set('America/Guayaquil');// change according timezone
$currentTime = date( 'd-m-Y h:i:s A', time () );


if(isset($_POST['submit']))
{
	$productName = $_POST['productName'];
    $productDescription = $_POST['productDescription'];

	$id=intval($_GET['id']);
	// Realiza el cálculo EOQ usando los valores ingresados
	$demandAnnual = $_POST['demandAnnual'];
	$costoPedido = $_POST['costoPedido'];
	$costoMantenimiento = $_POST['costoMantenimiento'];
	$calculateproducts = sqrt((2 * $demandAnnual * $costoPedido) / $costoMantenimiento);

	// Actualiza los datos incluyendo el EOQ calculado
    $sql = mysqli_query($con, "UPDATE eoq SET productName='$productName', productDescription='$productDescription', calculateproducts='$calculateproducts', updationDate='$currentTime' WHERE id='$id'");
    $_SESSION['msg'] = "Cálculo EOQ Actualizado !!";

}

?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Admin| Modelo EOQ</title>
	<link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css" href="css/theme.css" rel="stylesheet">
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
</head>
<body>
<?php include('include/header.php');?>

	<div class="wrapper">
		<div class="container">
			<div class="row">
<?php include('include/sidebar.php');?>				
			<div class="span9">
					<div class="content">

						<div class="module">
							<div class="module-head">
								<h3>Calculo Modelo EOQ</h3>
							</div>
							<div class="module-body">

									<?php if(isset($_POST['submit']))
{?>
									<div class="alert alert-success">
										<button type="button" class="close" data-dismiss="alert">×</button>
									<strong>Excelente Trabajo!</strong>	<?php echo htmlentities($_SESSION['msg']);?><?php echo htmlentities($_SESSION['msg']="");?>
									</div>
<?php } ?>


									<br />

			<form class="form-horizontal row-fluid" name="Calculo" method="post" >
<?php
$id=intval($_GET['id']);
$query=mysqli_query($con,"select * from eoq where id='$id'");
while($row=mysqli_fetch_array($query))
{
?>									
<div class="control-group">
<label class="control-label" for="basicinput">Nombre del Pructo</label>
<div class="controls">
<input type="text" placeholder="Ingrese el nombre del Producto"  name="productName" value="<?php echo  htmlentities($row['productName']);?>" class="span8 tip" required>
</div>
</div>


<div class="control-group">
											<label class="control-label" for="basicinput">Descripción</label>
											<div class="controls">
												<textarea class="span8" name="productDescription" rows="5"><?php echo  htmlentities($row['productDescription']);?></textarea>
											</div>
										</div>
									<?php } ?>
									
		<div class="control-group">
        <label class="control-label" for="basicinput">Demanda Anual</label>
        <div class="controls">
            <input type="number" name="demandAnnual" placeholder="Ingrese la demanda anual" class="span8 tip" value="<?php echo htmlentities($row['demandAnnual']);?>" required>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="basicinput">Costo de Pedido</label>
        <div class="controls">
            <input type="number" name="costoPedido" placeholder="Ingrese el costo de pedido" class="span8 tip" value="<?php echo htmlentities($row['costoPedido']);?>" required>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="basicinput">Costo de Mantenimiento por Unidad</label>
        <div class="controls">
            <input type="number" name="costoMantenimiento" placeholder="Ingrese el costo de mantenimiento" class="span8 tip" value="<?php echo htmlentities($row['costoMantenimiento']);?>" required>
        </div>
    </div>	

	<div class="control-group">
											<div class="controls">
												<button type="submit" name="submit" class="btn">Actualizar</button>
											</div>
										</div>
									</form>
							</div>
						</div>


						

						
						
					</div><!--/.content-->
				</div><!--/.span9-->
			</div>
		</div><!--/.container-->
	</div><!--/.wrapper-->

<?php include('include/footer.php');?>

	<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
	<script src="scripts/datatables/jquery.dataTables.js"></script>
	<script>
		$(document).ready(function() {
			$('.datatable-1').dataTable();
			$('.dataTables_paginate').addClass("btn-group datatable-pagination");
			$('.dataTables_paginate > a').wrapInner('<span />');
			$('.dataTables_paginate > a:first-child').append('<i class="icon-chevron-left shaded"></i>');
			$('.dataTables_paginate > a:last-child').append('<i class="icon-chevron-right shaded"></i>');
		} );
	</script>
</body>
<?php } ?>