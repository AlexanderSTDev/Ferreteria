<?php

require('./fpdf.php');

class PDF extends FPDF
{

   // Cabecera de página
   function Header()
   {
      //include '../../recursos/Recurso_conexion_bd.php';//llamamos a la conexion BD

      //$consulta_info = $conexion->query(" select *from hotel ");//traemos datos de la empresa desde BD
      //$dato_info = $consulta_info->fetch_object();
      $this->Image('logo.png', 185, 5, 20); //logo de la empresa,moverDerecha,moverAbajo,tamañoIMG
      $this->SetFont('Arial', 'B', 19); //tipo fuente, negrita(B-I-U-BIU), tamañoTexto
      $this->Cell(45); // Movernos a la derecha
      $this->SetTextColor(0, 0, 0); //color
      //creamos una celda o fila
      $this->Cell(110, 15, utf8_decode('FERRETERIA DAO'), 1, 1, 'C', 0); // AnchoCelda,AltoCelda,titulo,borde(1-0),saltoLinea(1-0),posicion(L-C-R),ColorFondo(1-0)
      $this->Ln(5); // Salto de línea
      $this->SetTextColor(103); //color

      /* UBICACION */
      $this->Cell(1);  // mover a la derecha
      $this->SetFont('Arial', 'B', 10);
      $this->Cell(96, 10, utf8_decode("Ubicación : Azuay, Ecuador"), 0, 0, '', 0);
      $this->Ln(7);

      /* TELEFONO */
      $this->Cell(1);  // mover a la derecha
      $this->SetFont('Arial', 'B', 10);
      $this->Cell(59, 10, utf8_decode("Teléfono : +593 999999999"), 0, 0, '', 0);
      $this->Ln(7);

      /* COREEO */
      $this->Cell(1);  // mover a la derecha
      $this->SetFont('Arial', 'B', 10);
      $this->Cell(85, 10, utf8_decode("Correo : ferreteriadao1@gmail.com"), 0, 0, '', 0);
      $this->Ln(15);

      /* TELEFONO */
      /* $this->Cell(110);  // mover a la derecha
      $this->SetFont('Arial', 'B', 10);
      $this->Cell(85, 10, utf8_decode("Sucursal : "), 0, 0, '', 0);
      $this->Ln(10); */

      /* TITULO DE LA TABLA */
      //color
      $this->SetTextColor(228, 100, 0);
      $this->Cell(50); // mover a la derecha
      $this->SetFont('Arial', 'B', 15);
      $this->Cell(100, 10, utf8_decode("PRODUCTOS MAS VENDIDOS "), 0, 1, 'C', 0);
      $this->Ln(7);

      /* CAMPOS DE LA TABLA */
      //color
      $this->SetFillColor(228, 100, 0); //colorFondo
      $this->SetTextColor(255, 255, 255); //colorTexto
      $this->SetDrawColor(163, 163, 163); //colorBorde
      $this->SetFont('Arial', 'B', 11);
      $this->Cell(10, 10, utf8_decode('N°'), 1, 0, 'C', 1);
      $this->Cell(50, 10, utf8_decode('NOMBRE'), 1, 0, 'C', 1);
      $this->Cell(30, 10, utf8_decode('FRECUENCIA'), 1, 0, 'C', 1);
      $this->Cell(20, 10, utf8_decode('PRECIO'), 1, 0, 'C', 1);
      $this->Cell(25, 10, utf8_decode('CANTIDAD'), 1, 0, 'C', 1);
      $this->Cell(49, 10, utf8_decode('FECHA'), 1, 1, 'C', 1);
   }

   // Pie de página
   function Footer()
   {
      $this->SetY(-15); // Posición: a 1,5 cm del final
      $this->SetFont('Arial', 'I', 8); //tipo fuente, negrita(B-I-U-BIU), tamañoTexto
      $this->Cell(0, 10, utf8_decode('Página ') . $this->PageNo() . '/{nb}', 0, 0, 'C'); //pie de pagina(numero de pagina)

      $this->SetY(-15); // Posición: a 1,5 cm del final
      $this->SetFont('Arial', 'I', 8); //tipo fuente, cursiva, tamañoTexto
      $hoy = date('d/m/Y');
      $this->Cell(355, 10, utf8_decode($hoy), 0, 0, 'C'); // pie de pagina(fecha de pagina)
   }
}

include '../include/conexion.php';

$pdf = new PDF();
$pdf->AddPage(); /* aqui entran dos para parametros (horientazion,tamaño)V->portrait H->landscape tamaño (A3.A4.A5.letter.legal) */
$pdf->AliasNbPages(); //muestra la pagina / y total de paginas

$i = 0;
$pdf->SetFont('Arial', '', 12);
$pdf->SetDrawColor(163, 163, 163); //colorBorde

$consulta_reporte = $conexion->query(" SELECT productName, COUNT(*) AS frecuencia, productPrice, orders.quantity, postingDate FROM products INNER JOIN orders ON products.id = orders.productId WHERE orders.orderStatus = 'Delivered' GROUP BY productName ");

while ($datos_reporte = $consulta_reporte->fetch_object()) {   
   $i = $i + 1;
   $pdf->Cell(10, 10, utf8_decode($i), 1, 0, 'C', 0);
   $pdf->Cell(50, 10, utf8_decode($datos_reporte->productName), 1, 0, 'C', 0);
   $pdf->Cell(30, 10, utf8_decode($datos_reporte->frecuencia." veces"), 1, 0, 'C', 0);
   $pdf->Cell(20, 10, utf8_decode($datos_reporte->productPrice." $"), 1, 0, 'C', 0);
   $pdf->Cell(25, 10, utf8_decode($datos_reporte->quantity), 1, 0, 'C', 0);
   $pdf->Cell(49, 10, utf8_decode($datos_reporte->postingDate), 1, 1, 'C', 0);
    
   }


$pdf->Output('Reportes-Productos-Más-Vendidos.pdf', 'I');//nombreDescarga, Visor(I->visualizar - D->descargar)
