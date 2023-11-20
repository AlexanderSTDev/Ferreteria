-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-08-2023 a las 01:40:01
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `shopping`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', 'db9d8cf438783f8891ff0963666c009a', '2023-07-24 16:21:18', '05-08-2023 08:29:27 AM'),
(2, 'steven', 'f925916e2754e5e03f75dd58a5733251', '2023-08-05 21:00:14', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(3, 'Herramientas de mano', 'Test anuj', '2023-07-24 19:17:37', '01-08-2023 12:22:24 AM'),
(4, 'Elementos de unión', 'Electronic Products', '2023-07-24 19:19:32', ''),
(5, 'Herrajes', 'test', '2023-07-24 19:19:54', ''),
(6, 'Tuberias', 'Fashion', '2023-07-24 19:18:52', ''),
(7, 'Válvulas', 'Válvulas', '2023-08-03 02:31:49', NULL),
(8, 'Pinturas', 'Pinturas', '2023-08-03 02:33:45', '03-08-2023 08:07:54 AM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(1, 5, '15', 1, '2023-08-05 20:30:01', 'Paypal', 'Delivered'),
(2, 5, '17', 1, '2023-08-05 20:30:47', 'Debito / Tarjeta de crédito', 'Delivered'),
(3, 1, '16', 1, '2023-08-05 20:39:21', 'Paypal', 'Delivered'),
(4, 5, '2', 1, '2023-08-05 23:16:02', 'Paypal', 'Delivered'),
(5, 5, '5', 1, '2023-08-05 23:20:53', 'Debito / Tarjeta de crédito', 'Delivered');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(1, 1, 'Delivered', 'Proceso Terminado', '2023-08-05 20:36:27'),
(2, 3, 'in Process', 'Aun no llega', '2023-08-05 20:52:34'),
(3, 2, 'Delivered', 'Ya esta listo', '2023-08-05 20:53:13'),
(4, 3, 'Delivered', 'Ya listo', '2023-08-05 20:53:43'),
(5, 4, 'in Process', 'Este aun no llega, por lo tanto debe eseperar', '2023-08-05 23:28:18'),
(6, 5, 'Delivered', 'Tu producto ya llegado', '2023-08-05 23:29:01'),
(7, 4, 'Delivered', 'Ya te llego tu producto', '2023-08-05 23:30:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(2, 3, 4, 5, 5, 'Anuj Kumar', 'BEST PRODUCT FOR ME :)', 'BEST PRODUCT FOR ME :)', '2023-07-27 20:43:57'),
(3, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2023-07-27 20:52:46'),
(4, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2023-07-27 20:59:19'),
(5, 2, 5, 4, 5, 'Dapienver', 'asfdlasda', 'adasdasd', '2023-07-31 18:01:21'),
(6, 2, 4, 2, 2, 'sads', 'adsad', 'asdasd', '2023-07-31 18:12:28'),
(7, 2, 4, 2, 2, 'sads', 'adsad', 'asdasd', '2023-07-31 18:12:43'),
(8, 17, 5, 1, 4, 'Dapienver', 'adsad', 'muy weno', '2023-08-05 23:15:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(1, 4, 3, 'Arandelas planas tratadas', 'bms', 139900, 0, '<div class=\"HoUsOy\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; font-size: 18px; white-space: nowrap; line-height: 1.4; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px; text-wrap: wrap;\">Arandelas planas tratadas (350 + 80 HV30) - DIN 6340.</span><br></div>', 'rodela-plana-inoxidable-ss-304.jpg', 'images.jpg', 'ARANDELA CIELO RAZO.jpg', 1200, 'In Stock', '2023-07-13 16:54:35', ''),
(2, 4, 4, 'Pernos de retención', 'Heinrich Kipp Werk GmbH & Co. KG', 36990, 0, '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\">Los pernos de bloqueo, también llamados pernos de retención, forman parte de los componentes de construcción estandarizados que permiten un rápido ajuste de los componentes móviles de las máquinas. Tirando del botón o del anillo de extracción se extrae un pasador de la contraparte, lo que permite colocar los componentes de las máquinas en la posición adecuada y, a continuación, volver a fijarlos en su nueva posición. Kipp dispone de pernos de bloqueo en diversos tamaños, formas y materiales. Garantizan una funcionalidad de los productos exenta de fricción, así como la máxima calidad y resistencia.</span>', 'reten.jpg', 'GN 608-Posicionadores de muelle.jpg', 'GN-817-Pernos-de-retencion-de-acero-inoxidable-pomo-de-plastico-con-bloqueo-de-posicion-sin-contratuerca-Acero-inoxidable-thumbnail.jpg', 0, 'In Stock', '2023-07-13 16:59:00', ''),
(3, 4, 4, 'Perno de bloqueo de bola', 'Kipp', 10999, 0, '<div><div><span style=\"color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\">Con un perno de bloqueo de bola se pueden unir y fijar componentes, piezas de trabajo y otros elementos integrantes de una máquina. El botón pulsador se encarga de ello. El perno de bloqueo de bola tiene un práctico mecanismo de bloqueo mediante bola. En cuanto el mecanismo de resorte en el perno se activa al presionar el botón, el bloqueo de bola se suelta (las bolas se retraen hacia el interior).</span><br></div></div>', 'P165138bo.jpg', 'perbolas.jpg', '03194-Kugelsperrbolzen-Edelstahl-selbstsichernd-Ball-lock-pins-self-locking-stainless-steel.jpg', 0, 'In Stock', '2023-07-14 04:03:15', ''),
(4, 4, 4, 'Bulones romboides', 'Business Moulding Supplies, S.L. - BMS (BMS-PMS)', 9999, 0, 'Bulones romboides', 'P207403.jpg', 'RHOMBUS-schema-600x600.png', 'BOULONT-img1-540x540.png', 45, 'In Stock', '2023-07-14 04:04:43', ''),
(5, 4, 4, 'Abarcones y pernos roscados', 'Industrial Recense, S.L. ', 110, 0, '<ul><li>3 GB RAM | 32 GB ROM | Expandable Upto 128 GB<br></li><li>5.5 inch Full HD Display<br></li><li>13MP Primary Camera | 8MP Front<br></li><li>3500 mAh Li-Ion Polymer Battery<br></li><li>Helio P10 64-bit Processor<br></li></ul>', 'pero.jpg', '41r4PGJy0dL.jpg', '694.jpg', 0, 'In Stock', '2023-07-14 04:06:17', ''),
(6, 4, 4, 'Abarcón equipado', 'Industrial Recense, S.L.', 6999, 0, '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\">Industrial Recence ofrece a sus clientes abarcones equipados. Estos también están disponibles en acero inoxidable bajo pedido. Equipados con 2 tuercas DIN 934 y 2 arandelas de seguridad DIN 7980.</span><br>', 'abarcon-din-3570-inoxidable-w5.jpg', 'images (1).jpg', 'images.jpg', 35, 'In Stock', '2023-07-14 04:08:07', ''),
(7, 4, 4, 'Gancho de teja', 'Industrial Recense, S.L.', 7490, 0, '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\">Industrial Recense dispone de ganchos de teja fabricados con alambre de acero zincado o de acero inoxidable AISI 304. Se venden en bolsas interiores de 250 unidades.</span>', 'Ganchos.jpg', '5121njgXYZL._AC_UF1000,1000_QL80_.jpg', '51TZTdOpXnL.jpg', 20, 'In Stock', '2023-07-14 04:10:17', ''),
(8, 4, 4, 'Juego de abarcones', 'Industrial Recense, S.L.', 14990, 0, '<div><span style=\"color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\">Industrial Recense nos presenta un juego de abarcones para invernaderos compuesta por dos abarcones de 65 mm de ancho y 110 mm de alto unidos entre sí por dos pletinas y cuatro tuercas DIN 934 de métrica 8. La varilla es de M7 x 125.</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\"><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\">Se fabrica en hierro zincado e inoxidable AISI 304 bajo pedido. Las piezas se sirven sueltas.</span><br></div>', 'P49536.jpg', 'Cancamo-Abarcon.png', 'images.jpg', 0, 'In Stock', '2023-07-14 04:11:54', ''),
(15, 3, 8, 'Cuchillas en ángulo recto para plástico', 'BMS AML-AMR', 205, 250, '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\">Cuchillas en ángulo recto para plástico.</span>', 'AJL-img1-540x540.png', 'P207821.jpg', 'PF-img1-540x540.png', 50, 'In Stock', '2023-07-15 04:35:13', ''),
(16, 3, 8, 'Alicate de corte neumático', 'BMS GTNR', 240, 0, '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\">Las cuchillas se venden por separado. Enchufes 1/4”. Tubo diámetro 5 mm .</span>', 'P207807.jpg', 'descargar.jpg', 'alicate.jpg', 30, 'In Stock', '2023-07-17 04:36:23', ''),
(17, 5, 9, 'Cierre de seguridad digital', 'DOM Security EniQ Ecosystem', 32566, 0, '<a href=\"https://www.dom-security.com/es/es/landing/control-de-accesos?utm_source=Interempresas_CCAA&amp;utm_medium=Interempresas_CCAA&amp;utm_campaign=Interempresas_CCAA&amp;utm_id=Interempresas_CCAA\" style=\"box-sizing: border-box; background: 0px 0px; color: rgb(66, 139, 202); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\">ENiQ Ecosystem</a><span style=\"color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\">&nbsp;es un sistema de cierre digital \"todo en uno\" a medida. Pensado para proteger edificios, oficinas. Combina las capacidades de Dom para la protección física con métodos de criptografía digital, ofreciendo un alto nivel de seguridad. Las diferentes opciones de control hacen que sea sencillo organizar la seguridad de cada usuario, así como la del sistema en su conjunto.</span>', 'P209566.jpg', 'cerradura-kdl-2700k-kocom.jpg', 'cerradura-inteligente-con-bluetooth-tarjeta-llave-codigo-os8810ble-diel.jpg', 0, 'In Stock', '2023-07-17 04:40:37', ''),
(18, 5, 10, 'Cerraduras y cerraderos para divisiones interiores', 'GEDASA - General Española de Accesorios', 6523, 0, '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\">Elegante gama de bisagras, cerraduras, cerraderos y pestillos de puertas con galce para mamparas de oficinas (“partitions”). Disponibles en aluminio anodizado y acero inoxidable. Material de fabricación europea certificada y testada para 500.000 ciclos.</span>', 'P164864.jpg', 'combo-cerradura-4-bulones-de-seguridad-yale-con-manija-milan-roseta-cuadrada-y-cilindro.jpg', 'cerradura-inteligente.jpg', 0, 'In Stock', '2023-07-17 04:42:27', ''),
(19, 6, 12, 'Codos de cristal 90°', 'Business Moulding Supplies, S.L. - BMS (BMS-PMS)', 379, 0, '<div><span style=\"color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\">Mangueras y accesorios para un transporte de materias sin límite. Alimentación materia centralizada Para sus aplicaciones muy cargadas (fibra de vidrio u otros elementos): codo de acero inoxidable endurecido que proporciona una excelente resistencia a la abrasión, 20 veces superior al acero inoxidable estándar.</span><font color=\"#212121\" face=\"Roboto, Arial, sans-serif\"><span style=\"font-size: 14px;\"><br></span></font></div><ul style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\"><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\"><br></div></li></ul>', 'P207650.jpg', 'Hf71d410f99f24ebebedbf9d6005d4b9da.jpg', 'GLB90-schema-3-600x600.png', 45, 'In Stock', '2023-07-16 20:16:03', ''),
(20, 6, 12, 'Brazo en escuadra - rígido', 'BMS BES', 55, 60, '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\">Material: aluminio.</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\"><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\">Superficie: plata anodizada.</span>', 'P207706co.jpg', 'CA-WKA-30-30-80_0_pr.jpeg', 'CA-WKA-10-10-60_0_ori.jpeg', 0, 'In Stock', '2023-07-16 20:19:22', ''),
(21, 5, 9, 'Cerraduras multipunto electromecánicas', 'KFV Genius', 190, 233, '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\">El sistema electromecánico de cierre y apertura Genius aúna las cualidades en seguridad de una cerradura multipunto mecánica con los detalles de confort de la más avanzada electrónica.</span><br><div><span style=\"color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\">Todas las ventajas a la vista:</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\"><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\">- cierre y apertura electrónica de todos los pestillos (incluso en la cerradura principal)</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\"><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\">- vigilancia permanente del cierre</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\"><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\">- óptima estanqueidad</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\"><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\">- reducido ancho de montaje de sólo 16 mm y profundidad de montaje desde 52 mm</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\"><br></span></div>', 'P146140cer.jpg', 'P204203.jpg', 'P204474cerrr.jpg', 40, 'In Stock', '2023-08-05 01:42:34', NULL),
(22, 6, 12, 'Rácores', 'Swagelok', 235, 240, '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Sofia Sans&quot;, sans-serif; font-size: 16px;\">Los racores producen un cierre sin fugas en servicio de gas con un diseño fácil de instalar, desmontar y reutilizar. El robusto agarre del tubo con tecnología patentada de dos férulas es resistente a la fatiga por vibraciones y soporta altas presiones y temperaturas extremas.</span><br>', 'racores.jpg', 'P147057ds.jpg', 'P125642.jpg', 5, 'In Stock', '2023-08-05 01:56:53', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(2, 4, 'Anclajes', '2023-07-26 16:24:52', '03-08-2023 08:41:24 AM'),
(3, 4, 'Arandelas', '2023-07-26 16:29:09', '03-08-2023 08:42:24 AM'),
(4, 4, 'Pernos', '2023-07-30 16:55:48', '03-08-2023 08:42:40 AM'),
(8, 3, 'Alicates', '2023-08-01 04:13:54', '03-08-2023 08:46:46 AM'),
(9, 5, 'Cerraduras de exterior', '2023-08-02 04:36:45', '03-08-2023 08:47:23 AM'),
(10, 5, 'Cerraduras de interior', '2023-08-02 04:37:02', '03-08-2023 08:47:58 AM'),
(11, 5, 'Cerraderos para puertas', '2023-08-02 04:37:51', ''),
(12, 6, 'Codos', '2023-08-01 20:12:59', ''),
(13, 4, 'Tuercas', '2023-08-02 03:14:52', NULL),
(15, 3, 'Destornilladores', '2023-08-03 03:16:29', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-26 11:18:50', '', 1),
(2, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-26 11:29:33', '', 1),
(3, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-26 11:30:11', '', 1),
(4, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-26 15:00:23', '26-07-2023 11:12:06 PM', 1),
(5, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-26 18:08:58', '', 0),
(6, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-26 18:09:41', '', 0),
(7, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-26 18:10:04', '', 0),
(8, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-26 18:10:31', '', 0),
(9, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-26 18:13:43', '', 1),
(10, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-27 18:52:58', '', 0),
(11, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-27 18:53:07', '', 1),
(12, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-28 18:00:09', '', 0),
(13, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-28 18:00:15', '', 1),
(14, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-28 18:10:26', '', 1),
(15, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-28 12:28:16', '', 1),
(16, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-28 18:43:27', '', 1),
(17, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-28 18:55:33', '', 1),
(18, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-29 19:44:29', '', 1),
(19, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-29 19:21:15', '', 1),
(20, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-29 17:19:38', '', 1),
(21, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-29 17:20:36', '29-07-2023 10:50:39 PM', 1),
(22, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-30 01:13:57', '', 1),
(23, 'hgfhgf@gmass.com', 0x3a3a3100000000000000000000000000, '2023-07-29 09:30:40', '', 1),
(24, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-30 14:52:48', '30-07-2023 08:25:37 PM', 1),
(25, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-30 14:55:56', NULL, 1),
(26, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-27 16:48:03', '28-07-2023 08:27:41 PM', 1),
(27, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-28 15:03:32', NULL, 1),
(28, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-28 15:04:29', '28-07-2023 08:58:41 PM', 1),
(29, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-28 15:30:57', NULL, 1),
(30, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-28 15:32:10', '28-07-2023 09:06:45 PM', 1),
(31, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-28 15:49:26', '28-07-2023 10:16:49 PM', 1),
(32, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-31 17:40:02', '31-07-2023 11:35:42 PM', 1),
(33, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-31 23:23:48', '01-08-2023 05:54:09 AM', 1),
(34, 'steven88724@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-01 00:31:28', '01-08-2023 07:02:22 PM', 1),
(35, 'steven88724@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-01 16:30:16', '01-08-2023 10:00:27 PM', 1),
(36, 'steven88724@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-01 16:30:42', NULL, 0),
(37, 'steven88724@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-01 16:37:41', '01-08-2023 10:07:43 PM', 1),
(38, 'steven88724@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-01 16:37:55', NULL, 0),
(39, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-01 17:12:59', NULL, 1),
(40, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-01 17:32:22', '01-08-2023 11:11:02 PM', 1),
(41, 'steven88724@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-01 17:43:11', NULL, 1),
(42, 'steven88724@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-01 17:53:02', '01-08-2023 11:24:06 PM', 1),
(43, 'steven88724@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-01 17:54:39', NULL, 1),
(44, 'steven88724@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-01 18:32:57', NULL, 1),
(45, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-01 19:00:52', '02-08-2023 12:30:54 AM', 1),
(46, 'steven88724@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-03 14:09:24', NULL, 0),
(47, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-03 14:09:37', '03-08-2023 07:39:41 PM', 1),
(48, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-03 15:28:06', NULL, 0),
(49, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-03 15:28:22', '03-08-2023 09:20:14 PM', 1),
(50, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-03 15:50:41', '03-08-2023 09:21:22 PM', 1),
(51, 'steven88724@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-03 15:53:44', '03-08-2023 09:23:48 PM', 1),
(52, 'steven88724@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-03 15:54:31', '03-08-2023 09:24:49 PM', 1),
(53, 'steven88724@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-05 04:53:59', NULL, 0),
(54, 'steven88724@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-05 04:54:14', NULL, 0),
(55, 'steven88724@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-05 04:55:10', NULL, 1),
(56, 'steven@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-05 05:44:34', '05-08-2023 12:44:38 AM', 1),
(57, 'steven88724@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-05 18:00:42', NULL, 0),
(58, 'steven@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-05 18:14:44', '05-08-2023 02:11:55 PM', 1),
(59, 'steven@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-05 19:16:21', '05-08-2023 02:32:34 PM', 1),
(60, 'steven@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-05 20:28:45', NULL, 1),
(61, 'steven@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-05 20:55:22', NULL, 1),
(62, 'steven@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-05 23:13:25', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(1, 'Anuj Kumar', 'anuj.lpu1@gmail.com', 9009857867, 'f925916e2754e5e03f75dd58a5733251', 'CS New Delhi', 'New Delhi', 'Delhi', 110001, 'New Delhi', 'New Delhi', 'Delhi', 110092, '2023-07-22 19:30:50', ''),
(2, 'Amit ', 'amit@gmail.com', 8285703355, '5c428d8875d2948607f3e3fe134d71b4', '', '', '', 0, '', '', '', 0, '2023-07-22 17:21:22', ''),
(3, 'hg', 'hgfhgf@gmass.com', 1121312312, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', 0, '', '', '', 0, '2023-07-22 09:30:32', ''),
(5, 'Steven Torres', 'steven@gmail.com', 967201167, '8bce61ee7bb83fe122f04906a38e4fe4', 'Av-Ataghualpa', 'Esmeraldas', 'Esmeraldas', 10241, 'Av-Ataghualpa', 'Esmeraldas', 'San Lorenzo', 10241, '2023-08-03 15:53:33', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(1, 1, 0, '2023-07-27 18:53:17'),
(3, 1, 1, '2023-07-31 17:53:13'),
(4, 1, 15, '2023-07-31 17:53:58'),
(6, 1, 2, '2023-07-31 18:00:12'),
(7, 4, 2, '2023-08-01 01:00:01'),
(10, 5, 2, '2023-08-05 18:29:07'),
(11, 5, 17, '2023-08-05 23:14:50');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
