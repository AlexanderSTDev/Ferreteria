<?php
session_start();
include_once 'includes/config.php';
$oid = intval($_GET['oid']);
?>
<script language="javascript" type="text/javascript">
  function f2() {
    window.close();
  }
  ser

  function f3() {
    window.print();
  }
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  <title>Detalles de seguimiento de pedidos</title>
  <link href="style.css" rel="stylesheet" type="text/css" />
  <link href="anuj.css" rel="stylesheet" type="text/css">
</head>

<body>

  <div style="margin-left:50px;">
    <form name="updateticket" id="updateticket" method="post">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">

        <tr height="50">
          <td colspan="2" class="fontkink2" style="padding-left:0px;">
            <div class="fontpink2"> <b>Detalles de seguimiento de pedidos !</b></div>
          </td>

        </tr>
        <tr height="30">
          <td class="fontkink1"><b>Solicitar ID:</b></td>
          <td class="fontkink"><?php echo $oid; ?></td>
        </tr>
        <?php
        $ret = mysqli_query($con, "SELECT * FROM ordertrackhistory WHERE orderId='$oid'");
        $num = mysqli_num_rows($ret);
        if ($num > 0) {
          while ($row = mysqli_fetch_array($ret)) {
        ?>



            <tr height="20">
              <td class="fontkink1"><b>En la fecha:</b></td>
              <td class="fontkink"><?php echo $row['postingDate']; ?></td>
            </tr>
            <tr height="20">
              <td class="fontkink1"><b>Estado:</b></td>
              <td class="fontkink"><?php echo $row['status']; ?></td>
            </tr>
            <tr height="20">
              <td class="fontkink1"><b>Observación:</b></td>
              <td class="fontkink"><?php echo $row['remark']; ?></td>
            </tr>


            <tr>
              <td colspan="2">
                <hr />
              </td>
            </tr>
          <?php }
        } else {
          ?>
          <tr>
            <td colspan="2">Orden no procesada todavía</td>
          </tr>
        <?php  }
        $st = 'Delivered';
        $rt = mysqli_query($con, "SELECT * FROM orders WHERE id='$oid'");
        while ($num = mysqli_fetch_array($rt)) {
          $currrentSt = $num['orderStatus'];
        }
        if ($st == $currrentSt) { ?>
          <tr>
            <td colspan="2"><b>
                Producto entregado con éxito </b></td>
          <?php }

          ?>
          <span>Presione las teclas: Ctrl+P para imprimir</span>
      </table>
    </form>
  </div>

</body>

</html>