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
      $this->Image('logo.png', 270, 5, 20); //logo de la empresa,moverDerecha,moverAbajo,tamañoIMG
      $this->SetFont('Arial', 'B', 19); //tipo fuente, negrita(B-I-U-BIU), tamañoTexto
      $this->Cell(95); // Movernos a la derecha
      $this->SetTextColor(0, 0, 0); //color
      //creamos una celda o fila
      $this->Cell(110, 15, utf8_decode('FERRETERIA DAO'), 1, 1, 'C', 0); // AnchoCelda,AltoCelda,titulo,borde(1-0),saltoLinea(1-0),posicion(L-C-R),ColorFondo(1-0)
      $this->Ln(3); // Salto de línea
      $this->SetTextColor(103); //color

      /* UBICACION */
      $this->Cell(1);  // mover a la derecha
      $this->SetFont('Arial', 'B', 13);
      $this->Cell(96, 10, utf8_decode("Ubicación : Azuay, Ecuador"), 0, 0, '', 0);
      $this->Ln(7);

      /* TELEFONO */
      $this->Cell(1);  // mover a la derecha
      $this->SetFont('Arial', 'B', 13);
      $this->Cell(59, 10, utf8_decode("Teléfono : +593 999999999"), 0, 0, '', 0);
      $this->Ln(7);

      /* COREEO */
      $this->Cell(1);  // mover a la derecha
      $this->SetFont('Arial', 'B', 13);
      $this->Cell(85, 10, utf8_decode("Correo : ferreteriadao1@gmail.com"), 0, 0, '', 0);
      $this->Ln(15);

      /* TELEFONO */
      /* $this->Cell(180);  // mover a la derecha
      $this->SetFont('Arial', 'B', 10);
      $this->Cell(85, 10, utf8_decode("Sucursal : "), 0, 0, '', 0);
      $this->Ln(10); */

      /* TITULO DE LA TABLA */
      //color
      $this->SetTextColor(228, 100, 0);
      $this->Cell(100); // mover a la derecha
      $this->SetFont('Arial', 'B', 15);
      $this->Cell(100, 10, utf8_decode("REPORTE DE CLIENTES"), 0, 1, 'C', 0);
      $this->Ln(7);

      /* CAMPOS DE LA TABLA */
      //color
      $this->SetFillColor(228, 100, 0); //colorFondo
      $this->SetTextColor(255, 255, 255); //colorTexto
      $this->SetDrawColor(163, 163, 163); //colorBorde
      $this->SetFont('Arial', 'B', 10);
      $this->Cell(10, 10, utf8_decode('N°'), 1, 0, 'C', 1);
      $this->Cell(37, 10, utf8_decode('NOMBRE'), 1, 0, 'C', 1);
      $this->Cell(50, 10, utf8_decode('CORREO'), 1, 0, 'C', 1);
      $this->Cell(50, 10, utf8_decode('TELEFONO'), 1, 0, 'C', 1);
      $this->Cell(45, 10, utf8_decode('D.ENVIO/CIUDAD/PIN'), 1, 0, 'C', 1);
      $this->Cell(45, 10, utf8_decode('D.FAC/CIUDAD/PIN'), 1, 0, 'C', 1);
      $this->Cell(45, 10, utf8_decode('REG. FECHA'), 1, 1, 'C', 1);
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
      $this->Cell(540, 10, utf8_decode($hoy), 0, 0, 'C'); // pie de pagina(fecha de pagina)
   }
}

include '../include/conexion.php';

$pdf = new PDF();
$pdf->AddPage("landscape"); /* aqui entran dos para parametros (horientazion,tamaño)V->portrait H->landscape tamaño (A3.A4.A5.letter.legal) */
$pdf->AliasNbPages(); //muestra la pagina / y total de paginas

$i = 0;
$pdf->SetFont('Arial', '', 12);
$pdf->SetDrawColor(163, 163, 163); //colorBorde

$consulta_reporte_productos = $conexion->query("select name, email, contactno, shippingCity, shippingPincode, billingCity, billingPincode, regDate from users");

while ($datos_reporte = $consulta_reporte_productos->fetch_object()) {      
   $i = $i + 1;
   /* TABLA */
   $pdf->Cell(10, 10, utf8_decode($i), 1, 0, 'C', 0);
   $pdf->Cell(37, 10, utf8_decode($datos_reporte->name), 1, 0, 'C', 0);
   $pdf->Cell(50, 10, utf8_decode($datos_reporte->email), 1, 0, 'C', 0);
   $pdf->Cell(50, 10, utf8_decode($datos_reporte->contactno), 1, 0, 'C', 0);
   $pdf->Cell(45, 10, utf8_decode($datos_reporte->shippingCity." / ".$datos_reporte->shippingPincode), 1, 0, 'C', 0);
   $pdf->Cell(45, 10, utf8_decode($datos_reporte->billingCity." / ".$datos_reporte->billingPincode), 1, 0, 'C', 0);
   $pdf->Cell(45, 10, utf8_decode($datos_reporte->regDate), 1, 1, 'C', 0);
   }


$pdf->Output('Reportes-Usuarios.pdf', 'I');//nombreDescarga, Visor(I->visualizar - D->descargar)
