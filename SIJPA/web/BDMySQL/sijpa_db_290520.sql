-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-05-2020 a las 16:48:54
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sijpa_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_acuerdo_reparatorio`
--

CREATE TABLE `catalogos_acuerdo_reparatorio` (
  `AREPARATORIO_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(70) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_acuerdo_reparatorio`
--

INSERT INTO `catalogos_acuerdo_reparatorio` (`AREPARATORIO_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Mediación'),
(2, 'Reunión de la víctima con la persona adolescente'),
(3, 'Junta restaurativa'),
(4, 'Círculos'),
(5, 'Otro'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_alfabetismo`
--

CREATE TABLE `catalogos_alfabetismo` (
  `ALFABETISMO_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_alfabetismo`
--

INSERT INTO `catalogos_alfabetismo` (`ALFABETISMO_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Sabe leer y escribir'),
(2, 'No sabe leer y escri'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_asentamiento_humano`
--

CREATE TABLE `catalogos_asentamiento_humano` (
  `ASENTAMIENTO_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_asentamiento_humano`
--

INSERT INTO `catalogos_asentamiento_humano` (`ASENTAMIENTO_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Aeropuerto'),
(2, 'Ampliación'),
(3, 'Barrio'),
(4, 'Cantón'),
(5, 'Ciudad'),
(6, 'Ciudad industrial'),
(7, 'Colonia'),
(8, 'Condominio'),
(9, 'Conjunto habitacional'),
(10, 'Corredor industrial'),
(11, 'Coto'),
(12, 'Cuartel'),
(13, 'Ejido'),
(14, 'Ex-hacienda'),
(15, 'Fracción'),
(16, 'Fraccionamiento'),
(17, 'Granja'),
(18, 'Hacienda'),
(19, 'Ingenio'),
(20, 'Manzana'),
(21, 'Paraje'),
(22, 'Parque industrial'),
(23, 'Privada'),
(24, 'Prolongación'),
(25, 'Pueblo'),
(26, 'Puerto'),
(27, 'Ranchería'),
(28, 'Rancho'),
(29, 'Región'),
(30, 'Residencial'),
(31, 'Rinconada'),
(32, 'Sección'),
(33, 'Sector'),
(34, 'Supermanzana'),
(35, 'Unidad'),
(36, 'Unidad habitacional'),
(37, 'Villa'),
(38, 'Zona Federal'),
(39, 'Zona Industrial'),
(40, 'Zona Militar'),
(41, 'Zona Naval');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_audiencias_intermedia`
--

CREATE TABLE `catalogos_audiencias_intermedia` (
  `AUDIENCIA_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_audiencias_intermedia`
--

INSERT INTO `catalogos_audiencias_intermedia` (`AUDIENCIA_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Audiencias de prueba anticipada'),
(2, 'Audiencias de acumulación de procesos'),
(3, 'Audiencias de separación de procesos'),
(4, 'Audiencias de desistimiento de la acción penal'),
(5, 'Audiencias de medida cautelar (revisión)'),
(6, 'Audiencias relacionadas con el procedimiento abreviado'),
(7, 'Audiencias relacionadas con la suspensión condicional del proceso'),
(8, 'Audiencias intermedias'),
(9, 'Audiencias relacionadas con acuerdos reparatorios'),
(10, 'Audiencias de solicitud y/o determinación de sobreseimiento'),
(11, 'Otras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_audiencias_investigacion`
--

CREATE TABLE `catalogos_audiencias_investigacion` (
  `AUDIENCIA_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_audiencias_investigacion`
--

INSERT INTO `catalogos_audiencias_investigacion` (`AUDIENCIA_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Audiencias relacionadas con la competencia'),
(2, 'Audiencias relacionadas con técnicas de investigación'),
(3, 'Audiencias de prueba anticipada'),
(4, 'Audiencias de acumulación de procesos'),
(5, 'Audiencias de separación de procesos'),
(6, 'Audiencias de citación '),
(7, 'Audiencias de comparecencia'),
(8, 'Audiencias de aprehensión'),
(9, 'Audiencias de desistimiento de la acción penal'),
(10, 'Audiencias relacionadas con las medidas de protección'),
(11, 'Audiencia inicial - control de detención'),
(12, 'Audiencia inicial - formulación de la imputación'),
(13, 'Audiencia inicial - vinculación a proceso'),
(14, 'Audiencia inicial - imposición de medida cautelar'),
(15, 'Audiencia inicial - otras'),
(16, 'Audiencias de medida cautelar (revisión)'),
(17, 'Audiencias relacionadas con el procedimiento abreviado'),
(18, 'Audiencias relacionadas con la suspensión condicional del proceso'),
(19, 'Audiencias de cierre de la investigación complementaria'),
(20, 'Audiencias relacionadas con impugnaciones a determinaciones del ministerio público'),
(21, 'Audiencias relacionadas con acuerdos reparatorios'),
(22, 'Audiencias de solicitud y/o determinación de sobreseimiento'),
(23, 'Otras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_audiencias_juiciooral`
--

CREATE TABLE `catalogos_audiencias_juiciooral` (
  `AUDIENCIA_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_audiencias_juiciooral`
--

INSERT INTO `catalogos_audiencias_juiciooral` (`AUDIENCIA_ID`, `DESCRIPCION`) VALUES
(1, 'Audiencias relacionadas con la competencia'),
(2, 'Audiencias de desistimiento de la acción penal'),
(3, 'Audiencias de medida cautelar (revisión)'),
(4, 'Audiencias de juicio'),
(5, 'Audiencias de solicitud y/o determinación de sobreseimiento'),
(6, 'Audiencias de individualización de medidas de sanción'),
(7, 'Audiencias de notificación o lectura de la sentencia'),
(8, 'Otras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_auto_vinculacion`
--

CREATE TABLE `catalogos_auto_vinculacion` (
  `AUTO_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_auto_vinculacion`
--

INSERT INTO `catalogos_auto_vinculacion` (`AUTO_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Vinculación a proceso'),
(2, 'No vinculación a proceso'),
(9, ' No Identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_calificacion_delito`
--

CREATE TABLE `catalogos_calificacion_delito` (
  `CALIFICACION_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_calificacion_delito`
--

INSERT INTO `catalogos_calificacion_delito` (`CALIFICACION_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Grave'),
(2, 'No grave'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_causa_suspencion`
--

CREATE TABLE `catalogos_causa_suspencion` (
  `CSUSPENSION_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(85) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_causa_suspencion`
--

INSERT INTO `catalogos_causa_suspencion` (`CSUSPENSION_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'El imputado se sustrajo de la acción de la justicia'),
(2, 'Falta de cumplimiento de requisitos de procedibilidad para la persecución del delito'),
(3, 'El imputado padece de algún trastorno mental temporal durante el proceso'),
(4, 'Otra'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_clasificacion`
--

CREATE TABLE `catalogos_clasificacion` (
  `CLASIFICACION_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_clasificacion`
--

INSERT INTO `catalogos_clasificacion` (`CLASIFICACION_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Instantáneo '),
(2, 'Permanente'),
(3, 'Continuado'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_codigo_norma`
--

CREATE TABLE `catalogos_codigo_norma` (
  `ID_CODIGO` int(3) NOT NULL,
  `CODIGO` varchar(300) COLLATE utf8_bin NOT NULL,
  `NORMA` int(3) NOT NULL,
  `ID_2018` int(3) NOT NULL,
  `NORMA_2018` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_codigo_norma`
--

INSERT INTO `catalogos_codigo_norma` (`ID_CODIGO`, `CODIGO`, `NORMA`, `ID_2018`, `NORMA_2018`) VALUES
(-2, 'No aplica', 0, 0, 0),
(1, 'Homicidio', 1, 364, 27),
(2, 'Homicidio agravado por razón de parentesco no consanguíneo', 1, 365, 27),
(3, 'Homicidio calificado', 1, 366, 27),
(4, 'Homicidio calificado a propósito de una violación, allanamiento de morada, asalto o secuestro', 1, 367, 27),
(5, 'Homicidio calificado por inundación, incendio, por gases explosivos, veneno u otra sustancia', 1, 368, 27),
(6, 'Homicidio culposo', 1, 369, 27),
(7, 'Homicidio culposo con motivo del tránsito de vehículos', 1, 370, 27),
(8, 'Homicidio culposo en razón de parentesco cuando el activo se encuentre bajo el efecto de bebidas embriagantes, estupefacientes y psicotrópicos', 1, 0, 0),
(9, 'Homicidio de mujer por razones de género', 1, 0, 0),
(10, 'Homicidio de prisioneros después de combate', 1, 371, 27),
(11, 'Homicidio en riña', 1, 372, 27),
(12, 'Homicidio por corrupción de descendiente o adoptado', 1, 373, 27),
(13, 'Homicidio por dos o más personas sin acuerdo previo', 1, 374, 27),
(14, 'Homicidio por estado de emoción violenta', 1, 0, 0),
(15, 'Homicidio por infidelidad conyugal', 1, 375, 27),
(16, 'Homicidio por lesiones mortales', 1, 0, 0),
(17, 'Homicidio por razones de piedad', 1, 376, 27),
(18, 'Homicidio por razones humanitaria', 1, 0, 0),
(19, 'Homicidio simple doloso', 1, 377, 27),
(20, 'Infanticidio', 1, 409, 47),
(21, 'Otros delitos que privan de la vida', 1, 518, 47),
(22, 'Parricidio, matricidio, filicidio, uxoricidio, fratricidio y otros homicidios por razón del parentesco consanguíneo o relación', 1, 528, 47),
(23, 'Feminicidio', 2, 344, 25),
(24, 'Feminicidio agravado por razón de parentesco o relación que implique subordinación o superioridad', 2, 0, 0),
(25, 'Aborto', 3, 22, 2),
(26, 'Aborto agravado mediante violencia física o moral', 3, 0, 0),
(27, 'Aborto con consentimiento', 3, 23, 2),
(28, 'Aborto consentido', 3, 24, 2),
(29, 'Aborto culposo', 3, 25, 2),
(30, 'Aborto forzado', 3, 0, 0),
(31, 'Aborto no consentido', 3, 26, 2),
(32, 'Aborto no punible', 3, 27, 2),
(33, 'Aborto sin consentimiento', 3, 28, 2),
(34, 'Lesiones', 4, 430, 31),
(35, 'Lesiones agravadas por razón del parentesco', 4, 431, 31),
(36, 'Lesiones al concebido', 4, 432, 31),
(37, 'Lesiones calificadas', 4, 433, 31),
(38, 'Lesiones causadas por animal bravío', 4, 0, 0),
(39, 'Lesiones culposas', 4, 434, 31),
(40, 'Lesiones culposas por motivos de tránsito de vehículos', 4, 0, 0),
(41, 'Lesiones de la cual resulte incapacidad permanente para trabajar, enajenación mental, la pérdida de la vista o del habla o de funciones sexuales', 4, 0, 0),
(42, 'Lesiones de las que resulte una enfermedad incurable, la inutilización de un órgano, se perjudique una función orgánica o se genere una incapacidad permanente para trabajar', 4, 435, 31),
(43, 'Lesiones dolosas', 4, 436, 31),
(44, 'Lesiones en riña', 4, 437, 31),
(45, 'Lesiones graves de disfunción parcial permanente de órganos o facultades', 4, 438, 31),
(46, 'Lesiones gravísimas', 4, 439, 31),
(47, 'Lesiones gravísimas que ponen en peligro de muerte', 4, 440, 31),
(48, 'Lesiones inferidas con crueldad o frecuencia a un menor de edad o incapaz', 4, 0, 0),
(49, 'Lesiones levísimas y leves', 4, 447, 31),
(50, 'Lesiones múltiples', 4, 448, 31),
(51, 'Lesiones por corrupción de descendiente o adoptado', 4, 441, 31),
(52, 'Lesiones por estado de emoción violenta', 4, 0, 0),
(53, 'Lesiones por infidelidad conyugal', 4, 442, 31),
(54, 'Lesiones que dejen cicatriz en la cara notable', 4, 443, 31),
(55, 'Lesiones que no pongan en peligro la vida y tarden en sanar más de 15 días', 4, 0, 0),
(56, 'Lesiones que no pongan en peligro la vida y tarden en sanar menos de 15 días', 4, 444, 31),
(57, 'Lesiones que pongan en peligro la vida', 4, 445, 31),
(58, 'Lesiones que provoquen perturbación de órganos, el uso de la palabra o alguna de las facultades mentales', 4, 446, 31),
(59, 'Lesiones simples', 4, 449, 31),
(60, 'Abandono de atropellado', 5, 2, 47),
(61, 'Abandono de cónyuge, concubina o concubinario', 5, 3, 30),
(62, 'Abandono de familiares', 5, 4, 30),
(63, 'Abandono de hijos o cónyuge', 5, 7, 30),
(64, 'Abandono de incapaz por incumplimiento del deber jurídico de cuidarlo', 5, 8, 30),
(65, 'Abandono de menores o incapaces', 5, 10, 43),
(66, 'Abandono de mujer gestante en situación crítica', 5, 9, 43),
(67, 'Abandono de persona', 5, 11, 43),
(68, 'Abandono de persona atropellada', 5, 12, 47),
(69, 'Abandono de personas por conductor o jinete', 5, 14, 47),
(70, 'Abandono de personas por omisión de auxilio o aviso', 5, 13, 43),
(71, 'Ataque peligroso', 5, 102, 47),
(72, 'Atentados a la integridad de las personas', 5, 105, 47),
(73, 'Auxilio o inducción al suicidio', 5, 117, 47),
(74, 'Ayuda al suicidio', 5, 118, 47),
(75, 'Contagio y propagación de enfermedades', 5, 157, 47),
(76, 'Esterilidad forzada', 5, 0, 0),
(77, 'Esterilidad provocada', 5, 294, 47),
(78, 'Eutanasia', 5, 298, 47),
(79, 'Fecundación a través de medios clínicos', 5, 343, 47),
(80, 'Golpes simples', 5, 360, 31),
(81, 'Golpes y otras violencias físicas', 5, 361, 31),
(82, 'Golpes y otras violencias físicas simples', 5, 362, 31),
(83, 'Inducción al suicidio', 5, 406, 47),
(84, 'Inducción y ayuda al suicidio', 5, 408, 47),
(85, 'Inseminación artificial indebida', 5, 414, 47),
(86, 'Instigación o ayuda al suicidio', 5, 419, 47),
(87, 'Manipulación genética', 5, 453, 47),
(88, 'Manipulación genética y de inseminación artificial indebida', 5, 454, 47),
(89, 'Omisión de auxilio', 5, 486, 47),
(90, 'Omisión de auxilio a lesionados', 5, 487, 47),
(91, 'Omisión de auxilio a personas atropelladas', 5, 488, 47),
(92, 'Omisión de auxilio a personas en peligro', 5, 489, 47),
(93, 'Omisión de auxilio médico en casos urgentes', 5, 490, 47),
(94, 'Omisión de cuidado', 5, 491, 30),
(95, 'Omisión de impedir un suicidio', 5, 495, 47),
(96, 'Operaciones quirúrgicas indebidas', 5, 499, 47),
(97, 'Otros delitos que atentan contra la vida y la integridad corporal', 5, 517, 47),
(98, 'Otros delitos que atentan contra la integridad corporal', 5, 511, 47),
(99, 'Peligro de contagio', 5, 534, 47),
(100, 'Peligro de contagio de nodriza', 5, 535, 47),
(101, 'Procreación asistida', 5, 564, 47),
(102, 'Privación de la libertad agravada contra menor de edad o mayor de sesenta años con violencia', 6, 0, 0),
(103, 'Privación de la libertad con fines sexuales', 6, 0, 0),
(104, 'Privación de la libertad laboral', 6, 558, 51),
(105, 'Privación de la libertad personal', 6, 559, 51),
(106, 'Privación ilegal de la libertad', 6, 560, 51),
(107, 'Privación ilegal de la libertad como medio de presión a servidores públicos', 6, 562, 51),
(108, 'Privación ilegal de la libertad con propósitos sexuales', 6, 563, 51),
(109, 'Privación ilegal de libertad calificada', 6, 561, 51),
(110, 'Robo de infante', 7, 635, 45),
(111, 'Tráfico de menores', 7, 682, 75),
(112, 'Tráfico de menores agravado sin autorización de quien ejerza la patria potestad', 7, 0, 0),
(113, 'Tráfico de menores incapaces', 7, 0, 0),
(114, 'Traslado indebido de niñas, niños o adolescentes de una institución asistencial', 7, 687, 75),
(115, 'Venta de niños, niñas y adolescentes', 7, 727, 75),
(116, 'Retención de menores o incapaces', 8, 0, 0),
(117, 'Retención de menores o incapaces agravado', 8, 0, 0),
(118, 'Retención y sustracción de menores o incapaces', 8, 615, 54),
(119, 'Sustracción de menores e incapaces', 8, 675, 54),
(120, 'Sustracción de menores o incapaces agravado', 8, 0, 0),
(121, 'Sustracción de menores por familiares', 8, 676, 54),
(122, 'Sustracción y tráfico de menores e incapaces', 8, 678, 54),
(123, 'Rapto', 9, 588, 53),
(124, 'Rapto con presunción de seducción', 9, 589, 53),
(125, 'Rapto equiparado', 9, 590, 53),
(126, 'Desaparición forzada de personas', 10, 249, 12),
(127, 'Desaparición forzada de personas agravado', 10, 0, 0),
(128, 'Desaparición forzada de personas por particular que por orden, autorización o con el apoyo de servidor público', 10, 0, 0),
(129, 'Secuestro', 11, 651, 70),
(130, 'Secuestro con propósito de obtener rescate', 12, 655, 71),
(131, 'Secuestro extorsivo', 12, 653, 73),
(132, 'Secuestro en calidad de rehén ', 13, 652, 71),
(133, 'Secuestro para causar daños', 14, 654, 74),
(134, 'Secuestro express', 15, 657, 72),
(135, 'Otro tipo de secuestros', 16, 525, 48),
(136, 'Secuestro equiparado por aportar o colaborar en su realización', 16, 656, 48),
(137, 'Secuestro simulado', 16, 658, 48),
(138, 'Simulación de secuestro', 16, 664, 48),
(139, 'Intermediación, colaboración, asesoría, intimación a la víctima y otros actos relacionados con la privación ilegal de la libertad y el secuestro', 17, 422, 41),
(140, 'Otros delitos que atentan contra la libertad personal', 17, 513, 45),
(141, 'Otros delitos que atentan contra la libertad personal con fines de lucro', 17, 514, 45),
(142, 'Otros delitos que atentan contra la libertad personal sin fines de lucro', 17, 515, 45),
(143, 'Personas desaparecidas o extraviadas', 17, 542, 45),
(144, 'Abuso sexual', 18, 43, 4),
(145, 'Abuso sexual de menores e incapaces', 18, 0, 0),
(146, 'Abuso sexual equiparado', 18, 44, 4),
(147, 'Abusos deshonestos', 18, 45, 4),
(148, 'Abusos deshonestos calificado', 18, 46, 4),
(149, 'Acoso sexual', 19, 53, 5),
(150, 'Hostigamiento sexual', 20, 378, 28),
(151, 'Violación', 21, 730, 82),
(152, 'Violación calificada', 22, 735, 82),
(153, 'Violación cometida por dos o más personas', 22, 0, 0),
(154, 'Violación cometida por ministros de culto religioso', 22, 0, 0),
(155, 'Violación cometida por servidor público o profesionista', 22, 0, 0),
(156, 'Violación conyugal', 22, 747, 82),
(157, 'Violación simple', 22, 761, 82),
(158, 'Violación con cualquier objeto o parte del cuerpo distinto al pene', 23, 0, 0),
(159, 'Violación con instrumento o parte del cuerpo distinto al miembro viril', 23, 0, 0),
(160, 'Violación equiparada', 23, 749, 83),
(161, 'Violación equiparada por introducir vía anal o vaginal cualquier instrumento distinto al miembro viril', 23, 0, 0),
(162, 'Violación equiparada por introducir vía anal o vaginal cualquier instrumento distinto al miembro viril contra menor e incapaz', 23, 0, 0),
(163, 'Violación impropia por instrumento o elemento distinto al natural', 23, 750, 83),
(164, 'Violación a persona incapaz', 24, 0, 0),
(165, 'Violación contra menor de edad', 24, 0, 0),
(166, 'Violación de impúber', 24, 0, 0),
(167, 'Violación equiparada a persona menor o incapaz', 24, 0, 0),
(168, 'Violación equiparada por realizar cópula con persona que no tenga la capacidad de comprender o resistir el hecho', 24, 0, 0),
(169, 'Violación impropia contra menores de edad', 24, 0, 0),
(170, 'Otro tipo de violación', 25, 0, 0),
(171, 'Violación en razón de parentesco', 25, 0, 0),
(172, 'Estupro', 26, 297, 20),
(173, 'Incesto', 27, 387, 29),
(174, 'Incesto equiparado', 27, 388, 29),
(175, 'Actos libidinosos', 28, 57, 46),
(176, 'Aprovechamiento sexual', 28, 91, 46),
(177, 'Asedio sexual', 28, 0, 0),
(178, 'Atentados al pudor', 28, 108, 46),
(179, 'Atentados al pudor impropio', 28, 109, 46),
(180, 'Ciberacoso sexual', 28, 0, 0),
(181, 'Exhibición pública obscena', 28, 304, 46),
(182, 'Exhibicionismo obsceno', 28, 303, 46),
(183, 'Exploración ginecológica por motivos deshonestos', 28, 306, 84),
(184, 'Impudicia', 28, 381, 46),
(185, 'Otros delitos que atentan contra la libertad y seguridad sexual', 28, 516, 46),
(186, 'Otros delitos sexuales con realización de cópula', 28, 519, 46),
(187, 'Otros delitos sexuales sin realización de cópula', 28, 520, 46),
(188, 'Realización de cópula por error o engaño', 28, 593, 46),
(189, 'Robo', 29, 622, 55),
(190, 'Robo con carácter temporal', 30, 633, 55),
(191, 'Robo equiparado de cosa propia', 30, 645, 55),
(192, 'Robo simple', 30, 647, 55),
(193, 'Robo a casa habitación', 31, 623, 56),
(194, 'Robo de vehículo automotor terrestre', 32, 640, 66),
(195, 'Robo equiparado de vehículo de motor', 32, 646, 66),
(196, 'Robo de autopartes', 33, 0, 0),
(197, 'Robo de partes de vehículo automotriz', 33, 631, 63),
(198, 'Robo a transeúnte en vía pública', 34, 629, 61),
(199, 'Robo a transeúnte en espacio abierto al público', 35, 628, 60),
(200, 'Robo a persona en un lugar privado', 36, 627, 59),
(201, 'Robo a transportista', 37, 630, 62),
(202, 'Robo en caminos o carreteras federales', 37, 0, 0),
(203, 'Robo en transporte público individual', 38, 643, 69),
(204, 'Robo en transporte público colectivo', 39, 642, 68),
(205, 'Robo en transporte particular', 40, 641, 67),
(206, 'Robo a institución bancaria', 41, 624, 57),
(207, 'Robo a local comercial o de servicios', 42, 626, 58),
(208, 'Robo a negocio', 42, 625, 58),
(209, 'Abigeato', 43, 17, 64),
(210, 'Abigeato equiparado', 43, 18, 64),
(211, 'Abigeato por apoderamiento de ganado bovino', 43, 20, 64),
(212, 'Abigeato y robo de animales de cría y explotación', 43, 21, 64),
(213, 'Robo de ganado', 43, 632, 64),
(214, 'Robo de maquinaria y equipo para actividades agropecuarias', 44, 636, 65),
(215, 'Robo de productos agropecuarios', 44, 637, 65),
(216, 'Robo de energía eléctrica', 45, 0, 0),
(217, 'Robo de energía eléctrica o de fluido', 45, 0, 0),
(218, 'Robo de fluido eléctrico', 45, 0, 0),
(219, 'Robo por aprovechamiento de energía eléctrica', 45, 0, 0),
(220, 'Otros robos', 46, 521, 49),
(221, 'Otros robos a unidad económica', 46, 522, 49),
(222, 'Otros robos contra las personas', 46, 523, 49),
(223, 'Otros robos distintos a los anteriores', 46, 524, 49),
(224, 'Robo con violencia, de noche o por dos o más personas', 46, 634, 55),
(225, 'Robo de embarcaciones', 46, 0, 0),
(226, 'Robo de material radioactivo, material nuclear, combustible nuclear, mineral radiactivo o fuente de radiación', 46, 0, 0),
(227, 'Robo de tarjetas o documentos para el pago de bienes y servicios o de información contenida en ellos', 46, 638, 49),
(228, 'Robo de uso', 46, 639, 55),
(229, 'Robo de vías, equipo ferroviario o sus partes', 46, 0, 0),
(230, 'Robo en contra del equipamiento inmobiliario urbano', 46, 0, 0),
(231, 'Robo en oficina recaudadora u otra en que se conserven valores', 46, 0, 0),
(232, 'Robo equiparado', 46, 644, 55),
(233, 'Sustracción de hidrocarburos y sus derivados ', 48, 0, 0),
(234, 'Aprovechamiento de hidrocarburos y sus derivados ', 49, 0, 0),
(235, 'Posesión ilícita de hidrocarburos y sus derivados ', 50, 0, 0),
(236, 'Otros delitos en materia de hidrocarburos y sus derivados', 51, 0, 0),
(237, 'Administración fraudulenta', 52, 61, 26),
(238, 'Administración indebida', 52, 62, 26),
(239, 'Fraude', 52, 349, 26),
(240, 'Fraude cuando exista entidad de propósito delictivo y se afecte a 3 o más sujetos pasivos', 52, 350, 26),
(241, 'Fraude de fraccionadores (fraccionarios)', 52, 351, 26),
(242, 'Fraude equiparado', 52, 352, 26),
(243, 'Fraude equiparado de servidores públicos', 52, 353, 15),
(244, 'Fraude específico', 52, 354, 26),
(245, 'Fraude específico por pago de salario inferior al mínimo general', 52, 355, 26),
(246, 'Fraude genérico', 52, 356, 26),
(247, 'Abuso de confianza', 53, 34, 3),
(248, 'Abuso de confianza (vehículo recibido en depósito)', 53, 35, 3),
(249, 'Abuso de confianza cuando exista entidad de propósito delictivo y se afecte a 3 o más sujetos pasivos', 53, 36, 3),
(250, 'Abuso de confianza de dueño depositario', 53, 37, 3),
(251, 'Abuso de confianza equiparado', 53, 38, 3),
(252, 'Abuso de confianza por hacer parecer como suyo un depósito que garantice la libertad caucional', 53, 0, 0),
(253, 'Abuso de confianza por no destinar al objeto de la operación concertada dinero, títulos o valores de alguna compraventa de inmueble', 53, 0, 0),
(254, 'Abuso de confianza por retención', 53, 39, 3),
(255, 'Extorsión', 54, 314, 22),
(256, 'Extorsión agravada si se utiliza como medio comisivo la vía telefónica, el correo electrónico o cualquier otro medio de comunicación electrónica', 55, 0, 0),
(257, 'Extorsión mediante cualquier vía de comunicación', 55, 0, 0),
(258, 'Extorsión por medio de comunicación electrónica o digital', 55, 0, 0),
(259, 'Extorsión utilizando medios de comunicación', 55, 0, 0),
(260, 'Extorsión a menor de dieciocho años de edad, o de persona que no tiene capacidad para comprender o resistir el hecho', 56, 0, 0),
(261, 'Extorsión equiparada', 56, 315, 22),
(262, 'Extorsión por sujeto calificado', 56, 316, 22),
(263, 'Otro tipo de extorsión', 56, 0, 0),
(264, 'Atentados a la estética urbana', 57, 104, 11),
(265, 'Daño culposo', 57, 0, 0),
(266, 'Daño en cosa propia en perjuicio de tercero', 57, 0, 0),
(267, 'Daño en la propiedad', 57, 204, 11),
(268, 'Daño en la propiedad ajena o propia en perjuicio de terceros', 57, 205, 11),
(269, 'Daño en las cosas', 57, 206, 11),
(270, 'Daño en las cosas culposo', 57, 207, 11),
(271, 'Daño en los bienes', 57, 208, 11),
(272, 'Daño en propiedad ajena', 57, 209, 11),
(273, 'Daños', 57, 211, 11),
(274, 'Daños agravados', 57, 202, 11),
(275, 'Estragos', 57, 296, 11),
(276, 'Figura típica del grafiti', 57, 347, 11),
(277, 'Incendios y otros estragos', 57, 386, 11),
(278, 'Aprovechamiento indebido de bienes ejidales o comunales', 58, 89, 16),
(279, 'Despojo', 58, 257, 16),
(280, 'Despojo de cosas inmuebles o de aguas', 58, 258, 16),
(281, 'Despojo equiparado', 58, 259, 16),
(282, 'Abigeato equiparado por adquisición, posesión, transporte o sacrificio, respecto de ganado bovino', 59, 19, 64),
(283, 'Actos ilícitos con tarjetas o documentos utilizados para el pago de bienes y servicios', 59, 55, 24),
(284, 'Adquisición de un vehículo automotor robado', 59, 64, 19),
(285, 'Adquisición ilegítima de bienes materia de un delito o de una infracción penal', 59, 65, 19),
(286, 'Adquisición y comercialización del producto obtenido de robo o abigeato', 59, 67, 19),
(287, 'Aprovechamiento ilícito de fondos', 59, 87, 19),
(288, 'Comercialización habitual con objetos robados', 59, 133, 19),
(289, 'Del pillaje', 59, 220, 43),
(290, 'Desmantelar algún o algunos vehículos robados o comercializar conjunta o separadamente sus partes', 59, 252, 19),
(291, 'Desmantelar, enajenar, detentar, poseer, trasladar, comercializar u utilizar vehículos robados', 59, 253, 19),
(292, 'Destrucción de medios de protección para evitar delitos contra la propiedad', 59, 261, 44),
(293, 'Detentar, poseer, custodiar, alterar o modificar de cualquier manera la documentación que acredite la propiedad de un vehículo robado', 59, 265, 19),
(294, 'Insolvencia fraudulenta en perjuicio de acreedores', 59, 416, 44),
(295, 'Otros delitos que atentan contra el patrimonio', 59, 512, 44),
(296, 'Poseer, enajenar, traficar, adquirir o recibir los instrumentos, objetos o productos de robo', 59, 551, 19),
(297, 'Transferencia ilegal de bienes sujetos a régimen ejidal o comunal', 59, 684, 44),
(298, 'Transporte del producto obtenido de robo o abigeato', 59, 685, 64),
(299, 'Trasladar él o los vehículos robados a otra entidad federativa o al extranjero', 59, 686, 44),
(300, 'Uso de vehículo con placas robadas', 59, 702, 44),
(301, 'Usura', 59, 710, 44),
(302, 'Utilizar él o los vehículos robados en la comisión de otro u otros delitos', 59, 717, 19),
(303, 'Venta o promesa de venta indebida', 59, 729, 44),
(304, 'Violencia de género en el ámbito familiar', 60, 753, 84),
(305, 'Violencia familiar', 60, 759, 85),
(306, 'Violencia familiar equiparada', 60, 760, 85),
(307, 'Incumplimiento de las obligaciones alimentarias', 61, 395, 30),
(308, 'Incumplimiento de las obligaciones de asistencia familiar', 61, 396, 30),
(309, 'Incumplimiento de obligaciones básicas de asistencia familiar', 61, 397, 30),
(310, 'Incumplimiento de obligaciones familiares', 61, 398, 30),
(311, 'Incumplimiento o retardo en la obligación de informar sobre los ingresos de los deudores alimentarios', 61, 402, 30),
(312, 'Insolvencia dolosa para cumplir las obligaciones alimentarias', 61, 415, 30),
(313, 'Adopción ilegal', 62, 63, 43),
(314, 'Adulterio', 62, 70, 40),
(315, 'Bigamia', 62, 120, 40),
(316, 'Maltrato a infante', 62, 451, 47),
(317, 'Matrimonios ilegales', 62, 456, 43),
(318, 'Negativa del derecho de convivencia entre padres e hijos', 62, 471, 43),
(319, 'Otros delitos contra la familia', 62, 507, 40),
(320, 'Substitución y ocultación de infante', 62, 667, 75),
(321, 'Suposición, supresión y ocultación de infante', 62, 669, 75),
(322, 'Sustitución de menor', 62, 673, 75),
(323, 'Corrupción de menores', 64, 196, 10),
(324, 'Corrupción de menores e incapaces', 64, 197, 10),
(325, 'Corrupción de menores e incapaces doloso cuando se empleen en lugares nocivos para su desarrollo', 64, 0, 0),
(326, 'Corrupción de menores e incapaces doloso cuando se induzca a la práctica de exhibicionismo corporal o de carácter sexual', 64, 0, 0),
(327, 'Corrupción de menores e incapaces doloso mediante la inducción a la práctica de mendicidad, ebriedad, toxicomanía o prostitución', 64, 0, 0),
(328, 'Corrupción de menores e incapaces por emplearlos en lugares donde se dañe su desarrollo', 64, 0, 0),
(329, 'Corrupción de menores o de personas privadas de la voluntad ', 64, 198, 10),
(330, 'Corrupción de menores y de quienes no tienen la capacidad para comprender el significado del hecho', 64, 199, 10),
(331, 'Corrupción y explotación de menores e incapaces', 64, 200, 10),
(332, 'Mantener en corrupción a un menor o incapaz', 64, 455, 10),
(333, 'Permitir el acceso a menores o incapaces a exhibiciones o espectáculos obscenos', 64, 540, 10),
(334, 'Prostitución sexual de menores', 65, 575, 52),
(335, 'Pornografía infantil', 66, 545, 50),
(336, 'Turismo sexual con personas menores de edad o personas que no tengan la capacidad para comprender el significado del hecho', 67, 694, 81),
(337, 'Pederastia', 68, 0, 0),
(338, 'Contra el libre desarrollo de la personalidad', 69, 166, 8),
(339, 'Empleo de menores e incapaces en centros de vicios y lugares de riesgo', 69, 280, 38),
(340, 'Empleo de menores en cantinas, tabernas y centros de vicio', 69, 281, 38),
(341, 'Explotación e inducción a la mendicidad', 69, 308, 38),
(342, 'Explotación laboral de menores o incapaces', 69, 309, 38),
(343, 'Exposición de incapaces', 69, 310, 38),
(344, 'Exposición de infantes', 69, 311, 38),
(345, 'Exposición de menores', 69, 312, 38),
(346, 'Incitación a la prostitución', 69, 390, 38),
(347, 'Inducción a la mendicidad', 69, 405, 38),
(348, 'Otros delitos contra el libre desarrollo de la personalidad', 69, 506, 38),
(349, 'Permitir o propiciar en menores e incapaces el consumo de substancias tóxicas o alucinógenos', 69, 541, 38),
(350, 'Pornografía de persona privada de la voluntad', 69, 544, 38),
(351, 'Trata de personas', 70, 688, 76),
(352, 'Trata de personas con fines de explotación para generar materiales de carácter lascivo o sexual para comercio, distribución, exposición o circulación', 71, 0, 0),
(353, 'Trata de personas con fines de explotación para realizar actos de pornografía', 71, 0, 0),
(354, 'Trata de personas con fines de explotación para realizar trabajos de servicios sexuales', 71, 0, 0),
(355, 'Trata de personas con fines de explotación sexual', 71, 689, 77),
(356, 'Trata de personas con fines de trabajo o servicios forzados', 72, 690, 78),
(357, 'Trata de personas con fines de tráfico de órganos', 73, 691, 79),
(358, 'Trata de personas con fines de esclavitud', 74, 0, 0),
(359, 'Trata de personas con otros fines de explotación', 74, 692, 80),
(360, 'Trata de personas menores de edad o de quienes no tienen capacidad para comprender el significado del hecho', 74, 693, 77),
(361, 'Violencia de género económica o patrimonial', 75, 751, 84),
(362, 'Violencia de género en el ámbito educativo', 75, 752, 84),
(363, 'Violencia de género física o psíquica', 75, 754, 84),
(364, 'Violencia de género institucional', 75, 755, 84),
(365, 'Violencia de género laboral', 75, 756, 84),
(366, 'Violencia de género obstétrica', 75, 757, 84),
(367, 'Contra la dignidad de las personas', 76, 175, 17),
(368, 'Contra la dignidad e igualdad de las personas', 76, 176, 17),
(369, 'Discriminación', 76, 268, 17),
(370, 'Concertar, permitir o encubrir el comercio carnal de menores de edad', 77, 147, 38),
(371, 'Lenocinio', 77, 428, 32),
(372, 'Lenocinio mediante beneficio económico', 77, 429, 32),
(373, 'Ataques a la libertad de reunión y de expresión', 78, 103, 43),
(374, 'Distribución o exposición pública de objetos obscenos y pornografía', 78, 271, 46),
(375, 'Exposición pública de pornografía', 78, 313, 46),
(376, 'Otros delitos contra la sociedad', 78, 508, 42),
(377, 'Pornografía', 78, 543, 38),
(378, 'Proporcionar inmuebles destinados al comercio carnal', 78, 574, 38),
(379, 'Ultrajes a la moral pública', 78, 698, 4),
(380, 'Delitos contra la salud relacionados con narcóticos en su modalidad de narcomenudeo', 79, 461, 33),
(381, 'Posesión simple de narcóticos en su modalidad de narcomenudeo', 80, 463, 35),
(382, 'Posesión con fines de comercio o suministro de narcóticos en su modalidad de narcomenudeo', 81, 462, 34),
(383, 'Comercio de narcóticos en su modalidad de narcomenudeo', 82, 464, 36),
(384, 'Suministro de narcóticos en su modalidad de narcomenudeo', 83, 0, 0),
(385, 'Otros delitos contra la salud relacionados con narcóticos en su modalidad de narcomenudeo', 84, 465, 37),
(386, 'Producción de narcóticos ', 86, 0, 0),
(387, 'Transporte de narcóticos ', 87, 0, 0),
(388, 'Tráfico de narcóticos ', 88, 0, 0),
(389, 'Comercio de narcóticos ', 89, 0, 0),
(390, 'Suministro de narcóticos ', 90, 0, 0),
(391, 'Posesión de narcóticos ', 91, 0, 0),
(392, 'Delitos federales contra la salud por administrar a otra persona algún narcótico', 92, 0, 0),
(393, 'Delitos federales contra la salud por aportar recursos económicos o de cualquier especie, o colaborar de cualquier manera al financiamiento, supervisión o fomento para posibilitar la ejecución de los mismos', 92, 0, 0),
(394, 'Delitos federales contra la salud por inducir o auxiliar a otro para que consuma narcóticos', 92, 0, 0),
(395, 'Delitos federales contra la salud por realizar actos de publicidad o propaganda, para que se consuma narcóticos ', 92, 0, 0),
(396, 'Delitos federales contra la salud por sembrar, cultivar o cosechar plantas de marihuana, amapola, hongos alucinógenos, peyote o cualquier otro vegetal que produzca efectos similares, por cuenta propia o con financiamiento de terceros', 92, 0, 0),
(397, 'Otros delitos federales contra la salud relacionados con narcóticos', 92, 0, 0),
(398, 'Evasión de presos', 93, 299, 21),
(399, 'Evasión de presos cometido por familiares, con uso de violencia', 93, 300, 21),
(400, 'Liberación de presos', 93, 450, 21),
(401, 'Preso que obre en concierto con otros y se fugué alguno de ellos o ejerciere violencia en las personas', 93, 554, 21),
(402, 'Conductas prohibidas con relación a ciertas armas', 94, 152, 1),
(403, 'Delitos en materia de armas y objetos prohibidos', 94, 92, 1),
(404, 'Portación de armas prohibidas', 94, 546, 1),
(405, 'Portación, fabricación e importación de objetos aptos para agredir', 94, 547, 1),
(406, 'Portación, fabricación y acopio de armas prohibidas', 94, 548, 1),
(407, 'Portación, fabricación, importación o acopio de instrumentos aptos para agredir', 94, 549, 1),
(408, 'Portación, tráfico y acopio de armas prohibidas', 94, 550, 1),
(409, 'Delincuencia organizada', 95, 221, 43),
(410, 'Portación ilícita de armas sancionado por la Ley Federal de Armas de Fuego y Explosivos', 97, 0, 0),
(411, 'Posesión ilícita de armas, cartuchos y cargadores sancionado por la Ley Federal de Armas de Fuego y Explosivos', 98, 0, 0),
(412, 'Acopio ilícito de armas sancionado por la Ley Federal de Armas de Fuego y Explosivos', 99, 0, 0),
(413, 'Tráfico ilícito de armas, explosivos y otros materiales destructivos sancionado por la Ley Federal de Armas de Fuego y Explosivos', 100, 0, 0),
(414, 'Otros delitos en materia de armas, explosivos y otros materiales destructivos', 101, 0, 0),
(415, 'Asociación delictuosa', 102, 99, 43),
(416, 'Figura típica de banda o pandilla criminal', 102, 345, 43),
(417, 'Pandillerismo', 102, 527, 41),
(418, 'Terrorismo', 103, 679, 41),
(419, 'Actos ilícitos con uniformes, divisas y otros distintivos', 104, 56, 43),
(420, 'Afectación de la seguridad colectiva por incendio, explosión o inundación', 104, 72, 43),
(421, 'Asalto', 104, 93, 55),
(422, 'Asalto en despoblado o paraje solitario', 104, 94, 55),
(423, 'Asalto tumultuario a una población', 104, 95, 43),
(424, 'Asonada o motín', 104, 96, 41),
(425, 'Atentados contra la paz y la integridad corporal y patrimonial del Estado', 104, 113, 41),
(426, 'Atentados contra la soberanía del Estado', 104, 114, 41),
(427, 'Comunicación falsa de actos de terrorismo', 104, 145, 41),
(428, 'Con motivo del tránsito de vehículos', 104, 146, 43),
(429, 'Conducción de vehículos de motor en estado de ebriedad o bajo el influjo de narcóticos u otras substancias que produzcan efectos similares', 104, 150, 43),
(430, 'Conducción punible de vehículos', 104, 151, 43),
(431, 'Conspiración', 104, 154, 43),
(432, 'Conspiración criminal', 104, 155, 43),
(433, 'Conspiración política', 104, 156, 43),
(434, 'Contra la constitución', 104, 174, 43),
(435, 'Contra la seguridad de la comunidad', 104, 189, 41),
(436, 'Contra la seguridad en un centro de detención', 104, 191, 41),
(437, 'Contra la seguridad vial y de los medios de transporte', 104, 192, 41),
(438, 'De tránsito ejecutados por manejadores de vehículos o autoridades de tránsito', 104, 218, 43),
(439, 'Delitos cometidos por rebeldes o funcionarios fuera de combate', 104, 228, 41),
(440, 'Delitos contra el funcionamiento del Sistema de Seguridad Pública', 104, 235, 41),
(441, 'Delitos contra la integridad territorial del Estado', 104, 233, 41),
(442, 'Delitos contra la seguridad del tránsito de vehículos', 104, 234, 41),
(443, 'Delitos emergentes con motivo de la rebelión', 104, 242, 41),
(444, 'Disparo de arma de fuego', 104, 269, 1),
(445, 'Favorecer el quebrantamiento de penas no privativas de libertad y medidas de seguridad', 104, 342, 41),
(446, 'Incitación y auxilio en una rebelión', 104, 391, 41),
(447, 'Incumplimiento de la obligación de proporcionar información a los Sistemas de Seguridad Pública', 104, 394, 41),
(448, 'Invitación a rebelión', 104, 427, 41),
(449, 'Motín o Asonada', 104, 459, 41),
(450, 'Movilización de sistemas de emergencia', 104, 460, 41),
(451, 'Obtención y uso indebido de información sobre actividades de instituciones de seguridad pública, procuración y la administración de justicia', 104, 480, 41),
(452, 'Otros delitos contra la seguridad pública y la seguridad del Estado', 104, 0, 0),
(453, 'Preservación del lugar de los hechos', 104, 553, 41),
(454, 'Quebrantamiento de arraigo judicial', 104, 577, 43),
(455, 'Quebrantamiento de confinamiento', 104, 578, 43),
(456, 'Quebrantamiento de medidas', 104, 579, 43),
(457, 'Quebrantamiento de penas no privativas de libertad y medidas de seguridad', 104, 580, 43),
(458, 'Quebrantamiento de sanción', 104, 581, 43),
(459, 'Quebrantamiento de sanción (fuga de reo)', 104, 582, 21),
(460, 'Quebrantamiento de sanción (inhabilitado que quebrante su condena)', 104, 583, 43),
(461, 'Quebrantamiento de sanción (sentenciado a confinamiento)', 104, 584, 43),
(462, 'Rebelión', 104, 595, 41),
(463, 'Rebelión cometida por extranjeros', 104, 596, 41),
(464, 'Rebelión contra la Constitución o Instituciones', 104, 597, 41),
(465, 'Rebelión equiparada', 104, 598, 41),
(466, 'Sabotaje', 104, 648, 41),
(467, 'Sedición', 104, 660, 41),
(468, 'Sedición tumultuaria', 104, 661, 41),
(469, 'Ultraje a las insignias públicas', 104, 695, 39),
(470, 'Ultrajes a instituciones públicas', 104, 696, 14),
(471, 'Ultrajes a la autoridad', 104, 697, 14),
(472, 'Uso indebido de condecoraciones, uniformes, grados jerárquicos, divisas, insignias y siglas', 104, 705, 39),
(473, 'Uso indebido de uniformes, distintivos o condecoraciones', 104, 709, 39),
(474, 'Uso indebido de uniformes, emblemas, símbolos, credenciales, placas o gafetes oficiales', 104, 704, 39),
(475, 'Usurpación funciones de seguridad pública', 104, 0, 0),
(476, 'Ejercicio indebido de atribuciones y facultades del servicio o función pública', 106, 274, 15),
(477, 'Ejercicio indebido o abandono del servicio público', 106, 276, 15),
(478, 'Abuso contra subalterno', 107, 29, 14),
(479, 'Abuso de autoridad', 107, 30, 15),
(480, 'Abuso de autoridad con contenido patrimonial', 107, 31, 15),
(481, 'Abuso de autoridad o incumplimiento de un deber legal', 107, 32, 15),
(482, 'Abuso de autoridad y otros delitos oficiales', 107, 33, 15),
(483, 'Abuso de autoridad y uso ilegal de la fuerza pública', 107, 0, 0),
(484, 'Abuso de funciones públicas', 107, 40, 15),
(485, 'Cohecho', 108, 128, 14),
(486, 'Cohecho a servidores públicos extranjeros', 108, 129, 14),
(487, 'Cohecho cometido por particulares', 108, 130, 14),
(488, 'Peculado', 109, 531, 15),
(489, 'Peculado impropio', 109, 532, 15),
(490, 'Adquisición u ocultación indebida de recursos públicos', 110, 66, 15),
(491, 'Enriquecimiento ilícito', 110, 292, 15),
(492, 'Abuso de otorgamiento indebido de plazas, comisiones, contratos o licencias', 111, 42, 43),
(493, 'Ejercicio abusivo de funciones', 111, 272, 15),
(494, 'Tráfico de influencia', 112, 681, 15),
(495, 'Abandono de funciones', 113, 5, 15),
(496, 'Abandono de funciones públicas', 113, 6, 15),
(497, 'Abandono del servicio público', 113, 15, 15),
(498, 'Aceptación indebida de empleo, cargo, comisión, contratos o licencias', 113, 51, 39),
(499, 'Aprovechamiento ilícito del poder', 113, 88, 43),
(500, 'Asignación de funciones a persona no certificada y registrada en los Sistemas de Seguridad Pública', 113, 98, 39),
(501, 'Autorizar el nombramiento en el servicio público de una persona inhabilitada para el cargo', 113, 116, 39),
(502, 'Coacción', 113, 123, 7),
(503, 'Coacción a la autoridad', 113, 124, 14),
(504, 'Coacción sobre autoridad pública equiparada a la resistencia', 113, 125, 14),
(505, 'Coalición', 113, 126, 43),
(506, 'Coalición de servidores públicos', 113, 127, 15),
(507, 'Concusión', 113, 149, 15),
(508, 'Intimidación', 113, 424, 7),
(509, 'Intimidación por parte de servidor de público', 113, 0, 0),
(510, 'Negligencia en el desempeño de función o cargo', 113, 472, 15),
(511, 'Otorgamiento indebido de empleo, cargo, comisión, contratos o licencias', 113, 503, 39),
(512, 'Otros delitos por hechos de corrupción', 113, 0, 0),
(513, 'Uso de influencias', 113, 700, 15),
(514, 'Uso ilegal de atribuciones y facultades', 113, 0, 0),
(515, 'Uso indebido de atribuciones y facultades', 113, 703, 43),
(516, 'Delitos contra la administración de justicia', 114, 173, 14),
(517, 'Delitos en materia de amparo', 115, 0, 0),
(518, 'Delitos relacionados al juicio de amparo', 115, 0, 0),
(519, 'Abandonar la defensa de un cliente o negocio sin motivo justificado y causando daño', 116, 1, 43),
(520, 'Aceptar el patrocinio de un contendiente y admitir después el de la parte contraria', 116, 52, 43),
(521, 'Alteración de la escena del delito', 116, 79, 43),
(522, 'Alteración u ocultación de constancias', 116, 78, 43),
(523, 'Alterar pruebas y presentarlas en juicio con el fin de obtener sentencia, resolución o acto administrativo contrario a la ley', 116, 81, 43),
(524, 'Aprehensión ilegal', 116, 86, 43),
(525, 'Asesoría ilegitima de litigantes', 116, 97, 43),
(526, 'Cometidos por servidores públicos de la administración de justicia', 116, 142, 15),
(527, 'Concretarse a aceptar la defensa y únicamente solicitar la libertad caucional sin promover más pruebas ni dirigir la defensa', 116, 148, 43),
(528, 'Contra el buen despacho de la administración', 116, 161, 43),
(529, 'Delitos cometidos contra la procuración y administración de justicia', 116, 222, 43),
(530, 'Delitos cometidos en el ámbito de la ejecución penal por funcionarios públicos', 116, 223, 15),
(531, 'Delitos de abogados, defensores y litigantes', 116, 237, 43),
(532, 'Denegación de justicia', 116, 245, 43),
(533, 'Desacato', 116, 247, 43),
(534, 'Desobediencia a mandato de arraigo domiciliario', 116, 254, 43),
(535, 'Desobediencia a un mandato de autoridad ministerial, judicial o penitenciaria', 116, 255, 14),
(536, 'Desobediencia de particulares', 116, 256, 43),
(537, 'Detención y prisión preventiva ilegítima', 116, 264, 43),
(538, 'Ejercicio arbitrario del propio derecho', 116, 273, 43),
(539, 'Ejercicio indebido o ilegal del propio derecho', 116, 275, 43),
(540, 'Ejercitar acción u oponer excepción en contra de otro, fundándose en documentos falsos o sin valor, o en testigos falsos', 116, 277, 23),
(541, 'Fraude procesal', 116, 357, 43),
(542, 'Función persecutoria y judicial indebida', 116, 358, 43),
(543, 'Impedir la aportación de pruebas relativas a la comisión de un delito', 116, 379, 43),
(544, 'Imposición forzada de un acto ilegal', 116, 380, 43),
(545, 'Incumplimiento de un deber legal', 116, 400, 43),
(546, 'Negarse o reincidencia en negarse a tomar protesta de ley o declarar ante la autoridad', 116, 470, 43),
(547, 'Negociaciones ilícitas', 116, 473, 43),
(548, 'Negociaciones indebidas', 116, 474, 43),
(549, 'Obstrucción a la justicia', 116, 481, 43),
(550, 'Obstrucción a la justicia por omisión de denuncia', 116, 482, 43),
(551, 'Obstrucción de la justicia', 116, 478, 43),
(552, 'Omisión de denuncia al presumir que determinados bienes son producto del delito de secuestro', 116, 492, 47),
(553, 'Omisión de información por parte de elementos policiales, tratándose del delito de secuestro', 116, 496, 48),
(554, 'Orden de aprehensión ilegítima', 116, 501, 43),
(555, 'Otros delitos contra la administración de justicia', 116, 0, 0),
(556, 'Pedir términos para probar lo que notoriamente no puede probarse o no ha de aprovechar su parte', 116, 533, 43),
(557, 'Prevaricación', 116, 556, 43),
(558, 'Prevaricación agravada en resoluciones de fondo', 116, 557, 43),
(559, 'Promover artículos o incidentes que motiven la suspensión del juicio o recursos manifiestamente improcedentes o de cualquiera otra manera procurar dilaciones que sean notoriamente ilegales', 116, 572, 43),
(560, 'Resistencia de particulares', 116, 601, 43),
(561, 'Resistencia de particulares empleando la fuerza o la amenaza', 116, 602, 43),
(562, 'Responsabilidad profesional de abogados, defensores o litigantes por abandonar una defensa o negocio, sin motivo justificado', 116, 0, 0),
(563, 'Retardo ilegítimo de la sujeción o no sujeción a proceso', 116, 609, 43),
(564, 'Retardo ilegítimo del auto de formal prisión, la sujeción a proceso o no sujeción a proceso', 116, 610, 43),
(565, 'Retardo ilegítimo en la entrega de un detenido', 116, 611, 43),
(566, 'Retractación falsa de traductor, perito o testigo', 116, 616, 43),
(567, 'Servidor público que omita informar sobre la comisión de un delito', 116, 662, 15),
(568, 'Simulación de actos jurídicos, judiciales o de cualquier otro orden', 116, 659, 43),
(569, 'Simulación de existencia de pruebas', 116, 663, 43),
(570, 'Simular un acto jurídico, o un acto o escrito judicial con el fin de obtener sentencia, resolución o acto administrativo contrario a la ley', 116, 665, 43),
(571, 'Sustracción, destrucción, alteración o daño de actuaciones u objetos', 116, 677, 43),
(572, 'Violación a las órdenes de protección', 116, 733, 43),
(573, 'Violación de fuero', 116, 739, 43),
(574, 'Cometidos por servidores públicos en agravio de la hacienda pública estatal o municipal y de organismos del sector auxiliar', 117, 143, 15),
(575, 'Defraudación fiscal', 117, 219, 43),
(576, 'Delitos contra la hacienda pública', 117, 236, 43),
(577, 'Delitos de contrabando', 117, 0, 0),
(578, 'Delitos en materia fiscal', 117, 0, 0),
(579, 'Exacción ilegal', 117, 301, 43),
(580, 'Expedir, adquirir o enajenar comprobantes fiscales que amparen operaciones inexistentes, falsas o actos jurídicos simulados (expedición de comprobantes fiscales falsos)', 117, 0, 0),
(581, 'Obstrucción al cobro de impuestos, o a la ejecución de resoluciones o de omisión', 117, 483, 43),
(582, 'Ocultamiento de algún delito cometido por los servidores públicos de la hacienda pública estatal, municipal y de organismos del sector auxiliar', 117, 0, 0),
(583, 'Simulación de actos fiscales', 117, 0, 0),
(584, 'Abuso de funciones con relación a elecciones', 118, 41, 18),
(585, 'Actos violatorios de la ley para alterar resultados de elección', 118, 58, 18),
(586, 'Afectación a la certeza de la elección', 118, 71, 18),
(587, 'Alteración del registro federal o estatal de electores', 118, 77, 18),
(588, 'Apertura indebida de paquete electoral', 118, 83, 18),
(589, 'Apoderamiento de casilla, ánforas o boletas', 118, 84, 18),
(590, 'Atentados al sistema de elección popular', 118, 110, 18),
(591, 'Atentados al sistema de votación', 118, 111, 18),
(592, 'Cometidos por candidatos', 118, 134, 18),
(593, 'Cometidos por funcionarios partidistas o candidatos', 118, 136, 18),
(594, 'Cometidos por los ciudadanos en elecciones', 118, 137, 18),
(595, 'Cometidos por los funcionarios electorales', 118, 138, 18),
(596, 'Cometidos por representantes de partido', 118, 141, 18),
(597, 'Contra el registro nacional o estatal de ciudadanos', 118, 169, 18),
(598, 'De los encuestadores electorales', 118, 216, 18),
(599, 'De los observadores electorales', 118, 217, 18),
(600, 'Delitos cometidos por funcionarios electorales', 118, 225, 18),
(601, 'Delitos cometidos por los servidores públicos en materia electoral', 118, 226, 18),
(602, 'Delitos de funcionarios electorales', 118, 239, 18),
(603, 'Delitos electorales', 118, 238, 18),
(604, 'Delitos electorales cometidos por los ciudadanos', 118, 240, 18),
(605, 'Delitos electorales cometidos por servidores públicos', 118, 241, 18),
(606, 'Destrucción de propaganda política', 118, 262, 18),
(607, 'En materia electoral (por los ciudadanos)', 118, 283, 18),
(608, 'Exceso en gastos autorizados para la campaña', 118, 302, 18),
(609, 'Figuras típicas agravadas de delitos de funcionarios electorales', 118, 346, 18),
(610, 'Inducción al voto', 118, 407, 18),
(611, 'Introducción, substitución, destrucción o alteración de documentos electorales', 118, 426, 18),
(612, 'Negativa a desempeño de función electoral', 118, 469, 18),
(613, 'No desempeño del cargo por representantes populares electos', 118, 475, 18),
(614, 'Promoción y coparticipación en conductas ilícitas de funcionarios públicos', 118, 571, 18),
(615, 'Propiciar la instalación ilegal de casilla o usurpación de funciones electorales', 118, 573, 18),
(616, 'Sanción y figura típica de negativa a desempeño de función electoral', 118, 650, 18),
(617, 'Aprovechamiento indebido de información reservada', 119, 90, 39),
(618, 'Cometidos por particulares en relación con servidores públicos', 119, 140, 14),
(619, 'Conocer o copiar información de alguna dependencia pública por persona no autorizada', 119, 153, 39),
(620, 'Contra el servicio público', 119, 170, 13),
(621, 'Contra funcionarios públicos', 119, 172, 14),
(622, 'Contra la infraestructura hidráulica', 119, 182, 9),
(623, 'Contra la seguridad en los medios informativos cometidos en perjuicio de una entidad pública', 119, 188, 39),
(624, 'Contra servidores públicos', 119, 194, 14),
(625, 'Copiar, transmitir o imprimir indebidamente información de alguna dependencia pública por persona autorizada', 119, 195, 39),
(626, 'Delitos cometidos en el desempeño de funciones administrativas', 119, 224, 15),
(627, 'Delitos contra funcionarios públicos', 119, 231, 14),
(628, 'Desacato por servidor público', 119, 248, 15),
(629, 'Desempeño irregular de la función publica', 119, 251, 15),
(630, 'Destrucción total o parcial de una nave, aeronave u otro vehículo de servicio público federal o local', 119, 263, 39),
(631, 'Distracción de recursos públicos', 119, 270, 15),
(632, 'Grabar o manufacturar, sin autorización del Congreso del Estado, matrices, clichés o negativos', 119, 363, 24),
(633, 'Incompatibilidad de labores', 119, 392, 15),
(634, 'Incumplimiento de funciones públicas', 119, 393, 15),
(635, 'Infidelidad en la custodia de documentos (cometido por servidores públicos)', 119, 410, 15),
(636, 'Insultos a la autoridad', 119, 421, 14),
(637, 'Negación del servicio público', 119, 466, 15),
(638, 'Ocupación ilegal de edificios e inmuebles destinados a un servicio público', 119, 485, 43),
(639, 'Oposición a que se efectué alguna obra o trabajo público', 119, 500, 43),
(640, 'Otorgamiento indebido de identificaciones', 119, 504, 39),
(641, 'Otros delitos contra la administración del Estado', 119, 0, 0),
(642, 'Patrimoniales de los servidores públicos', 119, 529, 15),
(643, 'Quebrantamiento de sellos', 119, 585, 43),
(644, 'Quebrantamiento de sellos en un negocio civil', 119, 586, 43),
(645, 'Quebrantamiento de sellos equiparado', 119, 587, 43),
(646, 'Responsabilidad de los directores responsables de obra o corresponsables', 119, 603, 43),
(647, 'Usurpación de funciones públicas', 119, 711, 39),
(648, 'Violación de sellos', 119, 746, 43),
(649, 'Amenazas', 120, 82, 7),
(650, 'Amenazas agravadas', 120, 0, 0),
(651, 'Allanamiento de morada', 121, 74, 6),
(652, 'Allanamiento de morada en establecimiento público cerrado', 121, 75, 6),
(653, 'Acusación o denuncias falsas', 122, 60, 23),
(654, 'Alegar a sabiendas hechos falsos', 122, 73, 23),
(655, 'Falsas denuncias, querellas o incriminaciones', 122, 339, 23),
(656, 'Falsedad', 122, 0, 0),
(657, 'Falsedad ante autoridades no judiciales', 122, 318, 23),
(658, 'Falsedad ante la autoridad o fedatario público', 122, 319, 23),
(659, 'Falsedad de los servidores públicos', 122, 320, 23),
(660, 'Falsedad en declaraciones', 122, 321, 23),
(661, 'Falsedad en declaraciones judiciales', 122, 322, 23),
(662, 'Falsedad en informes dados a una autoridad distinta de la judicial', 122, 323, 23),
(663, 'Falsedad por variación de nombre o domicilio cometido por particulares', 122, 723, 23),
(664, 'Falsedad por variación de nombre, domicilio o nacionalidad', 122, 720, 23),
(665, 'Falsedad por variación del nombre cometido por la autoridad', 122, 719, 23),
(666, 'Falsedad por variación del nombre o del domicilio', 122, 721, 23),
(667, 'Falso testimonio', 122, 340, 23),
(668, 'Faltar a la verdad en perjuicio de otro', 122, 341, 23),
(669, 'Imputación de hechos falsos y simulación de pruebas', 122, 382, 23),
(670, 'Imputaciones falsas', 122, 383, 23),
(671, 'Imputar dolosamente la comisión de delitos a los trabajadores, para eludir el cumplimiento de obligaciones patronales', 122, 384, 23),
(672, 'Perjurio o falsedad en declaraciones', 122, 539, 23),
(673, 'Presentación de denuncias o querellas falsas', 122, 552, 23),
(674, 'Soborno a testigo, perito o intérprete para que se conduzca con falsedad o presentación de testigos falsos', 122, 666, 23),
(675, 'Variación u ocultación de nombre o domicilio', 122, 722, 23),
(676, 'Elaboración indebida de placas, engomados y documentos de identificación de vehículos automotores', 123, 279, 24),
(677, 'Elaboración y alteración de documentos oficiales de identificación de vehículos automotores', 123, 278, 24),
(678, 'Falsificación', 123, 324, 24),
(679, 'Falsificación de acciones y otros documentos de crédito público', 123, 325, 24),
(680, 'Falsificación de certificaciones', 123, 326, 24),
(681, 'Falsificación de certificados de los Sistemas de Seguridad Pública', 123, 338, 24),
(682, 'Falsificación de documentos', 123, 327, 24),
(683, 'Falsificación de documentos de crédito', 123, 328, 24),
(684, 'Falsificación de documentos en general', 123, 329, 24),
(685, 'Falsificación de documentos expedidos por la administración pública', 123, 330, 24),
(686, 'Falsificación de medios electrónicos o magnéticos', 123, 331, 24),
(687, 'Falsificación de sellos, llaves, marcas, estampillas, contraseñas, pesas y medidas y otros objetos', 123, 333, 24),
(688, 'Falsificación de sellos, llaves, punzones, marcas y otros objetos oficiales', 123, 334, 24),
(689, 'Falsificación de títulos al portador y documentos de crédito público', 123, 335, 24),
(690, 'Falsificación de uniformes, divisas y otros distintivos', 123, 336, 24),
(691, 'Falsificación o adulteración de productos alimenticios o medicinales', 123, 337, 24),
(692, 'Producir o editar imágenes, textos o voces, total o parcialmente falsos o verdaderas', 123, 565, 24),
(693, 'Tráfico de especies en peligro de extinción, amenazadas o sujetas a protección especial', 125, 0, 0),
(694, 'Tráfico ilegal de especies o subespecies silvestres de flora o fauna', 125, 0, 0),
(695, 'Comercializar o vender flora o fauna en peligro de extinción o amenazada', 126, 0, 0),
(696, 'Delitos contra especies de flora o fauna que se realicen en o afecten un área natural protegida, o cuando se realicen con fines comerciales', 126, 0, 0),
(697, 'Caza, pesca o tala ilegal de flora o fauna silvestres en peligro de extinción, amenazadas o sujetas a protección', 127, 0, 0),
(698, 'Delitos ambientales por cortar, arrancar, derribar, talar, desmontar, destruir árboles y vegetación natural de manera ilícita', 127, 0, 0),
(699, 'Delitos contra el ambiente y la gestión ambiental por realizar actividades de caza, pesca o captura con un medio no permitido', 127, 0, 0),
(700, 'Delitos contra la riqueza forestal por derribar, talar u ocasionar la muerte de uno o más árboles, con la finalidad de realizar asentamientos humanos dentro de zonas que tengan la calidad de protegidas o de reservas ecológicas reconocidas por los Municipios y/o el Estado', 127, 0, 0),
(701, 'Tala ilícita en área natural protegida o área de valor ambiental de competencia del Estado', 127, 0, 0),
(702, 'Actividades con sustancias peligrosas', 128, 54, 43),
(703, 'Delitos contra el ambiente por descargar depositar, o infiltrar de manera ilícita, autorizar u ordenar, aguas residuales, líquidos químicos o bioquímicos, desechos o contaminantes en aguas de jurisdicción estatal', 128, 0, 0),
(704, 'Delitos contra el ambiente por filtrar o descargar aguas residuales, líquidos químicos o bioquímicos, desechos o contaminantes en suelos o en aguas de jurisdicción local o en aguas federales asignadas para la prestación de servicios', 128, 0, 0),
(705, 'Transporte o manejo de residuos peligrosos', 128, 0, 0),
(706, 'Atentados al equilibrio ecológico culposos', 129, 106, 9),
(707, 'Atentados al equilibrio ecológico y la protección al ambiente', 129, 107, 9),
(708, 'Atentados contra el saneamiento del ambiente y la ecología del Estado', 129, 112, 9),
(709, 'Contaminación del ambiente por vehículos motorizados', 129, 158, 9),
(710, 'Contaminación del manto acuífero', 129, 159, 9),
(711, 'Daños a los ecosistemas o sus elementos', 129, 203, 11),
(712, 'Delitos ambientales por descarga de desechos o contaminantes en suelos, ríos, cuencas, vasos, depósitos o corrientes de agua', 129, 0, 0),
(713, 'Delitos contra el ambiente por contaminación atmosférica', 129, 0, 0),
(714, 'Delitos contra el ambiente por contaminación visual o auditiva', 129, 0, 0),
(715, 'Descargar o depositar aguas residuales, desechos o contaminantes', 129, 250, 9),
(716, 'Extraer suelo o cubierta vegetal por un volumen igual o mayor a dos metros cúbicos de un área natural proteja o área de valor ambiental', 129, 317, 9),
(717, 'Generar emisiones de energía térmica o lumínica, olores, ruidos o vibraciones que dañen la salud pública, el ecosistema o sus componentes', 129, 0, 0),
(718, 'Realización de actividades riesgosas en contra de la ecología', 129, 591, 9),
(719, 'Realizar el cambio de uso de suelo en un área natural protegida o área de valor ambiental', 129, 594, 9);
INSERT INTO `catalogos_codigo_norma` (`ID_CODIGO`, `CODIGO`, `NORMA`, `ID_2018`, `NORMA_2018`) VALUES
(720, 'Contra el ambiente, los recursos naturales, la gestión ambiental y la protección a la fauna', 130, 160, 9),
(721, 'Contra el medio ambiente', 130, 167, 9),
(722, 'Contra la ecología', 130, 177, 9),
(723, 'Contra la gestión ambiental', 130, 179, 9),
(724, 'Contra la gestión ambiental cometidos por autoridades', 130, 180, 9),
(725, 'Contra la gestión ambiental cometidos por los particulares', 130, 181, 9),
(726, 'Contra la ordenación de los ecosistemas terrestres cometidos por la autoridad', 130, 183, 9),
(727, 'Contra la ordenación del ecosistema terrestre cometidos por particulares', 130, 184, 9),
(728, 'Contra la protección al ambiente', 130, 185, 9),
(729, 'Contra la riqueza forestal del Estado', 130, 186, 9),
(730, 'De la biodiversidad', 130, 213, 9),
(731, 'De la comercialización del agua', 130, 214, 9),
(732, 'Delitos contra el ambiente', 130, 229, 9),
(733, 'Delitos contra especies de flora o fauna considerada endémica, amenazada, en peligro de extinción, sujeta a protección especial', 130, 0, 0),
(734, 'Delitos contra la flora y fauna silvestre por poseer ejemplares vivos de la vida silvestre fuera de su hábitat', 130, 0, 0),
(735, 'Derribamiento de un árbol en centro de población sin permiso', 130, 246, 9),
(736, 'Otorgamiento de licencia o autorización a industrias que causen contaminación o sean nocivas', 130, 502, 9),
(737, 'Otros delitos contra el medio ambiente, el equilibrio ecológico y la gestión ambiental', 130, 0, 0),
(738, 'Peligro de devastación', 130, 537, 43),
(739, 'Ataque a las vías de comunicación y de los medios de transporte', 131, 100, 43),
(740, 'Ataque a vías estatales de comunicación o vías públicas', 131, 101, 43),
(741, 'Contra el normal funcionamiento de vías de comunicación, vehículos y embarcaciones', 131, 168, 43),
(742, 'Contra la vía pública y los sitios de uso común', 131, 193, 43),
(743, 'Daño o destrucción dolosa a vías estatales de comunicación o vías públicas', 131, 212, 11),
(744, 'Destrucción de indicadores o dispositivos para el control de tránsito o alumbrado público', 131, 260, 11),
(745, 'Incendio de vehículo con persona en vías estatales de comunicación', 131, 385, 11),
(746, 'Obstaculización de vías estatales de comunicación terrestre o de una vía pública', 131, 477, 43),
(747, 'Violación de correspondencia', 131, 736, 43),
(748, 'Tráfico de indocumentados', 133, 0, 0),
(749, 'Tráfico de personas que no tienen capacidad para comprender el significado del hecho', 133, 683, 75),
(750, 'Otros delitos en materia de migración', 134, 0, 0),
(751, 'Actos ilícitos en materia de derechos de autor', 135, 0, 0),
(752, 'Delitos en materia de derechos de autor', 135, 0, 0),
(753, 'Falsificación de obra artística', 135, 332, 24),
(754, 'Delitos en materia de instituciones de crédito, inversión, fianzas y seguros', 136, 0, 0),
(755, 'Introducción a la República o puesta en circulación de títulos al portador y documentos de crédito público', 136, 425, 43),
(756, 'Alteración de marcas o señales', 137, 76, 43),
(757, 'Delitos en materia de propiedad industrial', 137, 0, 0),
(758, 'Revelación de secreto industrial', 137, 617, 43),
(759, 'Adulteración de alimentos y bebidas', 138, 69, 43),
(760, 'Comercialización de alimentos dañinos o animales enfermos', 138, 131, 43),
(761, 'Comercialización de órganos', 138, 132, 43),
(762, 'Delitos contra salud no relacionados con narcóticos', 138, 0, 0),
(763, 'En materia de comestibles y bebidas adulteradas o contaminadas', 138, 282, 43),
(764, 'En materia sanitaria', 138, 284, 43),
(765, 'Enajenación fraudulenta de medicinas nocivas o inapropiadas', 138, 285, 43),
(766, 'Expendio ilícito de bebidas alcohólicas adulteradas o contaminadas', 138, 305, 43),
(767, 'Negarse a desempeñar las funciones que solicite la autoridad sanitaria en ejercicio de la acción extraordinaria en materia de salubridad general', 138, 468, 43),
(768, 'Peligros contra la salud colectiva de la población', 138, 538, 43),
(769, 'Suministro de medicinas nocivas o inapropiadas', 138, 668, 43),
(770, 'Sustitución de receta médica', 138, 674, 43),
(771, 'Venta de bebidas y comestibles adulteradas o alterados', 138, 726, 43),
(772, 'Adquisición, recepción u ocultación de bienes producto de un delito', 139, 68, 19),
(773, 'Encubrimiento', 139, 286, 19),
(774, 'Encubrimiento de la tortura', 139, 287, 15),
(775, 'Encubrimiento de robo de camarón, ganado o colonias de abejas', 139, 288, 64),
(776, 'Encubrimiento equiparado', 139, 289, 19),
(777, 'Encubrimiento por favorecimiento', 139, 290, 19),
(778, 'Encubrimiento por receptación', 139, 291, 19),
(779, 'Receptación de objetos de procedencia ilícita', 139, 599, 19),
(780, 'Operaciones con recursos de procedencia ilícita', 140, 498, 43),
(781, 'Instigamiento a la tortura', 141, 420, 15),
(782, 'Tortura', 141, 680, 15),
(783, 'Usurpación de identidad', 142, 712, 43),
(784, 'Acceso ilícito a sistemas y equipos de informática', 144, 48, 43),
(785, 'Acceso ilícito a sistemas y equipos de informática de las instituciones que integran el sistema financiero, para indebidamente copiar información que contengan', 144, 0, 0),
(786, 'Acceso ilícito a sistemas y equipos de informática por copiar, transmitir o imprima información de alguna dependencia pública', 144, 0, 0),
(787, 'Acceso o uso indebido de los sistemas informáticos y bancos de datos de los Sistemas de Seguridad Pública', 144, 49, 41),
(788, 'Acceso sin autorización a sistemas y equipos de informática', 144, 50, 43),
(789, 'Delitos informáticos por acceso indebido por personal autorizado a equipo y sistemas de informática del Estado', 144, 0, 0),
(790, 'Daño informático', 145, 210, 11),
(791, 'Daño informático cometido por el encargado del manejo, administración o mantenimiento de los bienes informáticos dañados', 145, 0, 0),
(792, 'Daños a datos informáticos', 145, 0, 0),
(793, 'Indebida modificación, destrucción o provocación de pérdida de información de equipos de informática del Estado', 145, 403, 39),
(794, 'Indebidamente modificar, destruir o provocar la pérdida de información contenida en sistemas o equipos de informática de las instituciones que integran el sistema financiero por persona autorizada para su acceso', 145, 404, 43),
(795, 'Modificación, destrucción o provocación de pérdida de información de equipos de informática del Estado sin autorización', 145, 457, 39),
(796, 'Modificar, destruir o provocar la pérdida de información contenida en sistemas o equipos de informática de las instituciones que integran el sistema financiero, sin autorización de acceso', 145, 458, 41),
(797, 'Delitos informáticos contra un soporte lógico o programa informático', 146, 0, 0),
(798, 'Interferir el buen funcionamiento de un sistema operativo, programa de computadora, base de datos o cualquier archivo informático, sin autorización de su propietario o poseedor legítimo', 146, 0, 0),
(799, 'Interferir en el buen funcionamiento de sistemas o equipos informáticos', 146, 0, 0),
(800, 'Delitos informáticos', 147, 244, 44),
(801, 'Obtención ilícita de información electrónica', 147, 479, 43),
(802, 'Otros delitos contra la seguridad de los datos y/o sistemas o equipos informáticos', 147, 0, 0),
(803, 'Tratos o penas crueles, inhumanos o degradantes', 148, 0, 0),
(804, 'Abandono, negación y práctica indebida del servicio médico', 149, 16, 43),
(805, 'Acaparamiento', 149, 47, 43),
(806, 'Acuerdo en la comisión de un delito', 149, 59, 18),
(807, 'Alteraciones nocivas', 149, 80, 43),
(808, 'Aportar recursos económicos o de cualquier otra índole para la ejecución de actividades ilícitas con vehículos', 149, 85, 43),
(809, 'Atribución de título o de nombre indebidos', 149, 115, 43),
(810, 'Ayuda en la comisión de un delito', 149, 119, 43),
(811, 'Calumnia', 149, 121, 43),
(812, 'Chantaje', 149, 122, 22),
(813, 'Cometidos por fraccionadores', 149, 135, 43),
(814, 'Cometidos por otros profesionales y técnicos', 149, 139, 43),
(815, 'Comisión de delito por medio de otra persona', 149, 144, 43),
(816, 'Contra el comercio, la industria, la agricultura y la estabilidad económica', 149, 162, 43),
(817, 'Contra el consumo y la riqueza', 149, 163, 43),
(818, 'Contra el derecho de los trabajadores', 149, 164, 43),
(819, 'Contra el estado civil de las personas', 149, 165, 40),
(820, 'Contra el trabajo y la previsión social', 149, 171, 43),
(821, 'Contra la filiación y el estado civil', 149, 178, 40),
(822, 'Contra la seguridad de la propiedad y la posesión de inmuebles y límites de crecimiento de los centros de población', 149, 190, 43),
(823, 'Contra la seguridad en los medios informativos cometidos en perjuicio de particulares', 149, 187, 43),
(824, 'Creación de asentamientos humanos irregulares', 149, 201, 43),
(825, 'De las personas sujetas a concurso', 149, 215, 43),
(826, 'Delito contra el normal funcionamiento de embarcaciones', 149, 232, 43),
(827, 'Delitos cometidos por personas sujetas a concurso', 149, 227, 43),
(828, 'Delitos contra el estado civil', 149, 230, 40),
(829, 'Delitos en materia de inhumaciones y exhumaciones', 149, 243, 43),
(830, 'Difamación', 149, 266, 43),
(831, 'Difamación equiparada', 149, 267, 17),
(832, 'Especulación', 149, 293, 43),
(833, 'Estorbo del aprovechamiento de bienes públicos de uso común', 149, 295, 43),
(834, 'Explotación de grupos socialmente desfavorecidos', 149, 307, 43),
(835, 'Filiación y el estado civil', 149, 348, 40),
(836, 'Genocidio', 149, 359, 47),
(837, 'Incitación a la comisión de un delito', 149, 389, 43),
(838, 'Incumplimiento de obligaciones cometido por notario público', 149, 399, 43),
(839, 'Incumplimiento del deber de trasladar comunicaciones al destinatario', 149, 401, 43),
(840, 'Inhumación', 149, 411, 43),
(841, 'Inhumación y exhumación ilícitas', 149, 412, 43),
(842, 'Injurias', 149, 413, 43),
(843, 'Instalación y uso de placas de circulación o autorización oficial correspondientes a otro vehículo', 149, 417, 43),
(844, 'Instigación a cometer un delito', 149, 418, 43),
(845, 'Intervención ilegal de comunicaciones privadas', 149, 423, 43),
(846, 'Intimación', 149, 0, 0),
(847, 'Malvivencia', 149, 452, 43),
(848, 'Negarse a atender a una persona, en caso de notoria urgencia, poniendo en peligro su vida', 149, 467, 43),
(849, 'Nutrición', 149, 476, 47),
(850, 'Ocultación, destrucción e inhumación agravada', 149, 484, 43),
(851, 'Omisión de denunciar la comisión de un delito', 149, 493, 43),
(852, 'Omisión de impedir la comisión de un delito', 149, 494, 43),
(853, 'Omisión de proteger al tránsito por obra pública', 149, 497, 43),
(854, 'Otros delitos contenidos en leyes federales, especiales y generales', 149, 505, 43),
(855, 'Otros delitos del Fuero Común', 149, 509, 43),
(856, 'Otros delitos en razón de concurrencia', 149, 510, 43),
(857, 'Pago de salario en mercancías, vales, fichas o moneda que no sea de curso legal', 149, 526, 43),
(858, 'Patrocinar o ayudar a diversos contendientes o partes con intereses opuestos en un mismo negocio o negocios conexos', 149, 530, 43),
(859, 'Peligro de daño', 149, 536, 43),
(860, 'Prestación ilícita del servicio público de transporte de pasajeros', 149, 555, 43),
(861, 'Profanación de cadáveres', 149, 566, 43),
(862, 'Profanación de sepulcros', 149, 568, 43),
(863, 'Profanación, inhumación y exhumación de cadáver', 149, 567, 43),
(864, 'Promoción de conductas ilícitas', 149, 569, 43),
(865, 'Promoción o denigración de imagen', 149, 570, 43),
(866, 'Provocación de un delito y apología de éste o de algún vicio', 149, 576, 43),
(867, 'Realización de actos jurídicos con bienes producto del delito de secuestro', 149, 592, 48),
(868, 'Relacionados con la capacidad pecuniaria de las personas sujetas a concurso de acreedores', 149, 600, 43),
(869, 'Responsabilidad médica', 149, 604, 43),
(870, 'Responsabilidad médico-legal', 149, 605, 43),
(871, 'Responsabilidad profesional médica', 149, 606, 43),
(872, 'Responsabilidad técnica y médica', 149, 607, 43),
(873, 'Responsabilidad técnica y profesional', 149, 608, 43),
(874, 'Retención de cadáver', 149, 612, 43),
(875, 'Retención en hospital, clínica, centro de salud, dispensario o agencia funeraria', 149, 613, 43),
(876, 'Retención indebida', 149, 614, 43),
(877, 'Revelación de secretos', 149, 618, 43),
(878, 'Revelación de secretos o violación a la intimidad personal o familiar', 149, 619, 43),
(879, 'Revelación de secretos por profesionista o técnico, o por servidor público', 149, 620, 43),
(880, 'Revelar información o imágenes obtenidas en la intervención de una comunicación privada', 149, 621, 43),
(881, 'Sanción específica para los encargados de las oficinas del Registro Civil', 149, 649, 40),
(882, 'Suposición, supresión, ocultación y substitución', 149, 670, 43),
(883, 'Supresión de dispositivos o de señales de seguridad', 149, 671, 43),
(884, 'Supresión del estado civil', 149, 672, 40),
(885, 'Uso de documentos falsos', 149, 699, 23),
(886, 'Uso de objeto o documento falso o alterado', 149, 701, 23),
(887, 'Uso indebido de información reservada', 149, 706, 43),
(888, 'Uso indebido de llamadas telefónicas', 149, 707, 43),
(889, 'Uso indebido de sellos, marcas, llaves, contraseñas y otros objetos', 149, 708, 43),
(890, 'Usurpación de profesiones', 149, 713, 43),
(891, 'Usurpación del uso de documento', 149, 714, 23),
(892, 'Utilización de instalaciones o medios de comunicación o de transporte para la realización de actividades delictivas', 149, 715, 43),
(893, 'Utilización indebida de descubrimiento científico', 149, 716, 43),
(894, 'Vagancia', 149, 718, 43),
(895, 'Venta clandestina', 149, 724, 43),
(896, 'Venta clandestina de bebidas alcohólicas', 149, 725, 43),
(897, 'Venta indebida de bebidas alcohólicas', 149, 728, 43),
(898, 'Violación a las leyes sobre inhumaciones y exhumaciones', 149, 732, 43),
(899, 'Violación a las normas de protección de tránsito nocturno en carreteras', 149, 731, 43),
(900, 'Violación a los deberes de humanidad', 149, 734, 43),
(901, 'Violación de depósito', 149, 737, 43),
(902, 'Violación de domicilio', 149, 738, 43),
(903, 'Violación de impedimentos civiles', 149, 740, 43),
(904, 'Violación de inmunidad', 149, 741, 43),
(905, 'Violación de inmunidad y de neutralidad', 149, 742, 43),
(906, 'Violación de la intimidad personal o familiar', 149, 743, 43),
(907, 'Violación de la privacidad', 149, 744, 43),
(908, 'Violación de secretos', 149, 745, 43),
(909, 'Violación de túmulo, sepulcro, sepultura, féretro o urna funeraria', 149, 748, 43),
(910, 'Violencia en espectáculos deportivos', 149, 758, 43);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_concurso`
--

CREATE TABLE `catalogos_concurso` (
  `CONCURSO_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_concurso`
--

INSERT INTO `catalogos_concurso` (`CONCURSO_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Ideal'),
(2, 'Real'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_condicion_actividad`
--

CREATE TABLE `catalogos_condicion_actividad` (
  `CONDICIONA_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_condicion_actividad`
--

INSERT INTO `catalogos_condicion_actividad` (`CONDICIONA_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Estaba buscando trabajo'),
(2, 'Se dedicaba a apoyar con los quehaceres del hogar y/o al cuidado de niños o personas dependientes'),
(3, 'Se dedicaba únicamente a su rol de estudiante '),
(4, 'No podía ejercer alguna actividad (limitaciones físicas)'),
(5, 'No ejercía ninguna actividad'),
(6, 'Otra'),
(9, 'No identificada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_condicion_estudiante`
--

CREATE TABLE `catalogos_condicion_estudiante` (
  `CONDICIONE_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(40) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_condicion_estudiante`
--

INSERT INTO `catalogos_condicion_estudiante` (`CONDICIONE_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Se encontraba estudiando'),
(2, 'No se encontraba estudiando'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_consumacion`
--

CREATE TABLE `catalogos_consumacion` (
  `CONSUMACION_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_consumacion`
--

INSERT INTO `catalogos_consumacion` (`CONSUMACION_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Consumado'),
(2, 'Tentativa'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_contexto_situacional`
--

CREATE TABLE `catalogos_contexto_situacional` (
  `CONTEXTO_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_contexto_situacional`
--

INSERT INTO `catalogos_contexto_situacional` (`CONTEXTO_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Relacionado con grupos de la delincuencia organizada'),
(2, 'Relacionado con pandillas'),
(3, 'Relacionado con situaciones de parentesco'),
(4, 'Relacionado con riñas o problemas entre vecinos'),
(5, 'Relacionados con motivo de la orientación sexual o identidad de género de la víctima'),
(6, 'Relacionados con motivo de discriminación étnico - racial'),
(7, 'Relacionado con intereses políticos'),
(8, 'Relacionado con disturbios civiles'),
(9, 'Relacionado con ejecuciones extrajudiciales'),
(10, 'Relacionado con uso excesivo de la fuerza'),
(11, 'Otro '),
(99, 'No identificado ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_cosa_robada`
--

CREATE TABLE `catalogos_cosa_robada` (
  `COSA_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_cosa_robada`
--

INSERT INTO `catalogos_cosa_robada` (`COSA_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Cableado o instalación de cobre'),
(2, 'Mobiliario'),
(3, 'Equipo electrónico'),
(4, 'Electrodomésticos'),
(5, 'Bolsa, maleta, portafolio'),
(6, 'Joyas, relojes'),
(7, 'Dinero, tarjetas de crédito, cheques'),
(8, 'Identificación o documentos'),
(9, 'Teléfono celular'),
(10, 'Bicicleta '),
(11, 'Otra '),
(99, 'No identificada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_delitos_norma`
--

CREATE TABLE `catalogos_delitos_norma` (
  `ID_DELITO` int(3) NOT NULL,
  `JURIDICO` int(1) NOT NULL,
  `DELITO` varchar(300) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_delitos_norma`
--

INSERT INTO `catalogos_delitos_norma` (`ID_DELITO`, `JURIDICO`, `DELITO`) VALUES
(-2, -2, 'No aplica'),
(1, 1, 'Homicidio'),
(2, 1, 'Feminicidio'),
(3, 1, 'Aborto'),
(4, 1, 'Lesiones'),
(5, 1, 'Otros delitos que atentan contra la vida y la integridad corporal'),
(6, 2, 'Privación de la libertad'),
(7, 2, 'Tráfico de menores'),
(8, 2, 'Retención o sustracción de menores e incapaces'),
(9, 2, 'Rapto'),
(10, 2, 'Desaparición forzada de personas'),
(11, 2, 'Secuestro'),
(12, 2, 'Secuestro extorsivo'),
(13, 2, 'Secuestro en calidad de rehén'),
(14, 2, 'Secuestro para causar daño'),
(15, 2, 'Secuestro exprés'),
(16, 2, 'Otro tipo de secuestro'),
(17, 2, 'Otros delitos que atentan contra la libertad personal'),
(18, 3, 'Abuso sexual'),
(19, 3, 'Acoso sexual '),
(20, 3, 'Hostigamiento sexual'),
(21, 3, 'Violación'),
(22, 3, 'Violación simple'),
(23, 3, 'Violación equiparada por introducir cualquier elemento, instrumento o cualquier parte del cuerpo humano, distinto al pene'),
(24, 3, 'Violación equiparada en contra de menores e incapaces'),
(25, 3, 'Otro tipo de violación'),
(26, 3, 'Estupro'),
(27, 3, 'Incesto'),
(28, 3, 'Otros delitos que atentan contra la libertad y la seguridad sexual'),
(29, 4, 'Robo'),
(30, 4, 'Robo simple'),
(31, 4, 'Robo a casa habitación'),
(32, 4, 'Robo de vehículo'),
(33, 4, 'Robo de autopartes'),
(34, 4, 'Robo a transeúnte en vía pública'),
(35, 4, 'Robo a transeúnte en espacio abierto al público'),
(36, 4, 'Robo a persona en un lugar privado'),
(37, 4, 'Robo a transportista'),
(38, 4, 'Robo en transporte público individual'),
(39, 4, 'Robo en transporte público colectivo'),
(40, 4, 'Robo en transporte individual'),
(41, 4, 'Robo a institución bancaria'),
(42, 4, 'Robo a negocio'),
(43, 4, 'Robo de ganado'),
(44, 4, 'Robo de maquinaria'),
(45, 4, 'Robo de energía eléctrica'),
(46, 4, 'Otros robos'),
(47, 4, 'Delitos en materia de hidrocarburos y sus derivados'),
(48, 4, 'Sustracción de hidrocarburos y sus derivados'),
(49, 4, 'Aprovechamiento de hidrocarburos y sus derivados'),
(50, 4, 'Posesión ilícita de hidrocarburos y sus derivados'),
(51, 4, 'Otros delitos en materia de hidrocarburos y sus derivados'),
(52, 4, 'Fraude'),
(53, 4, 'Abuso de confianza'),
(54, 4, 'Extorsión'),
(55, 4, 'Extorsión cometida por vía telefónica o cualquier otro medio electrónico o de comunicación'),
(56, 4, 'Otro tipo de extorsión'),
(57, 4, 'Daño a la propiedad'),
(58, 4, 'Despojo'),
(59, 0, 'Otros delitos que atentan contra el patrimonio'),
(60, 5, 'Violencia familiar'),
(61, 5, 'Incumplimiento de obligaciones familiares'),
(62, 5, 'Otros delitos contra la familia'),
(63, 6, 'Delitos contra el libre desarrollo de la personalidad'),
(64, 6, 'Corrupción de menores e incapaces'),
(65, 6, 'Prostitución de menores e incapaces'),
(66, 6, 'Pornografía infantil '),
(67, 6, 'Turismo sexual'),
(68, 6, 'Pederastia'),
(69, 6, 'Otros delitos contra el libre desarrollo de la personalidad'),
(70, 6, 'Trata de personas'),
(71, 6, 'Trata de personas con fines de explotación sexual'),
(72, 6, 'Trata de personas con fines de trabajo o servicios forzados'),
(73, 6, 'Trata de personas con fines de tráfico de órganos'),
(74, 6, 'Trata de personas con otros fines'),
(75, 6, 'Violencia de género en todas sus modalidades distinta a la violencia familiar'),
(76, 6, 'Discriminación'),
(77, 6, 'Lenocinio'),
(78, 6, 'Otros delitos contra la sociedad'),
(79, 7, 'Delitos contra la salud relacionados con narcóticos en su modalidad de narcomenudeo'),
(80, 7, 'Posesión simple de narcóticos'),
(81, 7, 'Posesión con fines de comercio o suministro de narcóticos'),
(82, 7, 'Comercio de narcóticos'),
(83, 7, 'Suministro de narcóticos'),
(84, 7, 'Otros delitos contra la salud relacionados con narcóticos en su modalidad de narcomenudeo'),
(85, 7, 'Delitos federales contra la salud relacionados con narcóticos'),
(86, 7, 'Producción de narcóticos'),
(87, 7, 'Transporte de narcóticos'),
(88, 7, 'Tráfico de narcóticos'),
(89, 7, 'Comercio de narcóticos'),
(90, 7, 'Suministro de narcóticos'),
(91, 7, 'Posesión de narcóticos'),
(92, 7, 'Otros delitos federales contra la salud relacionados con narcóticos'),
(93, 7, 'Evasión de presos'),
(94, 7, 'Delitos en materia de armas y objetos prohibidos'),
(95, 7, 'Delitos de delincuencia organizada'),
(96, 7, 'Delitos en materia de armas, explosivos y otros materiales destructivos'),
(97, 7, 'Portación ilícita de armas'),
(98, 7, 'Posesión ilícita de armas, cartuchos y cargadores'),
(99, 7, 'Acopio ilícito de armas'),
(100, 7, 'Tráfico ilícito de armas, explosivos y otros materiales destructivos'),
(101, 7, 'Otros delitos en materia de armas, explosivos y otros materiales destructivos'),
(102, 7, 'Asociación delictuosa'),
(103, 7, 'Terrorismo'),
(104, 7, 'Otros delitos contra la seguridad pública y la seguridad del Estado'),
(105, 8, 'Delitos por hechos de corrupción'),
(106, 8, 'Ejercicio indebido del servicio público'),
(107, 8, 'Abuso de autoridad'),
(108, 8, 'Cohecho'),
(109, 8, 'Peculado'),
(110, 8, 'Enriquecimiento ilícito'),
(111, 8, 'Ejercicio abusivo de funciones'),
(112, 8, 'Tráfico de influencias'),
(113, 8, 'Otros delitos por hechos de corrupción'),
(114, 8, 'Delitos contra la administración de justicia'),
(115, 8, 'En materia de amparo'),
(116, 8, 'Otros delitos contra la administración de justicia'),
(117, 8, 'Delitos en materia fiscal'),
(118, 8, 'Delitos electorales'),
(119, 8, 'Otros delitos contra la administración del Estado'),
(120, 9, 'Amenazas'),
(121, 9, 'Allanamiento de morada'),
(122, 9, 'Falsedad'),
(123, 9, 'Falsificación'),
(124, 9, 'Delitos contra el medio ambiente, el equilibrio ecológico y la gestión ambiental'),
(125, 9, 'Tráfico de flora o fauna silvestres en peligro de extinción, amenazadas o sujetas a protección'),
(126, 9, 'Comercialización de flora o fauna silvestres en peligro de extinción, amenazadas o sujetas a protección'),
(127, 9, 'Caza, pesca o tala ilegal de flora o fauna silvestres en peligro de extinción, amenazadas o sujetas a protección'),
(128, 9, 'Transporte o manejo de residuos peligrosos'),
(129, 9, 'Daños a los ecosistemas o sus elementos'),
(130, 9, 'Otros delitos contra el medio ambiente, el equilibrio ecológico y la gestión ambiental'),
(131, 9, 'Delitos en materia de vías de comunicación y correspondencia'),
(132, 9, 'Delitos en materia de migración'),
(133, 9, 'Tráfico de indocumentados'),
(134, 9, 'Otros delitos en materia de migración'),
(135, 9, 'Delitos en materia de derechos de autor'),
(136, 9, 'Delitos en materia de instituciones de crédito, inversión, fianzas y seguros'),
(137, 9, 'Delitos en materia de propiedad industrial'),
(138, 9, 'Delitos contra la salud no relacionados con narcóticos'),
(139, 9, 'Encubrimiento'),
(140, 9, 'Operaciones con recursos de procedencia ilícita'),
(141, 9, 'Tortura '),
(142, 9, 'Suplantación y usurpación de identidad'),
(143, 9, 'Delitos contra la seguridad de los datos y/o sistemas o equipos informáticos'),
(144, 9, 'Acceso ilícito a sistemas o equipos informáticos'),
(145, 9, 'Daños a datos informáticos'),
(146, 9, 'Interferir en el buen funcionamiento de sistemas o equipos informáticos'),
(147, 9, 'Otros delitos contra la seguridad de los datos y/o sistemas o equipos informáticos'),
(148, 9, 'Tratos o penas crueles, inhumanos o degradantes'),
(149, 9, 'Otros delitos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_dominio_espanol`
--

CREATE TABLE `catalogos_dominio_espanol` (
  `DOMINIO_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_dominio_espanol`
--

INSERT INTO `catalogos_dominio_espanol` (`DOMINIO_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Habla español'),
(2, 'No habla español'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_entidades`
--

CREATE TABLE `catalogos_entidades` (
  `ENTIDAD_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_entidades`
--

INSERT INTO `catalogos_entidades` (`ENTIDAD_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Aguascalientes'),
(2, 'Baja California'),
(3, 'Baja California Sur'),
(4, 'Campeche'),
(5, 'Chiapas'),
(6, 'Chihuahua'),
(7, 'Coahuila de Zaragoza'),
(8, 'Colima'),
(9, 'Ciudad de México'),
(10, 'Durango'),
(11, 'Guanajuato'),
(12, 'Guerrero'),
(13, 'Hidalgo'),
(14, 'Jalisco'),
(15, 'México'),
(16, 'Michoacán de Ocampo'),
(17, 'Morelos'),
(18, 'Nayarit'),
(19, 'Nuevo León'),
(20, 'Oaxaca'),
(21, 'Puebla'),
(22, 'Querétaro'),
(23, 'Quintana Roo'),
(24, 'San Luis Potosí'),
(25, 'Sinaloa'),
(26, 'Sonora'),
(27, 'Tabasco'),
(28, 'Tamaulipas'),
(29, 'Tlaxcala'),
(30, 'Veracruz de Ignacio de la Llave'),
(31, 'Yucatán'),
(32, 'Zacatecas'),
(99, 'No Identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_estado_civil`
--

CREATE TABLE `catalogos_estado_civil` (
  `ESTADO_CIVIL_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(40) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_estado_civil`
--

INSERT INTO `catalogos_estado_civil` (`ESTADO_CIVIL_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Casado(a)'),
(2, 'Unión Libre'),
(3, 'Divorciado (a)'),
(4, 'Separado (a)'),
(5, 'Soltero (a)'),
(6, 'Concubinato'),
(7, 'Sociedad de convivencia'),
(8, 'Viudo (a)'),
(9, 'Otro'),
(99, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_estado_psicofisico`
--

CREATE TABLE `catalogos_estado_psicofisico` (
  `ESTADO_PSICO_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_estado_psicofisico`
--

INSERT INTO `catalogos_estado_psicofisico` (`ESTADO_PSICO_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'En pleno uso de sus facultades mentales'),
(2, 'Ebrio'),
(3, 'Drogado'),
(4, 'Otro'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_estatusjo`
--

CREATE TABLE `catalogos_estatusjo` (
  `ESTATUS_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_estatusjo`
--

INSERT INTO `catalogos_estatusjo` (`ESTATUS_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'En continuación de la audiencia de juicio oral'),
(2, 'En receso para deliberar el fallo'),
(3, 'En audiencia para emisión del fallo'),
(4, 'Otro'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_estudio_profesional`
--

CREATE TABLE `catalogos_estudio_profesional` (
  `ESTUDIO_PRO_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_estudio_profesional`
--

INSERT INTO `catalogos_estudio_profesional` (`ESTUDIO_PRO_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Licenciatura'),
(2, 'Especialidad'),
(3, 'Maestría'),
(4, 'Doctorado'),
(5, 'Otro'),
(6, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_etapas`
--

CREATE TABLE `catalogos_etapas` (
  `ETAPA_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_etapas`
--

INSERT INTO `catalogos_etapas` (`ETAPA_ID`, `DESCRIPCION`) VALUES
(0, 'Nuevo'),
(1, 'Intermedia'),
(2, 'Conclusiones'),
(3, 'Tramite'),
(4, 'Fin de Causa'),
(5, 'S/Estatus'),
(6, 'Intermedia-Conclusiones'),
(7, 'Intermedia-Tramite');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_etapa_inicial`
--

CREATE TABLE `catalogos_etapa_inicial` (
  `INICIAL_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(60) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_etapa_inicial`
--

INSERT INTO `catalogos_etapa_inicial` (`INICIAL_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Detención ilegal'),
(2, 'No vinculación a proceso'),
(3, 'Suspensión del proceso'),
(4, 'Suspensión condicional del proceso por cumplimentar'),
(5, 'Acuerdo reparatorio por cumplimentar'),
(6, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_etapa_intermedia`
--

CREATE TABLE `catalogos_etapa_intermedia` (
  `INTERMEDIA_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(60) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_etapa_intermedia`
--

INSERT INTO `catalogos_etapa_intermedia` (`INTERMEDIA_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Audiencia intermedia'),
(2, 'Suspensión condicional del proceso por cumplimentar'),
(3, 'Acuerdo reparatorio por cumplimentar'),
(4, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_etapa_procesal`
--

CREATE TABLE `catalogos_etapa_procesal` (
  `PROCESAL_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_etapa_procesal`
--

INSERT INTO `catalogos_etapa_procesal` (`PROCESAL_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Investigación'),
(2, 'Intermedia'),
(9, 'No identificada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_exclusion_accionp`
--

CREATE TABLE `catalogos_exclusion_accionp` (
  `EXCLUSION_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_exclusion_accionp`
--

INSERT INTO `catalogos_exclusion_accionp` (`EXCLUSION_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Muerte del acusado o sentenciado'),
(2, 'Reconocimiento de inocencia del sentenciado o anulación de la sentencia'),
(3, 'Perdón de la persona ofendida en los delitos de querella o por cualquier otro acto equivalente'),
(4, 'Indulto'),
(5, 'Amnistía'),
(6, 'Prescripción'),
(7, 'Supresión del tipo penal'),
(8, 'Existencia de una sentencia anterior dictada en proceso instaurado por los mismos hechos'),
(9, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_figura_mprueba`
--

CREATE TABLE `catalogos_figura_mprueba` (
  `FIGURA_MPRU_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_figura_mprueba`
--

INSERT INTO `catalogos_figura_mprueba` (`FIGURA_MPRU_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Ministerio público'),
(2, 'Asesor jurídico'),
(3, 'Defensa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_figura_proceso`
--

CREATE TABLE `catalogos_figura_proceso` (
  `FIGURA_PRO_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(25) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_figura_proceso`
--

INSERT INTO `catalogos_figura_proceso` (`FIGURA_PRO_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Víctima'),
(2, 'Asesor jurídico'),
(3, 'Defensor del imputado'),
(4, 'Ministerio público'),
(5, 'Otro'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_forma_accion`
--

CREATE TABLE `catalogos_forma_accion` (
  `ACCION_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_forma_accion`
--

INSERT INTO `catalogos_forma_accion` (`ACCION_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Con violencia'),
(2, 'Sin violencia'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_forma_comision`
--

CREATE TABLE `catalogos_forma_comision` (
  `COMISION_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_forma_comision`
--

INSERT INTO `catalogos_forma_comision` (`COMISION_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Doloso'),
(2, 'Culposo'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_forma_conduccion`
--

CREATE TABLE `catalogos_forma_conduccion` (
  `CONDUCCION_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_forma_conduccion`
--

INSERT INTO `catalogos_forma_conduccion` (`CONDUCCION_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Citatorio'),
(2, 'Orden de comparecencia'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_forma_division`
--

CREATE TABLE `catalogos_forma_division` (
  `DIVISION_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_forma_division`
--

INSERT INTO `catalogos_forma_division` (`DIVISION_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Región judicial'),
(2, 'Distrito judicial'),
(3, 'Partido judicial'),
(4, 'Cobertura estatal'),
(5, 'Otros'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_fuente_ingresos`
--

CREATE TABLE `catalogos_fuente_ingresos` (
  `FUENTE_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(65) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_fuente_ingresos`
--

INSERT INTO `catalogos_fuente_ingresos` (`FUENTE_ID`, `DESCRIPCION`) VALUES
(1, 'Trabajo'),
(2, 'Apoyo de familiares'),
(3, 'Apoyo de conocidos'),
(4, 'Becas escolares para sus hijos(as)'),
(5, 'Becas escolares para usted'),
(6, 'Programa de asistencia social (diferentes a becas escolares)'),
(7, 'Otra'),
(9, 'No identificada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_fuero`
--

CREATE TABLE `catalogos_fuero` (
  `FUERO_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_fuero`
--

INSERT INTO `catalogos_fuero` (`FUERO_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Común'),
(2, 'Federal'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_funcion_juzgado`
--

CREATE TABLE `catalogos_funcion_juzgado` (
  `FUNCION_JUZ_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_funcion_juzgado`
--

INSERT INTO `catalogos_funcion_juzgado` (`FUNCION_JUZ_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Control'),
(2, 'Enjuiciamiento'),
(3, 'Control y Enjuiciamiento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_grado_estudios`
--

CREATE TABLE `catalogos_grado_estudios` (
  `ESTUDIO_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_grado_estudios`
--

INSERT INTO `catalogos_grado_estudios` (`ESTUDIO_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Ninguno'),
(2, 'Preescolar o primaria'),
(3, 'Secundaria '),
(4, 'Preparatoria '),
(5, 'Carrera técnica o  comercial'),
(6, 'Licenciatura'),
(7, 'Maestria'),
(8, 'Doctorado'),
(9, 'No Identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_grado_participacion`
--

CREATE TABLE `catalogos_grado_participacion` (
  `PARTICIPACION_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_grado_participacion`
--

INSERT INTO `catalogos_grado_participacion` (`PARTICIPACION_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Autor intelectual'),
(2, 'Autor material'),
(3, 'Coautoría material'),
(4, 'Autor inmediato'),
(5, 'Instigador '),
(6, 'Cómplice '),
(7, 'Encubridor '),
(8, 'Cómplice correspectivo '),
(9, ' Otro'),
(99, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_incompetencia`
--

CREATE TABLE `catalogos_incompetencia` (
  `INCOMPETENCIA_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_incompetencia`
--

INSERT INTO `catalogos_incompetencia` (`INCOMPETENCIA_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Fuero común de otra entidad federativa'),
(2, 'Fuero común de la entidad federativa (en razón de territorio)'),
(3, 'Materia'),
(4, 'Otra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_instrumento_comision`
--

CREATE TABLE `catalogos_instrumento_comision` (
  `INSTRUMENTO_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_instrumento_comision`
--

INSERT INTO `catalogos_instrumento_comision` (`INSTRUMENTO_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Con arma de fuego'),
(2, 'Con arma blanca'),
(3, 'Con alguna parte del cuerpo'),
(4, 'Con algún vehículo'),
(5, 'Con algún medio electrónico o informá'),
(6, 'Con otro instrumento'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_jurisdiccion`
--

CREATE TABLE `catalogos_jurisdiccion` (
  `JURISDICCION_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(150) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_jurisdiccion`
--

INSERT INTO `catalogos_jurisdiccion` (`JURISDICCION_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'En toda la entidad federativa'),
(2, 'Solo en la división territorial a la que pertenece'),
(3, 'En más de una división territorial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_linguisticas`
--

CREATE TABLE `catalogos_linguisticas` (
  `LINGUISTICA_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_linguisticas`
--

INSERT INTO `catalogos_linguisticas` (`LINGUISTICA_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Hokana'),
(2, 'Chinanteca'),
(3, 'Otopame'),
(4, 'Oaxaqueña'),
(5, 'Huave'),
(6, 'Tlapaneca'),
(7, 'Totonaca'),
(8, 'Mixe-Zoque'),
(9, 'Maya'),
(10, 'Yutoazteca'),
(11, 'Tarasca'),
(12, 'Algonquina'),
(13, 'Otra'),
(99, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_medidas_cautelares`
--

CREATE TABLE `catalogos_medidas_cautelares` (
  `CAUTELARES_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(200) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_medidas_cautelares`
--

INSERT INTO `catalogos_medidas_cautelares` (`CAUTELARES_ID`, `DESCRIPCION`) VALUES
(-2, 'No identificado'),
(1, 'Presentación periódica ante autoridad que el juez designe'),
(2, 'La prohibición de salir del país, de la localidad en la cual reside o del ámbito territorial que fije el órgano Jurisdiccional, sin autorización del juez'),
(3, 'La obligación de someterse al cuidado o vigilancia de una persona o institución determinada, que informe regularmente al órgano jurisdiccional'),
(4, 'La prohibición de asistir a determinadas reuniones o de visitar o acercarse a ciertos lugares'),
(5, 'La prohibición de convivir, acercarse o comunicarse con determinadas personas, con las víctimas, ofendidos o testigos, siempre que no se afecte el derecho de defensa'),
(6, 'La separación inmediata del domicilio'),
(7, 'La colocación de localizadores electrónicos'),
(8, 'Garantía económica para asegurar la comparecencia'),
(9, 'Embargo de bienes'),
(10, 'Inmovilización de cuentas'),
(11, 'El resguardo en su domicilio con las modalidades que el órgano Jurisdiccional disponga'),
(12, 'Internamiento preventivo'),
(13, 'Otra '),
(99, 'No identificada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_medidas_disciplinarias`
--

CREATE TABLE `catalogos_medidas_disciplinarias` (
  `MEDIDA_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(200) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_medidas_disciplinarias`
--

INSERT INTO `catalogos_medidas_disciplinarias` (`MEDIDA_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Apercibimiento'),
(2, 'Multa de veinte a cinco mil salarios mínimos'),
(3, 'Expulsión de la sala de audiencia'),
(4, 'Arresto hasta por treinta y seis horas'),
(5, 'Desalojo público de la sala de audiencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_medidas_duracion`
--

CREATE TABLE `catalogos_medidas_duracion` (
  `MEDIDA_DURA_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(200) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_medidas_duracion`
--

INSERT INTO `catalogos_medidas_duracion` (`MEDIDA_DURA_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Menos de 1 mes'),
(2, 'De 1 a 2 meses'),
(3, 'De 3 a 4 meses'),
(4, 'De 5 a hasta 6 meses'),
(5, 'Otro'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_medidas_mujer`
--

CREATE TABLE `catalogos_medidas_mujer` (
  `MUJER_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(300) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_medidas_mujer`
--

INSERT INTO `catalogos_medidas_mujer` (`MUJER_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Acceso al domicilio en común, de autoridades policíacas o de personas que auxilien a la víctima a tomar sus pertenencias personales y las de sus hijas e hijos'),
(2, 'Auxilio policíaco de reacción inmediata a favor de la víctima, con autorización expresa de ingreso al domicilio donde se localice o se encuentre la Víctima en el momento de solicitar el auxilio'),
(3, 'Brindar servicios reeducativos integrales especializados y gratuitos, con perspectiva de género al agresor en instituciones públicas debidamente acreditadas'),
(4, 'Desocupación inmediata por el agresor del domicilio conyugal o donde habite la víctima, independientemente de la acreditación de propiedad o posesión del inmueble, aún en los casos de arrendamiento del mismo'),
(5, 'Embargo preventivo de bienes del agresor, que deberá inscribirse con carácter temporal en el Registro Público de la Propiedad, a efecto de garantizar las obligaciones alimentarias'),
(6, 'Entrega inmediata de objetos de uso personal y documentos de identidad de la víctima y de sus hijas e hijos'),
(7, 'Inventario de los bienes muebles e inmuebles de propiedad común, incluyendo los implementos de trabajo de la víctima '),
(8, 'Obligación alimentaria provisional e inmediata'),
(9, 'Posesión exclusiva de la víctima sobre el inmueble que sirvió de domicilio'),
(10, 'Prohibición al agresor de enajenar o hipotecar bienes de su propiedad cuando se trate del domicilio conyugal; y en cualquier caso cuando se trate de bienes de la sociedad conyugal'),
(11, 'Prohibición de intimidar o molestar a la víctima en su entorno social, así como a cualquier integrante de su familia'),
(12, 'Prohibición inmediata al probable responsable de acercarse al domicilio, lugar de trabajo, de estudios, del domicilio de las y los ascendientes y descendientes o cualquier otro que frecuente la víctima'),
(13, 'Reingreso de la víctima al domicilio, una vez que se salvaguarde de su seguridad'),
(14, 'Retención y guarda de armas de fuego propiedad del agresor o de alguna institución privada de seguridad, independientemente si las mismas se encuentran registradas conforme a la normatividad de la materia'),
(15, 'Suspensión temporal al agresor del régimen de visitas y convivencia con sus descendientes'),
(16, 'Uso y goce de bienes muebles que se encuentren en el inmueble que sirva de domicilio de la víctima'),
(17, 'Otra '),
(99, 'No identificada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_medidas_proteccion`
--

CREATE TABLE `catalogos_medidas_proteccion` (
  `PROTECCION_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(300) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_medidas_proteccion`
--

INSERT INTO `catalogos_medidas_proteccion` (`PROTECCION_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Auxilio inmediato por integrantes de instituciones policiales, al domicilio en donde se localice o se encuentre la víctima u ofendido en el momento de solicitarlo'),
(2, 'El reingreso de la víctima u ofendido a su domicilio, una vez que se salvaguarde su seguridad'),
(3, 'La entrega inmediata de objetos de uso personal y documentos de identidad de la víctima que tuviera en su posesión el probable responsable'),
(4, 'La prohibición de realizar conductas de intimidación o molestia a la víctima u ofendido o a personas relacionados con ellos'),
(5, 'Limitación para asistir o acercarse al domicilio de la víctima u ofendido o al lugar donde se encuentre'),
(6, 'Prohibición de acercarse o comunicarse con la víctima u ofendido'),
(7, 'Protección policial de la víctima u ofendido'),
(8, 'Separación inmediata del domicilio'),
(9, 'Traslado de la víctima u ofendido a refugios o albergues temporales, así como de sus descendientes'),
(10, 'Vigilancia en el domicilio de la víctima u ofendido'),
(11, 'Otra '),
(99, 'No identificada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_medidas_solicita`
--

CREATE TABLE `catalogos_medidas_solicita` (
  `MEDIDA_SOLICITA_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_medidas_solicita`
--

INSERT INTO `catalogos_medidas_solicita` (`MEDIDA_SOLICITA_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Ministerio Público'),
(2, 'Ofendido'),
(3, 'Victima'),
(4, 'Asesor Jurídico'),
(5, 'Defensor del adolescente imputado'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_medios_prueba`
--

CREATE TABLE `catalogos_medios_prueba` (
  `PRUEBA_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_medios_prueba`
--

INSERT INTO `catalogos_medios_prueba` (`PRUEBA_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Testimonial'),
(2, 'Pericial'),
(3, 'Declaración del acusado'),
(4, 'Documental y material'),
(5, 'Otro tipo de prueba'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_modalidad`
--

CREATE TABLE `catalogos_modalidad` (
  `MODALIDAD_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_modalidad`
--

INSERT INTO `catalogos_modalidad` (`MODALIDAD_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Simple'),
(2, 'Atenuado'),
(3, 'Agravado'),
(4, 'Calificado'),
(5, 'Agravado - Calificado'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_multa`
--

CREATE TABLE `catalogos_multa` (
  `MULTA_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_multa`
--

INSERT INTO `catalogos_multa` (`MULTA_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Hasta 5,000 pesos'),
(2, 'De 5,001 a 10,000 pesos'),
(3, 'De 10,001 a 15,000 pesos'),
(4, 'De 15,001 a 20,000 pesos'),
(5, 'De 20,001 a 25,000 pesos'),
(6, 'De 25,001 a 30,000 pesos'),
(7, 'De 30,001 a 35,000 pesos'),
(8, 'De 35,001 a 40,000 pesos'),
(9, 'De 40,001 a 45,000 pesos'),
(10, 'De 45,001 a 50,000 pesos'),
(11, 'Más de 50,000 pesos'),
(99, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_municipios`
--

CREATE TABLE `catalogos_municipios` (
  `ENTIDAD_ID` int(2) NOT NULL,
  `MUNICIPIO_ID` int(5) NOT NULL,
  `DESCRIPCION` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_municipios`
--

INSERT INTO `catalogos_municipios` (`ENTIDAD_ID`, `MUNICIPIO_ID`, `DESCRIPCION`) VALUES
(-2, -2, 'No aplica'),
(1, 1001, 'Aguascalientes'),
(1, 1002, 'Asientos'),
(1, 1003, 'Calvillo'),
(1, 1004, 'Cosío'),
(1, 1005, 'Jesús María'),
(1, 1006, 'Pabellón de Arteaga'),
(1, 1007, 'Rincón de Romos'),
(1, 1008, 'San José de Gracia'),
(1, 1009, 'Tepezalá'),
(1, 1010, 'El Llano'),
(1, 1011, 'San Francisco de los Romo'),
(1, 1999, 'No identificado'),
(2, 2001, 'Ensenada'),
(2, 2002, 'Mexicali'),
(2, 2003, 'Tecate'),
(2, 2004, 'Tijuana'),
(2, 2005, 'Playas de Rosarito'),
(2, 2999, 'No identificado'),
(3, 3001, 'Comondú'),
(3, 3002, 'Mulegé'),
(3, 3003, 'La Paz'),
(3, 3008, 'Los Cabos'),
(3, 3009, 'Loreto'),
(3, 3999, 'No identificado'),
(4, 4001, 'Calkiní'),
(4, 4002, 'Campeche'),
(4, 4003, 'Carmen'),
(4, 4004, 'Champotón'),
(4, 4005, 'Hecelchakán'),
(4, 4006, 'Hopelchén'),
(4, 4007, 'Palizada'),
(4, 4008, 'Tenabo'),
(4, 4009, 'Escárcega'),
(4, 4010, 'Calakmul'),
(4, 4011, 'Candelaria'),
(4, 4999, 'No identificado'),
(5, 5001, 'Abasolo'),
(5, 5002, 'Acuña'),
(5, 5003, 'Allende'),
(5, 5004, 'Arteaga'),
(5, 5005, 'Candela'),
(5, 5006, 'Castaños'),
(5, 5007, 'Cuatro Ciénegas'),
(5, 5008, 'Escobedo'),
(5, 5009, 'Francisco I. Madero'),
(5, 5010, 'Frontera'),
(5, 5011, 'General Cepeda'),
(5, 5012, 'Guerrero'),
(5, 5013, 'Hidalgo'),
(5, 5014, 'Jiménez'),
(5, 5015, 'Juárez'),
(5, 5016, 'Lamadrid'),
(5, 5017, 'Matamoros'),
(5, 5018, 'Monclova'),
(5, 5019, 'Morelos'),
(5, 5020, 'Múzquiz'),
(5, 5021, 'Nadadores'),
(5, 5022, 'Nava'),
(5, 5023, 'Ocampo'),
(5, 5024, 'Parras'),
(5, 5025, 'Piedras Negras'),
(5, 5026, 'Progreso'),
(5, 5027, 'Ramos Arizpe'),
(5, 5028, 'Sabinas'),
(5, 5029, 'Sacramento'),
(5, 5030, 'Saltillo'),
(5, 5031, 'San Buenaventura'),
(5, 5032, 'San Juan de Sabinas'),
(5, 5033, 'San Pedro'),
(5, 5034, 'Sierra Mojada'),
(5, 5035, 'Torreón'),
(5, 5036, 'Viesca'),
(5, 5037, 'Villa Unión'),
(5, 5038, 'Zaragoza'),
(5, 5999, 'No identificado'),
(6, 6001, 'Armería'),
(6, 6002, 'Colima'),
(6, 6003, 'Comala'),
(6, 6004, 'Coquimatlán'),
(6, 6005, 'Cuauhtémoc'),
(6, 6006, 'Ixtlahuacán'),
(6, 6007, 'Manzanillo'),
(6, 6008, 'Minatitlán'),
(6, 6009, 'Tecomán'),
(6, 6010, 'Villa de Álvarez'),
(6, 6999, 'No identificado'),
(7, 7001, 'Acacoyagua'),
(7, 7002, 'Acala'),
(7, 7003, 'Acapetahua'),
(7, 7004, 'Altamirano'),
(7, 7005, 'Amatán'),
(7, 7006, 'Amatenango de la Frontera'),
(7, 7007, 'Amatenango del Valle'),
(7, 7008, 'Angel Albino Corzo'),
(7, 7009, 'Arriaga'),
(7, 7010, 'Bejucal de Ocampo'),
(7, 7011, 'Bella Vista'),
(7, 7012, 'Berriozábal'),
(7, 7013, 'Bochil'),
(7, 7014, 'El Bosque'),
(7, 7015, 'Cacahoatán'),
(7, 7016, 'Catazajá'),
(7, 7017, 'Cintalapa'),
(7, 7018, 'Coapilla'),
(7, 7019, 'Comitán de Domínguez'),
(7, 7020, 'La Concordia'),
(7, 7021, 'Copainalá'),
(7, 7022, 'Chalchihuitán'),
(7, 7023, 'Chamula'),
(7, 7024, 'Chanal'),
(7, 7025, 'Chapultenango'),
(7, 7026, 'Chenalhó'),
(7, 7027, 'Chiapa de Corzo'),
(7, 7028, 'Chiapilla'),
(7, 7029, 'Chicoasén'),
(7, 7030, 'Chicomuselo'),
(7, 7031, 'Chilón'),
(7, 7032, 'Escuintla'),
(7, 7033, 'Francisco León'),
(7, 7034, 'Frontera Comalapa'),
(7, 7035, 'Frontera Hidalgo'),
(7, 7036, 'La Grandeza'),
(7, 7037, 'Huehuetán'),
(7, 7038, 'Huixtán'),
(7, 7039, 'Huitiupán'),
(7, 7040, 'Huixtla'),
(7, 7041, 'La Independencia'),
(7, 7042, 'Ixhuatán'),
(7, 7043, 'Ixtacomitán'),
(7, 7044, 'Ixtapa'),
(7, 7045, 'Ixtapangajoya'),
(7, 7046, 'Jiquipilas'),
(7, 7047, 'Jitotol'),
(7, 7048, 'Juárez'),
(7, 7049, 'Larráinzar'),
(7, 7050, 'La Libertad'),
(7, 7051, 'Mapastepec'),
(7, 7052, 'Las Margaritas'),
(7, 7053, 'Mazapa de Madero'),
(7, 7054, 'Mazatán'),
(7, 7055, 'Metapa'),
(7, 7056, 'Mitontic'),
(7, 7057, 'Motozintla'),
(7, 7058, 'Nicolás Ruíz'),
(7, 7059, 'Ocosingo'),
(7, 7060, 'Ocotepec'),
(7, 7061, 'Ocozocoautla de Espinosa'),
(7, 7062, 'Ostuacán'),
(7, 7063, 'Osumacinta'),
(7, 7064, 'Oxchuc'),
(7, 7065, 'Palenque'),
(7, 7066, 'Pantelhó'),
(7, 7067, 'Pantepec'),
(7, 7068, 'Pichucalco'),
(7, 7069, 'Pijijiapan'),
(7, 7070, 'El Porvenir'),
(7, 7071, 'Villa Comaltitlán'),
(7, 7072, 'Pueblo Nuevo Solistahuacán'),
(7, 7073, 'Rayón'),
(7, 7074, 'Reforma'),
(7, 7075, 'Las Rosas'),
(7, 7076, 'Sabanilla'),
(7, 7077, 'Salto de Agua'),
(7, 7078, 'San Cristóbal de las Casas'),
(7, 7079, 'San Fernando'),
(7, 7080, 'Siltepec'),
(7, 7081, 'Simojovel'),
(7, 7082, 'Sitalá'),
(7, 7083, 'Socoltenango'),
(7, 7084, 'Solosuchiapa'),
(7, 7085, 'Soyaló'),
(7, 7086, 'Suchiapa'),
(7, 7087, 'Suchiate'),
(7, 7088, 'Sunuapa'),
(7, 7089, 'Tapachula'),
(7, 7090, 'Tapalapa'),
(7, 7091, 'Tapilula'),
(7, 7092, 'Tecpatán'),
(7, 7093, 'Tenejapa'),
(7, 7094, 'Teopisca'),
(7, 7096, 'Tila'),
(7, 7097, 'Tonalá'),
(7, 7098, 'Totolapa'),
(7, 7099, 'La Trinitaria'),
(7, 7100, 'Tumbalá'),
(7, 7101, 'Tuxtla Gutiérrez'),
(7, 7102, 'Tuxtla Chico'),
(7, 7103, 'Tuzantán'),
(7, 7104, 'Tzimol'),
(7, 7105, 'Unión Juárez'),
(7, 7106, 'Venustiano Carranza'),
(7, 7107, 'Villa Corzo'),
(7, 7108, 'Villaflores'),
(7, 7109, 'Yajalón'),
(7, 7110, 'San Lucas'),
(7, 7111, 'Zinacantán'),
(7, 7112, 'San Juan Cancuc'),
(7, 7113, 'Aldama'),
(7, 7114, 'Benemérito de las Américas'),
(7, 7115, 'Maravilla Tenejapa'),
(7, 7116, 'Marqués de Comillas'),
(7, 7117, 'Montecristo de Guerrero'),
(7, 7118, 'San Andrés Duraznal'),
(7, 7119, 'Santiago el Pinar'),
(7, 7120, 'Capitán Luis Ángel Vidal'),
(7, 7121, 'Rincón Chamula San Pedro'),
(7, 7122, 'El Parral'),
(7, 7123, 'Emiliano Zapata'),
(7, 7124, 'Mezcalapa'),
(7, 7999, 'No identificado'),
(8, 8001, 'Ahumada'),
(8, 8002, 'Aldama'),
(8, 8003, 'Allende'),
(8, 8004, 'Aquiles Serdán'),
(8, 8005, 'Ascensión'),
(8, 8006, 'Bachíniva'),
(8, 8007, 'Balleza'),
(8, 8008, 'Batopilas'),
(8, 8009, 'Bocoyna'),
(8, 8010, 'Buenaventura'),
(8, 8011, 'Camargo'),
(8, 8012, 'Carichí'),
(8, 8013, 'Casas Grandes'),
(8, 8014, 'Coronado'),
(8, 8015, 'Coyame del Sotol'),
(8, 8016, 'La Cruz'),
(8, 8017, 'Cuauhtémoc'),
(8, 8018, 'Cusihuiriachi'),
(8, 8019, 'Chihuahua'),
(8, 8020, 'Chínipas'),
(8, 8021, 'Delicias'),
(8, 8022, 'Dr. Belisario Domínguez'),
(8, 8023, 'Galeana'),
(8, 8024, 'Santa Isabel'),
(8, 8025, 'Gómez Farías'),
(8, 8026, 'Gran Morelos'),
(8, 8027, 'Guachochi'),
(8, 8028, 'Guadalupe'),
(8, 8029, 'Guadalupe y Calvo'),
(8, 8030, 'Guazapares'),
(8, 8031, 'Guerrero'),
(8, 8032, 'Hidalgo del Parral'),
(8, 8033, 'Huejotitán'),
(8, 8034, 'Ignacio Zaragoza'),
(8, 8035, 'Janos'),
(8, 8036, 'Jiménez'),
(8, 8037, 'Juárez'),
(8, 8038, 'Julimes'),
(8, 8039, 'López'),
(8, 8040, 'Madera'),
(8, 8041, 'Maguarichi'),
(8, 8042, 'Manuel Benavides'),
(8, 8043, 'Matachí'),
(8, 8044, 'Matamoros'),
(8, 8045, 'Meoqui'),
(8, 8046, 'Morelos'),
(8, 8047, 'Moris'),
(8, 8048, 'Namiquipa'),
(8, 8049, 'Nonoava'),
(8, 8050, 'Nuevo Casas Grandes'),
(8, 8051, 'Ocampo'),
(8, 8052, 'Ojinaga'),
(8, 8053, 'Praxedis G. Guerrero'),
(8, 8054, 'Riva Palacio'),
(8, 8055, 'Rosales'),
(8, 8056, 'Rosario'),
(8, 8057, 'San Francisco de Borja'),
(8, 8058, 'San Francisco de Conchos'),
(8, 8059, 'San Francisco del Oro'),
(8, 8060, 'Santa Bárbara'),
(8, 8061, 'Satevó'),
(8, 8062, 'Saucillo'),
(8, 8063, 'Temósachic'),
(8, 8064, 'El Tule'),
(8, 8065, 'Urique'),
(8, 8066, 'Uruachi'),
(8, 8067, 'Valle de Zaragoza'),
(8, 8999, 'No identificado'),
(9, 9002, 'Azcapotzalco'),
(9, 9003, 'Coyoacán'),
(9, 9004, 'Cuajimalpa de Morelos'),
(9, 9005, 'Gustavo A. Madero'),
(9, 9006, 'Iztacalco'),
(9, 9007, 'Iztapalapa'),
(9, 9008, 'La Magdalena Contreras'),
(9, 9009, 'Milpa Alta'),
(9, 9010, 'Álvaro Obregón'),
(9, 9011, 'Tláhuac'),
(9, 9012, 'Tlalpan'),
(9, 9013, 'Xochimilco'),
(9, 9014, 'Benito Juárez'),
(9, 9015, 'Cuauhtémoc'),
(9, 9016, 'Miguel Hidalgo'),
(9, 9017, 'Venustiano Carranza'),
(9, 9999, 'No identificado'),
(10, 10001, 'Canatlán'),
(10, 10002, 'Canelas'),
(10, 10003, 'Coneto de Comonfort'),
(10, 10004, 'Cuencamé'),
(10, 10005, 'Durango'),
(10, 10006, 'General Simón Bolívar'),
(10, 10007, 'Gómez Palacio'),
(10, 10008, 'Guadalupe Victoria'),
(10, 10009, 'Guanaceví'),
(10, 10010, 'Hidalgo'),
(10, 10011, 'Indé'),
(10, 10012, 'Lerdo'),
(10, 10013, 'Mapimí'),
(10, 10014, 'Mezquital'),
(10, 10015, 'Nazas'),
(10, 10016, 'Nombre de Dios'),
(10, 10017, 'Ocampo'),
(10, 10018, 'El Oro'),
(10, 10019, 'Otáez'),
(10, 10020, 'Pánuco de Coronado'),
(10, 10021, 'Peñón Blanco'),
(10, 10022, 'Poanas'),
(10, 10023, 'Pueblo Nuevo'),
(10, 10024, 'Rodeo'),
(10, 10025, 'San Bernardo'),
(10, 10026, 'San Dimas'),
(10, 10027, 'San Juan de Guadalupe'),
(10, 10028, 'San Juan del Río'),
(10, 10029, 'San Luis del Cordero'),
(10, 10030, 'San Pedro del Gallo'),
(10, 10031, 'Santa Clara'),
(10, 10032, 'Santiago Papasquiaro'),
(10, 10033, 'Súchil'),
(10, 10034, 'Tamazula'),
(10, 10035, 'Tepehuanes'),
(10, 10036, 'Tlahualilo'),
(10, 10037, 'Topia'),
(10, 10038, 'Vicente Guerrero'),
(10, 10039, 'Nuevo Ideal'),
(10, 10999, 'No identificado'),
(11, 11001, 'Abasolo'),
(11, 11002, 'Acámbaro'),
(11, 11003, 'San Miguel de Allende'),
(11, 11004, 'Apaseo el Alto'),
(11, 11005, 'Apaseo el Grande'),
(11, 11006, 'Atarjea'),
(11, 11007, 'Celaya'),
(11, 11008, 'Manuel Doblado'),
(11, 11009, 'Comonfort'),
(11, 11010, 'Coroneo'),
(11, 11011, 'Cortazar'),
(11, 11012, 'Cuerámaro'),
(11, 11013, 'Doctor Mora'),
(11, 11014, 'Dolores Hidalgo Cuna de la Independencia Nacional'),
(11, 11015, 'Guanajuato'),
(11, 11016, 'Huanímaro'),
(11, 11017, 'Irapuato'),
(11, 11018, 'Jaral del Progreso'),
(11, 11019, 'Jerécuaro'),
(11, 11020, 'León'),
(11, 11021, 'Moroleón'),
(11, 11022, 'Ocampo'),
(11, 11023, 'Pénjamo'),
(11, 11024, 'Pueblo Nuevo'),
(11, 11025, 'Purísima del Rincón'),
(11, 11026, 'Romita'),
(11, 11027, 'Salamanca'),
(11, 11028, 'Salvatierra'),
(11, 11029, 'San Diego de la Unión'),
(11, 11030, 'San Felipe'),
(11, 11031, 'San Francisco del Rincón'),
(11, 11032, 'San José Iturbide'),
(11, 11033, 'San Luis de la Paz'),
(11, 11034, 'Santa Catarina'),
(11, 11035, 'Santa Cruz de Juventino Rosas'),
(11, 11036, 'Santiago Maravatío'),
(11, 11037, 'Silao'),
(11, 11038, 'Tarandacuao'),
(11, 11039, 'Tarimoro'),
(11, 11040, 'Tierra Blanca'),
(11, 11041, 'Uriangato'),
(11, 11042, 'Valle de Santiago'),
(11, 11043, 'Victoria'),
(11, 11044, 'Villagrán'),
(11, 11045, 'Xichú'),
(11, 11046, 'Yuriria'),
(11, 11999, 'No identificado'),
(12, 12001, 'Acapulco de Juárez'),
(12, 12002, 'Ahuacuotzingo'),
(12, 12003, 'Ajuchitlán del Progreso'),
(12, 12004, 'Alcozauca de Guerrero'),
(12, 12005, 'Alpoyeca'),
(12, 12006, 'Apaxtla'),
(12, 12007, 'Arcelia'),
(12, 12008, 'Atenango del Río'),
(12, 12009, 'Atlamajalcingo del Monte'),
(12, 12010, 'Atlixtac'),
(12, 12011, 'Atoyac de Álvarez'),
(12, 12012, 'Ayutla de los Libres'),
(12, 12013, 'Azoyú'),
(12, 12014, 'Benito Juárez'),
(12, 12015, 'Buenavista de Cuéllar'),
(12, 12016, 'Coahuayutla de José María Izazaga'),
(12, 12017, 'Cocula'),
(12, 12018, 'Copala'),
(12, 12019, 'Copalillo'),
(12, 12020, 'Copanatoyac'),
(12, 12021, 'Coyuca de Benítez'),
(12, 12022, 'Coyuca de Catalán'),
(12, 12023, 'Cuajinicuilapa'),
(12, 12024, 'Cualác'),
(12, 12025, 'Cuautepec'),
(12, 12026, 'Cuetzala del Progreso'),
(12, 12027, 'Cutzamala de Pinzón'),
(12, 12028, 'Chilapa de Álvarez'),
(12, 12029, 'Chilpancingo de los Bravo'),
(12, 12030, 'Florencio Villarreal'),
(12, 12031, 'General Canuto A. Neri'),
(12, 12032, 'General Heliodoro Castillo'),
(12, 12033, 'Huamuxtitlán'),
(12, 12034, 'Huitzuco de los Figueroa'),
(12, 12035, 'Iguala de la Independencia'),
(12, 12036, 'Igualapa'),
(12, 12037, 'Ixcateopan de Cuauhtémoc'),
(12, 12038, 'Zihuatanejo de Azueta'),
(12, 12039, 'Juan R. Escudero'),
(12, 12040, 'Leonardo Bravo'),
(12, 12041, 'Malinaltepec'),
(12, 12042, 'Mártir de Cuilapan'),
(12, 12043, 'Metlatónoc'),
(12, 12044, 'Mochitlán'),
(12, 12045, 'Olinalá'),
(12, 12046, 'Ometepec'),
(12, 12047, 'Pedro Ascencio Alquisiras'),
(12, 12048, 'Petatlán'),
(12, 12049, 'Pilcaya'),
(12, 12050, 'Pungarabato'),
(12, 12051, 'Quechultenango'),
(12, 12052, 'San Luis Acatlán'),
(12, 12053, 'San Marcos'),
(12, 12054, 'San Miguel Totolapan'),
(12, 12055, 'Taxco de Alarcón'),
(12, 12056, 'Tecoanapa'),
(12, 12057, 'Técpan de Galeana'),
(12, 12058, 'Teloloapan'),
(12, 12059, 'Tepecoacuilco de Trujano'),
(12, 12060, 'Tetipac'),
(12, 12061, 'Tixtla de Guerrero'),
(12, 12062, 'Tlacoachistlahuaca'),
(12, 12063, 'Tlacoapa'),
(12, 12064, 'Tlalchapa'),
(12, 12065, 'Tlalixtaquilla de Maldonado'),
(12, 12066, 'Tlapa de Comonfort'),
(12, 12067, 'Tlapehuala'),
(12, 12068, 'La Unión de Isidoro Montes de Oca'),
(12, 12069, 'Xalpatláhuac'),
(12, 12070, 'Xochihuehuetlán'),
(12, 12071, 'Xochistlahuaca'),
(12, 12072, 'Zapotitlán Tablas'),
(12, 12073, 'Zirándaro'),
(12, 12074, 'Zitlala'),
(12, 12075, 'Eduardo Neri'),
(12, 12076, 'Acatepec'),
(12, 12077, 'Marquelia'),
(12, 12078, 'Cochoapa el Grande'),
(12, 12079, 'José Joaquín de Herrera'),
(12, 12080, 'Juchitán'),
(12, 12081, 'Iliatenco'),
(12, 12999, 'No identificado'),
(13, 13001, 'Acatlán'),
(13, 13002, 'Acaxochitlán'),
(13, 13003, 'Actopan'),
(13, 13004, 'Agua Blanca de Iturbide'),
(13, 13005, 'Ajacuba'),
(13, 13006, 'Alfajayucan'),
(13, 13007, 'Almoloya'),
(13, 13008, 'Apan'),
(13, 13009, 'El Arenal'),
(13, 13010, 'Atitalaquia'),
(13, 13011, 'Atlapexco'),
(13, 13012, 'Atotonilco el Grande'),
(13, 13013, 'Atotonilco de Tula'),
(13, 13014, 'Calnali'),
(13, 13015, 'Cardonal'),
(13, 13016, 'Cuautepec de Hinojosa'),
(13, 13017, 'Chapantongo'),
(13, 13018, 'Chapulhuacán'),
(13, 13019, 'Chilcuautla'),
(13, 13020, 'Eloxochitlán'),
(13, 13021, 'Emiliano Zapata'),
(13, 13022, 'Epazoyucan'),
(13, 13023, 'Francisco I. Madero'),
(13, 13024, 'Huasca de Ocampo'),
(13, 13025, 'Huautla'),
(13, 13026, 'Huazalingo'),
(13, 13027, 'Huehuetla'),
(13, 13028, 'Huejutla de Reyes'),
(13, 13029, 'Huichapan'),
(13, 13030, 'Ixmiquilpan'),
(13, 13031, 'Jacala de Ledezma'),
(13, 13032, 'Jaltocán'),
(13, 13033, 'Juárez Hidalgo'),
(13, 13034, 'Lolotla'),
(13, 13035, 'Metepec'),
(13, 13036, 'San Agustín Metzquititlán'),
(13, 13037, 'Metztitlán'),
(13, 13038, 'Mineral del Chico'),
(13, 13039, 'Mineral del Monte'),
(13, 13040, 'La Misión'),
(13, 13041, 'Mixquiahuala de Juárez'),
(13, 13042, 'Molango de Escamilla'),
(13, 13043, 'Nicolás Flores'),
(13, 13044, 'Nopala de Villagrán'),
(13, 13045, 'Omitlán de Juárez'),
(13, 13046, 'San Felipe Orizatlán'),
(13, 13047, 'Pacula'),
(13, 13048, 'Pachuca de Soto'),
(13, 13049, 'Pisaflores'),
(13, 13050, 'Progreso de Obregón'),
(13, 13051, 'Mineral de la Reforma'),
(13, 13052, 'San Agustín Tlaxiaca'),
(13, 13053, 'San Bartolo Tutotepec'),
(13, 13054, 'San Salvador'),
(13, 13055, 'Santiago de Anaya'),
(13, 13056, 'Santiago Tulantepec de Lugo Guerrero'),
(13, 13057, 'Singuilucan'),
(13, 13058, 'Tasquillo'),
(13, 13059, 'Tecozautla'),
(13, 13060, 'Tenango de Doria'),
(13, 13061, 'Tepeapulco'),
(13, 13062, 'Tepehuacán de Guerrero'),
(13, 13063, 'Tepeji del Río de Ocampo'),
(13, 13064, 'Tepetitlán'),
(13, 13065, 'Tetepango'),
(13, 13066, 'Villa de Tezontepec'),
(13, 13067, 'Tezontepec de Aldama'),
(13, 13068, 'Tianguistengo'),
(13, 13069, 'Tizayuca'),
(13, 13070, 'Tlahuelilpan'),
(13, 13071, 'Tlahuiltepa'),
(13, 13072, 'Tlanalapa'),
(13, 13073, 'Tlanchinol'),
(13, 13074, 'Tlaxcoapan'),
(13, 13075, 'Tolcayuca'),
(13, 13076, 'Tula de Allende'),
(13, 13077, 'Tulancingo de Bravo'),
(13, 13078, 'Xochiatipan'),
(13, 13079, 'Xochicoatlán'),
(13, 13080, 'Yahualica'),
(13, 13081, 'Zacualtipán de Ángeles'),
(13, 13082, 'Zapotlán de Juárez'),
(13, 13083, 'Zempoala'),
(13, 13084, 'Zimapán'),
(13, 13999, 'No identificado'),
(14, 14001, 'Acatic'),
(14, 14002, 'Acatlán de Juárez'),
(14, 14003, 'Ahualulco de Mercado'),
(14, 14004, 'Amacueca'),
(14, 14005, 'Amatitán'),
(14, 14006, 'Ameca'),
(14, 14007, 'San Juanito de Escobedo'),
(14, 14008, 'Arandas'),
(14, 14009, 'El Arenal'),
(14, 14010, 'Atemajac de Brizuela'),
(14, 14011, 'Atengo'),
(14, 14012, 'Atenguillo'),
(14, 14013, 'Atotonilco el Alto'),
(14, 14014, 'Atoyac'),
(14, 14015, 'Autlán de Navarro'),
(14, 14016, 'Ayotlán'),
(14, 14017, 'Ayutla'),
(14, 14018, 'La Barca'),
(14, 14019, 'Bolaños'),
(14, 14020, 'Cabo Corrientes'),
(14, 14021, 'Casimiro Castillo'),
(14, 14022, 'Cihuatlán'),
(14, 14023, 'Zapotlán el Grande'),
(14, 14024, 'Cocula'),
(14, 14025, 'Colotlán'),
(14, 14026, 'Concepción de Buenos Aires'),
(14, 14027, 'Cuautitlán de García Barragán'),
(14, 14028, 'Cuautla'),
(14, 14029, 'Cuquío'),
(14, 14030, 'Chapala'),
(14, 14031, 'Chimaltitán'),
(14, 14032, 'Chiquilistlán'),
(14, 14033, 'Degollado'),
(14, 14034, 'Ejutla'),
(14, 14035, 'Encarnación de Díaz'),
(14, 14036, 'Etzatlán'),
(14, 14037, 'El Grullo'),
(14, 14038, 'Guachinango'),
(14, 14039, 'Guadalajara'),
(14, 14040, 'Hostotipaquillo'),
(14, 14041, 'Huejúcar'),
(14, 14042, 'Huejuquilla el Alto'),
(14, 14043, 'La Huerta'),
(14, 14044, 'Ixtlahuacán de los Membrillos'),
(14, 14045, 'Ixtlahuacán del Río'),
(14, 14046, 'Jalostotitlán'),
(14, 14047, 'Jamay'),
(14, 14048, 'Jesús María'),
(14, 14049, 'Jilotlán de los Dolores'),
(14, 14050, 'Jocotepec'),
(14, 14051, 'Juanacatlán'),
(14, 14052, 'Juchitlán'),
(14, 14053, 'Lagos de Moreno'),
(14, 14054, 'El Limón'),
(14, 14055, 'Magdalena'),
(14, 14056, 'Santa María del Oro'),
(14, 14057, 'La Manzanilla de la Paz'),
(14, 14058, 'Mascota'),
(14, 14059, 'Mazamitla'),
(14, 14060, 'Mexticacán'),
(14, 14061, 'Mezquitic'),
(14, 14062, 'Mixtlán'),
(14, 14063, 'Ocotlán'),
(14, 14064, 'Ojuelos de Jalisco'),
(14, 14065, 'Pihuamo'),
(14, 14066, 'Poncitlán'),
(14, 14067, 'Puerto Vallarta'),
(14, 14068, 'Villa Purificación'),
(14, 14069, 'Quitupan'),
(14, 14070, 'El Salto'),
(14, 14071, 'San Cristóbal de la Barranca'),
(14, 14072, 'San Diego de Alejandría'),
(14, 14073, 'San Juan de los Lagos'),
(14, 14074, 'San Julián'),
(14, 14075, 'San Marcos'),
(14, 14076, 'San Martín de Bolaños'),
(14, 14077, 'San Martín Hidalgo'),
(14, 14078, 'San Miguel el Alto'),
(14, 14079, 'Gómez Farías'),
(14, 14080, 'San Sebastián del Oeste'),
(14, 14081, 'Santa María de los Ángeles'),
(14, 14082, 'Sayula'),
(14, 14083, 'Tala'),
(14, 14084, 'Talpa de Allende'),
(14, 14085, 'Tamazula de Gordiano'),
(14, 14086, 'Tapalpa'),
(14, 14087, 'Tecalitlán'),
(14, 14088, 'Tecolotlán'),
(14, 14089, 'Techaluta de Montenegro'),
(14, 14090, 'Tenamaxtlán'),
(14, 14091, 'Teocaltiche'),
(14, 14092, 'Teocuitatlán de Corona'),
(14, 14093, 'Tepatitlán de Morelos'),
(14, 14094, 'Tequila'),
(14, 14095, 'Teuchitlán'),
(14, 14096, 'Tizapán el Alto'),
(14, 14097, 'Tlajomulco de Zúñiga'),
(14, 14098, 'San Pedro Tlaquepaque'),
(14, 14099, 'Tolimán'),
(14, 14100, 'Tomatlán'),
(14, 14101, 'Tonalá'),
(14, 14102, 'Tonaya'),
(14, 14103, 'Tonila'),
(14, 14104, 'Totatiche'),
(14, 14105, 'Tototlán'),
(14, 14106, 'Tuxcacuesco'),
(14, 14107, 'Tuxcueca'),
(14, 14108, 'Tuxpan'),
(14, 14109, 'Unión de San Antonio'),
(14, 14110, 'Unión de Tula'),
(14, 14111, 'Valle de Guadalupe'),
(14, 14112, 'Valle de Juárez'),
(14, 14113, 'San Gabriel'),
(14, 14114, 'Villa Corona'),
(14, 14115, 'Villa Guerrero'),
(14, 14116, 'Villa Hidalgo'),
(14, 14117, 'Cañadas de Obregón'),
(14, 14118, 'Yahualica de González Gallo'),
(14, 14119, 'Zacoalco de Torres'),
(14, 14120, 'Zapopan'),
(14, 14121, 'Zapotiltic'),
(14, 14122, 'Zapotitlán de Vadillo'),
(14, 14123, 'Zapotlán del Rey'),
(14, 14124, 'Zapotlanejo'),
(14, 14125, 'San Ignacio Cerro Gordo'),
(14, 14999, 'No identificado'),
(15, 15001, 'Acambay'),
(15, 15002, 'Acolman'),
(15, 15003, 'Aculco'),
(15, 15004, 'Almoloya de Alquisiras'),
(15, 15005, 'Almoloya de Juárez'),
(15, 15006, 'Almoloya del Río'),
(15, 15007, 'Amanalco'),
(15, 15008, 'Amatepec'),
(15, 15009, 'Amecameca'),
(15, 15010, 'Apaxco'),
(15, 15011, 'Atenco'),
(15, 15012, 'Atizapán'),
(15, 15013, 'Atizapán de Zaragoza'),
(15, 15014, 'Atlacomulco'),
(15, 15015, 'Atlautla'),
(15, 15016, 'Axapusco'),
(15, 15017, 'Ayapango'),
(15, 15018, 'Calimaya'),
(15, 15019, 'Capulhuac'),
(15, 15020, 'Coacalco de Berriozábal'),
(15, 15021, 'Coatepec Harinas'),
(15, 15022, 'Cocotitlán'),
(15, 15023, 'Coyotepec'),
(15, 15024, 'Cuautitlán'),
(15, 15025, 'Chalco'),
(15, 15026, 'Chapa de Mota'),
(15, 15027, 'Chapultepec'),
(15, 15028, 'Chiautla'),
(15, 15029, 'Chicoloapan'),
(15, 15030, 'Chiconcuac'),
(15, 15031, 'Chimalhuacán'),
(15, 15032, 'Donato Guerra'),
(15, 15033, 'Ecatepec de Morelos'),
(15, 15034, 'Ecatzingo'),
(15, 15035, 'Huehuetoca'),
(15, 15036, 'Hueypoxtla'),
(15, 15037, 'Huixquilucan'),
(15, 15038, 'Isidro Fabela'),
(15, 15039, 'Ixtapaluca'),
(15, 15040, 'Ixtapan de la Sal'),
(15, 15041, 'Ixtapan del Oro'),
(15, 15042, 'Ixtlahuaca'),
(15, 15043, 'Xalatlaco'),
(15, 15044, 'Jaltenco'),
(15, 15045, 'Jilotepec'),
(15, 15046, 'Jilotzingo'),
(15, 15047, 'Jiquipilco'),
(15, 15048, 'Jocotitlán'),
(15, 15049, 'Joquicingo'),
(15, 15050, 'Juchitepec'),
(15, 15051, 'Lerma'),
(15, 15052, 'Malinalco'),
(15, 15053, 'Melchor Ocampo'),
(15, 15054, 'Metepec'),
(15, 15055, 'Mexicaltzingo'),
(15, 15056, 'Morelos'),
(15, 15057, 'Naucalpan de Juárez'),
(15, 15058, 'Nezahualcóyotl'),
(15, 15059, 'Nextlalpan'),
(15, 15060, 'Nicolás Romero'),
(15, 15061, 'Nopaltepec'),
(15, 15062, 'Ocoyoacac'),
(15, 15063, 'Ocuilan'),
(15, 15064, 'El Oro'),
(15, 15065, 'Otumba'),
(15, 15066, 'Otzoloapan'),
(15, 15067, 'Otzolotepec'),
(15, 15068, 'Ozumba'),
(15, 15069, 'Papalotla'),
(15, 15070, 'La Paz'),
(15, 15071, 'Polotitlán'),
(15, 15072, 'Rayón'),
(15, 15073, 'San Antonio la Isla'),
(15, 15074, 'San Felipe del Progreso'),
(15, 15075, 'San Martín de las Pirámides'),
(15, 15076, 'San Mateo Atenco'),
(15, 15077, 'San Simón de Guerrero'),
(15, 15078, 'Santo Tomás'),
(15, 15079, 'Soyaniquilpan de Juárez'),
(15, 15080, 'Sultepec'),
(15, 15081, 'Tecámac'),
(15, 15082, 'Tejupilco'),
(15, 15083, 'Temamatla'),
(15, 15084, 'Temascalapa'),
(15, 15085, 'Temascalcingo'),
(15, 15086, 'Temascaltepec'),
(15, 15087, 'Temoaya'),
(15, 15088, 'Tenancingo'),
(15, 15089, 'Tenango del Aire'),
(15, 15090, 'Tenango del Valle'),
(15, 15091, 'Teoloyucan'),
(15, 15092, 'Teotihuacán'),
(15, 15093, 'Tepetlaoxtoc'),
(15, 15094, 'Tepetlixpa'),
(15, 15095, 'Tepotzotlán'),
(15, 15096, 'Tequixquiac'),
(15, 15097, 'Texcaltitlán'),
(15, 15098, 'Texcalyacac'),
(15, 15099, 'Texcoco'),
(15, 15100, 'Tezoyuca'),
(15, 15101, 'Tianguistenco'),
(15, 15102, 'Timilpan'),
(15, 15103, 'Tlalmanalco'),
(15, 15104, 'Tlalnepantla de Baz'),
(15, 15105, 'Tlatlaya'),
(15, 15106, 'Toluca'),
(15, 15107, 'Tonatico'),
(15, 15108, 'Tultepec'),
(15, 15109, 'Tultitlán'),
(15, 15110, 'Valle de Bravo'),
(15, 15111, 'Villa de Allende'),
(15, 15112, 'Villa del Carbón'),
(15, 15113, 'Villa Guerrero'),
(15, 15114, 'Villa Victoria'),
(15, 15115, 'Xonacatlán'),
(15, 15116, 'Zacazonapan'),
(15, 15117, 'Zacualpan'),
(15, 15118, 'Zinacantepec'),
(15, 15119, 'Zumpahuacán'),
(15, 15120, 'Zumpango'),
(15, 15121, 'Cuautitlán Izcalli'),
(15, 15122, 'Valle de Chalco Solidaridad'),
(15, 15123, 'Luvianos'),
(15, 15124, 'San José del Rincón'),
(15, 15125, 'Tonanitla'),
(15, 15999, 'No identificado'),
(16, 16001, 'Acuitzio'),
(16, 16002, 'Aguililla'),
(16, 16003, 'Álvaro Obregón'),
(16, 16004, 'Angamacutiro'),
(16, 16005, 'Angangueo'),
(16, 16006, 'Apatzingán'),
(16, 16007, 'Aporo'),
(16, 16008, 'Aquila'),
(16, 16009, 'Ario'),
(16, 16010, 'Arteaga'),
(16, 16011, 'Briseñas'),
(16, 16012, 'Buenavista'),
(16, 16013, 'Carácuaro'),
(16, 16014, 'Coahuayana'),
(16, 16015, 'Coalcomán de Vázquez Pallares'),
(16, 16016, 'Coeneo'),
(16, 16017, 'Contepec'),
(16, 16018, 'Copándaro'),
(16, 16019, 'Cotija'),
(16, 16020, 'Cuitzeo'),
(16, 16021, 'Charapan'),
(16, 16022, 'Charo'),
(16, 16023, 'Chavinda'),
(16, 16024, 'Cherán'),
(16, 16025, 'Chilchota'),
(16, 16026, 'Chinicuila'),
(16, 16027, 'Chucándiro'),
(16, 16028, 'Churintzio'),
(16, 16029, 'Churumuco'),
(16, 16030, 'Ecuandureo'),
(16, 16031, 'Epitacio Huerta'),
(16, 16032, 'Erongarícuaro'),
(16, 16033, 'Gabriel Zamora'),
(16, 16034, 'Hidalgo'),
(16, 16035, 'La Huacana'),
(16, 16036, 'Huandacareo'),
(16, 16037, 'Huaniqueo'),
(16, 16038, 'Huetamo'),
(16, 16039, 'Huiramba'),
(16, 16040, 'Indaparapeo'),
(16, 16041, 'Irimbo'),
(16, 16042, 'Ixtlán'),
(16, 16043, 'Jacona'),
(16, 16044, 'Jiménez'),
(16, 16045, 'Jiquilpan'),
(16, 16046, 'Juárez'),
(16, 16047, 'Jungapeo'),
(16, 16048, 'Lagunillas'),
(16, 16049, 'Madero'),
(16, 16050, 'Maravatío'),
(16, 16051, 'Marcos Castellanos'),
(16, 16052, 'Lázaro Cárdenas'),
(16, 16053, 'Morelia'),
(16, 16054, 'Morelos'),
(16, 16055, 'Múgica'),
(16, 16056, 'Nahuatzen'),
(16, 16057, 'Nocupétaro'),
(16, 16058, 'Nuevo Parangaricutiro'),
(16, 16059, 'Nuevo Urecho'),
(16, 16060, 'Numarán'),
(16, 16061, 'Ocampo'),
(16, 16062, 'Pajacuarán'),
(16, 16063, 'Panindícuaro'),
(16, 16064, 'Parácuaro'),
(16, 16065, 'Paracho'),
(16, 16066, 'Pátzcuaro'),
(16, 16067, 'Penjamillo'),
(16, 16068, 'Peribán'),
(16, 16069, 'La Piedad'),
(16, 16070, 'Purépero'),
(16, 16071, 'Puruándiro'),
(16, 16072, 'Queréndaro'),
(16, 16073, 'Quiroga'),
(16, 16074, 'Cojumatlán de Régules'),
(16, 16075, 'Los Reyes'),
(16, 16076, 'Sahuayo'),
(16, 16077, 'San Lucas'),
(16, 16078, 'Santa Ana Maya'),
(16, 16079, 'Salvador Escalante'),
(16, 16080, 'Senguio'),
(16, 16081, 'Susupuato'),
(16, 16082, 'Tacámbaro'),
(16, 16083, 'Tancítaro'),
(16, 16084, 'Tangamandapio'),
(16, 16085, 'Tangancícuaro'),
(16, 16086, 'Tanhuato'),
(16, 16087, 'Taretan'),
(16, 16088, 'Tarímbaro'),
(16, 16089, 'Tepalcatepec'),
(16, 16090, 'Tingambato'),
(16, 16091, 'Tingüindín'),
(16, 16092, 'Tiquicheo de Nicolás Romero'),
(16, 16093, 'Tlalpujahua'),
(16, 16094, 'Tlazazalca'),
(16, 16095, 'Tocumbo'),
(16, 16096, 'Tumbiscatío'),
(16, 16097, 'Turicato'),
(16, 16098, 'Tuxpan'),
(16, 16099, 'Tuzantla'),
(16, 16100, 'Tzintzuntzan'),
(16, 16101, 'Tzitzio'),
(16, 16102, 'Uruapan'),
(16, 16103, 'Venustiano Carranza'),
(16, 16104, 'Villamar'),
(16, 16105, 'Vista Hermosa'),
(16, 16106, 'Yurécuaro'),
(16, 16107, 'Zacapu'),
(16, 16108, 'Zamora'),
(16, 16109, 'Zináparo'),
(16, 16110, 'Zinapécuaro'),
(16, 16111, 'Ziracuaretiro'),
(16, 16112, 'Zitácuaro'),
(16, 16113, 'José Sixto Verduzco'),
(16, 16999, 'No identificado'),
(17, 17001, 'Amacuzac'),
(17, 17002, 'Atlatlahucan'),
(17, 17003, 'Axochiapan'),
(17, 17004, 'Ayala'),
(17, 17005, 'Coatlán del Río'),
(17, 17006, 'Cuautla'),
(17, 17007, 'Cuernavaca'),
(17, 17008, 'Emiliano Zapata'),
(17, 17009, 'Huitzilac'),
(17, 17010, 'Jantetelco'),
(17, 17011, 'Jiutepec'),
(17, 17012, 'Jojutla'),
(17, 17013, 'Jonacatepec'),
(17, 17014, 'Mazatepec'),
(17, 17015, 'Miacatlán'),
(17, 17016, 'Ocuituco'),
(17, 17017, 'Puente de Ixtla'),
(17, 17018, 'Temixco'),
(17, 17019, 'Tepalcingo'),
(17, 17020, 'Tepoztlán'),
(17, 17021, 'Tetecala'),
(17, 17022, 'Tetela del Volcán'),
(17, 17023, 'Tlalnepantla'),
(17, 17024, 'Tlaltizapán de Zapata'),
(17, 17025, 'Tlaquiltenango'),
(17, 17026, 'Tlayacapan'),
(17, 17027, 'Totolapan'),
(17, 17028, 'Xochitepec'),
(17, 17029, 'Yautepec'),
(17, 17030, 'Yecapixtla'),
(17, 17031, 'Zacatepec'),
(17, 17032, 'Zacualpan'),
(17, 17033, 'Temoac'),
(17, 17999, 'No identificado'),
(18, 18001, 'Acaponeta'),
(18, 18002, 'Ahuacatlán'),
(18, 18003, 'Amatlán de Cañas'),
(18, 18004, 'Compostela'),
(18, 18005, 'Huajicori'),
(18, 18006, 'Ixtlán del Río'),
(18, 18007, 'Jala'),
(18, 18008, 'Xalisco'),
(18, 18009, 'Del Nayar'),
(18, 18010, 'Rosamorada'),
(18, 18011, 'Ruíz'),
(18, 18012, 'San Blas'),
(18, 18013, 'San Pedro Lagunillas'),
(18, 18014, 'Santa María del Oro'),
(18, 18015, 'Santiago Ixcuintla'),
(18, 18016, 'Tecuala'),
(18, 18017, 'Tepic'),
(18, 18018, 'Tuxpan'),
(18, 18019, 'La Yesca'),
(18, 18020, 'Bahía de Banderas'),
(18, 18999, 'No identificado'),
(19, 19001, 'Abasolo'),
(19, 19002, 'Agualeguas'),
(19, 19003, 'Los Aldamas'),
(19, 19004, 'Allende'),
(19, 19005, 'Anáhuac'),
(19, 19006, 'Apodaca'),
(19, 19007, 'Aramberri'),
(19, 19008, 'Bustamante'),
(19, 19009, 'Cadereyta Jiménez'),
(19, 19010, 'El Carmen'),
(19, 19011, 'Cerralvo'),
(19, 19012, 'Ciénega de Flores'),
(19, 19013, 'China'),
(19, 19014, 'Doctor Arroyo'),
(19, 19015, 'Doctor Coss'),
(19, 19016, 'Doctor González'),
(19, 19017, 'Galeana'),
(19, 19018, 'García'),
(19, 19019, 'San Pedro Garza García'),
(19, 19020, 'General Bravo'),
(19, 19021, 'General Escobedo'),
(19, 19022, 'General Terán'),
(19, 19023, 'General Treviño'),
(19, 19024, 'General Zaragoza'),
(19, 19025, 'General Zuazua'),
(19, 19026, 'Guadalupe'),
(19, 19027, 'Los Herreras'),
(19, 19028, 'Higueras'),
(19, 19029, 'Hualahuises'),
(19, 19030, 'Iturbide'),
(19, 19031, 'Juárez'),
(19, 19032, 'Lampazos de Naranjo'),
(19, 19033, 'Linares'),
(19, 19034, 'Marín'),
(19, 19035, 'Melchor Ocampo'),
(19, 19036, 'Mier y Noriega'),
(19, 19037, 'Mina'),
(19, 19038, 'Montemorelos'),
(19, 19039, 'Monterrey'),
(19, 19040, 'Parás'),
(19, 19041, 'Pesquería'),
(19, 19042, 'Los Ramones'),
(19, 19043, 'Rayones'),
(19, 19044, 'Sabinas Hidalgo'),
(19, 19045, 'Salinas Victoria'),
(19, 19046, 'San Nicolás de los Garza'),
(19, 19047, 'Hidalgo'),
(19, 19048, 'Santa Catarina'),
(19, 19049, 'Santiago'),
(19, 19050, 'Vallecillo'),
(19, 19051, 'Villaldama'),
(19, 19999, 'No identificado'),
(20, 20001, 'Abejones'),
(20, 20002, 'Acatlán de Pérez Figueroa'),
(20, 20003, 'Asunción Cacalotepec'),
(20, 20004, 'Asunción Cuyotepeji'),
(20, 20005, 'Asunción Ixtaltepec'),
(20, 20006, 'Asunción Nochixtlán'),
(20, 20007, 'Asunción Ocotlán'),
(20, 20008, 'Asunción Tlacolulita'),
(20, 20009, 'Ayotzintepec'),
(20, 20010, 'El Barrio de la Soledad'),
(20, 20011, 'Calihualá'),
(20, 20012, 'Candelaria Loxicha'),
(20, 20013, 'Ciénega de Zimatlán'),
(20, 20014, 'Ciudad Ixtepec'),
(20, 20015, 'Coatecas Altas'),
(20, 20016, 'Coicoyán de las Flores'),
(20, 20017, 'La Compañía'),
(20, 20018, 'Concepción Buenavista'),
(20, 20019, 'Concepción Pápalo'),
(20, 20020, 'Constancia del Rosario'),
(20, 20021, 'Cosolapa'),
(20, 20022, 'Cosoltepec'),
(20, 20023, 'Cuilápam de Guerrero'),
(20, 20024, 'Cuyamecalco Villa de Zaragoza'),
(20, 20025, 'Chahuites'),
(20, 20026, 'Chalcatongo de Hidalgo'),
(20, 20027, 'Chiquihuitlán de Benito Juárez'),
(20, 20028, 'Heroica Ciudad de Ejutla de Crespo'),
(20, 20029, 'Eloxochitlán de Flores Magón'),
(20, 20030, 'El Espinal'),
(20, 20031, 'Tamazulápam del Espíritu Santo'),
(20, 20032, 'Fresnillo de Trujano'),
(20, 20033, 'Guadalupe Etla'),
(20, 20034, 'Guadalupe de Ramírez'),
(20, 20035, 'Guelatao de Juárez'),
(20, 20036, 'Guevea de Humboldt'),
(20, 20037, 'Mesones Hidalgo'),
(20, 20038, 'Villa Hidalgo'),
(20, 20039, 'Heroica Ciudad de Huajuapan de León'),
(20, 20040, 'Huautepec'),
(20, 20041, 'Huautla de Jiménez'),
(20, 20042, 'Ixtlán de Juárez'),
(20, 20043, 'Heroica Ciudad de Juchitán de Zaragoza'),
(20, 20044, 'Loma Bonita'),
(20, 20045, 'Magdalena Apasco'),
(20, 20046, 'Magdalena Jaltepec'),
(20, 20047, 'Santa Magdalena Jicotlán'),
(20, 20048, 'Magdalena Mixtepec'),
(20, 20049, 'Magdalena Ocotlán'),
(20, 20050, 'Magdalena Peñasco'),
(20, 20051, 'Magdalena Teitipac'),
(20, 20052, 'Magdalena Tequisistlán'),
(20, 20053, 'Magdalena Tlacotepec'),
(20, 20054, 'Magdalena Zahuatlán'),
(20, 20055, 'Mariscala de Juárez'),
(20, 20056, 'Mártires de Tacubaya'),
(20, 20057, 'Matías Romero Avendaño'),
(20, 20058, 'Mazatlán Villa de Flores'),
(20, 20059, 'Miahuatlán de Porfirio Díaz'),
(20, 20060, 'Mixistlán de la Reforma'),
(20, 20061, 'Monjas'),
(20, 20062, 'Natividad'),
(20, 20063, 'Nazareno Etla'),
(20, 20064, 'Nejapa de Madero'),
(20, 20065, 'Ixpantepec Nieves'),
(20, 20066, 'Santiago Niltepec'),
(20, 20067, 'Oaxaca de Juárez'),
(20, 20068, 'Ocotlán de Morelos'),
(20, 20069, 'La Pe'),
(20, 20070, 'Pinotepa de Don Luis'),
(20, 20071, 'Pluma Hidalgo'),
(20, 20072, 'San José del Progreso'),
(20, 20073, 'Putla Villa de Guerrero'),
(20, 20074, 'Santa Catarina Quioquitani'),
(20, 20075, 'Reforma de Pineda'),
(20, 20076, 'La Reforma'),
(20, 20077, 'Reyes Etla'),
(20, 20078, 'Rojas de Cuauhtémoc'),
(20, 20079, 'Salina Cruz'),
(20, 20080, 'San Agustín Amatengo'),
(20, 20081, 'San Agustín Atenango'),
(20, 20082, 'San Agustín Chayuco'),
(20, 20083, 'San Agustín de las Juntas'),
(20, 20084, 'San Agustín Etla'),
(20, 20085, 'San Agustín Loxicha'),
(20, 20086, 'San Agustín Tlacotepec'),
(20, 20087, 'San Agustín Yatareni'),
(20, 20088, 'San Andrés Cabecera Nueva'),
(20, 20089, 'San Andrés Dinicuiti'),
(20, 20090, 'San Andrés Huaxpaltepec'),
(20, 20091, 'San Andrés Huayápam'),
(20, 20092, 'San Andrés Ixtlahuaca'),
(20, 20093, 'San Andrés Lagunas'),
(20, 20094, 'San Andrés Nuxiño'),
(20, 20095, 'San Andrés Paxtlán'),
(20, 20096, 'San Andrés Sinaxtla'),
(20, 20097, 'San Andrés Solaga'),
(20, 20098, 'San Andrés Teotilálpam'),
(20, 20099, 'San Andrés Tepetlapa'),
(20, 20100, 'San Andrés Yaá'),
(20, 20101, 'San Andrés Zabache'),
(20, 20102, 'San Andrés Zautla'),
(20, 20103, 'San Antonino Castillo Velasco'),
(20, 20104, 'San Antonino el Alto'),
(20, 20105, 'San Antonino Monte Verde'),
(20, 20106, 'San Antonio Acutla'),
(20, 20107, 'San Antonio de la Cal'),
(20, 20108, 'San Antonio Huitepec'),
(20, 20109, 'San Antonio Nanahuatípam'),
(20, 20110, 'San Antonio Sinicahua'),
(20, 20111, 'San Antonio Tepetlapa'),
(20, 20112, 'San Baltazar Chichicápam'),
(20, 20113, 'San Baltazar Loxicha'),
(20, 20114, 'San Baltazar Yatzachi el Bajo'),
(20, 20115, 'San Bartolo Coyotepec'),
(20, 20116, 'San Bartolomé Ayautla'),
(20, 20117, 'San Bartolomé Loxicha'),
(20, 20118, 'San Bartolomé Quialana'),
(20, 20119, 'San Bartolomé Yucuañe'),
(20, 20120, 'San Bartolomé Zoogocho'),
(20, 20121, 'San Bartolo Soyaltepec'),
(20, 20122, 'San Bartolo Yautepec'),
(20, 20123, 'San Bernardo Mixtepec'),
(20, 20124, 'San Blas Atempa'),
(20, 20125, 'San Carlos Yautepec'),
(20, 20126, 'San Cristóbal Amatlán'),
(20, 20127, 'San Cristóbal Amoltepec'),
(20, 20128, 'San Cristóbal Lachirioag'),
(20, 20129, 'San Cristóbal Suchixtlahuaca'),
(20, 20130, 'San Dionisio del Mar'),
(20, 20131, 'San Dionisio Ocotepec'),
(20, 20132, 'San Dionisio Ocotlán'),
(20, 20133, 'San Esteban Atatlahuca'),
(20, 20134, 'San Felipe Jalapa de Díaz'),
(20, 20135, 'San Felipe Tejalápam'),
(20, 20136, 'San Felipe Usila'),
(20, 20137, 'San Francisco Cahuacuá'),
(20, 20138, 'San Francisco Cajonos'),
(20, 20139, 'San Francisco Chapulapa'),
(20, 20140, 'San Francisco Chindúa'),
(20, 20141, 'San Francisco del Mar'),
(20, 20142, 'San Francisco Huehuetlán'),
(20, 20143, 'San Francisco Ixhuatán'),
(20, 20144, 'San Francisco Jaltepetongo'),
(20, 20145, 'San Francisco Lachigoló'),
(20, 20146, 'San Francisco Logueche'),
(20, 20147, 'San Francisco Nuxaño'),
(20, 20148, 'San Francisco Ozolotepec'),
(20, 20149, 'San Francisco Sola'),
(20, 20150, 'San Francisco Telixtlahuaca'),
(20, 20151, 'San Francisco Teopan'),
(20, 20152, 'San Francisco Tlapancingo'),
(20, 20153, 'San Gabriel Mixtepec'),
(20, 20154, 'San Ildefonso Amatlán'),
(20, 20155, 'San Ildefonso Sola'),
(20, 20156, 'San Ildefonso Villa Alta'),
(20, 20157, 'San Jacinto Amilpas'),
(20, 20158, 'San Jacinto Tlacotepec'),
(20, 20159, 'San Jerónimo Coatlán'),
(20, 20160, 'San Jerónimo Silacayoapilla'),
(20, 20161, 'San Jerónimo Sosola'),
(20, 20162, 'San Jerónimo Taviche'),
(20, 20163, 'San Jerónimo Tecóatl'),
(20, 20164, 'San Jorge Nuchita'),
(20, 20165, 'San José Ayuquila'),
(20, 20166, 'San José Chiltepec'),
(20, 20167, 'San José del Peñasco'),
(20, 20168, 'San José Estancia Grande'),
(20, 20169, 'San José Independencia'),
(20, 20170, 'San José Lachiguiri'),
(20, 20171, 'San José Tenango'),
(20, 20172, 'San Juan Achiutla'),
(20, 20173, 'San Juan Atepec'),
(20, 20174, 'Ánimas Trujano'),
(20, 20175, 'San Juan Bautista Atatlahuca'),
(20, 20176, 'San Juan Bautista Coixtlahuaca'),
(20, 20177, 'San Juan Bautista Cuicatlán'),
(20, 20178, 'San Juan Bautista Guelache'),
(20, 20179, 'San Juan Bautista Jayacatlán'),
(20, 20180, 'San Juan Bautista Lo de Soto'),
(20, 20181, 'San Juan Bautista Suchitepec'),
(20, 20182, 'San Juan Bautista Tlacoatzintepec'),
(20, 20183, 'San Juan Bautista Tlachichilco'),
(20, 20184, 'San Juan Bautista Tuxtepec'),
(20, 20185, 'San Juan Cacahuatepec'),
(20, 20186, 'San Juan Cieneguilla'),
(20, 20187, 'San Juan Coatzóspam'),
(20, 20188, 'San Juan Colorado'),
(20, 20189, 'San Juan Comaltepec'),
(20, 20190, 'San Juan Cotzocón'),
(20, 20191, 'San Juan Chicomezúchil'),
(20, 20192, 'San Juan Chilateca'),
(20, 20193, 'San Juan del Estado'),
(20, 20194, 'San Juan del Río'),
(20, 20195, 'San Juan Diuxi'),
(20, 20196, 'San Juan Evangelista Analco'),
(20, 20197, 'San Juan Guelavía'),
(20, 20198, 'San Juan Guichicovi'),
(20, 20199, 'San Juan Ihualtepec'),
(20, 20200, 'San Juan Juquila Mixes'),
(20, 20201, 'San Juan Juquila Vijanos'),
(20, 20202, 'San Juan Lachao'),
(20, 20203, 'San Juan Lachigalla'),
(20, 20204, 'San Juan Lajarcia'),
(20, 20205, 'San Juan Lalana'),
(20, 20206, 'San Juan de los Cués'),
(20, 20207, 'San Juan Mazatlán'),
(20, 20208, 'San Juan Mixtepec -Dto. 08 -'),
(20, 20209, 'San Juan Mixtepec -Dto. 26 -'),
(20, 20210, 'San Juan Ñumí'),
(20, 20211, 'San Juan Ozolotepec'),
(20, 20212, 'San Juan Petlapa'),
(20, 20213, 'San Juan Quiahije'),
(20, 20214, 'San Juan Quiotepec'),
(20, 20215, 'San Juan Sayultepec'),
(20, 20216, 'San Juan Tabaá'),
(20, 20217, 'San Juan Tamazola'),
(20, 20218, 'San Juan Teita'),
(20, 20219, 'San Juan Teitipac'),
(20, 20220, 'San Juan Tepeuxila'),
(20, 20221, 'San Juan Teposcolula'),
(20, 20222, 'San Juan Yaeé'),
(20, 20223, 'San Juan Yatzona'),
(20, 20224, 'San Juan Yucuita'),
(20, 20225, 'San Lorenzo'),
(20, 20226, 'San Lorenzo Albarradas'),
(20, 20227, 'San Lorenzo Cacaotepec'),
(20, 20228, 'San Lorenzo Cuaunecuiltitla'),
(20, 20229, 'San Lorenzo Texmelúcan'),
(20, 20230, 'San Lorenzo Victoria'),
(20, 20231, 'San Lucas Camotlán'),
(20, 20232, 'San Lucas Ojitlán'),
(20, 20233, 'San Lucas Quiaviní'),
(20, 20234, 'San Lucas Zoquiápam'),
(20, 20235, 'San Luis Amatlán'),
(20, 20236, 'San Marcial Ozolotepec'),
(20, 20237, 'San Marcos Arteaga'),
(20, 20238, 'San Martín de los Cansecos'),
(20, 20239, 'San Martín Huamelúlpam'),
(20, 20240, 'San Martín Itunyoso'),
(20, 20241, 'San Martín Lachilá'),
(20, 20242, 'San Martín Peras'),
(20, 20243, 'San Martín Tilcajete'),
(20, 20244, 'San Martín Toxpalan'),
(20, 20245, 'San Martín Zacatepec'),
(20, 20246, 'San Mateo Cajonos'),
(20, 20247, 'Capulálpam de Méndez'),
(20, 20248, 'San Mateo del Mar'),
(20, 20249, 'San Mateo Yoloxochitlán'),
(20, 20250, 'San Mateo Etlatongo'),
(20, 20251, 'San Mateo Nejápam'),
(20, 20252, 'San Mateo Peñasco'),
(20, 20253, 'San Mateo Piñas'),
(20, 20254, 'San Mateo Río Hondo'),
(20, 20255, 'San Mateo Sindihui'),
(20, 20256, 'San Mateo Tlapiltepec'),
(20, 20257, 'San Melchor Betaza'),
(20, 20258, 'San Miguel Achiutla'),
(20, 20259, 'San Miguel Ahuehuetitlán'),
(20, 20260, 'San Miguel Aloápam'),
(20, 20261, 'San Miguel Amatitlán'),
(20, 20262, 'San Miguel Amatlán'),
(20, 20263, 'San Miguel Coatlán'),
(20, 20264, 'San Miguel Chicahua'),
(20, 20265, 'San Miguel Chimalapa'),
(20, 20266, 'San Miguel del Puerto'),
(20, 20267, 'San Miguel del Río'),
(20, 20268, 'San Miguel Ejutla'),
(20, 20269, 'San Miguel el Grande'),
(20, 20270, 'San Miguel Huautla'),
(20, 20271, 'San Miguel Mixtepec'),
(20, 20272, 'San Miguel Panixtlahuaca'),
(20, 20273, 'San Miguel Peras'),
(20, 20274, 'San Miguel Piedras'),
(20, 20275, 'San Miguel Quetzaltepec'),
(20, 20276, 'San Miguel Santa Flor'),
(20, 20277, 'Villa Sola de Vega'),
(20, 20278, 'San Miguel Soyaltepec'),
(20, 20279, 'San Miguel Suchixtepec'),
(20, 20280, 'Villa Talea de Castro'),
(20, 20281, 'San Miguel Tecomatlán'),
(20, 20282, 'San Miguel Tenango'),
(20, 20283, 'San Miguel Tequixtepec'),
(20, 20284, 'San Miguel Tilquiápam'),
(20, 20285, 'San Miguel Tlacamama'),
(20, 20286, 'San Miguel Tlacotepec'),
(20, 20287, 'San Miguel Tulancingo'),
(20, 20288, 'San Miguel Yotao'),
(20, 20289, 'San Nicolás'),
(20, 20290, 'San Nicolás Hidalgo'),
(20, 20291, 'San Pablo Coatlán'),
(20, 20292, 'San Pablo Cuatro Venados'),
(20, 20293, 'San Pablo Etla'),
(20, 20294, 'San Pablo Huitzo'),
(20, 20295, 'San Pablo Huixtepec'),
(20, 20296, 'San Pablo Macuiltianguis'),
(20, 20297, 'San Pablo Tijaltepec'),
(20, 20298, 'San Pablo Villa de Mitla'),
(20, 20299, 'San Pablo Yaganiza'),
(20, 20300, 'San Pedro Amuzgos'),
(20, 20301, 'San Pedro Apóstol'),
(20, 20302, 'San Pedro Atoyac'),
(20, 20303, 'San Pedro Cajonos'),
(20, 20304, 'San Pedro Coxcaltepec Cántaros'),
(20, 20305, 'San Pedro Comitancillo'),
(20, 20306, 'San Pedro el Alto'),
(20, 20307, 'San Pedro Huamelula'),
(20, 20308, 'San Pedro Huilotepec'),
(20, 20309, 'San Pedro Ixcatlán'),
(20, 20310, 'San Pedro Ixtlahuaca'),
(20, 20311, 'San Pedro Jaltepetongo'),
(20, 20312, 'San Pedro Jicayán'),
(20, 20313, 'San Pedro Jocotipac'),
(20, 20314, 'San Pedro Juchatengo'),
(20, 20315, 'San Pedro Mártir'),
(20, 20316, 'San Pedro Mártir Quiechapa'),
(20, 20317, 'San Pedro Mártir Yucuxaco'),
(20, 20318, 'San Pedro Mixtepec -Dto. 22 -'),
(20, 20319, 'San Pedro Mixtepec -Dto. 26 -'),
(20, 20320, 'San Pedro Molinos'),
(20, 20321, 'San Pedro Nopala'),
(20, 20322, 'San Pedro Ocopetatillo'),
(20, 20323, 'San Pedro Ocotepec'),
(20, 20324, 'San Pedro Pochutla'),
(20, 20325, 'San Pedro Quiatoni'),
(20, 20326, 'San Pedro Sochiápam'),
(20, 20327, 'San Pedro Tapanatepec'),
(20, 20328, 'San Pedro Taviche'),
(20, 20329, 'San Pedro Teozacoalco'),
(20, 20330, 'San Pedro Teutila'),
(20, 20331, 'San Pedro Tidaá'),
(20, 20332, 'San Pedro Topiltepec'),
(20, 20333, 'San Pedro Totolápam'),
(20, 20334, 'Villa de Tututepec de Melchor Ocampo'),
(20, 20335, 'San Pedro Yaneri'),
(20, 20336, 'San Pedro Yólox'),
(20, 20337, 'San Pedro y San Pablo Ayutla'),
(20, 20338, 'Villa de Etla'),
(20, 20339, 'San Pedro y San Pablo Teposcolula'),
(20, 20340, 'San Pedro y San Pablo Tequixtepec'),
(20, 20341, 'San Pedro Yucunama'),
(20, 20342, 'San Raymundo Jalpan'),
(20, 20343, 'San Sebastián Abasolo'),
(20, 20344, 'San Sebastián Coatlán'),
(20, 20345, 'San Sebastián Ixcapa'),
(20, 20346, 'San Sebastián Nicananduta'),
(20, 20347, 'San Sebastián Río Hondo'),
(20, 20348, 'San Sebastián Tecomaxtlahuaca'),
(20, 20349, 'San Sebastián Teitipac'),
(20, 20350, 'San Sebastián Tutla'),
(20, 20351, 'San Simón Almolongas'),
(20, 20352, 'San Simón Zahuatlán'),
(20, 20353, 'Santa Ana'),
(20, 20354, 'Santa Ana Ateixtlahuaca'),
(20, 20355, 'Santa Ana Cuauhtémoc'),
(20, 20356, 'Santa Ana del Valle'),
(20, 20357, 'Santa Ana Tavela'),
(20, 20358, 'Santa Ana Tlapacoyan'),
(20, 20359, 'Santa Ana Yareni'),
(20, 20360, 'Santa Ana Zegache'),
(20, 20361, 'Santa Catalina Quierí'),
(20, 20362, 'Santa Catarina Cuixtla'),
(20, 20363, 'Santa Catarina Ixtepeji'),
(20, 20364, 'Santa Catarina Juquila'),
(20, 20365, 'Santa Catarina Lachatao'),
(20, 20366, 'Santa Catarina Loxicha'),
(20, 20367, 'Santa Catarina Mechoacán'),
(20, 20368, 'Santa Catarina Minas'),
(20, 20369, 'Santa Catarina Quiané'),
(20, 20370, 'Santa Catarina Tayata'),
(20, 20371, 'Santa Catarina Ticuá'),
(20, 20372, 'Santa Catarina Yosonotú'),
(20, 20373, 'Santa Catarina Zapoquila'),
(20, 20374, 'Santa Cruz Acatepec'),
(20, 20375, 'Santa Cruz Amilpas'),
(20, 20376, 'Santa Cruz de Bravo'),
(20, 20377, 'Santa Cruz Itundujia'),
(20, 20378, 'Santa Cruz Mixtepec'),
(20, 20379, 'Santa Cruz Nundaco'),
(20, 20380, 'Santa Cruz Papalutla'),
(20, 20381, 'Santa Cruz Tacache de Mina'),
(20, 20382, 'Santa Cruz Tacahua'),
(20, 20383, 'Santa Cruz Tayata'),
(20, 20384, 'Santa Cruz Xitla'),
(20, 20385, 'Santa Cruz Xoxocotlán'),
(20, 20386, 'Santa Cruz Zenzontepec'),
(20, 20387, 'Santa Gertrudis'),
(20, 20388, 'Santa Inés del Monte'),
(20, 20389, 'Santa Inés Yatzeche'),
(20, 20390, 'Santa Lucía del Camino'),
(20, 20391, 'Santa Lucía Miahuatlán'),
(20, 20392, 'Santa Lucía Monteverde'),
(20, 20393, 'Santa Lucía Ocotlán'),
(20, 20394, 'Santa María Alotepec'),
(20, 20395, 'Santa María Apazco'),
(20, 20396, 'Santa María la Asunción'),
(20, 20397, 'Heroica Ciudad de Tlaxiaco'),
(20, 20398, 'Ayoquezco de Aldama'),
(20, 20399, 'Santa María Atzompa'),
(20, 20400, 'Santa María Camotlán'),
(20, 20401, 'Santa María Colotepec'),
(20, 20402, 'Santa María Cortijo'),
(20, 20403, 'Santa María Coyotepec'),
(20, 20404, 'Santa María Chachoápam'),
(20, 20405, 'Villa de Chilapa de Díaz'),
(20, 20406, 'Santa María Chilchotla'),
(20, 20407, 'Santa María Chimalapa'),
(20, 20408, 'Santa María del Rosario'),
(20, 20409, 'Santa María del Tule'),
(20, 20410, 'Santa María Ecatepec'),
(20, 20411, 'Santa María Guelacé'),
(20, 20412, 'Santa María Guienagati'),
(20, 20413, 'Santa María Huatulco'),
(20, 20414, 'Santa María Huazolotitlán'),
(20, 20415, 'Santa María Ipalapa'),
(20, 20416, 'Santa María Ixcatlán'),
(20, 20417, 'Santa María Jacatepec'),
(20, 20418, 'Santa María Jalapa del Marqués'),
(20, 20419, 'Santa María Jaltianguis'),
(20, 20420, 'Santa María Lachixío'),
(20, 20421, 'Santa María Mixtequilla'),
(20, 20422, 'Santa María Nativitas'),
(20, 20423, 'Santa María Nduayaco'),
(20, 20424, 'Santa María Ozolotepec'),
(20, 20425, 'Santa María Pápalo'),
(20, 20426, 'Santa María Peñoles'),
(20, 20427, 'Santa María Petapa'),
(20, 20428, 'Santa María Quiegolani'),
(20, 20429, 'Santa María Sola'),
(20, 20430, 'Santa María Tataltepec'),
(20, 20431, 'Santa María Tecomavaca'),
(20, 20432, 'Santa María Temaxcalapa'),
(20, 20433, 'Santa María Temaxcaltepec'),
(20, 20434, 'Santa María Teopoxco'),
(20, 20435, 'Santa María Tepantlali'),
(20, 20436, 'Santa María Texcatitlán'),
(20, 20437, 'Santa María Tlahuitoltepec'),
(20, 20438, 'Santa María Tlalixtac'),
(20, 20439, 'Santa María Tonameca'),
(20, 20440, 'Santa María Totolapilla'),
(20, 20441, 'Santa María Xadani'),
(20, 20442, 'Santa María Yalina'),
(20, 20443, 'Santa María Yavesía'),
(20, 20444, 'Santa María Yolotepec'),
(20, 20445, 'Santa María Yosoyúa'),
(20, 20446, 'Santa María Yucuhiti'),
(20, 20447, 'Santa María Zacatepec'),
(20, 20448, 'Santa María Zaniza'),
(20, 20449, 'Santa María Zoquitlán'),
(20, 20450, 'Santiago Amoltepec'),
(20, 20451, 'Santiago Apoala'),
(20, 20452, 'Santiago Apóstol'),
(20, 20453, 'Santiago Astata'),
(20, 20454, 'Santiago Atitlán'),
(20, 20455, 'Santiago Ayuquililla'),
(20, 20456, 'Santiago Cacaloxtepec'),
(20, 20457, 'Santiago Camotlán'),
(20, 20458, 'Santiago Comaltepec'),
(20, 20459, 'Santiago Chazumba'),
(20, 20460, 'Santiago Choápam'),
(20, 20461, 'Santiago del Río'),
(20, 20462, 'Santiago Huajolotitlán'),
(20, 20463, 'Santiago Huauclilla'),
(20, 20464, 'Santiago Ihuitlán Plumas'),
(20, 20465, 'Santiago Ixcuintepec'),
(20, 20466, 'Santiago Ixtayutla'),
(20, 20467, 'Santiago Jamiltepec'),
(20, 20468, 'Santiago Jocotepec'),
(20, 20469, 'Santiago Juxtlahuaca'),
(20, 20470, 'Santiago Lachiguiri'),
(20, 20471, 'Santiago Lalopa'),
(20, 20472, 'Santiago Laollaga'),
(20, 20473, 'Santiago Laxopa'),
(20, 20474, 'Santiago Llano Grande'),
(20, 20475, 'Santiago Matatlán'),
(20, 20476, 'Santiago Miltepec'),
(20, 20477, 'Santiago Minas'),
(20, 20478, 'Santiago Nacaltepec'),
(20, 20479, 'Santiago Nejapilla'),
(20, 20480, 'Santiago Nundiche'),
(20, 20481, 'Santiago Nuyoó'),
(20, 20482, 'Santiago Pinotepa Nacional'),
(20, 20483, 'Santiago Suchilquitongo'),
(20, 20484, 'Santiago Tamazola'),
(20, 20485, 'Santiago Tapextla'),
(20, 20486, 'Villa Tejúpam de la Unión'),
(20, 20487, 'Santiago Tenango'),
(20, 20488, 'Santiago Tepetlapa'),
(20, 20489, 'Santiago Tetepec'),
(20, 20490, 'Santiago Texcalcingo'),
(20, 20491, 'Santiago Textitlán'),
(20, 20492, 'Santiago Tilantongo'),
(20, 20493, 'Santiago Tillo'),
(20, 20494, 'Santiago Tlazoyaltepec'),
(20, 20495, 'Santiago Xanica'),
(20, 20496, 'Santiago Xiacuí'),
(20, 20497, 'Santiago Yaitepec'),
(20, 20498, 'Santiago Yaveo'),
(20, 20499, 'Santiago Yolomécatl'),
(20, 20500, 'Santiago Yosondúa'),
(20, 20501, 'Santiago Yucuyachi'),
(20, 20502, 'Santiago Zacatepec'),
(20, 20503, 'Santiago Zoochila'),
(20, 20504, 'Nuevo Zoquiápam'),
(20, 20505, 'Santo Domingo Ingenio'),
(20, 20506, 'Santo Domingo Albarradas'),
(20, 20507, 'Santo Domingo Armenta'),
(20, 20508, 'Santo Domingo Chihuitán'),
(20, 20509, 'Santo Domingo de Morelos'),
(20, 20510, 'Santo Domingo Ixcatlán'),
(20, 20511, 'Santo Domingo Nuxaá'),
(20, 20512, 'Santo Domingo Ozolotepec'),
(20, 20513, 'Santo Domingo Petapa'),
(20, 20514, 'Santo Domingo Roayaga'),
(20, 20515, 'Santo Domingo Tehuantepec'),
(20, 20516, 'Santo Domingo Teojomulco'),
(20, 20517, 'Santo Domingo Tepuxtepec'),
(20, 20518, 'Santo Domingo Tlatayápam'),
(20, 20519, 'Santo Domingo Tomaltepec'),
(20, 20520, 'Santo Domingo Tonalá'),
(20, 20521, 'Santo Domingo Tonaltepec'),
(20, 20522, 'Santo Domingo Xagacía'),
(20, 20523, 'Santo Domingo Yanhuitlán'),
(20, 20524, 'Santo Domingo Yodohino'),
(20, 20525, 'Santo Domingo Zanatepec'),
(20, 20526, 'Santos Reyes Nopala'),
(20, 20527, 'Santos Reyes Pápalo'),
(20, 20528, 'Santos Reyes Tepejillo'),
(20, 20529, 'Santos Reyes Yucuná'),
(20, 20530, 'Santo Tomás Jalieza'),
(20, 20531, 'Santo Tomás Mazaltepec'),
(20, 20532, 'Santo Tomás Ocotepec'),
(20, 20533, 'Santo Tomás Tamazulapan'),
(20, 20534, 'San Vicente Coatlán'),
(20, 20535, 'San Vicente Lachixío'),
(20, 20536, 'San Vicente Nuñú'),
(20, 20537, 'Silacayoápam'),
(20, 20538, 'Sitio de Xitlapehua'),
(20, 20539, 'Soledad Etla'),
(20, 20540, 'Villa de Tamazulápam del Progreso'),
(20, 20541, 'Tanetze de Zaragoza'),
(20, 20542, 'Taniche'),
(20, 20543, 'Tataltepec de Valdés'),
(20, 20544, 'Teococuilco de Marcos Pérez'),
(20, 20545, 'Teotitlán de Flores Magón'),
(20, 20546, 'Teotitlán del Valle'),
(20, 20547, 'Teotongo'),
(20, 20548, 'Tepelmeme Villa de Morelos'),
(20, 20549, '\"Heroica Villa Tezoatlán de Segura y Luna, Cuna de la Independencia de Oaxaca\"'),
(20, 20550, 'San Jerónimo Tlacochahuaya'),
(20, 20551, 'Tlacolula de Matamoros'),
(20, 20552, 'Tlacotepec Plumas'),
(20, 20553, 'Tlalixtac de Cabrera'),
(20, 20554, 'Totontepec Villa de Morelos'),
(20, 20555, 'Trinidad Zaachila'),
(20, 20556, 'La Trinidad Vista Hermosa'),
(20, 20557, 'Unión Hidalgo'),
(20, 20558, 'Valerio Trujano'),
(20, 20559, 'San Juan Bautista Valle Nacional'),
(20, 20560, 'Villa Díaz Ordaz'),
(20, 20561, 'Yaxe'),
(20, 20562, 'Magdalena Yodocono de Porfirio Díaz'),
(20, 20563, 'Yogana'),
(20, 20564, 'Yutanduchi de Guerrero'),
(20, 20565, 'Villa de Zaachila'),
(20, 20566, 'San Mateo Yucutindó'),
(20, 20567, 'Zapotitlán Lagunas'),
(20, 20568, 'Zapotitlán Palmas'),
(20, 20569, 'Santa Inés de Zaragoza'),
(20, 20570, 'Zimatlán de Álvarez'),
(20, 20999, 'No identificado'),
(21, 21001, 'Acajete'),
(21, 21002, 'Acateno'),
(21, 21003, 'Acatlán'),
(21, 21004, 'Acatzingo'),
(21, 21005, 'Acteopan'),
(21, 21006, 'Ahuacatlán'),
(21, 21007, 'Ahuatlán'),
(21, 21008, 'Ahuazotepec'),
(21, 21009, 'Ahuehuetitla'),
(21, 21010, 'Ajalpan'),
(21, 21011, 'Albino Zertuche'),
(21, 21012, 'Aljojuca'),
(21, 21013, 'Altepexi'),
(21, 21014, 'Amixtlán'),
(21, 21015, 'Amozoc'),
(21, 21016, 'Aquixtla'),
(21, 21017, 'Atempan'),
(21, 21018, 'Atexcal'),
(21, 21019, 'Atlixco'),
(21, 21020, 'Atoyatempan'),
(21, 21021, 'Atzala'),
(21, 21022, 'Atzitzihuacán'),
(21, 21023, 'Atzitzintla'),
(21, 21024, 'Axutla'),
(21, 21025, 'Ayotoxco de Guerrero'),
(21, 21026, 'Calpan'),
(21, 21027, 'Caltepec'),
(21, 21028, 'Camocuautla'),
(21, 21029, 'Caxhuacan'),
(21, 21030, 'Coatepec'),
(21, 21031, 'Coatzingo'),
(21, 21032, 'Cohetzala'),
(21, 21033, 'Cohuecan'),
(21, 21034, 'Coronango'),
(21, 21035, 'Coxcatlán'),
(21, 21036, 'Coyomeapan'),
(21, 21037, 'Coyotepec'),
(21, 21038, 'Cuapiaxtla de Madero'),
(21, 21039, 'Cuautempan'),
(21, 21040, 'Cuautinchán'),
(21, 21041, 'Cuautlancingo'),
(21, 21042, 'Cuayuca de Andrade'),
(21, 21043, 'Cuetzalan del Progreso'),
(21, 21044, 'Cuyoaco'),
(21, 21045, 'Chalchicomula de Sesma'),
(21, 21046, 'Chapulco'),
(21, 21047, 'Chiautla'),
(21, 21048, 'Chiautzingo'),
(21, 21049, 'Chiconcuautla'),
(21, 21050, 'Chichiquila'),
(21, 21051, 'Chietla'),
(21, 21052, 'Chigmecatitlán'),
(21, 21053, 'Chignahuapan'),
(21, 21054, 'Chignautla'),
(21, 21055, 'Chila'),
(21, 21056, 'Chila de la Sal'),
(21, 21057, 'Honey'),
(21, 21058, 'Chilchotla'),
(21, 21059, 'Chinantla'),
(21, 21060, 'Domingo Arenas'),
(21, 21061, 'Eloxochitlán'),
(21, 21062, 'Epatlán'),
(21, 21063, 'Esperanza'),
(21, 21064, 'Francisco Z. Mena'),
(21, 21065, 'General Felipe Ángeles'),
(21, 21066, 'Guadalupe'),
(21, 21067, 'Guadalupe Victoria'),
(21, 21068, 'Hermenegildo Galeana'),
(21, 21069, 'Huaquechula'),
(21, 21070, 'Huatlatlauca'),
(21, 21071, 'Huauchinango'),
(21, 21072, 'Huehuetla'),
(21, 21073, 'Huehuetlán el Chico'),
(21, 21074, 'Huejotzingo'),
(21, 21075, 'Hueyapan'),
(21, 21076, 'Hueytamalco'),
(21, 21077, 'Hueytlalpan'),
(21, 21078, 'Huitzilan de Serdán'),
(21, 21079, 'Huitziltepec'),
(21, 21080, 'Atlequizayan'),
(21, 21081, 'Ixcamilpa de Guerrero'),
(21, 21082, 'Ixcaquixtla'),
(21, 21083, 'Ixtacamaxtitlán'),
(21, 21084, 'Ixtepec'),
(21, 21085, 'Izúcar de Matamoros'),
(21, 21086, 'Jalpan'),
(21, 21087, 'Jolalpan'),
(21, 21088, 'Jonotla'),
(21, 21089, 'Jopala'),
(21, 21090, 'Juan C. Bonilla'),
(21, 21091, 'Juan Galindo'),
(21, 21092, 'Juan N. Méndez'),
(21, 21093, 'Lafragua'),
(21, 21094, 'Libres'),
(21, 21095, 'La Magdalena Tlatlauquitepec'),
(21, 21096, 'Mazapiltepec de Juárez'),
(21, 21097, 'Mixtla'),
(21, 21098, 'Molcaxac'),
(21, 21099, 'Cañada Morelos'),
(21, 21100, 'Naupan'),
(21, 21101, 'Nauzontla'),
(21, 21102, 'Nealtican'),
(21, 21103, 'Nicolás Bravo'),
(21, 21104, 'Nopalucan'),
(21, 21105, 'Ocotepec'),
(21, 21106, 'Ocoyucan'),
(21, 21107, 'Olintla'),
(21, 21108, 'Oriental'),
(21, 21109, 'Pahuatlán'),
(21, 21110, 'Palmar de Bravo'),
(21, 21111, 'Pantepec'),
(21, 21112, 'Petlalcingo'),
(21, 21113, 'Piaxtla'),
(21, 21114, 'Puebla'),
(21, 21115, 'Quecholac'),
(21, 21116, 'Quimixtlán'),
(21, 21117, 'Rafael Lara Grajales'),
(21, 21118, 'Los Reyes de Juárez'),
(21, 21119, 'San Andrés Cholula'),
(21, 21120, 'San Antonio Cañada'),
(21, 21121, 'San Diego la Mesa Tochimiltzingo'),
(21, 21122, 'San Felipe Teotlalcingo'),
(21, 21123, 'San Felipe Tepatlán'),
(21, 21124, 'San Gabriel Chilac'),
(21, 21125, 'San Gregorio Atzompa');
INSERT INTO `catalogos_municipios` (`ENTIDAD_ID`, `MUNICIPIO_ID`, `DESCRIPCION`) VALUES
(21, 21126, 'San Jerónimo Tecuanipan'),
(21, 21127, 'San Jerónimo Xayacatlán'),
(21, 21128, 'San José Chiapa'),
(21, 21129, 'San José Miahuatlán'),
(21, 21130, 'San Juan Atenco'),
(21, 21131, 'San Juan Atzompa'),
(21, 21132, 'San Martín Texmelucan'),
(21, 21133, 'San Martín Totoltepec'),
(21, 21134, 'San Matías Tlalancaleca'),
(21, 21135, 'San Miguel Ixitlán'),
(21, 21136, 'San Miguel Xoxtla'),
(21, 21137, 'San Nicolás Buenos Aires'),
(21, 21138, 'San Nicolás de los Ranchos'),
(21, 21139, 'San Pablo Anicano'),
(21, 21140, 'San Pedro Cholula'),
(21, 21141, 'San Pedro Yeloixtlahuaca'),
(21, 21142, 'San Salvador el Seco'),
(21, 21143, 'San Salvador el Verde'),
(21, 21144, 'San Salvador Huixcolotla'),
(21, 21145, 'San Sebastián Tlacotepec'),
(21, 21146, 'Santa Catarina Tlaltempan'),
(21, 21147, 'Santa Inés Ahuatempan'),
(21, 21148, 'Santa Isabel Cholula'),
(21, 21149, 'Santiago Miahuatlán'),
(21, 21150, 'Huehuetlán el Grande'),
(21, 21151, 'Santo Tomás Hueyotlipan'),
(21, 21152, 'Soltepec'),
(21, 21153, 'Tecali de Herrera'),
(21, 21154, 'Tecamachalco'),
(21, 21155, 'Tecomatlán'),
(21, 21156, 'Tehuacán'),
(21, 21157, 'Tehuitzingo'),
(21, 21158, 'Tenampulco'),
(21, 21159, 'Teopantlán'),
(21, 21160, 'Teotlalco'),
(21, 21161, 'Tepanco de López'),
(21, 21162, 'Tepango de Rodríguez'),
(21, 21163, 'Tepatlaxco de Hidalgo'),
(21, 21164, 'Tepeaca'),
(21, 21165, 'Tepemaxalco'),
(21, 21166, 'Tepeojuma'),
(21, 21167, 'Tepetzintla'),
(21, 21168, 'Tepexco'),
(21, 21169, 'Tepexi de Rodríguez'),
(21, 21170, 'Tepeyahualco'),
(21, 21171, 'Tepeyahualco de Cuauhtémoc'),
(21, 21172, 'Tetela de Ocampo'),
(21, 21173, 'Teteles de Avila Castillo'),
(21, 21174, 'Teziutlán'),
(21, 21175, 'Tianguismanalco'),
(21, 21176, 'Tilapa'),
(21, 21177, 'Tlacotepec de Benito Juárez'),
(21, 21178, 'Tlacuilotepec'),
(21, 21179, 'Tlachichuca'),
(21, 21180, 'Tlahuapan'),
(21, 21181, 'Tlaltenango'),
(21, 21182, 'Tlanepantla'),
(21, 21183, 'Tlaola'),
(21, 21184, 'Tlapacoya'),
(21, 21185, 'Tlapanalá'),
(21, 21186, 'Tlatlauquitepec'),
(21, 21187, 'Tlaxco'),
(21, 21188, 'Tochimilco'),
(21, 21189, 'Tochtepec'),
(21, 21190, 'Totoltepec de Guerrero'),
(21, 21191, 'Tulcingo'),
(21, 21192, 'Tuzamapan de Galeana'),
(21, 21193, 'Tzicatlacoyan'),
(21, 21194, 'Venustiano Carranza'),
(21, 21195, 'Vicente Guerrero'),
(21, 21196, 'Xayacatlán de Bravo'),
(21, 21197, 'Xicotepec'),
(21, 21198, 'Xicotlán'),
(21, 21199, 'Xiutetelco'),
(21, 21200, 'Xochiapulco'),
(21, 21201, 'Xochiltepec'),
(21, 21202, 'Xochitlán de Vicente Suárez'),
(21, 21203, 'Xochitlán Todos Santos'),
(21, 21204, 'Yaonáhuac'),
(21, 21205, 'Yehualtepec'),
(21, 21206, 'Zacapala'),
(21, 21207, 'Zacapoaxtla'),
(21, 21208, 'Zacatlán'),
(21, 21209, 'Zapotitlán'),
(21, 21210, 'Zapotitlán de Méndez'),
(21, 21211, 'Zaragoza'),
(21, 21212, 'Zautla'),
(21, 21213, 'Zihuateutla'),
(21, 21214, 'Zinacatepec'),
(21, 21215, 'Zongozotla'),
(21, 21216, 'Zoquiapan'),
(21, 21217, 'Zoquitlán'),
(21, 21999, 'No identificado'),
(22, 22001, 'Amealco de Bonfil'),
(22, 22002, 'Pinal de Amoles'),
(22, 22003, 'Arroyo Seco'),
(22, 22004, 'Cadereyta de Montes'),
(22, 22005, 'Colón'),
(22, 22006, 'Corregidora'),
(22, 22007, 'Ezequiel Montes'),
(22, 22008, 'Huimilpan'),
(22, 22009, 'Jalpan de Serra'),
(22, 22010, 'Landa de Matamoros'),
(22, 22011, 'El Marqués'),
(22, 22012, 'Pedro Escobedo'),
(22, 22013, 'Peñamiller'),
(22, 22014, 'Querétaro'),
(22, 22015, 'San Joaquín'),
(22, 22016, 'San Juan del Río'),
(22, 22017, 'Tequisquiapan'),
(22, 22018, 'Tolimán'),
(22, 22999, 'No identificado'),
(23, 23001, 'Cozumel'),
(23, 23002, 'Felipe Carrillo Puerto'),
(23, 23003, 'Isla Mujeres'),
(23, 23004, 'Othón P. Blanco'),
(23, 23005, 'Benito Juárez'),
(23, 23006, 'José María Morelos'),
(23, 23007, 'Lázaro Cárdenas'),
(23, 23008, 'Solidaridad'),
(23, 23009, 'Tulum'),
(23, 23010, 'Bacalar'),
(23, 23999, 'No identificado'),
(24, 24001, 'Ahualulco'),
(24, 24002, 'Alaquines'),
(24, 24003, 'Aquismón'),
(24, 24004, 'Armadillo de los Infante'),
(24, 24005, 'Cárdenas'),
(24, 24006, 'Catorce'),
(24, 24007, 'Cedral'),
(24, 24008, 'Cerritos'),
(24, 24009, 'Cerro de San Pedro'),
(24, 24010, 'Ciudad del Maíz'),
(24, 24011, 'Ciudad Fernández'),
(24, 24012, 'Tancanhuitz'),
(24, 24013, 'Ciudad Valles'),
(24, 24014, 'Coxcatlán'),
(24, 24015, 'Charcas'),
(24, 24016, 'Ebano'),
(24, 24017, 'Guadalcázar'),
(24, 24018, 'Huehuetlán'),
(24, 24019, 'Lagunillas'),
(24, 24020, 'Matehuala'),
(24, 24021, 'Mexquitic de Carmona'),
(24, 24022, 'Moctezuma'),
(24, 24023, 'Rayón'),
(24, 24024, 'Rioverde'),
(24, 24025, 'Salinas'),
(24, 24026, 'San Antonio'),
(24, 24027, 'San Ciro de Acosta'),
(24, 24028, 'San Luis Potosí'),
(24, 24029, 'San Martín Chalchicuautla'),
(24, 24030, 'San Nicolás Tolentino'),
(24, 24031, 'Santa Catarina'),
(24, 24032, 'Santa María del Río'),
(24, 24033, 'Santo Domingo'),
(24, 24034, 'San Vicente Tancuayalab'),
(24, 24035, 'Soledad de Graciano Sánchez'),
(24, 24036, 'Tamasopo'),
(24, 24037, 'Tamazunchale'),
(24, 24038, 'Tampacán'),
(24, 24039, 'Tampamolón Corona'),
(24, 24040, 'Tamuín'),
(24, 24041, 'Tanlajás'),
(24, 24042, 'Tanquián de Escobedo'),
(24, 24043, 'Tierra Nueva'),
(24, 24044, 'Vanegas'),
(24, 24045, 'Venado'),
(24, 24046, 'Villa de Arriaga'),
(24, 24047, 'Villa de Guadalupe'),
(24, 24048, 'Villa de la Paz'),
(24, 24049, 'Villa de Ramos'),
(24, 24050, 'Villa de Reyes'),
(24, 24051, 'Villa Hidalgo'),
(24, 24052, 'Villa Juárez'),
(24, 24053, 'Axtla de Terrazas'),
(24, 24054, 'Xilitla'),
(24, 24055, 'Zaragoza'),
(24, 24056, 'Villa de Arista'),
(24, 24057, 'Matlapa'),
(24, 24058, 'El Naranjo'),
(24, 24999, 'No identificado'),
(25, 25001, 'Ahome'),
(25, 25002, 'Angostura'),
(25, 25003, 'Badiraguato'),
(25, 25004, 'Concordia'),
(25, 25005, 'Cosalá'),
(25, 25006, 'Culiacán'),
(25, 25007, 'Choix'),
(25, 25008, 'Elota'),
(25, 25009, 'Escuinapa'),
(25, 25010, 'El Fuerte'),
(25, 25011, 'Guasave'),
(25, 25012, 'Mazatlán'),
(25, 25013, 'Mocorito'),
(25, 25014, 'Rosario'),
(25, 25015, 'Salvador Alvarado'),
(25, 25016, 'San Ignacio'),
(25, 25017, 'Sinaloa'),
(25, 25018, 'Navolato'),
(25, 25999, 'No identificado'),
(26, 26001, 'Aconchi'),
(26, 26002, 'Agua Prieta'),
(26, 26003, 'Alamos'),
(26, 26004, 'Altar'),
(26, 26005, 'Arivechi'),
(26, 26006, 'Arizpe'),
(26, 26007, 'Atil'),
(26, 26008, 'Bacadéhuachi'),
(26, 26009, 'Bacanora'),
(26, 26010, 'Bacerac'),
(26, 26011, 'Bacoachi'),
(26, 26012, 'Bácum'),
(26, 26013, 'Banámichi'),
(26, 26014, 'Baviácora'),
(26, 26015, 'Bavispe'),
(26, 26016, 'Benjamín Hill'),
(26, 26017, 'Caborca'),
(26, 26018, 'Cajeme'),
(26, 26019, 'Cananea'),
(26, 26020, 'Carbó'),
(26, 26021, 'La Colorada'),
(26, 26022, 'Cucurpe'),
(26, 26023, 'Cumpas'),
(26, 26024, 'Divisaderos'),
(26, 26025, 'Empalme'),
(26, 26026, 'Etchojoa'),
(26, 26027, 'Fronteras'),
(26, 26028, 'Granados'),
(26, 26029, 'Guaymas'),
(26, 26030, 'Hermosillo'),
(26, 26031, 'Huachinera'),
(26, 26032, 'Huásabas'),
(26, 26033, 'Huatabampo'),
(26, 26034, 'Huépac'),
(26, 26035, 'Imuris'),
(26, 26036, 'Magdalena'),
(26, 26037, 'Mazatán'),
(26, 26038, 'Moctezuma'),
(26, 26039, 'Naco'),
(26, 26040, 'Nácori Chico'),
(26, 26041, 'Nacozari de García'),
(26, 26042, 'Navojoa'),
(26, 26043, 'Nogales'),
(26, 26044, 'Onavas'),
(26, 26045, 'Opodepe'),
(26, 26046, 'Oquitoa'),
(26, 26047, 'Pitiquito'),
(26, 26048, 'Puerto Peñasco'),
(26, 26049, 'Quiriego'),
(26, 26050, 'Rayón'),
(26, 26051, 'Rosario'),
(26, 26052, 'Sahuaripa'),
(26, 26053, 'San Felipe de Jesús'),
(26, 26054, 'San Javier'),
(26, 26055, 'San Luis Río Colorado'),
(26, 26056, 'San Miguel de Horcasitas'),
(26, 26057, 'San Pedro de la Cueva'),
(26, 26058, 'Santa Ana'),
(26, 26059, 'Santa Cruz'),
(26, 26060, 'Sáric'),
(26, 26061, 'Soyopa'),
(26, 26062, 'Suaqui Grande'),
(26, 26063, 'Tepache'),
(26, 26064, 'Trincheras'),
(26, 26065, 'Tubutama'),
(26, 26066, 'Ures'),
(26, 26067, 'Villa Hidalgo'),
(26, 26068, 'Villa Pesqueira'),
(26, 26069, 'Yécora'),
(26, 26070, 'General Plutarco Elías Calles'),
(26, 26071, 'Benito Juárez'),
(26, 26072, 'San Ignacio Río Muerto'),
(26, 26999, 'No identificado'),
(27, 27001, 'Balancán'),
(27, 27002, 'Cárdenas'),
(27, 27003, 'Centla'),
(27, 27004, 'Centro'),
(27, 27005, 'Comalcalco'),
(27, 27006, 'Cunduacán'),
(27, 27007, 'Emiliano Zapata'),
(27, 27008, 'Huimanguillo'),
(27, 27009, 'Jalapa'),
(27, 27010, 'Jalpa de Méndez'),
(27, 27011, 'Jonuta'),
(27, 27012, 'Macuspana'),
(27, 27013, 'Nacajuca'),
(27, 27014, 'Paraíso'),
(27, 27015, 'Tacotalpa'),
(27, 27016, 'Teapa'),
(27, 27017, 'Tenosique'),
(27, 27999, 'No identificado'),
(28, 28001, 'Abasolo'),
(28, 28002, 'Aldama'),
(28, 28003, 'Altamira'),
(28, 28004, 'Antiguo Morelos'),
(28, 28005, 'Burgos'),
(28, 28006, 'Bustamante'),
(28, 28007, 'Camargo'),
(28, 28008, 'Casas'),
(28, 28009, 'Ciudad Madero'),
(28, 28010, 'Cruillas'),
(28, 28011, 'Gómez Farías'),
(28, 28012, 'González'),
(28, 28013, 'Güémez'),
(28, 28014, 'Guerrero'),
(28, 28015, 'Gustavo Díaz Ordaz'),
(28, 28016, 'Hidalgo'),
(28, 28017, 'Jaumave'),
(28, 28018, 'Jiménez'),
(28, 28019, 'Llera'),
(28, 28020, 'Mainero'),
(28, 28021, 'El Mante'),
(28, 28022, 'Matamoros'),
(28, 28023, 'Méndez'),
(28, 28024, 'Mier'),
(28, 28025, 'Miguel Alemán'),
(28, 28026, 'Miquihuana'),
(28, 28027, 'Nuevo Laredo'),
(28, 28028, 'Nuevo Morelos'),
(28, 28029, 'Ocampo'),
(28, 28030, 'Padilla'),
(28, 28031, 'Palmillas'),
(28, 28032, 'Reynosa'),
(28, 28033, 'Río Bravo'),
(28, 28034, 'San Carlos'),
(28, 28035, 'San Fernando'),
(28, 28036, 'San Nicolás'),
(28, 28037, 'Soto la Marina'),
(28, 28038, 'Tampico'),
(28, 28039, 'Tula'),
(28, 28040, 'Valle Hermoso'),
(28, 28041, 'Victoria'),
(28, 28042, 'Villagrán'),
(28, 28043, 'Xicoténcatl'),
(28, 28999, 'No identificado'),
(29, 29001, 'Amaxac de Guerrero'),
(29, 29002, 'Apetatitlán de Antonio Carvajal'),
(29, 29003, 'Atlangatepec'),
(29, 29004, 'Atltzayanca'),
(29, 29005, 'Apizaco'),
(29, 29006, 'Calpulalpan'),
(29, 29007, 'El Carmen Tequexquitla'),
(29, 29008, 'Cuapiaxtla'),
(29, 29009, 'Cuaxomulco'),
(29, 29010, 'Chiautempan'),
(29, 29011, 'Muñoz de Domingo Arenas'),
(29, 29012, 'Españita'),
(29, 29013, 'Huamantla'),
(29, 29014, 'Hueyotlipan'),
(29, 29015, 'Ixtacuixtla de Mariano Matamoros'),
(29, 29016, 'Ixtenco'),
(29, 29017, 'Mazatecochco de José María Morelos'),
(29, 29018, 'Contla de Juan Cuamatzi'),
(29, 29019, 'Tepetitla de Lardizábal'),
(29, 29020, 'Sanctórum de Lázaro Cárdenas'),
(29, 29021, 'Nanacamilpa de Mariano Arista'),
(29, 29022, 'Acuamanala de Miguel Hidalgo'),
(29, 29023, 'Natívitas'),
(29, 29024, 'Panotla'),
(29, 29025, 'San Pablo del Monte'),
(29, 29026, 'Santa Cruz Tlaxcala'),
(29, 29027, 'Tenancingo'),
(29, 29028, 'Teolocholco'),
(29, 29029, 'Tepeyanco'),
(29, 29030, 'Terrenate'),
(29, 29031, 'Tetla de la Solidaridad'),
(29, 29032, 'Tetlatlahuca'),
(29, 29033, 'Tlaxcala'),
(29, 29034, 'Tlaxco'),
(29, 29035, 'Tocatlán'),
(29, 29036, 'Totolac'),
(29, 29037, 'Ziltlaltépec de Trinidad Sánchez Santos'),
(29, 29038, 'Tzompantepec'),
(29, 29039, 'Xaloztoc'),
(29, 29040, 'Xaltocan'),
(29, 29041, 'Papalotla de Xicohténcatl'),
(29, 29042, 'Xicohtzinco'),
(29, 29043, 'Yauhquemehcan'),
(29, 29044, 'Zacatelco'),
(29, 29045, 'Benito Juárez'),
(29, 29046, 'Emiliano Zapata'),
(29, 29047, 'Lázaro Cárdenas'),
(29, 29048, 'La Magdalena Tlaltelulco'),
(29, 29049, 'San Damián Texóloc'),
(29, 29050, 'San Francisco Tetlanohcan'),
(29, 29051, 'San Jerónimo Zacualpan'),
(29, 29052, 'San José Teacalco'),
(29, 29053, 'San Juan Huactzinco'),
(29, 29054, 'San Lorenzo Axocomanitla'),
(29, 29055, 'San Lucas Tecopilco'),
(29, 29056, 'Santa Ana Nopalucan'),
(29, 29057, 'Santa Apolonia Teacalco'),
(29, 29058, 'Santa Catarina Ayometla'),
(29, 29059, 'Santa Cruz Quilehtla'),
(29, 29060, 'Santa Isabel Xiloxoxtla'),
(29, 29999, 'No identificado'),
(30, 30001, 'Acajete'),
(30, 30002, 'Acatlán'),
(30, 30003, 'Acayucan'),
(30, 30004, 'Actopan'),
(30, 30005, 'Acula'),
(30, 30006, 'Acultzingo'),
(30, 30007, 'Camarón de Tejeda'),
(30, 30008, 'Alpatláhuac'),
(30, 30009, 'Alto Lucero de Gutiérrez Barrios'),
(30, 30010, 'Altotonga'),
(30, 30011, 'Alvarado'),
(30, 30012, 'Amatitlán'),
(30, 30013, 'Naranjos Amatlán'),
(30, 30014, 'Amatlán de los Reyes'),
(30, 30015, 'Angel R. Cabada'),
(30, 30016, 'La Antigua'),
(30, 30017, 'Apazapan'),
(30, 30018, 'Aquila'),
(30, 30019, 'Astacinga'),
(30, 30020, 'Atlahuilco'),
(30, 30021, 'Atoyac'),
(30, 30022, 'Atzacan'),
(30, 30023, 'Atzalan'),
(30, 30024, 'Tlaltetela'),
(30, 30025, 'Ayahualulco'),
(30, 30026, 'Banderilla'),
(30, 30027, 'Benito Juárez'),
(30, 30028, 'Boca del Río'),
(30, 30029, 'Calcahualco'),
(30, 30030, 'Camerino Z. Mendoza'),
(30, 30031, 'Carrillo Puerto'),
(30, 30032, 'Catemaco'),
(30, 30033, 'Cazones de Herrera'),
(30, 30034, 'Cerro Azul'),
(30, 30035, 'Citlaltépetl'),
(30, 30036, 'Coacoatzintla'),
(30, 30037, 'Coahuitlán'),
(30, 30038, 'Coatepec'),
(30, 30039, 'Coatzacoalcos'),
(30, 30040, 'Coatzintla'),
(30, 30041, 'Coetzala'),
(30, 30042, 'Colipa'),
(30, 30043, 'Comapa'),
(30, 30044, 'Córdoba'),
(30, 30045, 'Cosamaloapan de Carpio'),
(30, 30046, 'Cosautlán de Carvajal'),
(30, 30047, 'Coscomatepec'),
(30, 30048, 'Cosoleacaque'),
(30, 30049, 'Cotaxtla'),
(30, 30050, 'Coxquihui'),
(30, 30051, 'Coyutla'),
(30, 30052, 'Cuichapa'),
(30, 30053, 'Cuitláhuac'),
(30, 30054, 'Chacaltianguis'),
(30, 30055, 'Chalma'),
(30, 30056, 'Chiconamel'),
(30, 30057, 'Chiconquiaco'),
(30, 30058, 'Chicontepec'),
(30, 30059, 'Chinameca'),
(30, 30060, 'Chinampa de Gorostiza'),
(30, 30061, 'Las Choapas'),
(30, 30062, 'Chocamán'),
(30, 30063, 'Chontla'),
(30, 30064, 'Chumatlán'),
(30, 30065, 'Emiliano Zapata'),
(30, 30066, 'Espinal'),
(30, 30067, 'Filomeno Mata'),
(30, 30068, 'Fortín'),
(30, 30069, 'Gutiérrez Zamora'),
(30, 30070, 'Hidalgotitlán'),
(30, 30071, 'Huatusco'),
(30, 30072, 'Huayacocotla'),
(30, 30073, 'Hueyapan de Ocampo'),
(30, 30074, 'Huiloapan de Cuauhtémoc'),
(30, 30075, 'Ignacio de la Llave'),
(30, 30076, 'Ilamatlán'),
(30, 30077, 'Isla'),
(30, 30078, 'Ixcatepec'),
(30, 30079, 'Ixhuacán de los Reyes'),
(30, 30080, 'Ixhuatlán del Café'),
(30, 30081, 'Ixhuatlancillo'),
(30, 30082, 'Ixhuatlán del Sureste'),
(30, 30083, 'Ixhuatlán de Madero'),
(30, 30084, 'Ixmatlahuacan'),
(30, 30085, 'Ixtaczoquitlán'),
(30, 30086, 'Jalacingo'),
(30, 30087, 'Xalapa'),
(30, 30088, 'Jalcomulco'),
(30, 30089, 'Jáltipan'),
(30, 30090, 'Jamapa'),
(30, 30091, 'Jesús Carranza'),
(30, 30092, 'Xico'),
(30, 30093, 'Jilotepec'),
(30, 30094, 'Juan Rodríguez Clara'),
(30, 30095, 'Juchique de Ferrer'),
(30, 30096, 'Landero y Coss'),
(30, 30097, 'Lerdo de Tejada'),
(30, 30098, 'Magdalena'),
(30, 30099, 'Maltrata'),
(30, 30100, 'Manlio Fabio Altamirano'),
(30, 30101, 'Mariano Escobedo'),
(30, 30102, 'Martínez de la Torre'),
(30, 30103, 'Mecatlán'),
(30, 30104, 'Mecayapan'),
(30, 30105, 'Medellín'),
(30, 30106, 'Miahuatlán'),
(30, 30107, 'Las Minas'),
(30, 30108, 'Minatitlán'),
(30, 30109, 'Misantla'),
(30, 30110, 'Mixtla de Altamirano'),
(30, 30111, 'Moloacán'),
(30, 30112, 'Naolinco'),
(30, 30113, 'Naranjal'),
(30, 30114, 'Nautla'),
(30, 30115, 'Nogales'),
(30, 30116, 'Oluta'),
(30, 30117, 'Omealca'),
(30, 30118, 'Orizaba'),
(30, 30119, 'Otatitlán'),
(30, 30120, 'Oteapan'),
(30, 30121, 'Ozuluama de Mascareñas'),
(30, 30122, 'Pajapan'),
(30, 30123, 'Pánuco'),
(30, 30124, 'Papantla'),
(30, 30125, 'Paso del Macho'),
(30, 30126, 'Paso de Ovejas'),
(30, 30127, 'La Perla'),
(30, 30128, 'Perote'),
(30, 30129, 'Platón Sánchez'),
(30, 30130, 'Playa Vicente'),
(30, 30131, 'Poza Rica de Hidalgo'),
(30, 30132, 'Las Vigas de Ramírez'),
(30, 30133, 'Pueblo Viejo'),
(30, 30134, 'Puente Nacional'),
(30, 30135, 'Rafael Delgado'),
(30, 30136, 'Rafael Lucio'),
(30, 30137, 'Los Reyes'),
(30, 30138, 'Río Blanco'),
(30, 30139, 'Saltabarranca'),
(30, 30140, 'San Andrés Tenejapan'),
(30, 30141, 'San Andrés Tuxtla'),
(30, 30142, 'San Juan Evangelista'),
(30, 30143, 'Santiago Tuxtla'),
(30, 30144, 'Sayula de Alemán'),
(30, 30145, 'Soconusco'),
(30, 30146, 'Sochiapa'),
(30, 30147, 'Soledad Atzompa'),
(30, 30148, 'Soledad de Doblado'),
(30, 30149, 'Soteapan'),
(30, 30150, 'Tamalín'),
(30, 30151, 'Tamiahua'),
(30, 30152, 'Tampico Alto'),
(30, 30153, 'Tancoco'),
(30, 30154, 'Tantima'),
(30, 30155, 'Tantoyuca'),
(30, 30156, 'Tatatila'),
(30, 30157, 'Castillo de Teayo'),
(30, 30158, 'Tecolutla'),
(30, 30159, 'Tehuipango'),
(30, 30160, 'Álamo Temapache'),
(30, 30161, 'Tempoal'),
(30, 30162, 'Tenampa'),
(30, 30163, 'Tenochtitlán'),
(30, 30164, 'Teocelo'),
(30, 30165, 'Tepatlaxco'),
(30, 30166, 'Tepetlán'),
(30, 30167, 'Tepetzintla'),
(30, 30168, 'Tequila'),
(30, 30169, 'José Azueta'),
(30, 30170, 'Texcatepec'),
(30, 30171, 'Texhuacán'),
(30, 30172, 'Texistepec'),
(30, 30173, 'Tezonapa'),
(30, 30174, 'Tierra Blanca'),
(30, 30175, 'Tihuatlán'),
(30, 30176, 'Tlacojalpan'),
(30, 30177, 'Tlacolulan'),
(30, 30178, 'Tlacotalpan'),
(30, 30179, 'Tlacotepec de Mejía'),
(30, 30180, 'Tlachichilco'),
(30, 30181, 'Tlalixcoyan'),
(30, 30182, 'Tlalnelhuayocan'),
(30, 30183, 'Tlapacoyan'),
(30, 30184, 'Tlaquilpa'),
(30, 30185, 'Tlilapan'),
(30, 30186, 'Tomatlán'),
(30, 30187, 'Tonayán'),
(30, 30188, 'Totutla'),
(30, 30189, 'Tuxpan'),
(30, 30190, 'Tuxtilla'),
(30, 30191, 'Ursulo Galván'),
(30, 30192, 'Vega de Alatorre'),
(30, 30193, 'Veracruz'),
(30, 30194, 'Villa Aldama'),
(30, 30195, 'Xoxocotla'),
(30, 30196, 'Yanga'),
(30, 30197, 'Yecuatla'),
(30, 30198, 'Zacualpan'),
(30, 30199, 'Zaragoza'),
(30, 30200, 'Zentla'),
(30, 30201, 'Zongolica'),
(30, 30202, 'Zontecomatlán de López y Fuentes'),
(30, 30203, 'Zozocolco de Hidalgo'),
(30, 30204, 'Agua Dulce'),
(30, 30205, 'El Higo'),
(30, 30206, 'Nanchital de Lázaro Cárdenas del Río'),
(30, 30207, 'Tres Valles'),
(30, 30208, 'Carlos A. Carrillo'),
(30, 30209, 'Tatahuicapan de Juárez'),
(30, 30210, 'Uxpanapa'),
(30, 30211, 'San Rafael'),
(30, 30212, 'Santiago Sochiapan'),
(30, 30999, 'No identificado'),
(31, 31001, 'Abalá'),
(31, 31002, 'Acanceh'),
(31, 31003, 'Akil'),
(31, 31004, 'Baca'),
(31, 31005, 'Bokobá'),
(31, 31006, 'Buctzotz'),
(31, 31007, 'Cacalchén'),
(31, 31008, 'Calotmul'),
(31, 31009, 'Cansahcab'),
(31, 31010, 'Cantamayec'),
(31, 31011, 'Celestún'),
(31, 31012, 'Cenotillo'),
(31, 31013, 'Conkal'),
(31, 31014, 'Cuncunul'),
(31, 31015, 'Cuzamá'),
(31, 31016, 'Chacsinkín'),
(31, 31017, 'Chankom'),
(31, 31018, 'Chapab'),
(31, 31019, 'Chemax'),
(31, 31020, 'Chicxulub Pueblo'),
(31, 31021, 'Chichimilá'),
(31, 31022, 'Chikindzonot'),
(31, 31023, 'Chocholá'),
(31, 31024, 'Chumayel'),
(31, 31025, 'Dzán'),
(31, 31026, 'Dzemul'),
(31, 31027, 'Dzidzantún'),
(31, 31028, 'Dzilam de Bravo'),
(31, 31029, 'Dzilam González'),
(31, 31030, 'Dzitás'),
(31, 31031, 'Dzoncauich'),
(31, 31032, 'Espita'),
(31, 31033, 'Halachó'),
(31, 31034, 'Hocabá'),
(31, 31035, 'Hoctún'),
(31, 31036, 'Homún'),
(31, 31037, 'Huhí'),
(31, 31038, 'Hunucmá'),
(31, 31039, 'Ixil'),
(31, 31040, 'Izamal'),
(31, 31041, 'Kanasín'),
(31, 31042, 'Kantunil'),
(31, 31043, 'Kaua'),
(31, 31044, 'Kinchil'),
(31, 31045, 'Kopomá'),
(31, 31046, 'Mama'),
(31, 31047, 'Maní'),
(31, 31048, 'Maxcanú'),
(31, 31049, 'Mayapán'),
(31, 31050, 'Mérida'),
(31, 31051, 'Mocochá'),
(31, 31052, 'Motul'),
(31, 31053, 'Muna'),
(31, 31054, 'Muxupip'),
(31, 31055, 'Opichén'),
(31, 31056, 'Oxkutzcab'),
(31, 31057, 'Panabá'),
(31, 31058, 'Peto'),
(31, 31059, 'Progreso'),
(31, 31060, 'Quintana Roo'),
(31, 31061, 'Río Lagartos'),
(31, 31062, 'Sacalum'),
(31, 31063, 'Samahil'),
(31, 31064, 'Sanahcat'),
(31, 31065, 'San Felipe'),
(31, 31066, 'Santa Elena'),
(31, 31067, 'Seyé'),
(31, 31068, 'Sinanché'),
(31, 31069, 'Sotuta'),
(31, 31070, 'Sucilá'),
(31, 31071, 'Sudzal'),
(31, 31072, 'Suma'),
(31, 31073, 'Tahdziú'),
(31, 31074, 'Tahmek'),
(31, 31075, 'Teabo'),
(31, 31076, 'Tecoh'),
(31, 31077, 'Tekal de Venegas'),
(31, 31078, 'Tekantó'),
(31, 31079, 'Tekax'),
(31, 31080, 'Tekit'),
(31, 31081, 'Tekom'),
(31, 31082, 'Telchac Pueblo'),
(31, 31083, 'Telchac Puerto'),
(31, 31084, 'Temax'),
(31, 31085, 'Temozón'),
(31, 31086, 'Tepakán'),
(31, 31087, 'Tetiz'),
(31, 31088, 'Teya'),
(31, 31089, 'Ticul'),
(31, 31090, 'Timucuy'),
(31, 31091, 'Tinum'),
(31, 31092, 'Tixcacalcupul'),
(31, 31093, 'Tixkokob'),
(31, 31094, 'Tixmehuac'),
(31, 31095, 'Tixpéhual'),
(31, 31096, 'Tizimín'),
(31, 31097, 'Tunkás'),
(31, 31098, 'Tzucacab'),
(31, 31099, 'Uayma'),
(31, 31100, 'Ucú'),
(31, 31101, 'Umán'),
(31, 31102, 'Valladolid'),
(31, 31103, 'Xocchel'),
(31, 31104, 'Yaxcabá'),
(31, 31105, 'Yaxkukul'),
(31, 31106, 'Yobaín'),
(31, 31999, 'No identificado'),
(32, 32001, 'Apozol'),
(32, 32002, 'Apulco'),
(32, 32003, 'Atolinga'),
(32, 32004, 'Benito Juárez'),
(32, 32005, 'Calera'),
(32, 32006, 'Cañitas de Felipe Pescador'),
(32, 32007, 'Concepción del Oro'),
(32, 32008, 'Cuauhtémoc'),
(32, 32009, 'Chalchihuites'),
(32, 32010, 'Fresnillo'),
(32, 32011, 'Trinidad García de la Cadena'),
(32, 32012, 'Genaro Codina'),
(32, 32013, 'General Enrique Estrada'),
(32, 32014, 'General Francisco R. Murguía'),
(32, 32015, 'El Plateado de Joaquín Amaro'),
(32, 32016, 'General Pánfilo Natera'),
(32, 32017, 'Guadalupe'),
(32, 32018, 'Huanusco'),
(32, 32019, 'Jalpa'),
(32, 32020, 'Jerez'),
(32, 32021, 'Jiménez del Teul'),
(32, 32022, 'Juan Aldama'),
(32, 32023, 'Juchipila'),
(32, 32024, 'Loreto'),
(32, 32025, 'Luis Moya'),
(32, 32026, 'Mazapil'),
(32, 32027, 'Melchor Ocampo'),
(32, 32028, 'Mezquital del Oro'),
(32, 32029, 'Miguel Auza'),
(32, 32030, 'Momax'),
(32, 32031, 'Monte Escobedo'),
(32, 32032, 'Morelos'),
(32, 32033, 'Moyahua de Estrada'),
(32, 32034, 'Nochistlán de Mejía'),
(32, 32035, 'Noria de Ángeles'),
(32, 32036, 'Ojocaliente'),
(32, 32037, 'Pánuco'),
(32, 32038, 'Pinos'),
(32, 32039, 'Río Grande'),
(32, 32040, 'Sain Alto'),
(32, 32041, 'El Salvador'),
(32, 32042, 'Sombrerete'),
(32, 32043, 'Susticacán'),
(32, 32044, 'Tabasco'),
(32, 32045, 'Tepechitlán'),
(32, 32046, 'Tepetongo'),
(32, 32047, 'Teúl de González Ortega'),
(32, 32048, 'Tlaltenango de Sánchez Román'),
(32, 32049, 'Valparaíso'),
(32, 32050, 'Vetagrande'),
(32, 32051, 'Villa de Cos'),
(32, 32052, 'Villa García'),
(32, 32053, 'Villa González Ortega'),
(32, 32054, 'Villa Hidalgo'),
(32, 32055, 'Villanueva'),
(32, 32056, 'Zacatecas'),
(32, 32057, 'Trancoso'),
(32, 32058, 'Santa María de la Paz'),
(32, 32999, 'No identificado'),
(99, 99999, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_nacionalidad`
--

CREATE TABLE `catalogos_nacionalidad` (
  `NACIONALIDAD_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_nacionalidad`
--

INSERT INTO `catalogos_nacionalidad` (`NACIONALIDAD_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Mexicana'),
(2, 'Estadounidense'),
(3, 'Canadiense'),
(4, 'Beliceña'),
(5, 'Costarricense'),
(6, 'Guatemalteca'),
(7, 'Hondureña'),
(8, 'Nicaragüense'),
(9, 'Panameña'),
(10, 'Salvadoreña'),
(11, 'Argentina'),
(12, 'Brasileña'),
(13, 'Colombiana'),
(14, 'Otras nacionalidades de Sudamérica (distintas a las 3 anteriores)'),
(15, 'De algún país del Caribe'),
(16, 'De algún país  Europeo'),
(17, 'De algún país  Asiático'),
(18, 'De algún país Africano'),
(19, 'De algún país de Oceanía'),
(99, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_noprivativas`
--

CREATE TABLE `catalogos_noprivativas` (
  `NOPRIVATIVAS_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(200) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_noprivativas`
--

INSERT INTO `catalogos_noprivativas` (`NOPRIVATIVAS_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Amonestación'),
(2, 'Apercibimiento'),
(3, 'Prestación de servicios a favor de la comunidad'),
(4, 'Sesiones de asesoramiento colectivo y actividades análogas'),
(5, 'Supervisión familiar'),
(6, 'Prohibición de asistir a determinados lugares, conducir vehículos y de utilizar instrumentos, objetos o productos que se hayan utilizado en el hecho delictivo'),
(7, 'No poseer armas'),
(8, 'Abstenerse a viajar al extranjero'),
(9, 'Integrarse a programas especializados en teoría de género, en casos de hechos tipificados como delitos sexuales'),
(10, 'Libertad asistida'),
(11, 'Otra'),
(99, 'No identificada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_numero`
--

CREATE TABLE `catalogos_numero` (
  `NUMERO_ID` int(3) NOT NULL,
  `DESCRIPCION` varchar(15) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_numero`
--

INSERT INTO `catalogos_numero` (`NUMERO_ID`, `DESCRIPCION`) VALUES
(-9, 'No identificado'),
(-2, 'No aplica'),
(0, '0'),
(1, '1'),
(2, '2'),
(3, '3'),
(4, '4'),
(5, '5'),
(6, '6'),
(7, '7'),
(8, '8'),
(9, '9'),
(10, '10'),
(11, '11'),
(12, '12'),
(13, '13'),
(14, '14'),
(15, '15'),
(16, '16'),
(17, '17'),
(18, '18'),
(19, '19'),
(20, '20'),
(21, '21'),
(22, '22'),
(23, '23'),
(24, '24'),
(25, '25'),
(26, '26'),
(27, '27'),
(28, '28'),
(29, '29'),
(30, '30'),
(31, '31'),
(32, '32'),
(33, '33'),
(34, '34'),
(35, '35'),
(36, '36'),
(37, '37'),
(38, '38'),
(39, '39'),
(40, '40'),
(41, '41'),
(42, '42'),
(43, '43'),
(44, '44'),
(45, '45'),
(46, '46'),
(47, '47'),
(48, '48'),
(49, '49'),
(50, '50'),
(51, '51'),
(52, '52'),
(53, '53'),
(54, '54'),
(55, '55'),
(56, '56'),
(57, '57'),
(58, '58'),
(59, '59'),
(60, '60'),
(61, '61'),
(62, '62'),
(63, '63'),
(64, '64'),
(65, '65'),
(66, '66'),
(67, '67'),
(68, '68'),
(69, '69'),
(70, '70'),
(71, '71'),
(72, '72'),
(73, '73'),
(74, '74'),
(75, '75'),
(76, '76'),
(77, '77'),
(78, '78'),
(79, '79'),
(80, '80'),
(81, '81'),
(82, '82'),
(83, '83'),
(84, '84'),
(85, '85'),
(86, '86'),
(87, '87'),
(88, '88'),
(89, '89'),
(90, '90'),
(91, '91'),
(92, '92'),
(93, '93'),
(94, '94'),
(95, '95'),
(96, '96'),
(97, '97'),
(98, '98'),
(99, '99'),
(100, '100'),
(101, '101'),
(102, '102'),
(103, '103'),
(104, '104'),
(105, '105'),
(106, '106'),
(107, '107'),
(108, '108'),
(109, '109'),
(110, '110'),
(111, '111'),
(112, '112'),
(113, '113'),
(114, '114'),
(115, '115'),
(116, '116'),
(117, '117'),
(118, '118'),
(119, '119'),
(120, '120'),
(121, '121'),
(122, '122'),
(123, '123'),
(124, '124'),
(125, '125'),
(126, '126'),
(127, '127'),
(128, '128'),
(129, '129'),
(130, '130'),
(131, '131'),
(132, '132'),
(133, '133'),
(134, '134'),
(135, '135'),
(136, '136'),
(137, '137'),
(138, '138'),
(139, '139'),
(140, '140'),
(141, '141'),
(142, '142'),
(143, '143'),
(144, '144'),
(145, '145'),
(146, '146'),
(147, '147'),
(148, '148'),
(149, '149'),
(150, '150'),
(151, '151'),
(152, '152'),
(153, '153'),
(154, '154'),
(155, '155'),
(156, '156'),
(157, '157'),
(158, '158'),
(159, '159'),
(160, '160'),
(161, '161'),
(162, '162'),
(163, '163'),
(164, '164'),
(165, '165'),
(166, '166'),
(167, '167'),
(168, '168'),
(169, '169'),
(170, '170'),
(171, '171'),
(172, '172'),
(173, '173'),
(174, '174'),
(175, '175'),
(176, '176'),
(177, '177'),
(178, '178'),
(179, '179'),
(180, '180'),
(181, '181'),
(182, '182'),
(183, '183'),
(184, '184'),
(185, '185'),
(186, '186'),
(187, '187'),
(188, '188'),
(189, '189'),
(190, '190'),
(191, '191'),
(192, '192'),
(193, '193'),
(194, '194'),
(195, '195'),
(196, '196'),
(197, '197'),
(198, '198'),
(199, '199'),
(200, '200'),
(201, '201'),
(202, '202'),
(203, '203'),
(204, '204'),
(205, '205'),
(206, '206'),
(207, '207'),
(208, '208'),
(209, '209'),
(210, '210'),
(211, '211'),
(212, '212'),
(213, '213'),
(214, '214'),
(215, '215'),
(216, '216'),
(217, '217'),
(218, '218'),
(219, '219'),
(220, '220'),
(221, '221'),
(222, '222'),
(223, '223'),
(224, '224'),
(225, '225'),
(226, '226'),
(227, '227'),
(228, '228'),
(229, '229'),
(230, '230'),
(231, '231'),
(232, '232'),
(233, '233'),
(234, '234'),
(235, '235'),
(236, '236'),
(237, '237'),
(238, '238'),
(239, '239'),
(240, '240'),
(241, '241'),
(242, '242'),
(243, '243'),
(244, '244'),
(245, '245'),
(246, '246'),
(247, '247'),
(248, '248'),
(249, '249'),
(250, '250'),
(251, '251'),
(252, '252'),
(253, '253'),
(254, '254'),
(255, '255'),
(256, '256'),
(257, '257'),
(258, '258'),
(259, '259'),
(260, '260'),
(261, '261'),
(262, '262'),
(263, '263'),
(264, '264'),
(265, '265'),
(266, '266'),
(267, '267'),
(268, '268'),
(269, '269'),
(270, '270'),
(271, '271'),
(272, '272'),
(273, '273'),
(274, '274'),
(275, '275'),
(276, '276'),
(277, '277'),
(278, '278'),
(279, '279'),
(280, '280'),
(281, '281'),
(282, '282'),
(283, '283'),
(284, '284'),
(285, '285'),
(286, '286'),
(287, '287'),
(288, '288'),
(289, '289'),
(290, '290'),
(291, '291'),
(292, '292'),
(293, '293'),
(294, '294'),
(295, '295'),
(296, '296'),
(297, '297'),
(298, '298'),
(299, '299'),
(300, '300'),
(301, '301'),
(302, '302'),
(303, '303'),
(304, '304'),
(305, '305'),
(306, '306'),
(307, '307'),
(308, '308'),
(309, '309'),
(310, '310'),
(311, '311'),
(312, '312'),
(313, '313'),
(314, '314'),
(315, '315'),
(316, '316'),
(317, '317'),
(318, '318'),
(319, '319'),
(320, '320'),
(321, '321'),
(322, '322'),
(323, '323'),
(324, '324'),
(325, '325'),
(326, '326'),
(327, '327'),
(328, '328'),
(329, '329'),
(330, '330'),
(331, '331'),
(332, '332'),
(333, '333'),
(334, '334'),
(335, '335'),
(336, '336'),
(337, '337'),
(338, '338'),
(339, '339'),
(340, '340'),
(341, '341'),
(342, '342'),
(343, '343'),
(344, '344'),
(345, '345'),
(346, '346'),
(347, '347'),
(348, '348'),
(349, '349'),
(350, '350'),
(351, '351'),
(352, '352'),
(353, '353'),
(354, '354'),
(355, '355'),
(356, '356'),
(357, '357'),
(358, '358'),
(359, '359'),
(360, '360'),
(361, '361'),
(362, '362'),
(363, '363'),
(364, '364'),
(365, '365'),
(366, '366'),
(367, '367'),
(368, '368'),
(369, '369'),
(370, '370'),
(371, '371'),
(372, '372'),
(373, '373'),
(374, '374'),
(375, '375'),
(376, '376'),
(377, '377'),
(378, '378'),
(379, '379'),
(380, '380'),
(381, '381'),
(382, '382'),
(383, '383'),
(384, '384'),
(385, '385'),
(386, '386'),
(387, '387'),
(388, '388'),
(389, '389'),
(390, '390'),
(391, '391'),
(392, '392'),
(393, '393'),
(394, '394'),
(395, '395'),
(396, '396'),
(397, '397'),
(398, '398'),
(399, '399'),
(400, '400'),
(401, '401'),
(402, '402'),
(403, '403'),
(404, '404'),
(405, '405'),
(406, '406'),
(407, '407'),
(408, '408'),
(409, '409'),
(410, '410'),
(411, '411'),
(412, '412'),
(413, '413'),
(414, '414'),
(415, '415'),
(416, '416'),
(417, '417'),
(418, '418'),
(419, '419'),
(420, '420'),
(421, '421'),
(422, '422'),
(423, '423'),
(424, '424'),
(425, '425'),
(426, '426'),
(427, '427'),
(428, '428'),
(429, '429'),
(430, '430'),
(431, '431'),
(432, '432'),
(433, '433'),
(434, '434'),
(435, '435'),
(436, '436'),
(437, '437'),
(438, '438'),
(439, '439'),
(440, '440'),
(441, '441'),
(442, '442'),
(443, '443'),
(444, '444'),
(445, '445'),
(446, '446'),
(447, '447'),
(448, '448'),
(449, '449'),
(450, '450'),
(451, '451'),
(452, '452'),
(453, '453'),
(454, '454'),
(455, '455'),
(456, '456'),
(457, '457'),
(458, '458'),
(459, '459'),
(460, '460'),
(461, '461'),
(462, '462'),
(463, '463'),
(464, '464'),
(465, '465'),
(466, '466'),
(467, '467'),
(468, '468'),
(469, '469'),
(470, '470'),
(471, '471'),
(472, '472'),
(473, '473'),
(474, '474'),
(475, '475'),
(476, '476'),
(477, '477'),
(478, '478'),
(479, '479'),
(480, '480'),
(481, '481'),
(482, '482'),
(483, '483'),
(484, '484'),
(485, '485'),
(486, '486'),
(487, '487'),
(488, '488'),
(489, '489'),
(490, '490'),
(491, '491'),
(492, '492'),
(493, '493'),
(494, '494'),
(495, '495'),
(496, '496'),
(497, '497'),
(498, '498'),
(499, '499'),
(500, '500');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_ocupacion`
--

CREATE TABLE `catalogos_ocupacion` (
  `OCUPACION_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_ocupacion`
--

INSERT INTO `catalogos_ocupacion` (`OCUPACION_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Funcionarios, directores y jefes'),
(2, 'Profesionistas y técnicos '),
(3, 'Trabajadores auxiliares en actividades administrativas'),
(4, 'Comerciantes, empleados en ventas y agentes de ventas'),
(5, 'Trabajadores en servicios personales y vigilancia'),
(6, 'Trabajadores en actividades agrícolas, ganaderas, forestales, caza y pesca'),
(7, 'Trabajadores artesanales'),
(8, 'Operadores de maquinaria industrial, ensambladores, choferes y conductores de transporte'),
(9, 'Trabajadores en actividades elementales y de apoyo'),
(10, 'No ejercía alguna ocupación'),
(99, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_pais`
--

CREATE TABLE `catalogos_pais` (
  `PAIS_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_pais`
--

INSERT INTO `catalogos_pais` (`PAIS_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Estados Unidos Mexicanos'),
(2, 'Estados Unidos de América'),
(3, 'Canadá'),
(4, 'Belice'),
(5, 'Costa Rica '),
(6, 'Guatemala'),
(7, 'Honduras'),
(8, 'Nicaragua '),
(9, 'Panamá'),
(10, 'El Salvador'),
(11, 'Argentina'),
(12, 'Brasil '),
(13, 'Colombia '),
(14, 'Otros países de Sudamérica'),
(15, 'De algún país del Caribe'),
(16, 'De algún país Europeo'),
(17, 'De algún país Asiático'),
(18, 'De algún país Africano'),
(19, 'De algún país de Oceanía'),
(99, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_plazo_cierre`
--

CREATE TABLE `catalogos_plazo_cierre` (
  `CIERRE_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(200) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_plazo_cierre`
--

INSERT INTO `catalogos_plazo_cierre` (`CIERRE_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'De 1 a 15 días '),
(2, 'De 16 días a 1 mes'),
(3, 'De 1 mes 1 día a 2  meses'),
(4, 'De 2 meses 1 día a 3 meses'),
(5, 'Más de 3 meses'),
(99, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_plazo_constitucional`
--

CREATE TABLE `catalogos_plazo_constitucional` (
  `PLAZO_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_plazo_constitucional`
--

INSERT INTO `catalogos_plazo_constitucional` (`PLAZO_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, '72 horas '),
(2, '144 horas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_privativas`
--

CREATE TABLE `catalogos_privativas` (
  `PRIVATIVAS_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(60) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_privativas`
--

INSERT INTO `catalogos_privativas` (`PRIVATIVAS_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Estancia domiciliaria'),
(2, 'Internamiento'),
(3, 'Semi-internamiento o internamiento en tiempo libre'),
(9, 'No identificada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_proc_abreviado`
--

CREATE TABLE `catalogos_proc_abreviado` (
  `PROCABREV_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_proc_abreviado`
--

INSERT INTO `catalogos_proc_abreviado` (`PROCABREV_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Medida privativa de la libertad'),
(2, 'Medida no privativa de la libertad'),
(3, 'Mixta (medida privativa y no privativa de la libertad)'),
(9, 'No identificada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_promueve_incidente`
--

CREATE TABLE `catalogos_promueve_incidente` (
  `PROMUEVE_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(200) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_promueve_incidente`
--

INSERT INTO `catalogos_promueve_incidente` (`PROMUEVE_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Victima'),
(2, 'Defensor del imputado'),
(3, 'Ministerio público'),
(4, 'Otro'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_pueblo_indigena`
--

CREATE TABLE `catalogos_pueblo_indigena` (
  `PUEBLO_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_pueblo_indigena`
--

INSERT INTO `catalogos_pueblo_indigena` (`PUEBLO_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Chinanteco'),
(2, 'Chol'),
(3, 'Cora'),
(4, 'Huasteco'),
(5, 'Huichol'),
(6, 'Maya'),
(7, 'Mayo'),
(8, 'Mazahua'),
(9, 'Mazateco'),
(10, 'Mixe'),
(11, 'Mixteco'),
(12, 'Náhuatl'),
(13, 'Otomí'),
(14, 'Tarasco/Purépecha'),
(15, 'Tarahumara'),
(16, 'Tepehuano'),
(17, 'Tlapaneco'),
(18, 'Totonaco'),
(19, 'Tseltal'),
(20, 'Tsotsil'),
(21, 'Yaqui'),
(22, 'Zapoteco'),
(23, 'Zoque'),
(24, 'Otro'),
(99, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_rango_ingresos`
--

CREATE TABLE `catalogos_rango_ingresos` (
  `ID_INGRESOS` int(1) NOT NULL,
  `DESCRIPCION` varchar(35) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_rango_ingresos`
--

INSERT INTO `catalogos_rango_ingresos` (`ID_INGRESOS`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'De 1 peso a 500 pesos'),
(2, 'De 501 peso a 1,000 pesos'),
(3, 'De 1,001 pesos a 1,500 pesos'),
(4, 'De 1,501 pesos a 3,183 pesos'),
(5, 'De 3,184 pesos a 6,366 pesos'),
(6, 'De 6,367 pesos a 9,549 pesos'),
(7, 'De 9,550 pesos a 15,915 pesos'),
(8, 'Más de 15,915 pesos'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_reincidencia`
--

CREATE TABLE `catalogos_reincidencia` (
  `REINCIDENCIA_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_reincidencia`
--

INSERT INTO `catalogos_reincidencia` (`REINCIDENCIA_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Reincidente'),
(2, 'No reincidente'),
(3, 'Delincuente habitual'),
(4, ' Otro'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_relacion_imputado`
--

CREATE TABLE `catalogos_relacion_imputado` (
  `RELACION_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_relacion_imputado`
--

INSERT INTO `catalogos_relacion_imputado` (`RELACION_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Académica'),
(2, 'Autoridad'),
(3, 'Cónyuge o concubinato'),
(4, 'Ex cónyuge o pareja anterior'),
(5, 'Empleo o profesión'),
(6, 'Parentesco por afinidad'),
(7, 'Parentesco por consanguinidad'),
(8, 'Tutor o curador'),
(9, 'Otro tipo de relación'),
(10, 'Ninguna'),
(99, 'No identificada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_reparacion_dano`
--

CREATE TABLE `catalogos_reparacion_dano` (
  `REPARACION_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_reparacion_dano`
--

INSERT INTO `catalogos_reparacion_dano` (`REPARACION_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Restitución de las cosa'),
(2, 'Pago de la cosa'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_representante_legal`
--

CREATE TABLE `catalogos_representante_legal` (
  `REPRESENTANTE_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(40) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_representante_legal`
--

INSERT INTO `catalogos_representante_legal` (`REPRESENTANTE_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Padre'),
(2, 'Madre '),
(3, ' Tutor '),
(4, 'Procuraduría de Protección'),
(5, 'Sistema de Desarrollo Integral de la Fam'),
(6, 'Otro '),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_resolucion_mprueba`
--

CREATE TABLE `catalogos_resolucion_mprueba` (
  `MPRUEBA_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_resolucion_mprueba`
--

INSERT INTO `catalogos_resolucion_mprueba` (`MPRUEBA_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Admitida'),
(2, 'Excluida'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_respuesta_simple`
--

CREATE TABLE `catalogos_respuesta_simple` (
  `RESPUESTA_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_respuesta_simple`
--

INSERT INTO `catalogos_respuesta_simple` (`RESPUESTA_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Sí'),
(2, 'No'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_sentido_fallo`
--

CREATE TABLE `catalogos_sentido_fallo` (
  `SENTIDO_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(25) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_sentido_fallo`
--

INSERT INTO `catalogos_sentido_fallo` (`SENTIDO_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Absolución '),
(2, 'Condena'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_sexo`
--

CREATE TABLE `catalogos_sexo` (
  `SEXO_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_sexo`
--

INSERT INTO `catalogos_sexo` (`SEXO_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Hombre'),
(2, 'Mujer'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_sitio_ocurrencia`
--

CREATE TABLE `catalogos_sitio_ocurrencia` (
  `SITIO_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_sitio_ocurrencia`
--

INSERT INTO `catalogos_sitio_ocurrencia` (`SITIO_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Hogar '),
(2, 'Escuela'),
(3, 'Oficina gubernamental'),
(4, 'Vía pública'),
(5, 'Empresa'),
(6, 'Banco'),
(7, 'Transporte público colectivo (microbús, combi, vagoneta)'),
(8, 'Transporte público individual (taxi)'),
(9, 'Metro, suburbano, metrobús'),
(10, 'Vehículo particular'),
(11, 'Aeropuerto'),
(12, 'Otro '),
(99, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_sobreseimiento`
--

CREATE TABLE `catalogos_sobreseimiento` (
  `SOBRESEIMIENTO_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(200) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_sobreseimiento`
--

INSERT INTO `catalogos_sobreseimiento` (`SOBRESEIMIENTO_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'El hecho no se cometió'),
(2, 'El hecho cometido no constituye delito'),
(3, 'Apareciere claramente establecida la inocencia del imputado'),
(4, 'El imputado esté exento de responsabilidad penal'),
(5, 'Agotada la investigación, el Ministerio Público estime que no cuenta con los elementos suficientes para fundar una acusación'),
(6, 'Se hubiere extinguido la acción penal (por causas diferentes al cumplimiento de la suspensión y del acuerdo reparatorio)'),
(7, 'Una ley o reforma posterior derogue el delito por el que se sigue el proceso'),
(8, 'El hecho de que se trata haya sido materia de un proceso penal en el que se hubiera dictado sentencia firme respecto del imputado'),
(9, 'Muerte del imputado'),
(10, 'La no vinculación al proceso'),
(11, 'Por incumplimiento del plazo del cierre de la investigación complementaria'),
(12, 'Otro'),
(99, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_suspension_condicional`
--

CREATE TABLE `catalogos_suspension_condicional` (
  `SUSPENSION_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_suspension_condicional`
--

INSERT INTO `catalogos_suspension_condicional` (`SUSPENSION_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Abstenerse de consumir drogas o estupefacientes o de abusar de las bebidas alcohólicas'),
(2, 'Abstenerse de viajar al extranjero'),
(3, 'Aprender una profesión u oficio o seguir cursos de capacitación en el lugar o la institución que determine el Juez de control'),
(4, 'Comenzar o continuar la escolaridad que le corresponda'),
(5, 'Cualquier otra condición que, a juicio del Juez, logre una efectiva tutela de los derechos de la víctima y contribuyan a cumplir con los fines socioeducativos de la persona adolescente'),
(6, 'Cumplir con los deberes de deudor alimentario'),
(7, 'En caso de hechos tipificados como delitos sexuales, la obligación de integrarse a programas de educación sexual que incorporen la perspectiva de género'),
(8, 'Frecuentar o dejar de frecuentar determinados lugares o personas'),
(9, 'No conducir vehículos'),
(10, 'No poseer ni portar armas'),
(11, 'Participar en programas especiales para la prevención y el tratamiento de adicciones'),
(12, 'Prestar servicio social a favor de la comunidad, las víctimas, del Estado o de instituciones de beneficencia pública o privada, en caso de que la persona adolescente sea mayor de quince años'),
(13, 'Prestar servicio social a favor del Estado o de instituciones de beneficencia pública'),
(14, 'Someterse a la vigilancia que determine el Juez de control'),
(15, 'Someterse a tratamiento médico o psicológico, de preferencia en instituciones públicas'),
(16, 'Tener un trabajo o empleo, o adquirir, en el plazo que el Juez de control determine, un oficio, arte, industria o profesión, si no tiene medios propios de subsistencia'),
(17, 'Tener un trabajo o empleo, o adquirir, en el plazo que el Juez determine, un oficio, arte, industria o profesión si no tiene medios propios de subsistencia, siempre y cuando su edad lo permita'),
(18, 'Otra'),
(99, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_tiempo_internamiento`
--

CREATE TABLE `catalogos_tiempo_internamiento` (
  `INTERNAMIENTO_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_tiempo_internamiento`
--

INSERT INTO `catalogos_tiempo_internamiento` (`INTERNAMIENTO_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Menos de 6 meses'),
(2, 'De 6 meses hasta menos de 1 año '),
(3, 'De 1 año hasta menos de 1 año, 6 meses'),
(4, 'De 1 año, 6 meses hasta 2 años'),
(5, 'Más de 2 años hasta menos de 2 años, 6 meses'),
(6, 'De 2 años, 6 meses hasta 3 años'),
(7, 'Más de 3 años hasta menos de 3 años, 6 meses'),
(8, 'De 3 años, 6 meses hasta 4 años'),
(9, 'Más de 4 años hasta menos de 4 años, 6 meses'),
(10, 'De 4 años, 6 meses hasta 5 años'),
(99, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_tipo_consignacion`
--

CREATE TABLE `catalogos_tipo_consignacion` (
  `CONSIGNACION_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_tipo_consignacion`
--

INSERT INTO `catalogos_tipo_consignacion` (`CONSIGNACION_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Detenido'),
(2, 'En libertad'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_tipo_defensor`
--

CREATE TABLE `catalogos_tipo_defensor` (
  `DEFENSOR_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_tipo_defensor`
--

INSERT INTO `catalogos_tipo_defensor` (`DEFENSOR_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Público'),
(2, 'Privado'),
(3, 'Público y privado'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_tipo_detencion`
--

CREATE TABLE `catalogos_tipo_detencion` (
  `TDETENCION_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_tipo_detencion`
--

INSERT INTO `catalogos_tipo_detencion` (`TDETENCION_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Flagrancia'),
(2, 'Caso urgente'),
(3, 'Orden de aprehensión'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_tipo_impugnacion`
--

CREATE TABLE `catalogos_tipo_impugnacion` (
  `IMPUGNACION_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_tipo_impugnacion`
--

INSERT INTO `catalogos_tipo_impugnacion` (`IMPUGNACION_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Recurso de revocación '),
(2, 'Recurso de apelación '),
(3, 'Amparo'),
(4, 'Otro'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_tipo_resolucion`
--

CREATE TABLE `catalogos_tipo_resolucion` (
  `RESOLUCION_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(200) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_tipo_resolucion`
--

INSERT INTO `catalogos_tipo_resolucion` (`RESOLUCION_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Sobreseimiento (diferente al que resulte por el cumplimiento del acuerdo reparatorio o la suspensión condicional del proceso)'),
(2, 'Suspensión condicional del proceso (cumplimentada)'),
(3, 'Acuerdo reparatorio (cumplimentada)'),
(4, 'Procedimiento abreviado'),
(5, 'Auto de apertura a juicio'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_tipo_resolucionjo`
--

CREATE TABLE `catalogos_tipo_resolucionjo` (
  `RESOLUCION_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(200) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_tipo_resolucionjo`
--

INSERT INTO `catalogos_tipo_resolucionjo` (`RESOLUCION_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Sobreseimiento '),
(2, 'Sentencia condenatoria'),
(3, 'Sentencia absolutoria'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_tipo_sobreseimiento`
--

CREATE TABLE `catalogos_tipo_sobreseimiento` (
  `TSOBRESEIMIENTO_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_tipo_sobreseimiento`
--

INSERT INTO `catalogos_tipo_sobreseimiento` (`TSOBRESEIMIENTO_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Total '),
(2, 'Parcial'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_tipo_victima`
--

CREATE TABLE `catalogos_tipo_victima` (
  `VICTIMA_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_tipo_victima`
--

INSERT INTO `catalogos_tipo_victima` (`VICTIMA_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Persona física'),
(2, 'Persona moral'),
(3, 'Sociedad'),
(4, 'Estado'),
(5, 'Otro'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_vialidad`
--

CREATE TABLE `catalogos_vialidad` (
  `VIALIDAD_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_vialidad`
--

INSERT INTO `catalogos_vialidad` (`VIALIDAD_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Ampliación'),
(2, 'Andador'),
(3, 'Avenida'),
(4, 'Boulevard'),
(5, 'Calle'),
(6, 'Callejón'),
(7, 'Calzada'),
(8, 'Cerrada'),
(9, 'Circuito'),
(10, 'Circunvalación'),
(11, 'Continuación'),
(12, 'Corredor'),
(13, 'Diagonal'),
(14, 'Eje vial'),
(15, 'Pasaje'),
(16, 'Peatonal'),
(17, 'Periférico'),
(18, 'Privada'),
(19, 'Prolongación'),
(20, 'Retorno'),
(21, 'Viaducto'),
(22, 'Brecha'),
(23, 'Camino'),
(24, 'Carretera'),
(25, 'Terracería'),
(26, 'Vereda');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_victima_moral`
--

CREATE TABLE `catalogos_victima_moral` (
  `MORAL_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_victima_moral`
--

INSERT INTO `catalogos_victima_moral` (`MORAL_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Sociedad mercantil'),
(2, 'Sociedad civil'),
(3, 'Asociación civil'),
(4, 'Otra'),
(9, 'No identificado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos_vulnerabilidad`
--

CREATE TABLE `catalogos_vulnerabilidad` (
  `VULNERABILIDAD_ID` int(2) NOT NULL,
  `DESCRIPCION` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `catalogos_vulnerabilidad`
--

INSERT INTO `catalogos_vulnerabilidad` (`VULNERABILIDAD_ID`, `DESCRIPCION`) VALUES
(-2, 'No aplica'),
(1, 'Candidato'),
(2, 'Persona adulta mayor'),
(3, 'Persona con discapacidad'),
(4, 'Persona migrante'),
(5, 'Persona indígena'),
(6, 'Persona defensora de derechos humanos'),
(7, 'Periodista'),
(8, 'Persona en situación de desplazamiento interno '),
(9, 'Perteneciente a la población LGBTTTI'),
(10, 'Servidor público'),
(11, 'Sindicalista'),
(12, 'Otra'),
(99, 'No identificada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_audiencias_adojc`
--

CREATE TABLE `datos_audiencias_adojc` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO` int(3) NOT NULL,
  `JUZGADO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `CAUSA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `JUEZ_CLAVE1` int(2) NOT NULL,
  `JUEZ_CLAVE2` int(2) NOT NULL,
  `JUEZ_CLAVE3` int(2) NOT NULL,
  `AUDIENCIA_INVESTIGACION` int(2) NOT NULL,
  `AUDIENCIA_INTERMEDIA` int(2) NOT NULL,
  `FECHA_CELEBRACION` date NOT NULL,
  `DURACION` time NOT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_audiencias_adojc`
--

INSERT INTO `datos_audiencias_adojc` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO`, `JUZGADO_CLAVE`, `CAUSA_CLAVE`, `JUEZ_CLAVE1`, `JUEZ_CLAVE2`, `JUEZ_CLAVE3`, `AUDIENCIA_INVESTIGACION`, `AUDIENCIA_INTERMEDIA`, `FECHA_CELEBRACION`, `DURACION`, `ANIO`) VALUES
(9, 9007, 125, '9-9007-125', '199007125', 7, -2, -2, -2, 1, '2020-04-01', '01:00:00', 2020),
(9, 9007, 125, '9-9007-125', '199007125', 7, -2, -2, -2, 3, '2020-03-30', '11:58:00', 2020),
(9, 9007, 125, '9-9007-125', '199007125', 7, -2, -2, 4, -2, '1899-09-09', '09:09:00', 2020),
(9, 9007, 125, '9-9007-125', '199007125', 7, -2, -2, 10, -2, '1899-09-09', '09:09:00', 2020),
(9, 9007, 125, '9-9007-125', '35599007125', 5, 6, 7, -2, 1, '2020-04-06', '01:58:00', 2020),
(9, 9007, 125, '9-9007-125', '35599007125', 5, 6, 7, -2, 3, '2020-04-13', '09:09:00', 2020),
(9, 9007, 125, '9-9007-125', '35599007125', 5, 6, 7, -2, 6, '1899-09-09', '09:09:00', 2020),
(9, 9007, 125, '9-9007-125', '35599007125', 5, 6, 7, -2, 7, '1899-09-09', '09:09:00', 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_audiencias_adojo`
--

CREATE TABLE `datos_audiencias_adojo` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO` int(3) NOT NULL,
  `JUZGADO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `CAUSA_CLAVEJO` varchar(255) COLLATE utf8_bin NOT NULL,
  `JUEZ_CLAVE1` int(2) NOT NULL,
  `JUEZ_CLAVE2` int(2) NOT NULL,
  `JUEZ_CLAVE3` int(2) NOT NULL,
  `AUDIENCIA_JUICIOORAL` int(2) NOT NULL,
  `FECHA_CELEBRACION` date NOT NULL,
  `DURACION` time NOT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_causas_penales_adojc`
--

CREATE TABLE `datos_causas_penales_adojc` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `JUZGADO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `CARPETA_INVESTIGA` varchar(255) COLLATE utf8_bin NOT NULL,
  `CAUSA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `FECHA_INGRESO` date NOT NULL,
  `JUEZ_CLAVE` int(2) NOT NULL,
  `DERIVA_ACCION_PENAL` int(1) NOT NULL,
  `COMPETENCIA` int(1) NOT NULL,
  `TIPO_INCOMPETENCIA` int(1) NOT NULL,
  `EXPEDIENTE_ACUMULADO` int(1) NOT NULL,
  `EXPEDIENTE_REFERENCIA` varchar(255) COLLATE utf8_bin NOT NULL,
  `TOTAL_DELITOS` int(3) NOT NULL,
  `TOTAL_PROCESADOS` int(3) NOT NULL,
  `TOTAL_VICTIMAS` int(3) NOT NULL,
  `COMENTARIOS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_causas_penales_adojc`
--

INSERT INTO `datos_causas_penales_adojc` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `JUZGADO_CLAVE`, `CARPETA_INVESTIGA`, `CAUSA_CLAVE`, `FECHA_INGRESO`, `JUEZ_CLAVE`, `DERIVA_ACCION_PENAL`, `COMPETENCIA`, `TIPO_INCOMPETENCIA`, `EXPEDIENTE_ACUMULADO`, `EXPEDIENTE_REFERENCIA`, `TOTAL_DELITOS`, `TOTAL_PROCESADOS`, `TOTAL_VICTIMAS`, `COMENTARIOS`, `ANIO`) VALUES
(9, 9007, 125, '9-9007-125', '1', '199007125', '1899-09-09', 1, 2, 1, -2, 2, '-2', 2, 2, 2, 'Nuevo', 2020),
(9, 9007, 125, '9-9007-125', '2', '299007125', '1899-09-09', 2, 2, 1, -2, 2, '-2', 6, 6, 6, '', 2020),
(9, 9007, 125, '9-9007-125', '355', '35599007125', '1899-09-09', 1, 2, 1, -2, 2, '-2', 5, 5, 5, 'actualizamos', 2020),
(9, 9007, 125, '9-9007-125', '5', '599007125', '1899-09-09', 1, 2, 1, -2, 2, '-2', 1, 1, 1, '', 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_causas_penales_adojo`
--

CREATE TABLE `datos_causas_penales_adojo` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `JUZGADO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `CAUSA_CLAVEJC` varchar(255) COLLATE utf8_bin NOT NULL,
  `CAUSA_CLAVEJO` varchar(255) COLLATE utf8_bin NOT NULL,
  `FECHA_INGRESO` date NOT NULL,
  `TOTAL_DELITOS` int(3) NOT NULL,
  `TOTAL_PROCESADOS` int(3) NOT NULL,
  `TOTAL_VICTIMAS` int(3) NOT NULL,
  `ATENDIDA_ORGDIFERENTE` int(1) NOT NULL,
  `JUZGADO_DIFERENTE` varchar(255) COLLATE utf8_bin NOT NULL,
  `CANTIDAD_JUECES` int(1) NOT NULL,
  `JUEZ_CLAVE_1` int(2) NOT NULL,
  `JUEZ_CLAVE_2` int(2) DEFAULT NULL,
  `JUEZ_CLAVE_3` int(2) DEFAULT NULL,
  `COMENTARIOS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_causas_penales_adojo`
--

INSERT INTO `datos_causas_penales_adojo` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `JUZGADO_CLAVE`, `CAUSA_CLAVEJC`, `CAUSA_CLAVEJO`, `FECHA_INGRESO`, `TOTAL_DELITOS`, `TOTAL_PROCESADOS`, `TOTAL_VICTIMAS`, `ATENDIDA_ORGDIFERENTE`, `JUZGADO_DIFERENTE`, `CANTIDAD_JUECES`, `JUEZ_CLAVE_1`, `JUEZ_CLAVE_2`, `JUEZ_CLAVE_3`, `COMENTARIOS`, `ANIO`) VALUES
(9, 9007, 125, '9-9007-125', '299007125', '5o99007125', '1899-09-09', 4, 2, 6, 1, '9-9007-125', -2, -2, -2, -2, '', 2020),
(9, 9007, 125, '9-9007-125', '199007125', '6O99007125', '1899-09-09', 1, 1, 2, 1, '9-9007-125', -2, -2, -2, -2, '', 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_conclusiones_adojc`
--

CREATE TABLE `datos_conclusiones_adojc` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROCESADO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `FECHA_CONCLUSION` date NOT NULL,
  `TIPO_RESOLUCION` int(1) NOT NULL,
  `TIPO_SOBRESEIMIENTO` int(1) NOT NULL,
  `PROCEDENCIA_SOBRESEIMIENTO` int(1) NOT NULL,
  `EXCLUSION_ACCIONP` int(2) NOT NULL,
  `SUSPENCION_CONDICIONAL` int(2) NOT NULL,
  `FECHA_SUSPENCION` date NOT NULL,
  `MECANISMO_ACUERDO` int(2) NOT NULL,
  `FECHA_ACUERDO` date NOT NULL,
  `TIPO_CONCLUSION_PA` int(1) NOT NULL,
  `MEDIDA_PRIVATIVA` int(1) NOT NULL,
  `MEDIDA_NOPRIVATIVA` int(2) NOT NULL,
  `TIEMPO_INTERNAMIENTO` int(2) NOT NULL,
  `REPARACION_DANIO` int(1) NOT NULL,
  `TIPO_REPARACION_DANIO` int(1) NOT NULL,
  `MONTO_REPARA` int(2) NOT NULL,
  `IMPUGNACION` int(1) NOT NULL,
  `TIPO_IMPUGNACION` int(2) NOT NULL,
  `FECHA_IMPUGNACION` date NOT NULL,
  `PERSONA_IMPUGNA` int(1) NOT NULL,
  `COMENTARIOS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_conclusiones_adojc`
--

INSERT INTO `datos_conclusiones_adojc` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `CAUSA_CLAVE`, `PROCESADO_CLAVE`, `FECHA_CONCLUSION`, `TIPO_RESOLUCION`, `TIPO_SOBRESEIMIENTO`, `PROCEDENCIA_SOBRESEIMIENTO`, `EXCLUSION_ACCIONP`, `SUSPENCION_CONDICIONAL`, `FECHA_SUSPENCION`, `MECANISMO_ACUERDO`, `FECHA_ACUERDO`, `TIPO_CONCLUSION_PA`, `MEDIDA_PRIVATIVA`, `MEDIDA_NOPRIVATIVA`, `TIEMPO_INTERNAMIENTO`, `REPARACION_DANIO`, `TIPO_REPARACION_DANIO`, `MONTO_REPARA`, `IMPUGNACION`, `TIPO_IMPUGNACION`, `FECHA_IMPUGNACION`, `PERSONA_IMPUGNA`, `COMENTARIOS`, `ANIO`) VALUES
(9, 9007, 125, '199007125', '1-P299007125', '1899-09-09', 5, -2, -2, -2, -2, '1799-09-09', -2, '1799-09-09', -2, -2, -2, -2, -2, -2, -2, 2, -2, '1899-09-09', -2, '', 2020),
(9, 9007, 125, '299007125', '2-P199007125', '1899-09-09', 5, -2, -2, -2, -2, '1799-09-09', -2, '1799-09-09', -2, -2, -2, -2, -2, -2, -2, 1, 2, '1899-09-09', 2, '', 2020),
(9, 9007, 125, '299007125', '2-P299007125', '1899-09-09', 1, 1, 5, -2, -2, '1799-09-09', -2, '1799-09-09', -2, -2, -2, -2, 2, -2, -2, 2, -2, '1899-09-09', -2, '', 2020),
(9, 9007, 125, '299007125', '2-P699007125', '1899-09-09', 5, -2, -2, -2, -2, '1799-09-09', -2, '1799-09-09', -2, -2, -2, -2, -2, -2, -2, 2, -2, '1899-09-09', -2, '', 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_conclusiones_adojo`
--

CREATE TABLE `datos_conclusiones_adojo` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVEJO` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROCESADO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `FECHA_CONCLUSION` date NOT NULL,
  `TIPO_RESOLUCION` int(1) NOT NULL,
  `TIPO_SOBRESEIMIENTO` int(1) NOT NULL,
  `PROCEDENCIA_SOBRESEIMIENTO` int(1) NOT NULL,
  `EXCLUSION_ACCIONP` int(2) NOT NULL,
  `FECHA_SENTENCIA` date NOT NULL,
  `TIPO_SENTENCIA` int(1) NOT NULL,
  `MEDIDA_PRIVATIVA` int(1) NOT NULL,
  `MEDIDA_NOPRIVATIVA` int(2) NOT NULL,
  `TIEMPO_INTERNAMIENTO` int(2) NOT NULL,
  `REPARACION_DANIO` int(1) NOT NULL,
  `TIPO_REPARACION_DANIO` int(1) NOT NULL,
  `MONTO_REPARA` int(2) NOT NULL,
  `IMPUGNACION` int(1) NOT NULL,
  `TIPO_IMPUGNACION` int(2) NOT NULL,
  `FECHA_IMPUGNACION` date NOT NULL,
  `PERSONA_IMPUGNA` int(1) NOT NULL,
  `COMENTARIOS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_dconclusiones_adojc`
--

CREATE TABLE `datos_dconclusiones_adojc` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROCESADO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `DELITO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `TIPO_RESOLUCION` int(2) NOT NULL,
  `TIPO_CONCLUSION_PA` int(1) NOT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_dconclusiones_adojo`
--

CREATE TABLE `datos_dconclusiones_adojo` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVEJO` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROCESADO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `DELITO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `TIPO_SENTENCIA` int(2) NOT NULL,
  `TIPO_CONCLUSION` int(1) NOT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_delitos_adojc`
--

CREATE TABLE `datos_delitos_adojc` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `DELITO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `DELITO_CODIGO_PENAL` int(3) NOT NULL,
  `ART_CODIGO_PENAL` varchar(255) COLLATE utf8_bin NOT NULL,
  `DELITO_NORMA_TECNICA` int(3) NOT NULL,
  `TIPO_FUERO` int(1) NOT NULL,
  `DELITO_RECLASIFICADO` int(1) NOT NULL,
  `FECHA_RECLASIFICACION` date NOT NULL,
  `FECHA_OCURRENCIA` date NOT NULL,
  `SITIO_OCURRENCIA` int(2) NOT NULL,
  `GRADO_CONSUMACION` int(2) NOT NULL,
  `CALIFICACION` int(2) NOT NULL,
  `CLASIFICACION` int(2) NOT NULL,
  `CONCURSO` int(1) NOT NULL,
  `FORMA_COMISION` int(2) NOT NULL,
  `FORMA_ACCION` int(2) NOT NULL,
  `MODALIDAD` int(2) NOT NULL,
  `INSTRUMENTO_COMISION` int(2) NOT NULL,
  `OCURRIO_ENTIDAD` int(2) NOT NULL,
  `OCURRIO_MUNICIPIO` int(5) NOT NULL,
  `NUMERO_PROCESADOS` int(3) NOT NULL,
  `NUMERO_VICTIMAS` int(3) NOT NULL,
  `COMENTARIOS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_delitos_adojc`
--

INSERT INTO `datos_delitos_adojc` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `CAUSA_CLAVE`, `DELITO_CLAVE`, `DELITO_CODIGO_PENAL`, `ART_CODIGO_PENAL`, `DELITO_NORMA_TECNICA`, `TIPO_FUERO`, `DELITO_RECLASIFICADO`, `FECHA_RECLASIFICACION`, `FECHA_OCURRENCIA`, `SITIO_OCURRENCIA`, `GRADO_CONSUMACION`, `CALIFICACION`, `CLASIFICACION`, `CONCURSO`, `FORMA_COMISION`, `FORMA_ACCION`, `MODALIDAD`, `INSTRUMENTO_COMISION`, `OCURRIO_ENTIDAD`, `OCURRIO_MUNICIPIO`, `NUMERO_PROCESADOS`, `NUMERO_VICTIMAS`, `COMENTARIOS`, `ANIO`) VALUES
(9, 9007, 125, '199007125', '1-D199007125', 3, '1', 1, 2, 2, '1899-09-09', '1899-09-09', 3, 2, 1, 3, 2, 2, 2, 3, 2, 1, 1005, 0, 0, '', 2020),
(9, 9007, 125, '199007125', '1-D299007125', 32, '2', 3, 1, 2, '1899-09-09', '1899-09-09', 4, 2, 1, 3, 2, 1, 2, 2, 2, 7, 7012, 0, 0, '', 2020),
(9, 9007, 125, '299007125', '2-D199007125', 51, '10', 4, 2, 2, '1899-09-09', '1899-09-09', 3, 9, 2, 2, 1, 1, 2, 3, 2, 16, 16014, 0, 0, '', 2020),
(9, 9007, 125, '299007125', '2-D299007125', 113, '11', 7, 2, 2, '1899-09-09', '1899-09-09', 4, 2, 1, 1, 1, 2, 1, 3, 2, 16, 16016, 0, 0, '', 2020),
(9, 9007, 125, '299007125', '2-D399007125', 33, '12', 3, 1, 2, '1899-09-09', '1899-09-09', 4, 9, 1, 1, 1, 1, 1, 2, 2, 2, 2002, 0, 0, '', 2020),
(9, 9007, 125, '299007125', '2-D499007125', 110, '13', 7, 1, 1, '1899-09-09', '1899-09-09', 5, 1, 1, 2, 2, 1, 2, 3, 2, 2, 2002, 0, 0, '', 2020),
(9, 9007, 125, '299007125', '2-D599007125', 157, '14', 22, 1, 2, '1899-09-09', '1899-09-09', 3, 1, 2, 1, 2, 1, 1, 2, 3, 4, 4002, 0, 0, '', 2020),
(9, 9007, 125, '299007125', '2-D699007125', 2, '15', 1, 1, 2, '1899-09-09', '1899-09-09', 2, 2, 2, 2, 1, 1, 2, 2, 3, 18, 18015, 0, 0, '', 2020),
(9, 9007, 125, '35599007125', '355-D199007125', 193, '1', 31, 2, 2, '1799-09-09', '1899-09-09', 10, 2, 2, 2, 2, 1, 1, 2, 3, 17, 17012, 0, 0, 'YA PUDE', 2020),
(9, 9007, 125, '35599007125', '355-D299007125', 2, '2', 1, 2, 2, '1799-09-09', '1899-09-09', 2, 1, 1, 2, 2, 2, 2, 2, 2, 17, 17012, 0, 0, 'si se pudo', 2020),
(9, 9007, 125, '35599007125', '355-D499007125', 77, '2', 5, 1, 2, '1799-09-09', '1899-09-09', 10, 2, 2, 2, 2, 2, 2, 2, 3, 17, 17015, 0, 0, '', 2020),
(9, 9007, 125, '35599007125', '355-D599007125', 830, '2', 149, 1, 1, '1899-09-09', '1899-09-09', 8, 1, 1, 2, 2, 2, 1, 3, 4, 17, 17012, 0, 0, 'Vamos a probar algo de comentarios aqui para pobrar el guardado', 2020),
(9, 9007, 125, '599007125', '5-D199007125', 1, '13', 1, 1, 2, '1899-09-09', '1899-09-09', 1, 2, 1, 2, 1, 1, 1, 1, 1, 2, 2001, 0, 0, '', 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_delitos_adojo`
--

CREATE TABLE `datos_delitos_adojo` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVEJC` varchar(255) COLLATE utf8_bin NOT NULL,
  `DELITO_CLAVEJC` varchar(255) COLLATE utf8_bin NOT NULL,
  `CAUSA_CLAVEJO` varchar(255) COLLATE utf8_bin NOT NULL,
  `DELITO_CLAVEJO` varchar(255) COLLATE utf8_bin NOT NULL,
  `DELITO_CODIGO_PENAL` int(3) NOT NULL,
  `ART_CODIGO_PENAL` varchar(255) COLLATE utf8_bin NOT NULL,
  `DELITO_NORMA_TECNICA` int(3) NOT NULL,
  `TIPO_FUERO` int(1) NOT NULL,
  `DELITO_RECLASIFICADO` int(1) NOT NULL,
  `FECHA_RECLASIFICACION` date NOT NULL,
  `FECHA_OCURRENCIA` date NOT NULL,
  `SITIO_OCURRENCIA` int(2) NOT NULL,
  `GRADO_CONSUMACION` int(2) NOT NULL,
  `CALIFICACION` int(2) NOT NULL,
  `CLASIFICACION` int(2) NOT NULL,
  `CONCURSO` int(1) NOT NULL,
  `FORMA_COMISION` int(2) NOT NULL,
  `FORMA_ACCION` int(2) NOT NULL,
  `MODALIDAD` int(2) NOT NULL,
  `INSTRUMENTO_COMISION` int(2) NOT NULL,
  `OCURRIO_ENTIDAD` int(2) NOT NULL,
  `OCURRIO_MUNICIPIO` int(5) NOT NULL,
  `NUMERO_PROCESADOS` int(3) NOT NULL,
  `NUMERO_VICTIMAS` int(3) NOT NULL,
  `COMENTARIOS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_delitos_adojo`
--

INSERT INTO `datos_delitos_adojo` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `CAUSA_CLAVEJC`, `DELITO_CLAVEJC`, `CAUSA_CLAVEJO`, `DELITO_CLAVEJO`, `DELITO_CODIGO_PENAL`, `ART_CODIGO_PENAL`, `DELITO_NORMA_TECNICA`, `TIPO_FUERO`, `DELITO_RECLASIFICADO`, `FECHA_RECLASIFICACION`, `FECHA_OCURRENCIA`, `SITIO_OCURRENCIA`, `GRADO_CONSUMACION`, `CALIFICACION`, `CLASIFICACION`, `CONCURSO`, `FORMA_COMISION`, `FORMA_ACCION`, `MODALIDAD`, `INSTRUMENTO_COMISION`, `OCURRIO_ENTIDAD`, `OCURRIO_MUNICIPIO`, `NUMERO_PROCESADOS`, `NUMERO_VICTIMAS`, `COMENTARIOS`, `ANIO`) VALUES
(9, 9007, 125, '299007125', '2-D299007125', '5o99007125', '5o-D299007125', 113, '11', 7, 2, 2, '1899-09-09', '1899-09-09', 4, 2, 1, 1, 1, 2, 1, 3, 2, 16, 16016, 0, 0, '', 2020),
(9, 9007, 125, '299007125', '2-D499007125', '5o99007125', '5o-D499007125', 193, '13', 31, 1, 1, '1899-09-09', '1899-09-09', 5, 1, 1, 2, 2, 1, 2, 3, 2, 2, 2002, 0, 0, '', 2020),
(9, 9007, 125, '299007125', '2-D599007125', '5o99007125', '5o-D599007125', 157, '14', 22, 1, 2, '1899-09-09', '1899-09-09', 3, 1, 2, 1, 2, 1, 1, 2, 3, 4, 4002, 0, 0, '', 2020),
(9, 9007, 125, '299007125', '2-D699007125', '5o99007125', '5o-D699007125', 2, '15', 1, 1, 2, '1899-09-09', '1899-09-09', 2, 2, 2, 2, 1, 1, 2, 2, 3, 18, 18015, 0, 0, '', 2020),
(9, 9007, 125, '199007125', '1-D199007125', '6O99007125', '6O-D199007125', 3, '1', 1, 2, 2, '1899-09-09', '1899-09-09', 3, 2, 1, 3, 2, 2, 2, 3, 2, 1, 1005, 0, 0, '', 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_dhomicidio_adojc`
--

CREATE TABLE `datos_dhomicidio_adojc` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `DELITO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `CONTEXTO_SITUACIONAL` int(2) NOT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_dhomicidio_adojc`
--

INSERT INTO `datos_dhomicidio_adojc` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `CAUSA_CLAVE`, `DELITO_CLAVE`, `CONTEXTO_SITUACIONAL`, `ANIO`) VALUES
(9, 9007, 125, '199007125', '1-D199007125', 1, 2020),
(9, 9007, 125, '199007125', '1-D199007125', 2, 2020),
(9, 9007, 125, '299007125', '2-D199007125', 1, 2020),
(9, 9007, 125, '299007125', '2-D199007125', 4, 2020),
(9, 9007, 125, '299007125', '2-D199007125', 5, 2020),
(9, 9007, 125, '299007125', '2-D699007125', 4, 2020),
(9, 9007, 125, '299007125', '2-D699007125', 7, 2020),
(9, 9007, 125, '299007125', '2-D699007125', 9, 2020),
(9, 9007, 125, '35599007125', '355-D299007125', 99, 2020),
(9, 9007, 125, '599007125', '5-D199007125', 1, 2020),
(9, 9007, 125, '599007125', '5-D199007125', 2, 2020),
(9, 9007, 125, '599007125', '5-D199007125', 3, 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_dhomicidio_adojo`
--

CREATE TABLE `datos_dhomicidio_adojo` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVEJO` varchar(255) COLLATE utf8_bin NOT NULL,
  `DELITO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `CONTEXTO_SITUACIONAL` int(2) NOT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_dhomicidio_adojo`
--

INSERT INTO `datos_dhomicidio_adojo` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `CAUSA_CLAVEJO`, `DELITO_CLAVE`, `CONTEXTO_SITUACIONAL`, `ANIO`) VALUES
(9, 9007, 125, '5o99007125', '5o-D699007125', 4, 2020),
(9, 9007, 125, '5o99007125', '5o-D699007125', 7, 2020),
(9, 9007, 125, '5o99007125', '5o-D699007125', 9, 2020),
(9, 9007, 125, '6O99007125', '6O-D199007125', 1, 2020),
(9, 9007, 125, '6O99007125', '6O-D199007125', 2, 2020),
(9, 9007, 125, '6O99007125', '6O-D199007125', 3, 2020),
(9, 9007, 125, '6O99007125', '6O-D199007125', 4, 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_drobo_adojc`
--

CREATE TABLE `datos_drobo_adojc` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `DELITO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `TIPO_COSA_ROBADA` int(2) NOT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_drobo_adojc`
--

INSERT INTO `datos_drobo_adojc` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `CAUSA_CLAVE`, `DELITO_CLAVE`, `TIPO_COSA_ROBADA`, `ANIO`) VALUES
(9, 9007, 125, '35599007125', '355-D199007125', 1, 2020),
(9, 9007, 125, '35599007125', '355-D199007125', 2, 2020),
(9, 9007, 125, '35599007125', '355-D199007125', 3, 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_drobo_adojo`
--

CREATE TABLE `datos_drobo_adojo` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVEJO` varchar(255) COLLATE utf8_bin NOT NULL,
  `DELITO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `TIPO_COSA_ROBADA` int(2) NOT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_drobo_adojo`
--

INSERT INTO `datos_drobo_adojo` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `CAUSA_CLAVEJO`, `DELITO_CLAVE`, `TIPO_COSA_ROBADA`, `ANIO`) VALUES
(9, 9007, 125, '5o99007125', '5o-D499007125', 1, 2020),
(9, 9007, 125, '5o99007125', '5o-D499007125', 2, 2020),
(9, 9007, 125, '5o99007125', '5o-D499007125', 3, 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_etapa_inicial_adojc`
--

CREATE TABLE `datos_etapa_inicial_adojc` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROCESADO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `AUDIENCIA_INICIAL` int(1) NOT NULL,
  `CTRL_DETENCION` int(1) NOT NULL,
  `DETENCION_LEGAL` int(1) NOT NULL,
  `FECHA_LIBERTAD` date NOT NULL,
  `FORMULACION_IMPUTACION` int(1) NOT NULL,
  `FECHA_IMPUTACION` date NOT NULL,
  `IMPUTADO_DECLARO` int(1) NOT NULL,
  `FECHA_DECLARACION` date NOT NULL,
  `PLAZO_CONSTITUCIONAL` int(1) NOT NULL,
  `TIEMPO_PLAZO` int(1) NOT NULL,
  `AUTO_VINCULACION` int(1) NOT NULL,
  `FECHA_VINCULACION` date NOT NULL,
  `IMPUSO_MCAUTELARES` int(1) NOT NULL,
  `INVESTIGACION_COMPLEMENTARIA` int(1) NOT NULL,
  `FECHA_PLAZO_INVESTIGACION` date NOT NULL,
  `PRORROGA_PLAZO_CIERRE` int(1) NOT NULL,
  `PLAZO_CIERRE_INVESTIGACION` int(1) NOT NULL,
  `FECHA_CIERRE_INVESTIGACION` date NOT NULL,
  `SOBRESEIMIENTO_CAUSAP` int(1) NOT NULL,
  `SUSPENSION_PROCESO` int(1) NOT NULL,
  `CAUSA_SUSPENSION_PROCESO` int(1) NOT NULL,
  `REAPERTURA_PROCESO` int(1) NOT NULL,
  `FECHA_REAPERTURA_PROCESO` date NOT NULL,
  `SOLICITO_REAPERTURA` int(1) NOT NULL,
  `FORMULO_ACUSACION` int(1) NOT NULL,
  `COMENTARIOS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ANIO` int(4) NOT NULL,
  `ETAPA` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_etapa_inicial_adojc`
--

INSERT INTO `datos_etapa_inicial_adojc` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `CAUSA_CLAVE`, `PROCESADO_CLAVE`, `AUDIENCIA_INICIAL`, `CTRL_DETENCION`, `DETENCION_LEGAL`, `FECHA_LIBERTAD`, `FORMULACION_IMPUTACION`, `FECHA_IMPUTACION`, `IMPUTADO_DECLARO`, `FECHA_DECLARACION`, `PLAZO_CONSTITUCIONAL`, `TIEMPO_PLAZO`, `AUTO_VINCULACION`, `FECHA_VINCULACION`, `IMPUSO_MCAUTELARES`, `INVESTIGACION_COMPLEMENTARIA`, `FECHA_PLAZO_INVESTIGACION`, `PRORROGA_PLAZO_CIERRE`, `PLAZO_CIERRE_INVESTIGACION`, `FECHA_CIERRE_INVESTIGACION`, `SOBRESEIMIENTO_CAUSAP`, `SUSPENSION_PROCESO`, `CAUSA_SUSPENSION_PROCESO`, `REAPERTURA_PROCESO`, `FECHA_REAPERTURA_PROCESO`, `SOLICITO_REAPERTURA`, `FORMULO_ACUSACION`, `COMENTARIOS`, `ANIO`, `ETAPA`) VALUES
(9, 9007, 125, '199007125', '1-P199007125', 2, -2, -2, '1799-09-09', -2, '1799-09-09', -2, '1799-09-09', -2, -2, -2, '1799-09-09', -2, -2, '1799-09-09', -2, -2, '1799-09-09', -2, -2, -2, -2, '1799-09-09', -2, -2, '', 2020, 3),
(9, 9007, 125, '199007125', '1-P299007125', 1, 2, -2, '1799-09-09', 2, '1799-09-09', -2, '1799-09-09', -2, -2, -2, '1799-09-09', -2, -2, '1799-09-09', -2, -2, '1799-09-09', -2, -2, -2, -2, '1799-09-09', -2, -2, '', 2020, 2),
(9, 9007, 125, '299007125', '2-P199007125', 1, 2, -2, '1799-09-09', 2, '1799-09-09', -2, '1799-09-09', -2, -2, -2, '1799-09-09', -2, -2, '1799-09-09', -2, -2, '1799-09-09', -2, -2, -2, -2, '1799-09-09', -2, -2, '', 2020, 2),
(9, 9007, 125, '299007125', '2-P299007125', 1, 1, 1, '1799-09-09', 1, '1899-09-09', 2, '1899-09-09', 2, 1, -2, '1899-09-09', 2, 2, '1799-09-09', -2, -2, '1899-09-09', 1, -2, -2, -2, '1799-09-09', -2, -2, '', 2020, 2),
(9, 9007, 125, '299007125', '2-P399007125', 2, -2, -2, '1799-09-09', -2, '1799-09-09', -2, '1799-09-09', -2, -2, -2, '1799-09-09', -2, -2, '1799-09-09', -2, -2, '1799-09-09', -2, -2, -2, -2, '1799-09-09', -2, -2, '', 2020, 3),
(9, 9007, 125, '299007125', '2-P499007125', 1, 1, 1, '1799-09-09', 1, '1899-09-09', 2, '1899-09-09', 2, 1, -2, '1899-09-09', 2, 1, '1899-09-09', 2, 2, '1899-09-09', 2, 2, -2, -2, '1799-09-09', -2, 1, '', 2020, 1),
(9, 9007, 125, '299007125', '2-P599007125', 2, -2, -2, '1799-09-09', -2, '1799-09-09', -2, '1799-09-09', -2, -2, -2, '1799-09-09', -2, -2, '1799-09-09', -2, -2, '1799-09-09', -2, -2, -2, -2, '1799-09-09', -2, -2, '', 2020, 3),
(9, 9007, 125, '299007125', '2-P699007125', 1, 1, 1, '1799-09-09', 1, '1899-09-09', 1, '1899-09-09', 2, 1, -2, '1899-09-09', 1, 2, '1799-09-09', -2, -2, '1899-09-09', 2, 2, -2, -2, '1799-09-09', -2, 2, '', 2020, 2),
(9, 9007, 125, '35599007125', '355-P199007125', 1, 1, 1, '1799-09-09', 1, '1899-09-09', 2, '1899-09-09', 2, 1, 1, '1899-09-09', 1, 2, '1799-09-09', -2, -2, '1899-09-09', 2, 1, 1, 1, '1899-09-09', 1, 1, '2 actualiza', 2020, 7),
(9, 9007, 125, '35599007125', '355-P399007125', 2, -2, -2, '1799-09-09', -2, '1799-09-09', -2, '1799-09-09', -2, -2, -2, '1799-09-09', -2, -2, '1799-09-09', -2, -2, '1799-09-09', -2, -2, -2, -2, '1799-09-09', -2, -2, '', 2020, 3),
(9, 9007, 125, '35599007125', '355-P599007125', 1, 2, -2, '1799-09-09', 2, '1799-09-09', -2, '1799-09-09', -2, -2, -2, '1799-09-09', -2, -2, '1799-09-09', -2, -2, '1799-09-09', -2, -2, -2, -2, '1799-09-09', -2, -2, '', 2020, 3),
(9, 9007, 125, '599007125', '5-P199007125', -2, -2, -2, '1899-09-09', -2, '1899-09-09', -2, '1899-09-09', -2, -2, -2, '1899-09-09', -2, -2, '1899-09-09', -2, -2, '1899-09-09', -2, -2, -2, -2, '1899-09-09', -2, -2, '', 2020, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_etapa_intermedia_adojc`
--

CREATE TABLE `datos_etapa_intermedia_adojc` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROCESADO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `FECHA_ESCRITO_ACUSACION` date NOT NULL,
  `FECHA_CONTESTACION` date NOT NULL,
  `DESCUBRIMIENTO_PROBATORIO` int(1) NOT NULL,
  `AUDIENCIA_INTERMEDIA` int(1) NOT NULL,
  `FECHA_AUDIENCIA_INTERMEDIA` date NOT NULL,
  `SEPARACION_ACUSACION` int(1) NOT NULL,
  `PRESENTACION_MPRUEBA` int(1) NOT NULL,
  `PRESENTA_MP_MINISTERIO` int(1) NOT NULL,
  `PRESENTA_MP_ASESOR` int(1) NOT NULL,
  `PRESENTA_MP_DEFENSA` int(1) NOT NULL,
  `ACUERDOS_PROBATORIOS` int(1) NOT NULL,
  `APERTURA_JUICIO_ORAL` int(1) NOT NULL,
  `COMENTARIOS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_etapa_intermedia_adojc`
--

INSERT INTO `datos_etapa_intermedia_adojc` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `CAUSA_CLAVE`, `PROCESADO_CLAVE`, `FECHA_ESCRITO_ACUSACION`, `FECHA_CONTESTACION`, `DESCUBRIMIENTO_PROBATORIO`, `AUDIENCIA_INTERMEDIA`, `FECHA_AUDIENCIA_INTERMEDIA`, `SEPARACION_ACUSACION`, `PRESENTACION_MPRUEBA`, `PRESENTA_MP_MINISTERIO`, `PRESENTA_MP_ASESOR`, `PRESENTA_MP_DEFENSA`, `ACUERDOS_PROBATORIOS`, `APERTURA_JUICIO_ORAL`, `COMENTARIOS`, `ANIO`) VALUES
(9, 9007, 125, '35599007125', '355-P199007125', '1899-09-09', '1899-09-09', 2, 2, '1899-09-09', -2, -2, -2, -2, -2, -2, -2, '', 2020),
(9, 9007, 125, '35599007125', '355-P399007125', '1899-09-09', '1899-09-09', 1, 1, '1899-09-09', 2, 2, -2, -2, -2, 2, 1, '', 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_etapa_oral_adojo`
--

CREATE TABLE `datos_etapa_oral_adojo` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVEJO` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROCESADO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `FECHA_APERTURA_JUICIOORAL` date NOT NULL,
  `FECHA_AUDIENCIA_JUICIO` date NOT NULL,
  `MEDIDAS_DISCIPLINARIAS` int(1) NOT NULL,
  `TIPO_DISCIPLINARIA` int(1) NOT NULL,
  `INCIDENTES_AUDIENCIA` int(1) NOT NULL,
  `FECHA_RESOLUCION_INCIDENTE` date NOT NULL,
  `PROMUEVE_INCIDENTE` int(1) NOT NULL,
  `PD_TESTIMONIAL` int(1) NOT NULL,
  `PD_PERICIAL` int(1) NOT NULL,
  `PD_DECLARACION_ACUSADO` int(1) NOT NULL,
  `PD_DOCUMENTAL_MATERIAL` int(1) NOT NULL,
  `PD_OTRA_PRUEBA` int(1) NOT NULL,
  `SUSPENCION_AUDIENCIA` int(1) NOT NULL,
  `FECHA_SUSPENCION` date NOT NULL,
  `FECHA_REANUDACION` date NOT NULL,
  `DELIBERACION` int(1) NOT NULL,
  `FECHA_DELIBERACION` date NOT NULL,
  `SENTIDO_FALLO` int(1) NOT NULL,
  `COMENTARIOS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ANIO` int(4) NOT NULL,
  `ETAPA` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_etapa_oral_adojo`
--

INSERT INTO `datos_etapa_oral_adojo` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `CAUSA_CLAVEJO`, `PROCESADO_CLAVE`, `FECHA_APERTURA_JUICIOORAL`, `FECHA_AUDIENCIA_JUICIO`, `MEDIDAS_DISCIPLINARIAS`, `TIPO_DISCIPLINARIA`, `INCIDENTES_AUDIENCIA`, `FECHA_RESOLUCION_INCIDENTE`, `PROMUEVE_INCIDENTE`, `PD_TESTIMONIAL`, `PD_PERICIAL`, `PD_DECLARACION_ACUSADO`, `PD_DOCUMENTAL_MATERIAL`, `PD_OTRA_PRUEBA`, `SUSPENCION_AUDIENCIA`, `FECHA_SUSPENCION`, `FECHA_REANUDACION`, `DELIBERACION`, `FECHA_DELIBERACION`, `SENTIDO_FALLO`, `COMENTARIOS`, `ANIO`, `ETAPA`) VALUES
(9, 9007, 125, '6O99007125', '6O-P299007125', '1899-09-09', '1899-09-09', 1, 2, 2, '1799-09-09', -2, 2, 2, 2, 2, 9, 2, '1799-09-09', '1799-09-09', 2, '1799-09-09', -2, '', 2020, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_informe_adojc`
--

CREATE TABLE `datos_informe_adojc` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `JUZGADO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `CAUSAS_PENALES_INGRESADAS` int(5) NOT NULL,
  `MEDIDAS_PROTECCION_ASIG` int(5) NOT NULL,
  `PROVIDENCIAS_PRECAUTORIAS` int(5) NOT NULL,
  `PRUEBA_ANTICIPADA` int(5) NOT NULL,
  `ORDENES_JUDICIALES` int(5) NOT NULL,
  `ACTOS_INVESTIGA` int(5) NOT NULL,
  `IMPUGNACION_MP` int(5) NOT NULL,
  `OTROS` int(5) NOT NULL,
  `CAUSAS_TRAMITE` int(5) NOT NULL,
  `CAUSAS_BAJAS` int(5) NOT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Información general de los asuntos conocidos por el Órgano j';

--
-- Volcado de datos para la tabla `datos_informe_adojc`
--

INSERT INTO `datos_informe_adojc` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `JUZGADO_CLAVE`, `CAUSAS_PENALES_INGRESADAS`, `MEDIDAS_PROTECCION_ASIG`, `PROVIDENCIAS_PRECAUTORIAS`, `PRUEBA_ANTICIPADA`, `ORDENES_JUDICIALES`, `ACTOS_INVESTIGA`, `IMPUGNACION_MP`, `OTROS`, `CAUSAS_TRAMITE`, `CAUSAS_BAJAS`, `ANIO`) VALUES
(9, 9007, 125, '9-9007-125', -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_jueces_adojc`
--

CREATE TABLE `datos_jueces_adojc` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `JUZGADO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `JUEZ_CLAVE` int(2) NOT NULL,
  `NOMBRE_JUEZ` varchar(255) COLLATE utf8_bin NOT NULL,
  `APELLIDOP_JUEZ` varchar(50) COLLATE utf8_bin NOT NULL,
  `APELLIDOM_JUEZ` varchar(50) COLLATE utf8_bin NOT NULL,
  `FECHA_GESTION` date NOT NULL,
  `SEXO` int(1) NOT NULL,
  `EDAD` int(2) NOT NULL,
  `GRADO_ESTUDIOS` int(2) NOT NULL,
  `FUNCION_DESEMPENA` int(2) NOT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Jueces/zas adscritas al Órgano jurisdiccional especializado ';

--
-- Volcado de datos para la tabla `datos_jueces_adojc`
--

INSERT INTO `datos_jueces_adojc` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `JUZGADO_CLAVE`, `JUEZ_CLAVE`, `NOMBRE_JUEZ`, `APELLIDOP_JUEZ`, `APELLIDOM_JUEZ`, `FECHA_GESTION`, `SEXO`, `EDAD`, `GRADO_ESTUDIOS`, `FUNCION_DESEMPENA`, `ANIO`) VALUES
(9, 9007, 125, '9-9007-125', -2, '-2', '-2', '-2', '1899-09-09', -2, -2, -2, -2, -2),
(9, 9007, 125, '9-9007-125', 1, 'MANUEL', 'TREVIÑO', 'MARTINEZ', '1987-04-05', 1, 56, 3, 3, 2020),
(9, 9007, 125, '9-9007-125', 2, 'FERMIN', 'GOMEZ', 'ALVARADO', '2018-04-08', 1, 32, 3, 3, 2020),
(9, 9007, 125, '9-9007-125', 3, 'PATRICIA', 'MENDOZA', 'FLORES', '2015-11-30', 2, 33, 4, 1, 2020),
(9, 9007, 125, '9-9007-125', 4, 'CECILIA', 'PINEDA', 'ANGELES', '2013-02-27', 2, 37, 1, 1, 2020),
(9, 9007, 125, '9-9007-125', 5, 'DIEGO FRANCISCO', 'DEL ANGEL', 'VILLANUEVA', '1899-09-09', 1, 45, 2, 2, 2020),
(9, 9007, 125, '9-9007-125', 6, 'SERGIO AGUSITIN', 'FERNANDEZ', 'TORREZ', '1899-09-09', 1, 58, 4, 2, 2020),
(9, 9007, 125, '9-9007-125', 7, 'GISELA GUADALUPE', 'OLIVERA', 'VELAZQUEZ', '1899-09-09', 2, 35, 1, 1, 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_juzgados_adojc`
--

CREATE TABLE `datos_juzgados_adojc` (
  `JUZGADO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `JUZGADO_NOMBRE` varchar(255) COLLATE utf8_bin NOT NULL,
  `JUZGADO_NUMERO` int(3) NOT NULL,
  `JUZGADO_JURISDICCION` int(2) NOT NULL,
  `JUZGADO_FUNCION` int(2) NOT NULL,
  `LADATEL` varchar(10) COLLATE utf8_bin NOT NULL,
  `CORREO` varchar(65) COLLATE utf8_bin NOT NULL,
  `ENTIDAD` int(2) NOT NULL,
  `MUNICIPIO` int(5) NOT NULL,
  `FORMA_DIVISION` int(1) NOT NULL,
  `NOMBRE_REGION_JUDICIAL` varchar(255) COLLATE utf8_bin NOT NULL,
  `NOMBRE_DISTRITO_JUDICIAL` varchar(255) COLLATE utf8_bin NOT NULL,
  `NOMBRE_PARTIDO_JUDICIAL` varchar(255) COLLATE utf8_bin NOT NULL,
  `TIPO_VIALIDAD` int(2) NOT NULL,
  `NOMBRE_VIALIDAD` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASENTAMIENTO_HUMANO` int(2) NOT NULL,
  `NOMBRE_ASENTAMIENTO` varchar(255) COLLATE utf8_bin NOT NULL,
  `NUMERO_EXT` int(4) NOT NULL,
  `NUMERO_INT` int(4) NOT NULL,
  `CODIGO_POSTAL` int(5) NOT NULL,
  `NOMBRE_CAP` varchar(100) COLLATE utf8_bin NOT NULL,
  `APELLIDOP_CAP` varchar(255) COLLATE utf8_bin NOT NULL,
  `APELLIDOM_CAP` varchar(100) COLLATE utf8_bin NOT NULL,
  `CARGO_CAP` varchar(100) COLLATE utf8_bin NOT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_juzgados_adojc`
--

INSERT INTO `datos_juzgados_adojc` (`JUZGADO_CLAVE`, `JUZGADO_NOMBRE`, `JUZGADO_NUMERO`, `JUZGADO_JURISDICCION`, `JUZGADO_FUNCION`, `LADATEL`, `CORREO`, `ENTIDAD`, `MUNICIPIO`, `FORMA_DIVISION`, `NOMBRE_REGION_JUDICIAL`, `NOMBRE_DISTRITO_JUDICIAL`, `NOMBRE_PARTIDO_JUDICIAL`, `TIPO_VIALIDAD`, `NOMBRE_VIALIDAD`, `ASENTAMIENTO_HUMANO`, `NOMBRE_ASENTAMIENTO`, `NUMERO_EXT`, `NUMERO_INT`, `CODIGO_POSTAL`, `NOMBRE_CAP`, `APELLIDOP_CAP`, `APELLIDOM_CAP`, `CARGO_CAP`, `ANIO`) VALUES
('9-9007-125', 'CASOS', 125, 1, 3, '5554789632', 'CASOS@MAIL.COM', 9, 9007, 4, '-2', '-2', '-2', 17, 'ORIENTE', 3, 'AZTAHUACAN', 89, 12, 12345, 'ROBERTO', 'SACARIAS', 'BLANCO', 'DIRECTOR', 2019);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_pdelitos_adojc`
--

CREATE TABLE `datos_pdelitos_adojc` (
  `JUZGADO_ENTIDAD_ID` int(2) DEFAULT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) DEFAULT NULL,
  `JUZGADO_NUMERO_ID` int(3) DEFAULT NULL,
  `CAUSA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROCESADO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `DELITO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `NUMERO_VICTIMAS` int(2) NOT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_pdelitos_adojc`
--

INSERT INTO `datos_pdelitos_adojc` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `CAUSA_CLAVE`, `PROCESADO_CLAVE`, `DELITO_CLAVE`, `NUMERO_VICTIMAS`, `ANIO`) VALUES
(9, 9007, 125, '199007125', '1-P199007125', '1-D299007125', 1, 2020),
(9, 9007, 125, '199007125', '1-P299007125', '1-D199007125', 1, 2020),
(9, 9007, 125, '299007125', '2-P199007125', '2-D299007125', 2, 2020),
(9, 9007, 125, '299007125', '2-P199007125', '2-D499007125', 2, 2020),
(9, 9007, 125, '299007125', '2-P199007125', '2-D599007125', 4, 2020),
(9, 9007, 125, '299007125', '2-P299007125', '2-D199007125', 3, 2020),
(9, 9007, 125, '299007125', '2-P299007125', '2-D599007125', 2, 2020),
(9, 9007, 125, '299007125', '2-P299007125', '2-D699007125', 3, 2020),
(9, 9007, 125, '299007125', '2-P399007125', '2-D199007125', 2, 2020),
(9, 9007, 125, '299007125', '2-P399007125', '2-D299007125', 1, 2020),
(9, 9007, 125, '299007125', '2-P399007125', '2-D699007125', 5, 2020),
(9, 9007, 125, '299007125', '2-P499007125', '2-D199007125', 1, 2020),
(9, 9007, 125, '299007125', '2-P499007125', '2-D299007125', 4, 2020),
(9, 9007, 125, '299007125', '2-P499007125', '2-D499007125', 1, 2020),
(9, 9007, 125, '299007125', '2-P599007125', '2-D199007125', 1, 2020),
(9, 9007, 125, '299007125', '2-P599007125', '2-D399007125', 5, 2020),
(9, 9007, 125, '299007125', '2-P699007125', '2-D599007125', 4, 2020),
(9, 9007, 125, '299007125', '2-P699007125', '2-D699007125', 2, 2020),
(9, 9007, 125, '35599007125', '355-P199007125', '355-D199007125', 3, 2020),
(9, 9007, 125, '35599007125', '355-P199007125', '355-D299007125', 1, 2020),
(9, 9007, 125, '35599007125', '355-P199007125', '355-D499007125', 3, 2020),
(9, 9007, 125, '35599007125', '355-P199007125', '355-D599007125', 5, 2020),
(9, 9007, 125, '35599007125', '355-P399007125', '355-D199007125', 3, 2020),
(9, 9007, 125, '35599007125', '355-P399007125', '355-D299007125', 3, 2020),
(9, 9007, 125, '35599007125', '355-P399007125', '355-D499007125', 3, 2020),
(9, 9007, 125, '35599007125', '355-P399007125', '355-D599007125', 3, 2020),
(9, 9007, 125, '35599007125', '355-P599007125', '355-D199007125', 1, 2020),
(9, 9007, 125, '35599007125', '355-P599007125', '355-D299007125', 1, 2020),
(9, 9007, 125, '35599007125', '355-P599007125', '355-D499007125', 1, 2020),
(9, 9007, 125, '35599007125', '355-P599007125', '355-D599007125', 1, 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_pdelitos_adojo`
--

CREATE TABLE `datos_pdelitos_adojo` (
  `JUZGADO_ENTIDAD_ID` int(2) DEFAULT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) DEFAULT NULL,
  `JUZGADO_NUMERO_ID` int(3) DEFAULT NULL,
  `CAUSA_CLAVEJO` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROCESADO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `DELITO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `NUMERO_VICTIMAS` int(2) NOT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_pdelitos_adojo`
--

INSERT INTO `datos_pdelitos_adojo` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `CAUSA_CLAVEJO`, `PROCESADO_CLAVE`, `DELITO_CLAVE`, `NUMERO_VICTIMAS`, `ANIO`) VALUES
(9, 9007, 125, '5o99007125', '5o-P199007125', '5o-D299007125', 2, 2020),
(9, 9007, 125, '5o99007125', '5o-P199007125', '5o-D499007125', 2, 2020),
(9, 9007, 125, '5o99007125', '5o-P199007125', '5o-D599007125', 4, 2020),
(9, 9007, 125, '6O99007125', '6O-P299007125', '6O-D199007125', 2, 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_pfuente_ingresos_adojc`
--

CREATE TABLE `datos_pfuente_ingresos_adojc` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROCESADO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `INGRESO` int(1) NOT NULL,
  `ANIO` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_pfuente_ingresos_adojc`
--

INSERT INTO `datos_pfuente_ingresos_adojc` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `CAUSA_CLAVE`, `PROCESADO_CLAVE`, `INGRESO`, `ANIO`) VALUES
(9, 9007, 125, '35599007125', '355-P199007125', 1, 2020),
(9, 9007, 125, '35599007125', '355-P199007125', 6, 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_pfuente_ingresos_adojo`
--

CREATE TABLE `datos_pfuente_ingresos_adojo` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVEJO` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROCESADO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `INGRESO` int(1) NOT NULL,
  `ANIO` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_pmedidas_adojc`
--

CREATE TABLE `datos_pmedidas_adojc` (
  `JUZGADO_ENTIDAD_ID` int(2) DEFAULT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) DEFAULT NULL,
  `JUZGADO_NUMERO_ID` int(3) DEFAULT NULL,
  `CAUSA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROCESADO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `SOLICITA_MEDIDA` int(1) NOT NULL,
  `CAUTELARES` int(2) NOT NULL,
  `DURACION_MEDIDA` int(1) NOT NULL,
  `ESPECIFIQUE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_pmedidas_adojc`
--

INSERT INTO `datos_pmedidas_adojc` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `CAUSA_CLAVE`, `PROCESADO_CLAVE`, `SOLICITA_MEDIDA`, `CAUTELARES`, `DURACION_MEDIDA`, `ESPECIFIQUE`, `ANIO`) VALUES
(9, 9007, 125, '299007125', '2-P699007125', 2, 3, 2, '-2', 2020),
(9, 9007, 125, '35599007125', '355-P199007125', 1, 1, 1, '-2', 2020),
(9, 9007, 125, '35599007125', '355-P199007125', 3, 1, 1, '-2', 2020),
(9, 9007, 125, '35599007125', '355-P199007125', 4, 1, 4, '-2', 2020),
(9, 9007, 125, '35599007125', '355-P199007125', 1, 6, 3, '-2', 2020),
(9, 9007, 125, '35599007125', '355-P199007125', 4, 6, 4, '-2', 2020),
(9, 9007, 125, '35599007125', '355-P199007125', 3, 7, 1, '-2', 2020),
(9, 9007, 125, '35599007125', '355-P199007125', 3, 8, 9, '-2', 2020),
(9, 9007, 125, '35599007125', '355-P199007125', 1, 9, 5, '-2', 2020),
(9, 9007, 125, '35599007125', '355-P199007125', 4, 9, 3, '-2', 2020),
(9, 9007, 125, '35599007125', '355-P199007125', 3, 10, 2, '-2', 2020),
(9, 9007, 125, '35599007125', '355-P199007125', 1, 13, 1, 'lalo luna', 2020),
(9, 9007, 125, '35599007125', '355-P199007125', 3, 13, 2, 'lolita', 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_presenta_mp_adojc`
--

CREATE TABLE `datos_presenta_mp_adojc` (
  `JUZGADO_ENTIDAD_ID` int(2) DEFAULT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) DEFAULT NULL,
  `JUZGADO_NUMERO_ID` int(3) DEFAULT NULL,
  `CAUSA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROCESADO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `FIGURA_MPRUEBA` int(1) NOT NULL,
  `MEDIO_PRUEBA_ID` int(1) NOT NULL,
  `ANIO` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_procesados_adojc`
--

CREATE TABLE `datos_procesados_adojc` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROCESADO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `NOMBRE` varchar(255) COLLATE utf8_bin NOT NULL,
  `A_PATERNO` varchar(255) COLLATE utf8_bin NOT NULL,
  `A_MATERNO` varchar(255) COLLATE utf8_bin NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8_bin NOT NULL,
  `CURP` varchar(18) COLLATE utf8_bin NOT NULL,
  `FECHA_NACIMIENTO` date NOT NULL,
  `SEXO` int(1) NOT NULL,
  `EDAD` int(2) NOT NULL,
  `NACIMIENTO_PAIS` int(2) NOT NULL,
  `NACIMIENTO_ENTIDAD` int(2) NOT NULL,
  `NACIMIENTO_MUNICIPIO` int(5) NOT NULL,
  `NACIONALIDAD` int(2) NOT NULL,
  `RESIDENCIA_PAIS` int(2) NOT NULL,
  `RESIDENCIA_ENTIDAD` int(2) NOT NULL,
  `RESIDENCIA_MUNICIPIO` int(5) NOT NULL,
  `ESTADO_CIVIL` int(2) NOT NULL,
  `DISCAPACIDAD` int(2) NOT NULL,
  `CONDICION_ALFABETISMO` int(2) NOT NULL,
  `ULTIMO_GRADO_ESTUDIOS` int(2) NOT NULL,
  `CONDICION_ESTUDIANTE` int(1) NOT NULL,
  `HABLA_ESPANOL` int(2) NOT NULL,
  `POBLACION_INDIGENA` int(1) NOT NULL,
  `TIPO_PUEBLO_INDIGENA` int(2) NOT NULL,
  `HABLA_INDIGENA` int(2) NOT NULL,
  `FAMILIA_LINGUISTICA` int(2) NOT NULL,
  `LENGUA_EXTRANJERA` int(1) NOT NULL,
  `INTERPRETE` int(2) NOT NULL,
  `INGRESOS` int(2) NOT NULL,
  `RANGO_INGRESOS` int(1) NOT NULL,
  `OCUPACION` int(2) NOT NULL,
  `CONDICION_ACTIVIDAD` int(2) NOT NULL,
  `INICIO_IMPUTADO` int(2) NOT NULL,
  `TIPO_DETENCION` int(2) NOT NULL,
  `FORMA_CONDUCCION` int(1) NOT NULL,
  `GRADO_PARTICIPACION` int(2) NOT NULL,
  `REINCIDENCIA` int(2) NOT NULL,
  `ESTADO_PSICOFISICO` int(1) NOT NULL,
  `DELICTIVO` int(2) NOT NULL,
  `GRUPO_DELICTIVO` varchar(255) COLLATE utf8_bin NOT NULL,
  `TIPO_DEFENSOR` int(2) NOT NULL,
  `PERSONA_RESPONSABLE` int(2) NOT NULL,
  `COMENTARIOS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_procesados_adojc`
--

INSERT INTO `datos_procesados_adojc` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `CAUSA_CLAVE`, `PROCESADO_CLAVE`, `NOMBRE`, `A_PATERNO`, `A_MATERNO`, `ALIAS`, `CURP`, `FECHA_NACIMIENTO`, `SEXO`, `EDAD`, `NACIMIENTO_PAIS`, `NACIMIENTO_ENTIDAD`, `NACIMIENTO_MUNICIPIO`, `NACIONALIDAD`, `RESIDENCIA_PAIS`, `RESIDENCIA_ENTIDAD`, `RESIDENCIA_MUNICIPIO`, `ESTADO_CIVIL`, `DISCAPACIDAD`, `CONDICION_ALFABETISMO`, `ULTIMO_GRADO_ESTUDIOS`, `CONDICION_ESTUDIANTE`, `HABLA_ESPANOL`, `POBLACION_INDIGENA`, `TIPO_PUEBLO_INDIGENA`, `HABLA_INDIGENA`, `FAMILIA_LINGUISTICA`, `LENGUA_EXTRANJERA`, `INTERPRETE`, `INGRESOS`, `RANGO_INGRESOS`, `OCUPACION`, `CONDICION_ACTIVIDAD`, `INICIO_IMPUTADO`, `TIPO_DETENCION`, `FORMA_CONDUCCION`, `GRADO_PARTICIPACION`, `REINCIDENCIA`, `ESTADO_PSICOFISICO`, `DELICTIVO`, `GRUPO_DELICTIVO`, `TIPO_DEFENSOR`, `PERSONA_RESPONSABLE`, `COMENTARIOS`, `ANIO`) VALUES
(9, 9007, 125, '199007125', '1-P199007125', 'MANUEL', 'ISLAS', 'PEREZ', 'EL GUAPO', 'SADRHDFRMJUDKIE01E', '1899-09-09', 1, 13, 11, -2, -2, 9, 11, -2, -2, 2, 1, 1, 2, 1, 2, 2, -2, 2, -2, 2, 2, 2, -2, 5, -2, 1, 2, -2, 1, 3, 2, 2, '-2', 2, 4, '', 2020),
(9, 9007, 125, '199007125', '1-P299007125', 'RICARDO', 'LOPEZ', 'SALAS', 'EL CHOLO', 'DOIUSJUOIOEMMDNSJU', '1899-09-09', 2, 14, 3, -2, -2, 12, 12, -2, -2, 4, 2, 1, 2, 2, 2, 2, -2, 2, -2, 2, 2, 2, -2, 4, -2, 1, 2, -2, 3, 1, 3, 2, '-2', 2, 3, '', 2020),
(9, 9007, 125, '299007125', '2-P199007125', 'JORGE', 'MAGAÑA', 'CASTE', 'EL ABUELO', 'JSUYETGSJASKAUIEJJ', '1899-09-09', 1, 15, 8, -2, -2, 6, 10, -2, -2, 2, 2, 1, 2, 2, 2, 2, -2, 2, -2, 2, 1, 2, -2, 5, -2, 2, -2, 1, 3, 3, 3, 2, '-2', 2, 2, '', 2020),
(9, 9007, 125, '299007125', '2-P299007125', 'JORGE ', 'RUEL', 'HERNANDEZ', 'EL CHOPO', 'LSLSLSLSLSLSLSLSLS', '1899-09-09', 1, 17, 8, -2, -2, 11, 3, -2, -2, 3, 2, 2, 2, 2, 2, 9, -2, 2, -2, 1, 2, 2, -2, 4, -2, 2, -2, 1, 3, 2, 1, 2, '-2', 2, 2, '', 2020),
(9, 9007, 125, '299007125', '2-P399007125', 'MANUEL', 'LOPEZ', 'PEREZ', 'EL GUAPO', 'SADRHDFRMJUDKIE01E', '1899-09-09', 2, 15, 12, -2, -2, 14, 8, -2, -2, 6, 2, 1, 3, 2, 2, 2, -2, 2, -2, 1, 2, 2, -2, 5, -2, 2, -2, 2, 3, 2, 2, 1, 'null', 2, 2, '', 2020),
(9, 9007, 125, '299007125', '2-P499007125', 'RICARDO', 'ISLAS', 'SALAS', 'EL CANIJO', 'SASSASASASASASASAS', '1899-09-09', 2, 15, 12, -2, -2, 10, 6, -2, -2, 4, 2, 2, 3, 1, 2, 2, -2, 2, -2, 2, 1, 2, -2, 7, -2, 1, 2, -2, 3, 1, 2, 2, '-2', 2, 3, '', 2020),
(9, 9007, 125, '299007125', '2-P599007125', 'FERNANDO', 'SANCHEZ ', 'VELADOR', 'EL CHOLO', 'SADRHDFRMJUDKIE01E', '1899-09-09', 1, 14, 14, -2, -2, 14, 14, -2, -2, 3, 2, 1, 2, 1, 1, 2, -2, 1, 11, 1, 2, 2, -2, 2, -2, 2, -2, 2, 3, 3, 2, 2, '-2', 2, 3, '', 2020),
(9, 9007, 125, '299007125', '2-P699007125', 'ANABEL', 'PEREZ', 'CRUZ', 'LA REINA', 'DOIUSJUOIOEMMDNSJU', '1899-09-09', 2, 12, 7, -2, -2, 7, 13, -2, -2, 3, 1, 2, 2, 2, 2, 2, -2, 2, -2, 2, 2, 2, -2, 2, -2, 1, 1, -2, 3, 2, 2, 2, '-2', 3, 2, '', 2020),
(9, 9007, 125, '35599007125', '355-P199007125', 'MANUEL', 'ISLAS', 'SALAS', 'EL GUAPO', 'SADRHDFRMJUDKIE01E', '1978-06-06', 1, 16, 1, 4, 4004, 5, 1, 17, 17015, 2, 2, 1, 3, 2, 1, 1, 13, 1, 3, 2, 2, 1, 2, 10, 3, 1, 1, -2, 2, 1, 3, 1, 'la manitas', 1, 2, '', 2020),
(9, 9007, 125, '35599007125', '355-P399007125', 'JORGE', 'MAGAÑA', 'CASTE', 'EL ABUELO', 'jsuyetgsjaskauiejj', '1899-09-09', 2, 13, 17, -2, -2, 13, 14, -2, -2, 6, 2, 2, 4, 9, 1, 2, -2, 2, -2, 2, 2, 2, -2, 5, -2, 1, 2, -2, 5, 2, 2, 2, '-2', 2, 2, '', 2020),
(9, 9007, 125, '35599007125', '355-P599007125', 'FERNANDO', 'SANCHEZ ', 'VELADOR', 'EL CANIJO', 'mais880808hdfwdert', '1899-09-09', 2, 15, 16, -2, -2, 18, 15, -2, -2, 3, 2, 1, 3, 2, 2, 2, -2, 2, -2, 1, 2, 2, -2, 7, -2, 2, -2, 2, 5, 3, 2, 1, 'la manitas', 1, 5, '', 2020),
(9, 9007, 125, '599007125', '5-P199007125', '-2', '-2', '-2', '-2', '-2', '1899-09-09', -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, '-2', -2, -2, '', 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_procesados_adojo`
--

CREATE TABLE `datos_procesados_adojo` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVEJC` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROCESADO_CLAVEJC` varchar(255) COLLATE utf8_bin NOT NULL,
  `CAUSA_CLAVEJO` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROCESADO_CLAVEJO` varchar(255) COLLATE utf8_bin NOT NULL,
  `NOMBRE` varchar(255) COLLATE utf8_bin NOT NULL,
  `A_PATERNO` varchar(255) COLLATE utf8_bin NOT NULL,
  `A_MATERNO` varchar(255) COLLATE utf8_bin NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8_bin NOT NULL,
  `CURP` varchar(18) COLLATE utf8_bin NOT NULL,
  `FECHA_NACIMIENTO` date NOT NULL,
  `SEXO` int(1) NOT NULL,
  `EDAD` int(2) NOT NULL,
  `NACIMIENTO_PAIS` int(2) NOT NULL,
  `NACIMIENTO_ENTIDAD` int(2) NOT NULL,
  `NACIMIENTO_MUNICIPIO` int(5) NOT NULL,
  `NACIONALIDAD` int(2) NOT NULL,
  `RESIDENCIA_PAIS` int(2) NOT NULL,
  `RESIDENCIA_ENTIDAD` int(2) NOT NULL,
  `RESIDENCIA_MUNICIPIO` int(5) NOT NULL,
  `ESTADO_CIVIL` int(2) NOT NULL,
  `DISCAPACIDAD` int(2) NOT NULL,
  `CONDICION_ALFABETISMO` int(2) NOT NULL,
  `ULTIMO_GRADO_ESTUDIOS` int(2) NOT NULL,
  `CONDICION_ESTUDIANTE` int(1) NOT NULL,
  `HABLA_ESPANOL` int(2) NOT NULL,
  `POBLACION_INDIGENA` int(1) NOT NULL,
  `TIPO_PUEBLO_INDIGENA` int(2) NOT NULL,
  `HABLA_INDIGENA` int(2) NOT NULL,
  `FAMILIA_LINGUISTICA` int(2) NOT NULL,
  `LENGUA_EXTRANJERA` int(1) NOT NULL,
  `INTERPRETE` int(2) NOT NULL,
  `INGRESOS` int(2) NOT NULL,
  `RANGO_INGRESOS` int(1) NOT NULL,
  `OCUPACION` int(2) NOT NULL,
  `CONDICION_ACTIVIDAD` int(2) NOT NULL,
  `GRADO_PARTICIPACION` int(2) NOT NULL,
  `REINCIDENCIA` int(2) NOT NULL,
  `ESTADO_PSICOFISICO` int(1) NOT NULL,
  `DELICTIVO` int(2) NOT NULL,
  `GRUPO_DELICTIVO` varchar(255) COLLATE utf8_bin NOT NULL,
  `TIPO_DEFENSOR` int(2) NOT NULL,
  `PERSONA_RESPONSABLE` int(2) NOT NULL,
  `COMENTARIOS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_procesados_adojo`
--

INSERT INTO `datos_procesados_adojo` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `CAUSA_CLAVEJC`, `PROCESADO_CLAVEJC`, `CAUSA_CLAVEJO`, `PROCESADO_CLAVEJO`, `NOMBRE`, `A_PATERNO`, `A_MATERNO`, `ALIAS`, `CURP`, `FECHA_NACIMIENTO`, `SEXO`, `EDAD`, `NACIMIENTO_PAIS`, `NACIMIENTO_ENTIDAD`, `NACIMIENTO_MUNICIPIO`, `NACIONALIDAD`, `RESIDENCIA_PAIS`, `RESIDENCIA_ENTIDAD`, `RESIDENCIA_MUNICIPIO`, `ESTADO_CIVIL`, `DISCAPACIDAD`, `CONDICION_ALFABETISMO`, `ULTIMO_GRADO_ESTUDIOS`, `CONDICION_ESTUDIANTE`, `HABLA_ESPANOL`, `POBLACION_INDIGENA`, `TIPO_PUEBLO_INDIGENA`, `HABLA_INDIGENA`, `FAMILIA_LINGUISTICA`, `LENGUA_EXTRANJERA`, `INTERPRETE`, `INGRESOS`, `RANGO_INGRESOS`, `OCUPACION`, `CONDICION_ACTIVIDAD`, `GRADO_PARTICIPACION`, `REINCIDENCIA`, `ESTADO_PSICOFISICO`, `DELICTIVO`, `GRUPO_DELICTIVO`, `TIPO_DEFENSOR`, `PERSONA_RESPONSABLE`, `COMENTARIOS`, `ANIO`) VALUES
(9, 9007, 125, '299007125', '2-P199007125', '5o99007125', '5o-P199007125', 'JORGE', 'MAGAÑA', 'CASTE', 'EL ABUELO', 'JSUYETGSJASKAUIEJJ', '1899-09-09', 1, 15, 8, -2, -2, 6, 10, -2, -2, 2, 2, 1, 2, 2, 2, 2, -2, 2, -2, 2, 1, 2, -2, 5, -2, 3, 3, 3, 2, '-2', 2, 2, '', 2020),
(9, 9007, 125, '199007125', '1-P299007125', '6O99007125', '6O-P299007125', 'RICARDO', 'LOPEZ', 'SALAS', 'EL CHOLO', 'DOIUSJUOIOEMMDNSJU', '1899-09-09', 2, 14, 3, -2, -2, 12, 12, -2, -2, 4, 2, 1, 2, 2, 2, 2, -2, 2, -2, 2, 2, 2, -2, 4, -2, 3, 1, 3, 2, '-2', 2, 3, '', 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_tramites_adojc`
--

CREATE TABLE `datos_tramites_adojc` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROCESADO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `ETAPA_PROCESAL` int(1) NOT NULL,
  `ESTATUS_INVESTIGACION` int(1) NOT NULL,
  `ESTATUS_INTERMEDIA` int(1) NOT NULL,
  `ESPECIFIQUE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `FECHA_ACTO_PROCESAL` date NOT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_tramites_adojc`
--

INSERT INTO `datos_tramites_adojc` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `CAUSA_CLAVE`, `PROCESADO_CLAVE`, `ETAPA_PROCESAL`, `ESTATUS_INVESTIGACION`, `ESTATUS_INTERMEDIA`, `ESPECIFIQUE`, `FECHA_ACTO_PROCESAL`, `ANIO`) VALUES
(9, 9007, 125, '199007125', '1-P199007125', 1, 1, -2, '-2', '1899-09-09', 2020),
(9, 9007, 125, '35599007125', '355-P199007125', 2, -2, 2, '-2', '1899-09-09', 2020),
(9, 9007, 125, '35599007125', '355-P399007125', 1, 3, -2, '-2', '1899-09-09', 2020),
(9, 9007, 125, '35599007125', '355-P599007125', 1, 1, -2, '-2', '1899-09-09', 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_tramites_adojo`
--

CREATE TABLE `datos_tramites_adojo` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVEJO` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROCESADO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `ESTATUS` int(1) NOT NULL,
  `ESPECIFIQUE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `FECHA_ACTO_PROCESAL` date NOT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_tramites_adojo`
--

INSERT INTO `datos_tramites_adojo` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `CAUSA_CLAVEJO`, `PROCESADO_CLAVE`, `ESTATUS`, `ESPECIFIQUE`, `FECHA_ACTO_PROCESAL`, `ANIO`) VALUES
(9, 9007, 125, '6O99007125', '6O-P299007125', 2, '', '1899-09-09', 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_vdelitos_adojc`
--

CREATE TABLE `datos_vdelitos_adojc` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `VICTIMA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `DELITO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_vdelitos_adojc`
--

INSERT INTO `datos_vdelitos_adojc` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `CAUSA_CLAVE`, `VICTIMA_CLAVE`, `DELITO_CLAVE`, `ANIO`) VALUES
(9, 9007, 125, '199007125', '1-V199007125', '1-D199007125', 2020),
(9, 9007, 125, '199007125', '1-V299007125', '1-D199007125', 2020),
(9, 9007, 125, '199007125', '1-V299007125', '1-D299007125', 2020),
(9, 9007, 125, '299007125', '2-V199007125', '2-D199007125', 2020),
(9, 9007, 125, '299007125', '2-V199007125', '2-D699007125', 2020),
(9, 9007, 125, '299007125', '2-V299007125', '2-D199007125', 2020),
(9, 9007, 125, '299007125', '2-V299007125', '2-D299007125', 2020),
(9, 9007, 125, '299007125', '2-V399007125', '2-D199007125', 2020),
(9, 9007, 125, '299007125', '2-V399007125', '2-D299007125', 2020),
(9, 9007, 125, '299007125', '2-V399007125', '2-D399007125', 2020),
(9, 9007, 125, '299007125', '2-V499007125', '2-D499007125', 2020),
(9, 9007, 125, '299007125', '2-V499007125', '2-D599007125', 2020),
(9, 9007, 125, '299007125', '2-V599007125', '2-D699007125', 2020),
(9, 9007, 125, '299007125', '2-V699007125', '2-D199007125', 2020),
(9, 9007, 125, '299007125', '2-V699007125', '2-D499007125', 2020),
(9, 9007, 125, '35599007125', '355-V199007125', '355-D199007125', 2020),
(9, 9007, 125, '35599007125', '355-V199007125', '355-D299007125', 2020),
(9, 9007, 125, '35599007125', '355-V299007125', '355-D199007125', 2020),
(9, 9007, 125, '35599007125', '355-V499007125', '355-D199007125', 2020),
(9, 9007, 125, '35599007125', '355-V499007125', '355-D299007125', 2020),
(9, 9007, 125, '35599007125', '355-V599007125', '355-D199007125', 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_vdelitos_adojo`
--

CREATE TABLE `datos_vdelitos_adojo` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVEJO` varchar(255) COLLATE utf8_bin NOT NULL,
  `VICTIMA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `DELITO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_vdelitos_adojo`
--

INSERT INTO `datos_vdelitos_adojo` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `CAUSA_CLAVEJO`, `VICTIMA_CLAVE`, `DELITO_CLAVE`, `ANIO`) VALUES
(9, 9007, 125, '5o99007125', '5o-V199007125', '5o-D699007125', 2020),
(9, 9007, 125, '6O99007125', '6O-V199007125', '6O-D199007125', 2020),
(9, 9007, 125, '6O99007125', '6O-V299007125', '6O-D199007125', 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_vfuente_ingresos_adojc`
--

CREATE TABLE `datos_vfuente_ingresos_adojc` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `VICTIMA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `INGRESO` int(1) NOT NULL,
  `ANIO` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_vfuente_ingresos_adojc`
--

INSERT INTO `datos_vfuente_ingresos_adojc` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `CAUSA_CLAVE`, `VICTIMA_CLAVE`, `INGRESO`, `ANIO`) VALUES
(9, 9007, 125, '35599007125', '355-V299007125', 1, 2020),
(9, 9007, 125, '35599007125', '355-V499007125', 9, 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_vfuente_ingresos_adojo`
--

CREATE TABLE `datos_vfuente_ingresos_adojo` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVEJO` varchar(255) COLLATE utf8_bin NOT NULL,
  `VICTIMA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `INGRESO` int(1) NOT NULL,
  `ANIO` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_victimas_adojc`
--

CREATE TABLE `datos_victimas_adojc` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `VICTIMA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `TIPO_VICTIMA` int(2) NOT NULL,
  `TIPO_VICTIMA_MORAL` int(2) NOT NULL,
  `CONTO_ASESOR` int(1) NOT NULL,
  `ASESOR` int(1) NOT NULL,
  `SEXO` int(2) NOT NULL,
  `FECHA_NACIMIENTO` date NOT NULL,
  `EDAD` int(3) NOT NULL,
  `VULNERABILIDAD` int(2) NOT NULL,
  `NACIMIENTO_PAIS` int(2) NOT NULL,
  `NACIMIENTO_ENTIDAD` int(2) NOT NULL,
  `NACIMIENTO_MUNICIPIO` int(5) NOT NULL,
  `NACIONALIDAD` int(2) NOT NULL,
  `RESIDENCIA_PAIS` int(2) NOT NULL,
  `RESIDENCIA_ENTIDAD` int(2) NOT NULL,
  `RESIDENCIA_MUNICIPIO` int(2) NOT NULL,
  `ESTADO_CIVIL` int(2) NOT NULL,
  `CONDICION_ALFABETISMO` int(2) NOT NULL,
  `GRADO_ESTUDIOS` int(2) NOT NULL,
  `HABLA_ESPANOL` int(2) NOT NULL,
  `HABLA_INDIGENA` int(1) NOT NULL,
  `LENGUA_INDIGENA` int(2) NOT NULL,
  `LENGUA_EXTRANJERA` int(1) NOT NULL,
  `INTERPRETE` int(1) NOT NULL,
  `INGRESOS` int(1) NOT NULL,
  `RANGO_INGRESOS` int(1) NOT NULL,
  `OCUPACION` int(2) NOT NULL,
  `MEDIDAS_MUJER` int(1) NOT NULL,
  `MEDIDAS_PROTECCION` int(1) NOT NULL,
  `COMENTARIOS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_victimas_adojc`
--

INSERT INTO `datos_victimas_adojc` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `CAUSA_CLAVE`, `VICTIMA_CLAVE`, `TIPO_VICTIMA`, `TIPO_VICTIMA_MORAL`, `CONTO_ASESOR`, `ASESOR`, `SEXO`, `FECHA_NACIMIENTO`, `EDAD`, `VULNERABILIDAD`, `NACIMIENTO_PAIS`, `NACIMIENTO_ENTIDAD`, `NACIMIENTO_MUNICIPIO`, `NACIONALIDAD`, `RESIDENCIA_PAIS`, `RESIDENCIA_ENTIDAD`, `RESIDENCIA_MUNICIPIO`, `ESTADO_CIVIL`, `CONDICION_ALFABETISMO`, `GRADO_ESTUDIOS`, `HABLA_ESPANOL`, `HABLA_INDIGENA`, `LENGUA_INDIGENA`, `LENGUA_EXTRANJERA`, `INTERPRETE`, `INGRESOS`, `RANGO_INGRESOS`, `OCUPACION`, `MEDIDAS_MUJER`, `MEDIDAS_PROTECCION`, `COMENTARIOS`, `ANIO`) VALUES
(9, 9007, 125, '199007125', '1-V199007125', 1, -2, 2, -2, 1, '1899-09-09', 5, 3, 10, -2, -2, 11, 15, -2, -2, 7, 2, 3, 2, 2, -2, 1, 1, 2, -2, 3, -2, 2, '', 2020),
(9, 9007, 125, '199007125', '1-V299007125', 2, 2, 2, -2, -2, '1899-09-09', -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, '', 2020),
(9, 9007, 125, '299007125', '2-V199007125', 2, 2, 1, 2, -2, '1899-09-09', -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, '', 2020),
(9, 9007, 125, '299007125', '2-V299007125', 1, -2, 2, -2, 1, '1899-09-09', 34, 3, 11, -2, -2, 13, 8, -2, -2, 5, 1, 2, 1, 2, -2, 2, 1, 2, -2, 8, -2, 1, '', 2020),
(9, 9007, 125, '299007125', '2-V399007125', 2, 2, 2, -2, -2, '1899-09-09', -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, '', 2020),
(9, 9007, 125, '299007125', '2-V499007125', 2, 1, 2, -2, -2, '1899-09-09', -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, '', 2020),
(9, 9007, 125, '299007125', '2-V599007125', 2, 1, 2, -2, -2, '1899-09-09', -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, '', 2020),
(9, 9007, 125, '299007125', '2-V699007125', 1, -2, 2, -2, 2, '1899-09-09', 22, 3, 14, -2, -2, 15, 16, -2, -2, 5, 1, 2, 2, 2, -2, 2, 2, 2, -2, 7, 1, 1, '', 2020),
(9, 9007, 125, '35599007125', '355-V199007125', 2, 2, 2, -2, -2, '1899-09-09', -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, '', 2020),
(9, 9007, 125, '35599007125', '355-V299007125', 1, -2, 1, 2, 1, '1899-09-09', 56, 4, 15, -2, -2, 15, 15, -2, -2, 8, 2, 3, 2, 2, -2, 2, 1, 1, 3, 5, -2, 2, 'SE GUARDO', 2020),
(9, 9007, 125, '35599007125', '355-V499007125', 1, -2, 1, 2, 1, '1899-09-09', 23, 10, 1, 1, 1002, 9, 1, 1, 1004, 5, 1, 6, 2, 1, 11, 2, 2, 1, 2, 6, -2, 1, 'PROBAREMOS', 2020),
(9, 9007, 125, '35599007125', '355-V599007125', 2, 2, 2, -2, -2, '1899-09-09', -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, '', 2020),
(9, 9007, 125, '599007125', '5-V199007125', -2, -2, -2, -2, -2, '1899-09-09', -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, '', 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_victimas_adojo`
--

CREATE TABLE `datos_victimas_adojo` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVEJC` varchar(255) COLLATE utf8_bin NOT NULL,
  `VICTIMA_CLAVEJC` varchar(255) COLLATE utf8_bin NOT NULL,
  `CAUSA_CLAVEJO` varchar(255) COLLATE utf8_bin NOT NULL,
  `VICTIMA_CLAVEJO` varchar(255) COLLATE utf8_bin NOT NULL,
  `TIPO_VICTIMA` int(2) NOT NULL,
  `TIPO_VICTIMA_MORAL` int(2) NOT NULL,
  `CONTO_ASESOR` int(1) NOT NULL,
  `ASESOR` int(1) NOT NULL,
  `SEXO` int(2) NOT NULL,
  `FECHA_NACIMIENTO` date NOT NULL,
  `EDAD` int(3) NOT NULL,
  `VULNERABILIDAD` int(2) NOT NULL,
  `NACIMIENTO_PAIS` int(2) NOT NULL,
  `NACIMIENTO_ENTIDAD` int(2) NOT NULL,
  `NACIMIENTO_MUNICIPIO` int(5) NOT NULL,
  `NACIONALIDAD` int(2) NOT NULL,
  `RESIDENCIA_PAIS` int(2) NOT NULL,
  `RESIDENCIA_ENTIDAD` int(2) NOT NULL,
  `RESIDENCIA_MUNICIPIO` int(2) NOT NULL,
  `ESTADO_CIVIL` int(2) NOT NULL,
  `CONDICION_ALFABETISMO` int(2) NOT NULL,
  `GRADO_ESTUDIOS` int(2) NOT NULL,
  `HABLA_ESPANOL` int(2) NOT NULL,
  `HABLA_INDIGENA` int(1) NOT NULL,
  `LENGUA_INDIGENA` int(2) NOT NULL,
  `LENGUA_EXTRANJERA` int(1) NOT NULL,
  `INTERPRETE` int(1) NOT NULL,
  `INGRESOS` int(1) NOT NULL,
  `RANGO_INGRESOS` int(1) NOT NULL,
  `OCUPACION` int(2) NOT NULL,
  `COMENTARIOS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_victimas_adojo`
--

INSERT INTO `datos_victimas_adojo` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `CAUSA_CLAVEJC`, `VICTIMA_CLAVEJC`, `CAUSA_CLAVEJO`, `VICTIMA_CLAVEJO`, `TIPO_VICTIMA`, `TIPO_VICTIMA_MORAL`, `CONTO_ASESOR`, `ASESOR`, `SEXO`, `FECHA_NACIMIENTO`, `EDAD`, `VULNERABILIDAD`, `NACIMIENTO_PAIS`, `NACIMIENTO_ENTIDAD`, `NACIMIENTO_MUNICIPIO`, `NACIONALIDAD`, `RESIDENCIA_PAIS`, `RESIDENCIA_ENTIDAD`, `RESIDENCIA_MUNICIPIO`, `ESTADO_CIVIL`, `CONDICION_ALFABETISMO`, `GRADO_ESTUDIOS`, `HABLA_ESPANOL`, `HABLA_INDIGENA`, `LENGUA_INDIGENA`, `LENGUA_EXTRANJERA`, `INTERPRETE`, `INGRESOS`, `RANGO_INGRESOS`, `OCUPACION`, `COMENTARIOS`, `ANIO`) VALUES
(9, 9007, 125, '299007125', '2-V199007125', '5o99007125', '5o-V199007125', 2, 2, 1, 2, -2, '1799-09-09', -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, '', 2020),
(9, 9007, 125, '199007125', '1-V199007125', '6O99007125', '6O-V199007125', 1, -2, 2, -2, 1, '1899-09-09', 5, 3, 10, -2, -2, 11, 15, -2, -2, 7, 2, 3, 2, 2, -2, 1, 1, 2, -2, 3, '', 2020),
(9, 9007, 125, '199007125', '1-V299007125', '6O99007125', '6O-V299007125', 2, 2, 2, -2, -2, '1799-09-09', -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, '', 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_vmedidas_adojc`
--

CREATE TABLE `datos_vmedidas_adojc` (
  `JUZGADO_ENTIDAD_ID` int(2) DEFAULT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) DEFAULT NULL,
  `JUZGADO_NUMERO_ID` int(3) DEFAULT NULL,
  `CAUSA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `VICTIMA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `TIPO_MEDIDA_PROT` int(2) NOT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_vmedidas_adojc`
--

INSERT INTO `datos_vmedidas_adojc` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `CAUSA_CLAVE`, `VICTIMA_CLAVE`, `TIPO_MEDIDA_PROT`, `ANIO`) VALUES
(9, 9007, 125, '299007125', '2-V299007125', 2, 2020),
(9, 9007, 125, '299007125', '2-V299007125', 3, 2020),
(9, 9007, 125, '299007125', '2-V699007125', 6, 2020),
(9, 9007, 125, '299007125', '2-V699007125', 7, 2020),
(9, 9007, 125, '35599007125', '355-V499007125', 1, 2020),
(9, 9007, 125, '35599007125', '355-V499007125', 2, 2020),
(9, 9007, 125, '35599007125', '355-V499007125', 6, 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_vmedidas_dmuj_adojc`
--

CREATE TABLE `datos_vmedidas_dmuj_adojc` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `VICTIMA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `TIPO_MEDIDA_MUJER` int(2) NOT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_vmedidas_dmuj_adojc`
--

INSERT INTO `datos_vmedidas_dmuj_adojc` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `CAUSA_CLAVE`, `VICTIMA_CLAVE`, `TIPO_MEDIDA_MUJER`, `ANIO`) VALUES
(9, 9007, 125, '299007125', '2-V699007125', 2, 2020),
(9, 9007, 125, '299007125', '2-V699007125', 3, 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_vprocesados_adojc`
--

CREATE TABLE `datos_vprocesados_adojc` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `VICTIMA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROCESADO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `RELACION` int(2) NOT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_vprocesados_adojc`
--

INSERT INTO `datos_vprocesados_adojc` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `CAUSA_CLAVE`, `VICTIMA_CLAVE`, `PROCESADO_CLAVE`, `RELACION`, `ANIO`) VALUES
(9, 9007, 125, '199007125', '1-V199007125', '1-P199007125', 1, 2020),
(9, 9007, 125, '199007125', '1-V199007125', '1-P199007125', 5, 2020),
(9, 9007, 125, '199007125', '1-V299007125', '1-P199007125', 99, 2020),
(9, 9007, 125, '199007125', '1-V199007125', '1-P299007125', 5, 2020),
(9, 9007, 125, '199007125', '1-V199007125', '1-P299007125', 7, 2020),
(9, 9007, 125, '199007125', '1-V299007125', '1-P299007125', 99, 2020),
(9, 9007, 125, '299007125', '2-V199007125', '2-P199007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V299007125', '2-P199007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V399007125', '2-P199007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V499007125', '2-P199007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V599007125', '2-P199007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V699007125', '2-P199007125', 8, 2020),
(9, 9007, 125, '299007125', '2-V199007125', '2-P299007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V299007125', '2-P299007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V399007125', '2-P299007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V499007125', '2-P299007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V599007125', '2-P299007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V699007125', '2-P299007125', 4, 2020),
(9, 9007, 125, '299007125', '2-V199007125', '2-P399007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V299007125', '2-P399007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V399007125', '2-P399007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V499007125', '2-P399007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V599007125', '2-P399007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V699007125', '2-P399007125', 4, 2020),
(9, 9007, 125, '299007125', '2-V199007125', '2-P499007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V299007125', '2-P499007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V399007125', '2-P499007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V499007125', '2-P499007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V599007125', '2-P499007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V699007125', '2-P499007125', 8, 2020),
(9, 9007, 125, '299007125', '2-V199007125', '2-P599007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V299007125', '2-P599007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V399007125', '2-P599007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V499007125', '2-P599007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V599007125', '2-P599007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V699007125', '2-P599007125', 8, 2020),
(9, 9007, 125, '299007125', '2-V199007125', '2-P699007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V299007125', '2-P699007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V399007125', '2-P699007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V499007125', '2-P699007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V599007125', '2-P699007125', 10, 2020),
(9, 9007, 125, '299007125', '2-V699007125', '2-P699007125', 8, 2020),
(9, 9007, 125, '35599007125', '355-V199007125', '355-P199007125', 5, 2020),
(9, 9007, 125, '35599007125', '355-V199007125', '355-P199007125', 8, 2020),
(9, 9007, 125, '35599007125', '355-V299007125', '355-P199007125', 10, 2020),
(9, 9007, 125, '35599007125', '355-V499007125', '355-P199007125', 99, 2020),
(9, 9007, 125, '35599007125', '355-V199007125', '355-P399007125', 5, 2020),
(9, 9007, 125, '35599007125', '355-V199007125', '355-P399007125', 8, 2020),
(9, 9007, 125, '35599007125', '355-V299007125', '355-P399007125', 5, 2020),
(9, 9007, 125, '35599007125', '355-V299007125', '355-P399007125', 6, 2020),
(9, 9007, 125, '35599007125', '355-V299007125', '355-P399007125', 7, 2020),
(9, 9007, 125, '35599007125', '355-V299007125', '355-P399007125', 8, 2020),
(9, 9007, 125, '35599007125', '355-V499007125', '355-P399007125', 10, 2020),
(9, 9007, 125, '35599007125', '355-V599007125', '355-P399007125', 3, 2020),
(9, 9007, 125, '35599007125', '355-V599007125', '355-P399007125', 5, 2020),
(9, 9007, 125, '35599007125', '355-V199007125', '355-P599007125', 4, 2020),
(9, 9007, 125, '35599007125', '355-V299007125', '355-P599007125', 2, 2020),
(9, 9007, 125, '35599007125', '355-V299007125', '355-P599007125', 3, 2020),
(9, 9007, 125, '35599007125', '355-V299007125', '355-P599007125', 6, 2020),
(9, 9007, 125, '35599007125', '355-V499007125', '355-P599007125', 10, 2020),
(9, 9007, 125, '35599007125', '355-V599007125', '355-P599007125', 10, 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_vprocesados_adojo`
--

CREATE TABLE `datos_vprocesados_adojo` (
  `JUZGADO_ENTIDAD_ID` int(2) NOT NULL,
  `JUZGADO_MUNICIPIO_ID` int(5) NOT NULL,
  `JUZGADO_NUMERO_ID` int(3) NOT NULL,
  `CAUSA_CLAVEJO` varchar(255) COLLATE utf8_bin NOT NULL,
  `VICTIMA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROCESADO_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `RELACION` int(2) NOT NULL,
  `ANIO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `datos_vprocesados_adojo`
--

INSERT INTO `datos_vprocesados_adojo` (`JUZGADO_ENTIDAD_ID`, `JUZGADO_MUNICIPIO_ID`, `JUZGADO_NUMERO_ID`, `CAUSA_CLAVEJO`, `VICTIMA_CLAVE`, `PROCESADO_CLAVE`, `RELACION`, `ANIO`) VALUES
(9, 9007, 125, '5o99007125', '5o-V199007125', '5o-P199007125', 1, 2020),
(9, 9007, 125, '6O99007125', '6O-V199007125', '6O-P299007125', 1, 2020),
(9, 9007, 125, '6O99007125', '6O-V199007125', '6O-P299007125', 5, 2020),
(9, 9007, 125, '6O99007125', '6O-V299007125', '6O-P299007125', 1, 2020),
(9, 9007, 125, '6O99007125', '6O-V299007125', '6O-P299007125', 2, 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuarios`
--

CREATE TABLE `tipo_usuarios` (
  `TIPO_USUARIO_ID` int(1) NOT NULL,
  `DESCRIPCION` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `tipo_usuarios`
--

INSERT INTO `tipo_usuarios` (`TIPO_USUARIO_ID`, `DESCRIPCION`) VALUES
(1, 'Administrador'),
(2, 'Captura'),
(3, 'Consulta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `USUARIO_ID` int(2) NOT NULL,
  `NOMBRE` varchar(150) COLLATE utf8_bin NOT NULL,
  `APATERNO` varchar(150) COLLATE utf8_bin NOT NULL,
  `AMATERNO` varchar(150) COLLATE utf8_bin NOT NULL,
  `EDAD` int(2) NOT NULL,
  `CORREO` varchar(150) COLLATE utf8_bin NOT NULL,
  `ENTIDAD` int(2) NOT NULL,
  `CONTRASENIA` varchar(100) COLLATE utf8_bin NOT NULL,
  `TIPO_USUARIO` int(1) NOT NULL,
  `VISITA` int(1) NOT NULL DEFAULT '0',
  `ESTATUS` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`USUARIO_ID`, `NOMBRE`, `APATERNO`, `AMATERNO`, `EDAD`, `CORREO`, `ENTIDAD`, `CONTRASENIA`, `TIPO_USUARIO`, `VISITA`, `ESTATUS`) VALUES
(5, 'CARLOS', 'SANCHEZ', 'GARCIA', 32, 'ADMIN@MAIL.COM', 9, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1, 1, 1),
(6, 'CHARLY', 'ROMERO', 'TERCERO', 33, 'TRES@MAIL.COM', 9, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 2, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_control`
--

CREATE TABLE `usuarios_control` (
  `CAUSA_CLAVE` varchar(255) COLLATE utf8_bin NOT NULL,
  `AVANCE` int(2) NOT NULL,
  `CAUSA_CLAVEJO` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `AVANCEJO` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `usuarios_control`
--

INSERT INTO `usuarios_control` (`CAUSA_CLAVE`, `AVANCE`, `CAUSA_CLAVEJO`, `AVANCEJO`) VALUES
('199007125', 6, '6O99007125', 5),
('299007125', 6, NULL, NULL),
('35599007125', 6, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `catalogos_acuerdo_reparatorio`
--
ALTER TABLE `catalogos_acuerdo_reparatorio`
  ADD PRIMARY KEY (`AREPARATORIO_ID`);

--
-- Indices de la tabla `catalogos_alfabetismo`
--
ALTER TABLE `catalogos_alfabetismo`
  ADD PRIMARY KEY (`ALFABETISMO_ID`);

--
-- Indices de la tabla `catalogos_asentamiento_humano`
--
ALTER TABLE `catalogos_asentamiento_humano`
  ADD PRIMARY KEY (`ASENTAMIENTO_ID`);

--
-- Indices de la tabla `catalogos_audiencias_intermedia`
--
ALTER TABLE `catalogos_audiencias_intermedia`
  ADD PRIMARY KEY (`AUDIENCIA_ID`);

--
-- Indices de la tabla `catalogos_audiencias_investigacion`
--
ALTER TABLE `catalogos_audiencias_investigacion`
  ADD PRIMARY KEY (`AUDIENCIA_ID`);

--
-- Indices de la tabla `catalogos_audiencias_juiciooral`
--
ALTER TABLE `catalogos_audiencias_juiciooral`
  ADD PRIMARY KEY (`AUDIENCIA_ID`);

--
-- Indices de la tabla `catalogos_auto_vinculacion`
--
ALTER TABLE `catalogos_auto_vinculacion`
  ADD PRIMARY KEY (`AUTO_ID`);

--
-- Indices de la tabla `catalogos_calificacion_delito`
--
ALTER TABLE `catalogos_calificacion_delito`
  ADD PRIMARY KEY (`CALIFICACION_ID`);

--
-- Indices de la tabla `catalogos_causa_suspencion`
--
ALTER TABLE `catalogos_causa_suspencion`
  ADD PRIMARY KEY (`CSUSPENSION_ID`);

--
-- Indices de la tabla `catalogos_clasificacion`
--
ALTER TABLE `catalogos_clasificacion`
  ADD PRIMARY KEY (`CLASIFICACION_ID`);

--
-- Indices de la tabla `catalogos_codigo_norma`
--
ALTER TABLE `catalogos_codigo_norma`
  ADD PRIMARY KEY (`ID_CODIGO`);

--
-- Indices de la tabla `catalogos_concurso`
--
ALTER TABLE `catalogos_concurso`
  ADD PRIMARY KEY (`CONCURSO_ID`);

--
-- Indices de la tabla `catalogos_condicion_actividad`
--
ALTER TABLE `catalogos_condicion_actividad`
  ADD PRIMARY KEY (`CONDICIONA_ID`);

--
-- Indices de la tabla `catalogos_condicion_estudiante`
--
ALTER TABLE `catalogos_condicion_estudiante`
  ADD PRIMARY KEY (`CONDICIONE_ID`);

--
-- Indices de la tabla `catalogos_consumacion`
--
ALTER TABLE `catalogos_consumacion`
  ADD PRIMARY KEY (`CONSUMACION_ID`);

--
-- Indices de la tabla `catalogos_contexto_situacional`
--
ALTER TABLE `catalogos_contexto_situacional`
  ADD PRIMARY KEY (`CONTEXTO_ID`);

--
-- Indices de la tabla `catalogos_cosa_robada`
--
ALTER TABLE `catalogos_cosa_robada`
  ADD PRIMARY KEY (`COSA_ID`);

--
-- Indices de la tabla `catalogos_delitos_norma`
--
ALTER TABLE `catalogos_delitos_norma`
  ADD PRIMARY KEY (`ID_DELITO`);

--
-- Indices de la tabla `catalogos_dominio_espanol`
--
ALTER TABLE `catalogos_dominio_espanol`
  ADD PRIMARY KEY (`DOMINIO_ID`);

--
-- Indices de la tabla `catalogos_entidades`
--
ALTER TABLE `catalogos_entidades`
  ADD PRIMARY KEY (`ENTIDAD_ID`);

--
-- Indices de la tabla `catalogos_estado_civil`
--
ALTER TABLE `catalogos_estado_civil`
  ADD PRIMARY KEY (`ESTADO_CIVIL_ID`);

--
-- Indices de la tabla `catalogos_estado_psicofisico`
--
ALTER TABLE `catalogos_estado_psicofisico`
  ADD PRIMARY KEY (`ESTADO_PSICO_ID`);

--
-- Indices de la tabla `catalogos_estatusjo`
--
ALTER TABLE `catalogos_estatusjo`
  ADD PRIMARY KEY (`ESTATUS_ID`);

--
-- Indices de la tabla `catalogos_estudio_profesional`
--
ALTER TABLE `catalogos_estudio_profesional`
  ADD PRIMARY KEY (`ESTUDIO_PRO_ID`);

--
-- Indices de la tabla `catalogos_etapas`
--
ALTER TABLE `catalogos_etapas`
  ADD PRIMARY KEY (`ETAPA_ID`);

--
-- Indices de la tabla `catalogos_etapa_inicial`
--
ALTER TABLE `catalogos_etapa_inicial`
  ADD PRIMARY KEY (`INICIAL_ID`);

--
-- Indices de la tabla `catalogos_etapa_intermedia`
--
ALTER TABLE `catalogos_etapa_intermedia`
  ADD PRIMARY KEY (`INTERMEDIA_ID`);

--
-- Indices de la tabla `catalogos_etapa_procesal`
--
ALTER TABLE `catalogos_etapa_procesal`
  ADD PRIMARY KEY (`PROCESAL_ID`);

--
-- Indices de la tabla `catalogos_exclusion_accionp`
--
ALTER TABLE `catalogos_exclusion_accionp`
  ADD PRIMARY KEY (`EXCLUSION_ID`);

--
-- Indices de la tabla `catalogos_figura_mprueba`
--
ALTER TABLE `catalogos_figura_mprueba`
  ADD PRIMARY KEY (`FIGURA_MPRU_ID`);

--
-- Indices de la tabla `catalogos_figura_proceso`
--
ALTER TABLE `catalogos_figura_proceso`
  ADD PRIMARY KEY (`FIGURA_PRO_ID`);

--
-- Indices de la tabla `catalogos_forma_accion`
--
ALTER TABLE `catalogos_forma_accion`
  ADD PRIMARY KEY (`ACCION_ID`);

--
-- Indices de la tabla `catalogos_forma_comision`
--
ALTER TABLE `catalogos_forma_comision`
  ADD PRIMARY KEY (`COMISION_ID`);

--
-- Indices de la tabla `catalogos_forma_conduccion`
--
ALTER TABLE `catalogos_forma_conduccion`
  ADD PRIMARY KEY (`CONDUCCION_ID`);

--
-- Indices de la tabla `catalogos_forma_division`
--
ALTER TABLE `catalogos_forma_division`
  ADD PRIMARY KEY (`DIVISION_ID`);

--
-- Indices de la tabla `catalogos_fuente_ingresos`
--
ALTER TABLE `catalogos_fuente_ingresos`
  ADD PRIMARY KEY (`FUENTE_ID`);

--
-- Indices de la tabla `catalogos_fuero`
--
ALTER TABLE `catalogos_fuero`
  ADD PRIMARY KEY (`FUERO_ID`);

--
-- Indices de la tabla `catalogos_funcion_juzgado`
--
ALTER TABLE `catalogos_funcion_juzgado`
  ADD PRIMARY KEY (`FUNCION_JUZ_ID`);

--
-- Indices de la tabla `catalogos_grado_estudios`
--
ALTER TABLE `catalogos_grado_estudios`
  ADD PRIMARY KEY (`ESTUDIO_ID`);

--
-- Indices de la tabla `catalogos_grado_participacion`
--
ALTER TABLE `catalogos_grado_participacion`
  ADD PRIMARY KEY (`PARTICIPACION_ID`);

--
-- Indices de la tabla `catalogos_incompetencia`
--
ALTER TABLE `catalogos_incompetencia`
  ADD PRIMARY KEY (`INCOMPETENCIA_ID`);

--
-- Indices de la tabla `catalogos_instrumento_comision`
--
ALTER TABLE `catalogos_instrumento_comision`
  ADD PRIMARY KEY (`INSTRUMENTO_ID`);

--
-- Indices de la tabla `catalogos_jurisdiccion`
--
ALTER TABLE `catalogos_jurisdiccion`
  ADD PRIMARY KEY (`JURISDICCION_ID`);

--
-- Indices de la tabla `catalogos_linguisticas`
--
ALTER TABLE `catalogos_linguisticas`
  ADD PRIMARY KEY (`LINGUISTICA_ID`);

--
-- Indices de la tabla `catalogos_medidas_cautelares`
--
ALTER TABLE `catalogos_medidas_cautelares`
  ADD PRIMARY KEY (`CAUTELARES_ID`);

--
-- Indices de la tabla `catalogos_medidas_disciplinarias`
--
ALTER TABLE `catalogos_medidas_disciplinarias`
  ADD PRIMARY KEY (`MEDIDA_ID`);

--
-- Indices de la tabla `catalogos_medidas_duracion`
--
ALTER TABLE `catalogos_medidas_duracion`
  ADD PRIMARY KEY (`MEDIDA_DURA_ID`);

--
-- Indices de la tabla `catalogos_medidas_mujer`
--
ALTER TABLE `catalogos_medidas_mujer`
  ADD PRIMARY KEY (`MUJER_ID`);

--
-- Indices de la tabla `catalogos_medidas_proteccion`
--
ALTER TABLE `catalogos_medidas_proteccion`
  ADD PRIMARY KEY (`PROTECCION_ID`);

--
-- Indices de la tabla `catalogos_medidas_solicita`
--
ALTER TABLE `catalogos_medidas_solicita`
  ADD PRIMARY KEY (`MEDIDA_SOLICITA_ID`);

--
-- Indices de la tabla `catalogos_medios_prueba`
--
ALTER TABLE `catalogos_medios_prueba`
  ADD PRIMARY KEY (`PRUEBA_ID`);

--
-- Indices de la tabla `catalogos_modalidad`
--
ALTER TABLE `catalogos_modalidad`
  ADD PRIMARY KEY (`MODALIDAD_ID`);

--
-- Indices de la tabla `catalogos_multa`
--
ALTER TABLE `catalogos_multa`
  ADD PRIMARY KEY (`MULTA_ID`);

--
-- Indices de la tabla `catalogos_municipios`
--
ALTER TABLE `catalogos_municipios`
  ADD PRIMARY KEY (`MUNICIPIO_ID`);

--
-- Indices de la tabla `catalogos_nacionalidad`
--
ALTER TABLE `catalogos_nacionalidad`
  ADD PRIMARY KEY (`NACIONALIDAD_ID`);

--
-- Indices de la tabla `catalogos_noprivativas`
--
ALTER TABLE `catalogos_noprivativas`
  ADD PRIMARY KEY (`NOPRIVATIVAS_ID`);

--
-- Indices de la tabla `catalogos_numero`
--
ALTER TABLE `catalogos_numero`
  ADD PRIMARY KEY (`NUMERO_ID`);

--
-- Indices de la tabla `catalogos_ocupacion`
--
ALTER TABLE `catalogos_ocupacion`
  ADD PRIMARY KEY (`OCUPACION_ID`);

--
-- Indices de la tabla `catalogos_pais`
--
ALTER TABLE `catalogos_pais`
  ADD PRIMARY KEY (`PAIS_ID`);

--
-- Indices de la tabla `catalogos_plazo_cierre`
--
ALTER TABLE `catalogos_plazo_cierre`
  ADD PRIMARY KEY (`CIERRE_ID`);

--
-- Indices de la tabla `catalogos_plazo_constitucional`
--
ALTER TABLE `catalogos_plazo_constitucional`
  ADD PRIMARY KEY (`PLAZO_ID`);

--
-- Indices de la tabla `catalogos_privativas`
--
ALTER TABLE `catalogos_privativas`
  ADD PRIMARY KEY (`PRIVATIVAS_ID`);

--
-- Indices de la tabla `catalogos_proc_abreviado`
--
ALTER TABLE `catalogos_proc_abreviado`
  ADD PRIMARY KEY (`PROCABREV_ID`);

--
-- Indices de la tabla `catalogos_promueve_incidente`
--
ALTER TABLE `catalogos_promueve_incidente`
  ADD PRIMARY KEY (`PROMUEVE_ID`);

--
-- Indices de la tabla `catalogos_pueblo_indigena`
--
ALTER TABLE `catalogos_pueblo_indigena`
  ADD PRIMARY KEY (`PUEBLO_ID`);

--
-- Indices de la tabla `catalogos_rango_ingresos`
--
ALTER TABLE `catalogos_rango_ingresos`
  ADD PRIMARY KEY (`ID_INGRESOS`);

--
-- Indices de la tabla `catalogos_reincidencia`
--
ALTER TABLE `catalogos_reincidencia`
  ADD PRIMARY KEY (`REINCIDENCIA_ID`);

--
-- Indices de la tabla `catalogos_relacion_imputado`
--
ALTER TABLE `catalogos_relacion_imputado`
  ADD PRIMARY KEY (`RELACION_ID`);

--
-- Indices de la tabla `catalogos_reparacion_dano`
--
ALTER TABLE `catalogos_reparacion_dano`
  ADD PRIMARY KEY (`REPARACION_ID`);

--
-- Indices de la tabla `catalogos_representante_legal`
--
ALTER TABLE `catalogos_representante_legal`
  ADD PRIMARY KEY (`REPRESENTANTE_ID`);

--
-- Indices de la tabla `catalogos_resolucion_mprueba`
--
ALTER TABLE `catalogos_resolucion_mprueba`
  ADD PRIMARY KEY (`MPRUEBA_ID`);

--
-- Indices de la tabla `catalogos_respuesta_simple`
--
ALTER TABLE `catalogos_respuesta_simple`
  ADD PRIMARY KEY (`RESPUESTA_ID`);

--
-- Indices de la tabla `catalogos_sentido_fallo`
--
ALTER TABLE `catalogos_sentido_fallo`
  ADD PRIMARY KEY (`SENTIDO_ID`);

--
-- Indices de la tabla `catalogos_sexo`
--
ALTER TABLE `catalogos_sexo`
  ADD PRIMARY KEY (`SEXO_ID`);

--
-- Indices de la tabla `catalogos_sitio_ocurrencia`
--
ALTER TABLE `catalogos_sitio_ocurrencia`
  ADD PRIMARY KEY (`SITIO_ID`);

--
-- Indices de la tabla `catalogos_sobreseimiento`
--
ALTER TABLE `catalogos_sobreseimiento`
  ADD PRIMARY KEY (`SOBRESEIMIENTO_ID`);

--
-- Indices de la tabla `catalogos_suspension_condicional`
--
ALTER TABLE `catalogos_suspension_condicional`
  ADD PRIMARY KEY (`SUSPENSION_ID`);

--
-- Indices de la tabla `catalogos_tiempo_internamiento`
--
ALTER TABLE `catalogos_tiempo_internamiento`
  ADD PRIMARY KEY (`INTERNAMIENTO_ID`);

--
-- Indices de la tabla `catalogos_tipo_consignacion`
--
ALTER TABLE `catalogos_tipo_consignacion`
  ADD PRIMARY KEY (`CONSIGNACION_ID`);

--
-- Indices de la tabla `catalogos_tipo_defensor`
--
ALTER TABLE `catalogos_tipo_defensor`
  ADD PRIMARY KEY (`DEFENSOR_ID`);

--
-- Indices de la tabla `catalogos_tipo_detencion`
--
ALTER TABLE `catalogos_tipo_detencion`
  ADD PRIMARY KEY (`TDETENCION_ID`);

--
-- Indices de la tabla `catalogos_tipo_impugnacion`
--
ALTER TABLE `catalogos_tipo_impugnacion`
  ADD PRIMARY KEY (`IMPUGNACION_ID`);

--
-- Indices de la tabla `catalogos_tipo_resolucion`
--
ALTER TABLE `catalogos_tipo_resolucion`
  ADD PRIMARY KEY (`RESOLUCION_ID`);

--
-- Indices de la tabla `catalogos_tipo_resolucionjo`
--
ALTER TABLE `catalogos_tipo_resolucionjo`
  ADD PRIMARY KEY (`RESOLUCION_ID`);

--
-- Indices de la tabla `catalogos_tipo_sobreseimiento`
--
ALTER TABLE `catalogos_tipo_sobreseimiento`
  ADD PRIMARY KEY (`TSOBRESEIMIENTO_ID`);

--
-- Indices de la tabla `catalogos_tipo_victima`
--
ALTER TABLE `catalogos_tipo_victima`
  ADD PRIMARY KEY (`VICTIMA_ID`);

--
-- Indices de la tabla `catalogos_vialidad`
--
ALTER TABLE `catalogos_vialidad`
  ADD PRIMARY KEY (`VIALIDAD_ID`);

--
-- Indices de la tabla `catalogos_victima_moral`
--
ALTER TABLE `catalogos_victima_moral`
  ADD PRIMARY KEY (`MORAL_ID`);

--
-- Indices de la tabla `catalogos_vulnerabilidad`
--
ALTER TABLE `catalogos_vulnerabilidad`
  ADD PRIMARY KEY (`VULNERABILIDAD_ID`);

--
-- Indices de la tabla `datos_audiencias_adojc`
--
ALTER TABLE `datos_audiencias_adojc`
  ADD PRIMARY KEY (`JUZGADO_CLAVE`,`CAUSA_CLAVE`,`JUEZ_CLAVE1`,`JUEZ_CLAVE2`,`JUEZ_CLAVE3`,`AUDIENCIA_INVESTIGACION`,`AUDIENCIA_INTERMEDIA`) USING BTREE,
  ADD KEY `FK_AUDI_ENTIDADES` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_AUDI_MUNICIPIOS` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_AUDI_CAUSACLAVE` (`CAUSA_CLAVE`),
  ADD KEY `FK_AUDI_JUEZ1` (`JUZGADO_CLAVE`,`JUEZ_CLAVE1`),
  ADD KEY `FK_AUDI_JUEZ2` (`JUZGADO_CLAVE`,`JUEZ_CLAVE2`),
  ADD KEY `FK_AUDI_JUEZ3` (`JUZGADO_CLAVE`,`JUEZ_CLAVE3`),
  ADD KEY `FK_AUDI_INVESTIGACION` (`AUDIENCIA_INVESTIGACION`),
  ADD KEY `FK_AUDI_INTERMEDIA` (`AUDIENCIA_INTERMEDIA`);

--
-- Indices de la tabla `datos_audiencias_adojo`
--
ALTER TABLE `datos_audiencias_adojo`
  ADD PRIMARY KEY (`JUZGADO_CLAVE`,`CAUSA_CLAVEJO`,`JUEZ_CLAVE1`,`JUEZ_CLAVE2`,`JUEZ_CLAVE3`,`AUDIENCIA_JUICIOORAL`) USING BTREE,
  ADD KEY `FK_AUDI_ENTIDADJO` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_AUDI_MUNICIPIOJO` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_AUDI_CAUSACLAVEJO` (`CAUSA_CLAVEJO`),
  ADD KEY `FK_AUDI_JUEZ1JO` (`JUZGADO_CLAVE`,`JUEZ_CLAVE1`),
  ADD KEY `FK_AUDI_JUEZ2JO` (`JUZGADO_CLAVE`,`JUEZ_CLAVE2`),
  ADD KEY `FK_AUDI_JUEZ3JO` (`JUZGADO_CLAVE`,`JUEZ_CLAVE3`),
  ADD KEY `FK_AUDI_JUICIOORAL` (`AUDIENCIA_JUICIOORAL`);

--
-- Indices de la tabla `datos_causas_penales_adojc`
--
ALTER TABLE `datos_causas_penales_adojc`
  ADD PRIMARY KEY (`CAUSA_CLAVE`),
  ADD KEY `FK_CAUSASP_JUZGADOS` (`JUZGADO_CLAVE`),
  ADD KEY `FK_DERIVAACCIONPENAL` (`DERIVA_ACCION_PENAL`),
  ADD KEY `FK_EXPEDIENTES_COMPETENCIA` (`COMPETENCIA`),
  ADD KEY `FK_EXPEDIENTES_ENTIDADES` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_EXPEDIENTES_JUECES` (`JUEZ_CLAVE`),
  ADD KEY `FK_EXPEDIENTES_MUNICIPIOS` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_EXPEDIENTES_TIPOINCOMPETENCIA` (`TIPO_INCOMPETENCIA`),
  ADD KEY `FK_EXPEDIENTE_ACUMULADO` (`EXPEDIENTE_ACUMULADO`),
  ADD KEY `FK_CAUSA_JUEZ` (`JUZGADO_CLAVE`,`JUEZ_CLAVE`);

--
-- Indices de la tabla `datos_causas_penales_adojo`
--
ALTER TABLE `datos_causas_penales_adojo`
  ADD PRIMARY KEY (`CAUSA_CLAVEJO`),
  ADD KEY `FK_CAUSASP_JUZGADOS` (`JUZGADO_CLAVE`),
  ADD KEY `FK_EXPEDIENTES_ENTIDADES` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_EXPEDIENTES_MUNICIPIOS` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_CAUSA_CLAVEJC` (`CAUSA_CLAVEJC`),
  ADD KEY `FK_ATENDIDA_ORGDIFERENTEJO` (`ATENDIDA_ORGDIFERENTE`) USING BTREE,
  ADD KEY `FK_CANTIDAD_JUECESJO` (`CANTIDAD_JUECES`) USING BTREE,
  ADD KEY `FK_JUEZCLAVE_1JO` (`JUZGADO_CLAVE`,`JUEZ_CLAVE_1`),
  ADD KEY `FK_JUEZCLAVE_2JO` (`JUZGADO_CLAVE`,`JUEZ_CLAVE_2`),
  ADD KEY `FK_JUEZCLAVE_3JO` (`JUZGADO_CLAVE`,`JUEZ_CLAVE_3`);

--
-- Indices de la tabla `datos_conclusiones_adojc`
--
ALTER TABLE `datos_conclusiones_adojc`
  ADD PRIMARY KEY (`CAUSA_CLAVE`,`PROCESADO_CLAVE`),
  ADD KEY `FK_CONCLUISONES_ACUERDO_REPARATORIO` (`MECANISMO_ACUERDO`),
  ADD KEY `FK_CONCLUISONES_PROCEDIMIENTO_ABREV` (`TIPO_CONCLUSION_PA`),
  ADD KEY `FK_CONCLUSIONES_ENTIDADES` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_CONCLUSIONES_EXCLUSION_AP` (`EXCLUSION_ACCIONP`),
  ADD KEY `FK_CONCLUSIONES_IMPUGNA_RESOL` (`PERSONA_IMPUGNA`),
  ADD KEY `FK_CONCLUSIONES_IMPUGNACION` (`IMPUGNACION`),
  ADD KEY `FK_CONCLUSIONES_INTERNAMIENTO` (`TIEMPO_INTERNAMIENTO`),
  ADD KEY `FK_CONCLUSIONES_MPRIVATIVAS` (`MEDIDA_PRIVATIVA`),
  ADD KEY `FK_CONCLUSIONES_MULTA` (`MONTO_REPARA`),
  ADD KEY `FK_CONCLUSIONES_MUNICIPIOS` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_CONCLUSIONES_NOM_PRIVACION` (`MEDIDA_NOPRIVATIVA`),
  ADD KEY `FK_CONCLUSIONES_PROCEDENCIA_SOB` (`PROCEDENCIA_SOBRESEIMIENTO`),
  ADD KEY `FK_CONCLUSIONES_RDANIO` (`REPARACION_DANIO`),
  ADD KEY `FK_CONCLUSIONES_TDANIO` (`TIPO_REPARACION_DANIO`),
  ADD KEY `FK_CONCLUSIONES_SUSPENCIONC` (`SUSPENCION_CONDICIONAL`),
  ADD KEY `FK_CONCLUSIONES_TIMPUGNACION` (`TIPO_IMPUGNACION`),
  ADD KEY `FK_CONCLUSIONES_TIPOR` (`TIPO_RESOLUCION`),
  ADD KEY `FK_CONCLUSIONES_TSOBRESEIMIENTO` (`TIPO_SOBRESEIMIENTO`);

--
-- Indices de la tabla `datos_conclusiones_adojo`
--
ALTER TABLE `datos_conclusiones_adojo`
  ADD PRIMARY KEY (`CAUSA_CLAVEJO`,`PROCESADO_CLAVE`),
  ADD KEY `FK_CONCLU_ENTIDADJO` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_CONCLU_MUNICIPIOJO` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_CONCLU_TIPORESOLUJO` (`TIPO_RESOLUCION`),
  ADD KEY `FK_CONCLU_TIPOSOBRESEIJO` (`TIPO_SOBRESEIMIENTO`),
  ADD KEY `FK_CONCLU_SOBRESEIJO` (`PROCEDENCIA_SOBRESEIMIENTO`),
  ADD KEY `FK_CONCLU_EXTINAPENALJO` (`EXCLUSION_ACCIONP`),
  ADD KEY `FK_CONCLU_SENTENCIAJO` (`TIPO_SENTENCIA`),
  ADD KEY `FK_CONCLU_PRIVATIVAJO` (`MEDIDA_PRIVATIVA`),
  ADD KEY `FK_CONCLU_NOPRIVATIVAJO` (`MEDIDA_NOPRIVATIVA`),
  ADD KEY `FK_CONCLU_INTERNAMIENTOJO` (`TIEMPO_INTERNAMIENTO`),
  ADD KEY `FK_CONCLU_REPARADANIOJO` (`REPARACION_DANIO`),
  ADD KEY `FK_CONCLU_TIPOREPARAJO` (`TIPO_REPARACION_DANIO`),
  ADD KEY `FK_CONCLU_MONTOREPARAJO` (`MONTO_REPARA`),
  ADD KEY `FKK_CONCLU_IMPUGNACIONJO` (`IMPUGNACION`),
  ADD KEY `FK_CONCLU_TIPOIMPUGNAJO` (`TIPO_IMPUGNACION`),
  ADD KEY `FK_CONCLU_PERSONAIMPUGJO` (`PERSONA_IMPUGNA`);

--
-- Indices de la tabla `datos_dconclusiones_adojc`
--
ALTER TABLE `datos_dconclusiones_adojc`
  ADD PRIMARY KEY (`CAUSA_CLAVE`,`PROCESADO_CLAVE`,`DELITO_CLAVE`),
  ADD KEY `FK_DCONCLUSIONES_DELITOS` (`CAUSA_CLAVE`,`DELITO_CLAVE`),
  ADD KEY `FK_DCONCLUSIONES_ENTIDADES` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_DCONCLUSIONES_MUNICIPIOS` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_DCONCLUSIONES_TRESOLUCION` (`TIPO_RESOLUCION`),
  ADD KEY `FK_DCONCLUSIONES_TCONCLUSIONDELI` (`TIPO_CONCLUSION_PA`);

--
-- Indices de la tabla `datos_dconclusiones_adojo`
--
ALTER TABLE `datos_dconclusiones_adojo`
  ADD PRIMARY KEY (`CAUSA_CLAVEJO`,`PROCESADO_CLAVE`,`DELITO_CLAVE`),
  ADD KEY `FK_DCON_ENTIDADJO` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_DCON_MUNICIPIOJO` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_DCON_DELITOCLAVEJO` (`CAUSA_CLAVEJO`,`DELITO_CLAVE`),
  ADD KEY `FK_DCON_SENTENCIAJO` (`TIPO_SENTENCIA`);

--
-- Indices de la tabla `datos_delitos_adojc`
--
ALTER TABLE `datos_delitos_adojc`
  ADD PRIMARY KEY (`CAUSA_CLAVE`,`DELITO_CLAVE`),
  ADD KEY `FK_DELITOCODIGOPENAL` (`DELITO_CODIGO_PENAL`),
  ADD KEY `FK_DELITORECLASIFICADO` (`DELITO_RECLASIFICADO`),
  ADD KEY `FK_DELITOS_CALIFICACION` (`CALIFICACION`),
  ADD KEY `FK_DELITOS_CLASIFICACION` (`CLASIFICACION`),
  ADD KEY `FK_DELITOS_CONSUMACION` (`GRADO_CONSUMACION`),
  ADD KEY `FK_DELITOS_ENTIDADES` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_DELITOS_FORMAACCION` (`FORMA_ACCION`),
  ADD KEY `FK_DELITOS_ISNTRUMENTOCOMISION` (`INSTRUMENTO_COMISION`),
  ADD KEY `FK_DELITOS_MODALIDAD` (`MODALIDAD`),
  ADD KEY `FK_DELITOS_MUNICIPIOS` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_DELITOS_NORMATECNICA` (`DELITO_NORMA_TECNICA`),
  ADD KEY `FK_DELITOS_OCURRIOENTIDAD` (`OCURRIO_ENTIDAD`),
  ADD KEY `FK_DELITOS_OCURRIO_MUNICIPIO` (`OCURRIO_MUNICIPIO`),
  ADD KEY `FK_DELITOS_SITIOOCURERENCIA` (`SITIO_OCURRENCIA`),
  ADD KEY `FK_DELITOS_TIPOFUERO` (`TIPO_FUERO`),
  ADD KEY `FK_DELITOS_CONCURSO` (`CONCURSO`),
  ADD KEY `FK_DELITOS_COMISION` (`FORMA_COMISION`);

--
-- Indices de la tabla `datos_delitos_adojo`
--
ALTER TABLE `datos_delitos_adojo`
  ADD PRIMARY KEY (`CAUSA_CLAVEJO`,`DELITO_CLAVEJO`),
  ADD KEY `FK_DELI_ENTIDADESJO` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_DELI_CODIGOPENALJO` (`DELITO_CODIGO_PENAL`),
  ADD KEY `FK_DELI_NORMATECNICAJO` (`DELITO_NORMA_TECNICA`),
  ADD KEY `FK_DELI_TIPOFUEROJO` (`TIPO_FUERO`),
  ADD KEY `FK_DELI_RECLASIFICADOJO` (`DELITO_RECLASIFICADO`),
  ADD KEY `FK_DELI_SITIOOCURRENCIA` (`SITIO_OCURRENCIA`),
  ADD KEY `FK_DELI_CONSUMACIONJO` (`GRADO_CONSUMACION`),
  ADD KEY `FK_DELI_CALIFICACIONJO` (`CALIFICACION`),
  ADD KEY `FK_DELI_CLASIFICACIONJO` (`CLASIFICACION`),
  ADD KEY `FK_DELI_CONCURSOJO` (`CONCURSO`),
  ADD KEY `FK_DELI_FORMACOMISIONJO` (`FORMA_COMISION`),
  ADD KEY `FK_DELI_FORMAACCIONJO` (`FORMA_ACCION`),
  ADD KEY `FK_DELI_MODALIDAD` (`MODALIDAD`),
  ADD KEY `FK_DELI_INSTRUMENTOSJO` (`INSTRUMENTO_COMISION`),
  ADD KEY `FK_DELI_OCURRIOENTIJO` (`OCURRIO_ENTIDAD`),
  ADD KEY `FK_DELI_OCURRIOMUNJO` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_DELITO_CLAVEJC` (`CAUSA_CLAVEJC`,`DELITO_CLAVEJC`);

--
-- Indices de la tabla `datos_dhomicidio_adojc`
--
ALTER TABLE `datos_dhomicidio_adojc`
  ADD PRIMARY KEY (`CAUSA_CLAVE`,`DELITO_CLAVE`,`CONTEXTO_SITUACIONAL`),
  ADD KEY `FK_DHOMCIDIO_CSITUACIONAL` (`CONTEXTO_SITUACIONAL`),
  ADD KEY `FK_DHOMICIDIOS_ENTIDADES` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_DHOMICIDIO_MUNICIPIOS` (`JUZGADO_MUNICIPIO_ID`);

--
-- Indices de la tabla `datos_dhomicidio_adojo`
--
ALTER TABLE `datos_dhomicidio_adojo`
  ADD PRIMARY KEY (`CAUSA_CLAVEJO`,`DELITO_CLAVE`,`CONTEXTO_SITUACIONAL`),
  ADD KEY `FK_DHOMI_ENTIDADJO` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_DHOMI_MUNICIPIOJO` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_DHOMI_CONTEXTOSITUAJO` (`CONTEXTO_SITUACIONAL`);

--
-- Indices de la tabla `datos_drobo_adojc`
--
ALTER TABLE `datos_drobo_adojc`
  ADD PRIMARY KEY (`CAUSA_CLAVE`,`DELITO_CLAVE`,`TIPO_COSA_ROBADA`),
  ADD KEY `FK_DROBOS_MUNICIPIO` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_DROBO_COSAROBADA` (`TIPO_COSA_ROBADA`),
  ADD KEY `FK_DROBO_ENTIDADES` (`JUZGADO_ENTIDAD_ID`);

--
-- Indices de la tabla `datos_drobo_adojo`
--
ALTER TABLE `datos_drobo_adojo`
  ADD PRIMARY KEY (`CAUSA_CLAVEJO`,`DELITO_CLAVE`,`TIPO_COSA_ROBADA`),
  ADD KEY `FK_DROBO_ENTIDADJO` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_DROBO_MUNICIPIOJO` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_DROBO_COSAROBADAJO` (`TIPO_COSA_ROBADA`);

--
-- Indices de la tabla `datos_etapa_inicial_adojc`
--
ALTER TABLE `datos_etapa_inicial_adojc`
  ADD PRIMARY KEY (`CAUSA_CLAVE`,`PROCESADO_CLAVE`),
  ADD KEY `FK_EINICIAL_FACUSACION` (`FORMULO_ACUSACION`),
  ADD KEY `FK_ESTAPAINICIAL_PCONSTITUCIONAL` (`PLAZO_CONSTITUCIONAL`),
  ADD KEY `FK_ETAPAINCIAL_CAUSASUSPENSION` (`CAUSA_SUSPENSION_PROCESO`),
  ADD KEY `FK_ETAPAINCIAL_CINVCOMPLEMENTARIA` (`INVESTIGACION_COMPLEMENTARIA`),
  ADD KEY `FK_ETAPAINCIAL_SUSPENSIONP` (`SUSPENSION_PROCESO`),
  ADD KEY `FK_ETAPAINICIAL_AUTOVINCULACION` (`AUTO_VINCULACION`),
  ADD KEY `FK_ETAPAINICIAL_CELEBRACION` (`AUDIENCIA_INICIAL`),
  ADD KEY `FK_ETAPAINICIAL_CTRLDETENCION` (`CTRL_DETENCION`),
  ADD KEY `FK_ETAPAINICIAL_DETENCIONLEGAL` (`DETENCION_LEGAL`),
  ADD KEY `FK_ETAPAINICIAL_ENTIDADES` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_ETAPAINICIAL_FORMIMPUTACION` (`FORMULACION_IMPUTACION`),
  ADD KEY `FK_ETAPAINICIAL_IMPUTADODECLARO` (`IMPUTADO_DECLARO`),
  ADD KEY `FK_ETAPAINICIAL_MEDIDACAUTELAR` (`IMPUSO_MCAUTELARES`),
  ADD KEY `FK_ETAPAINICIAL_MUNICIPIOS` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_ETAPAINICIAL_PCIERRE` (`PLAZO_CIERRE_INVESTIGACION`),
  ADD KEY `FK_ETAPAINICIAL_PCONSTITUCIONAL` (`TIEMPO_PLAZO`),
  ADD KEY `FK_ETAPAINICIAL_PRORROGAPCIERRE` (`PRORROGA_PLAZO_CIERRE`),
  ADD KEY `FK_ETAPAINICIAL_REAPERTURA` (`SOLICITO_REAPERTURA`),
  ADD KEY `FK_ETAPAINICIAL_REAPERTURA_PRO` (`REAPERTURA_PROCESO`),
  ADD KEY `FK_ETAPAINICIAL_SOBRESEIMIENTOCAUSAP` (`SOBRESEIMIENTO_CAUSAP`),
  ADD KEY `FK_ETAPAINICIAL_ETAPAS` (`ETAPA`);

--
-- Indices de la tabla `datos_etapa_intermedia_adojc`
--
ALTER TABLE `datos_etapa_intermedia_adojc`
  ADD PRIMARY KEY (`CAUSA_CLAVE`,`PROCESADO_CLAVE`),
  ADD KEY `FK_EINTERMEDIA_AINTERMEDIA` (`AUDIENCIA_INTERMEDIA`),
  ADD KEY `FK_EINTERMEDIA_AJUICIOORAL` (`APERTURA_JUICIO_ORAL`),
  ADD KEY `FK_EINTERMEDIA_APROBATORIOS` (`ACUERDOS_PROBATORIOS`),
  ADD KEY `FK_EINTERMEDIA_DPROBATORIO` (`DESCUBRIMIENTO_PROBATORIO`),
  ADD KEY `FK_EINTERMEDIA_ENTIDADES` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_EINTERMEDIA_MP_MP` (`PRESENTA_MP_MINISTERIO`),
  ADD KEY `FK_EINTERMEDIA_MUNICIPIOS` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_EINTERMEDIA_PMPRUEBA` (`PRESENTACION_MPRUEBA`),
  ADD KEY `FK_EINTERMEDIA_PRESENTA_MP_ASESOR` (`PRESENTA_MP_ASESOR`),
  ADD KEY `FK_EINTERMEDIA_PRESENTA_MP_DEFENSA` (`PRESENTA_MP_DEFENSA`),
  ADD KEY `FK_EINTERMEDIA_SACUSACION` (`SEPARACION_ACUSACION`);

--
-- Indices de la tabla `datos_etapa_oral_adojo`
--
ALTER TABLE `datos_etapa_oral_adojo`
  ADD PRIMARY KEY (`CAUSA_CLAVEJO`,`PROCESADO_CLAVE`),
  ADD KEY `FK_EORAL_ENTIDADJO` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_EORAL_MUNICIPIOJO` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_EORAL_DISCIPLINARIASJO` (`MEDIDAS_DISCIPLINARIAS`),
  ADD KEY `FK_EORAL_TIPODISCIPLIJO` (`TIPO_DISCIPLINARIA`),
  ADD KEY `FK_EORAL_HUBOINCIDENTEJO` (`INCIDENTES_AUDIENCIA`),
  ADD KEY `FK_EORAL_PROMUEVEINCJO` (`PROMUEVE_INCIDENTE`),
  ADD KEY `FK_EORAL_SUSPENCIONAUDIJO` (`SUSPENCION_AUDIENCIA`),
  ADD KEY `FK_EORAL_DELIBERACIONJO` (`DELIBERACION`),
  ADD KEY `FK_EORAL_SENTIDOJO` (`SENTIDO_FALLO`),
  ADD KEY `FK_EORAL_TESTIMONIALJO` (`PD_TESTIMONIAL`),
  ADD KEY `FK_EORAL_PERICIALJO` (`PD_PERICIAL`),
  ADD KEY `FK_EORAL_DACUSADOJO` (`PD_DECLARACION_ACUSADO`),
  ADD KEY `FK_EORAL_DOCMATERIALJO` (`PD_DOCUMENTAL_MATERIAL`),
  ADD KEY `FK_EORAL_OTRAPRUEBAJO` (`PD_OTRA_PRUEBA`),
  ADD KEY `FK_ETAPAS` (`ETAPA`);

--
-- Indices de la tabla `datos_informe_adojc`
--
ALTER TABLE `datos_informe_adojc`
  ADD PRIMARY KEY (`JUZGADO_CLAVE`);

--
-- Indices de la tabla `datos_jueces_adojc`
--
ALTER TABLE `datos_jueces_adojc`
  ADD PRIMARY KEY (`JUZGADO_CLAVE`,`JUEZ_CLAVE`) USING BTREE,
  ADD KEY `FK_JUECES_EDAD` (`EDAD`),
  ADD KEY `FK_JUECES_ESTUDIOPROF` (`GRADO_ESTUDIOS`),
  ADD KEY `FK_JUECES_FUNCION` (`FUNCION_DESEMPENA`),
  ADD KEY `FK_JUECES_SEXO` (`SEXO`);

--
-- Indices de la tabla `datos_juzgados_adojc`
--
ALTER TABLE `datos_juzgados_adojc`
  ADD PRIMARY KEY (`JUZGADO_CLAVE`),
  ADD KEY `FK_ASENTAMIENTOHUMANO` (`ASENTAMIENTO_HUMANO`),
  ADD KEY `FK_FUNCION_JUZGADO` (`JUZGADO_FUNCION`),
  ADD KEY `FK_JURISDICCION` (`JUZGADO_JURISDICCION`),
  ADD KEY `FK_JUZGADOS_MUNICIPIOS` (`MUNICIPIO`),
  ADD KEY `FK_JUZGADOS_VIALIDAD` (`TIPO_VIALIDAD`),
  ADD KEY `FK_JUZGADO_ENTIDADES` (`ENTIDAD`),
  ADD KEY `FK_JUZGADO_FORMADIVISION` (`FORMA_DIVISION`),
  ADD KEY `FK_JUZGADO_NUMERO` (`JUZGADO_NUMERO`);

--
-- Indices de la tabla `datos_pdelitos_adojc`
--
ALTER TABLE `datos_pdelitos_adojc`
  ADD PRIMARY KEY (`CAUSA_CLAVE`,`PROCESADO_CLAVE`,`DELITO_CLAVE`),
  ADD KEY `FK_PDELITOS_DELITOS` (`CAUSA_CLAVE`,`DELITO_CLAVE`),
  ADD KEY `FK_PDELITOS_ENTIDADES` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_PDELITOS_MUNICIPIOS` (`JUZGADO_MUNICIPIO_ID`);

--
-- Indices de la tabla `datos_pdelitos_adojo`
--
ALTER TABLE `datos_pdelitos_adojo`
  ADD PRIMARY KEY (`CAUSA_CLAVEJO`,`PROCESADO_CLAVE`,`DELITO_CLAVE`),
  ADD KEY `FK_PDELI_ENTIDADJO` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_PDELI_MUNICIPIOJO` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_PDELI_DELITOCLAVEJO` (`CAUSA_CLAVEJO`,`DELITO_CLAVE`);

--
-- Indices de la tabla `datos_pfuente_ingresos_adojc`
--
ALTER TABLE `datos_pfuente_ingresos_adojc`
  ADD PRIMARY KEY (`CAUSA_CLAVE`,`PROCESADO_CLAVE`,`INGRESO`),
  ADD KEY `FK_PFUENTE_ENTIDADES` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_PFUENTE_FINGRESOS` (`INGRESO`),
  ADD KEY `FK_PFUENTE_MUNICIPIOS` (`JUZGADO_MUNICIPIO_ID`);

--
-- Indices de la tabla `datos_pfuente_ingresos_adojo`
--
ALTER TABLE `datos_pfuente_ingresos_adojo`
  ADD PRIMARY KEY (`CAUSA_CLAVEJO`,`PROCESADO_CLAVE`,`INGRESO`),
  ADD KEY `FK_PFUENT_ENTIDADJO` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_PFUENT_MUNICIPIOJO` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_PFUENT_INGRESOSJO` (`INGRESO`);

--
-- Indices de la tabla `datos_pmedidas_adojc`
--
ALTER TABLE `datos_pmedidas_adojc`
  ADD PRIMARY KEY (`CAUSA_CLAVE`,`PROCESADO_CLAVE`,`CAUTELARES`,`SOLICITA_MEDIDA`) USING BTREE,
  ADD KEY `FK_PMEDIDAS_ENTIDADES` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_PMEDIDAS_MCAUTELARES` (`CAUTELARES`),
  ADD KEY `FK_PMEDIDAS_MUNICIPIOS` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_PMEDIDAS_SOLICITA` (`SOLICITA_MEDIDA`),
  ADD KEY `FK_PMEDIDAS_DURACION` (`DURACION_MEDIDA`);

--
-- Indices de la tabla `datos_presenta_mp_adojc`
--
ALTER TABLE `datos_presenta_mp_adojc`
  ADD PRIMARY KEY (`CAUSA_CLAVE`,`PROCESADO_CLAVE`,`FIGURA_MPRUEBA`,`MEDIO_PRUEBA_ID`) USING BTREE,
  ADD KEY `FK_MEDIOPRUEBA_ENTIDADES` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_MEDIOPRUEBA_FIGURA` (`FIGURA_MPRUEBA`),
  ADD KEY `FK_MEDIOPRUEBA_MUNICIPIOS` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_MEDIOPRUEBA_RESOLUCION` (`MEDIO_PRUEBA_ID`);

--
-- Indices de la tabla `datos_procesados_adojc`
--
ALTER TABLE `datos_procesados_adojc`
  ADD PRIMARY KEY (`CAUSA_CLAVE`,`PROCESADO_CLAVE`),
  ADD KEY `FK_PORCESADOS_NACIMIENTOENTIDADES` (`NACIMIENTO_ENTIDAD`),
  ADD KEY `FK_PORCESADOS_NACIMIENTOMUNICIPIO` (`NACIMIENTO_MUNICIPIO`),
  ADD KEY `FK_PORCESADOS_PSICOFISICO` (`ESTADO_PSICOFISICO`),
  ADD KEY `FK_PORCESADOS_RINGRESOS` (`RANGO_INGRESOS`),
  ADD KEY `FK_PROCESADOSLINGUISTICAS` (`FAMILIA_LINGUISTICA`),
  ADD KEY `FK_PROCESADOS_ALFABETISMO` (`CONDICION_ALFABETISMO`),
  ADD KEY `FK_PROCESADOS_CONDICIONACTIVIDAD` (`CONDICION_ACTIVIDAD`),
  ADD KEY `FK_PROCESADOS_CONDICIONESTUDIANTE` (`CONDICION_ESTUDIANTE`),
  ADD KEY `FK_PROCESADOS_CONSIGNACION` (`INICIO_IMPUTADO`),
  ADD KEY `FK_PROCESADOS_DISCAPACIDAD` (`DISCAPACIDAD`),
  ADD KEY `FK_PROCESADOS_DOMINIOESPANOL` (`HABLA_ESPANOL`),
  ADD KEY `FK_PROCESADOS_EDAD` (`EDAD`),
  ADD KEY `FK_PROCESADOS_ENTIDADES` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_PROCESADOS_FORMACONDUCCION` (`FORMA_CONDUCCION`),
  ADD KEY `FK_PROCESADOS_GRADOESTUDIOS` (`ULTIMO_GRADO_ESTUDIOS`),
  ADD KEY `FK_PROCESADOS_GRADOPARTICIPACION` (`GRADO_PARTICIPACION`),
  ADD KEY `FK_PROCESADOS_HABLAINDIGENA` (`HABLA_INDIGENA`),
  ADD KEY `FK_PROCESADOS_INTERPRETE` (`INTERPRETE`),
  ADD KEY `FK_PROCESADOS_LENGUAEXTRANJERA` (`LENGUA_EXTRANJERA`),
  ADD KEY `FK_PROCESADOS_MUNICIPIOS` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_PROCESADOS_NACIMIENTOPAIS` (`NACIMIENTO_PAIS`),
  ADD KEY `FK_PROCESADOS_NACIONALIDAD` (`NACIONALIDAD`),
  ADD KEY `FK_PROCESADOS_OCUPACION` (`OCUPACION`),
  ADD KEY `FK_PROCESADOS_PERCIBEINGRESO` (`INGRESOS`),
  ADD KEY `FK_PROCESADOS_POBLACIONINDIGENA` (`POBLACION_INDIGENA`),
  ADD KEY `FK_PROCESADOS_PUEBLOINDIGENA` (`TIPO_PUEBLO_INDIGENA`),
  ADD KEY `FK_PROCESADOS_REINCIDENCIA` (`REINCIDENCIA`),
  ADD KEY `FK_PROCESADOS_REPRESENTANTELEGAL` (`PERSONA_RESPONSABLE`),
  ADD KEY `FK_PROCESADOS_RESIDENCIA_ENTIDADES` (`RESIDENCIA_ENTIDAD`),
  ADD KEY `FK_PROCESADOS_RESIDENCIA_MUNICIPIOS` (`RESIDENCIA_MUNICIPIO`),
  ADD KEY `FK_PROCESADOS_RESIDENCIA_PAIS` (`RESIDENCIA_PAIS`),
  ADD KEY `FK_PROCESADOS_SEXO` (`SEXO`),
  ADD KEY `FK_PROCESADOS_SITUACIONCONYUGAL` (`ESTADO_CIVIL`),
  ADD KEY `FK_PROCESADOS_TIPODEFENSOR` (`TIPO_DEFENSOR`),
  ADD KEY `FK_PROCESADOS_TIPODETENCION` (`TIPO_DETENCION`),
  ADD KEY `FK_PROCESADO_PERTENECEGPODELICTIVO` (`DELICTIVO`);

--
-- Indices de la tabla `datos_procesados_adojo`
--
ALTER TABLE `datos_procesados_adojo`
  ADD PRIMARY KEY (`CAUSA_CLAVEJO`,`PROCESADO_CLAVEJO`),
  ADD KEY `FK_PRO_ENTIDADJO` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_PRO_SEXOJO` (`SEXO`),
  ADD KEY `FK_PRO_EDADJO` (`EDAD`),
  ADD KEY `FK_PRO_NACIMIENTOPAISJO` (`NACIMIENTO_PAIS`),
  ADD KEY `FK_PRO_NACIENTIDADJO` (`NACIMIENTO_ENTIDAD`),
  ADD KEY `FK_PRO_NACIMUNICIPIOJO` (`NACIMIENTO_MUNICIPIO`),
  ADD KEY `FK_PRO_NACIONALIDADJO` (`NACIONALIDAD`),
  ADD KEY `FK_PRO_RESIDENCIAPAISJO` (`RESIDENCIA_PAIS`),
  ADD KEY `FK_PRO_RESIENTIDADJO` (`RESIDENCIA_ENTIDAD`),
  ADD KEY `FK_PRO_RESIMUNICIPIOJO` (`RESIDENCIA_MUNICIPIO`),
  ADD KEY `FK_PRO_EDOCIVILJO` (`ESTADO_CIVIL`),
  ADD KEY `FK_PRO_DISCAPACIDADJO` (`DISCAPACIDAD`),
  ADD KEY `FK_PRO_ALFABETISMOJO` (`CONDICION_ALFABETISMO`),
  ADD KEY `FK_PRO_ESTUDIOSJO` (`ULTIMO_GRADO_ESTUDIOS`),
  ADD KEY `FK_PRO_CONDICIONESTUJO` (`CONDICION_ESTUDIANTE`),
  ADD KEY `FK_PRO_ESPANIOLJO` (`HABLA_ESPANOL`),
  ADD KEY `FK_PRO_POBLAINDIGENAJO` (`POBLACION_INDIGENA`),
  ADD KEY `FK_PRO_PUEBLOINDIGEJO` (`TIPO_PUEBLO_INDIGENA`),
  ADD KEY `FK_PRO_HABLAINDIGENAJO` (`HABLA_INDIGENA`),
  ADD KEY `FK_PRO_FAMILIALINJO` (`FAMILIA_LINGUISTICA`),
  ADD KEY `FK_PRO_LENGUAEXTRANJO` (`LENGUA_EXTRANJERA`),
  ADD KEY `FK_PRO_INTERPRETEJO` (`INTERPRETE`),
  ADD KEY `FK_PRO_INGRESOSJO` (`INGRESOS`),
  ADD KEY `FK_PRO_RANGOINGRESOJO` (`RANGO_INGRESOS`),
  ADD KEY `FK_PRO_OCUPACIONJO` (`OCUPACION`),
  ADD KEY `FK_PRO_ACTIVIDADJO` (`CONDICION_ACTIVIDAD`),
  ADD KEY `FK_PRO_PARTICIPACIONJO` (`GRADO_PARTICIPACION`),
  ADD KEY `FK_PRO_REINCIDENCIAJO` (`REINCIDENCIA`),
  ADD KEY `FK_PRO_PSICOFISICOJO` (`ESTADO_PSICOFISICO`),
  ADD KEY `FK_PRO_DELICTIVOJO` (`DELICTIVO`),
  ADD KEY `FK_PRO_DEFENSORJO` (`TIPO_DEFENSOR`),
  ADD KEY `FK_PRO_RESPONSABLEJO` (`PERSONA_RESPONSABLE`),
  ADD KEY `FK_PROCESADO_CLAVEJC` (`CAUSA_CLAVEJC`,`PROCESADO_CLAVEJC`);

--
-- Indices de la tabla `datos_tramites_adojc`
--
ALTER TABLE `datos_tramites_adojc`
  ADD PRIMARY KEY (`CAUSA_CLAVE`,`PROCESADO_CLAVE`),
  ADD KEY `FK_TRAMITES_ENTIDADES` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_TRAMITES_EPROCESAL` (`ETAPA_PROCESAL`),
  ADD KEY `FK_TRAMITES_MUNICIPIOS` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_TRAMITE_ESTATUSINTERMEDIA` (`ESTATUS_INTERMEDIA`),
  ADD KEY `FK_TRAMITE_INVESTIGACION` (`ESTATUS_INVESTIGACION`);

--
-- Indices de la tabla `datos_tramites_adojo`
--
ALTER TABLE `datos_tramites_adojo`
  ADD PRIMARY KEY (`CAUSA_CLAVEJO`,`PROCESADO_CLAVE`),
  ADD KEY `FK_TRAM_ENTIDADJO` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_TRAM_MUNICIPIOJO` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_TRAM_ESTATUSJO` (`ESTATUS`);

--
-- Indices de la tabla `datos_vdelitos_adojc`
--
ALTER TABLE `datos_vdelitos_adojc`
  ADD PRIMARY KEY (`CAUSA_CLAVE`,`VICTIMA_CLAVE`,`DELITO_CLAVE`),
  ADD KEY `FK_VDELITOS_DELITOS` (`CAUSA_CLAVE`,`DELITO_CLAVE`),
  ADD KEY `FK_VDELITOS_ENTIDADES` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_VDELITOS_MUNICIPIOS` (`JUZGADO_MUNICIPIO_ID`);

--
-- Indices de la tabla `datos_vdelitos_adojo`
--
ALTER TABLE `datos_vdelitos_adojo`
  ADD PRIMARY KEY (`CAUSA_CLAVEJO`,`VICTIMA_CLAVE`,`DELITO_CLAVE`),
  ADD KEY `FK_VDELI_ENTIDADJO` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_VDELI_MUNICIPIOJO` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_VDELI_DELITOCLAVEJO` (`CAUSA_CLAVEJO`,`DELITO_CLAVE`);

--
-- Indices de la tabla `datos_vfuente_ingresos_adojc`
--
ALTER TABLE `datos_vfuente_ingresos_adojc`
  ADD PRIMARY KEY (`CAUSA_CLAVE`,`VICTIMA_CLAVE`,`INGRESO`),
  ADD KEY `FK_VFUENTE_ENTIDADES` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_VFUENTE_INGRESOS` (`INGRESO`),
  ADD KEY `FK_VFUENTE_MUNICIPIOS` (`JUZGADO_MUNICIPIO_ID`);

--
-- Indices de la tabla `datos_vfuente_ingresos_adojo`
--
ALTER TABLE `datos_vfuente_ingresos_adojo`
  ADD PRIMARY KEY (`CAUSA_CLAVEJO`,`VICTIMA_CLAVE`,`INGRESO`),
  ADD KEY `FK_VFUENT_ENTIDADJO` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_VFUENT_MUNICIPIOJO` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_VFUENT_INGRESO` (`INGRESO`);

--
-- Indices de la tabla `datos_victimas_adojc`
--
ALTER TABLE `datos_victimas_adojc`
  ADD PRIMARY KEY (`CAUSA_CLAVE`,`VICTIMA_CLAVE`),
  ADD KEY `FK_VICITIMAS_NACIONALIDAD` (`NACIONALIDAD`),
  ADD KEY `FK_VICITIMAS_RANGOINGRESOS` (`RANGO_INGRESOS`),
  ADD KEY `FK_VICITMAS_ENTIDADESNAC` (`NACIMIENTO_ENTIDAD`),
  ADD KEY `FK_VICTIMAS_ALFABETISMO` (`CONDICION_ALFABETISMO`),
  ADD KEY `FK_VICTIMAS_ASESOR` (`ASESOR`),
  ADD KEY `FK_VICTIMAS_CONTOASESOR` (`CONTO_ASESOR`),
  ADD KEY `FK_VICTIMAS_DOMINIOESPANIOL` (`HABLA_ESPANOL`),
  ADD KEY `FK_VICTIMAS_EDAD` (`EDAD`),
  ADD KEY `FK_VICTIMAS_EDOCIVIL` (`ESTADO_CIVIL`),
  ADD KEY `FK_VICTIMAS_ENTIDADES` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_VICTIMAS_ENTIDADRESID` (`RESIDENCIA_ENTIDAD`),
  ADD KEY `FK_VICTIMAS_GRADOESTUDIOS` (`GRADO_ESTUDIOS`),
  ADD KEY `FK_VICTIMAS_HABLAINDIGENA` (`HABLA_INDIGENA`),
  ADD KEY `FK_VICTIMAS_INGRESOS` (`INGRESOS`),
  ADD KEY `FK_VICTIMAS_INTERPRETE` (`INTERPRETE`),
  ADD KEY `FK_VICTIMAS_LENGUAEXTRANJERA` (`LENGUA_EXTRANJERA`),
  ADD KEY `FK_VICTIMAS_LENGUAINDIGENA` (`LENGUA_INDIGENA`),
  ADD KEY `FK_VICTIMAS_MMUJER` (`MEDIDAS_MUJER`),
  ADD KEY `FK_VICTIMAS_MPORTECCION` (`MEDIDAS_PROTECCION`),
  ADD KEY `FK_VICTIMAS_MUNICIPIONAC` (`NACIMIENTO_MUNICIPIO`),
  ADD KEY `FK_VICTIMAS_MUNICIPIOS` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_VICTIMAS_MUNICIPIOSRESID` (`RESIDENCIA_MUNICIPIO`),
  ADD KEY `FK_VICTIMAS_OCUPACION` (`OCUPACION`),
  ADD KEY `FK_VICTIMAS_PAISNAC` (`NACIMIENTO_PAIS`),
  ADD KEY `FK_VICTIMAS_PAISRESID` (`RESIDENCIA_PAIS`),
  ADD KEY `FK_VICTIMAS_SEXO` (`SEXO`),
  ADD KEY `FK_VICTIMAS_TVICTIMA` (`TIPO_VICTIMA`),
  ADD KEY `FK_VICTIMAS_VMORAL` (`TIPO_VICTIMA_MORAL`),
  ADD KEY `FK_VICTIMAS_VULNERABILIDAD` (`VULNERABILIDAD`);

--
-- Indices de la tabla `datos_victimas_adojo`
--
ALTER TABLE `datos_victimas_adojo`
  ADD PRIMARY KEY (`CAUSA_CLAVEJO`,`VICTIMA_CLAVEJO`),
  ADD KEY `FK_VICT_ENTIDADJO` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_VICT_MUNICIPIOJO` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_VICT_TIPOVICTIMAJO` (`TIPO_VICTIMA`),
  ADD KEY `FK_VICT_VICTMORALJO` (`TIPO_VICTIMA_MORAL`),
  ADD KEY `FK_VICT_CONTOASESORJO` (`CONTO_ASESOR`),
  ADD KEY `FK_VICT_ASESORJO` (`ASESOR`),
  ADD KEY `FK_VICT_SEXOJO` (`SEXO`),
  ADD KEY `FK_VICT_EDADJO` (`EDAD`),
  ADD KEY `FK_VICT_VULNERABLEJO` (`VULNERABILIDAD`),
  ADD KEY `FK_VICT_NACIMTOPAISJO` (`NACIMIENTO_PAIS`),
  ADD KEY `FK_VICT_NACIMTOENTIDADJO` (`NACIMIENTO_ENTIDAD`),
  ADD KEY `FK_VICT_NACMUNICIPIOJO` (`NACIMIENTO_MUNICIPIO`),
  ADD KEY `FK_VICT_NACIONALIDADJO` (`NACIONALIDAD`),
  ADD KEY `FK_VICT_RESIDENPAISJO` (`RESIDENCIA_PAIS`),
  ADD KEY `FK_VICT_RESIENTIDADJO` (`RESIDENCIA_ENTIDAD`),
  ADD KEY `FK_VICT_RESIMUNICIPIOJO` (`RESIDENCIA_MUNICIPIO`),
  ADD KEY `FK_VICT_EDOCIVILJO` (`ESTADO_CIVIL`),
  ADD KEY `FK_VICT_ALFABETISMOJO` (`CONDICION_ALFABETISMO`),
  ADD KEY `FK_VICT_ESTUDIOSJO` (`GRADO_ESTUDIOS`),
  ADD KEY `FK_VICT_ESPANIOLJO` (`HABLA_ESPANOL`),
  ADD KEY `FK_VICT_HABLAINDIGENAJO` (`HABLA_INDIGENA`),
  ADD KEY `FK_VICT_LENGUAINDIGENAJO` (`LENGUA_INDIGENA`),
  ADD KEY `FK_VICT_HABLAEXTRAGERAJO` (`LENGUA_EXTRANJERA`),
  ADD KEY `FK_VICT_INTERPRETE` (`INTERPRETE`),
  ADD KEY `FK_VICT_INGRESOSJO` (`INGRESOS`),
  ADD KEY `FK_VICT_RANGOINGRESOSJO` (`RANGO_INGRESOS`),
  ADD KEY `FK_VICT_OCUPACIONJO` (`OCUPACION`),
  ADD KEY `FK_VICTIMA_CLAVEJC` (`CAUSA_CLAVEJC`,`VICTIMA_CLAVEJC`);

--
-- Indices de la tabla `datos_vmedidas_adojc`
--
ALTER TABLE `datos_vmedidas_adojc`
  ADD PRIMARY KEY (`CAUSA_CLAVE`,`VICTIMA_CLAVE`,`TIPO_MEDIDA_PROT`),
  ADD KEY `FK_VMEDIDAS_ENTIDADES` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_VMEDIDAS_MPROTECCION` (`TIPO_MEDIDA_PROT`),
  ADD KEY `FK_VMEDIDAS_MUNICIPIOS` (`JUZGADO_MUNICIPIO_ID`);

--
-- Indices de la tabla `datos_vmedidas_dmuj_adojc`
--
ALTER TABLE `datos_vmedidas_dmuj_adojc`
  ADD PRIMARY KEY (`CAUSA_CLAVE`,`VICTIMA_CLAVE`,`TIPO_MEDIDA_MUJER`),
  ADD KEY `FK_VMED_DMUJ_ENTIDADES` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_VMED_DMUJ_MEDIDAS` (`TIPO_MEDIDA_MUJER`),
  ADD KEY `FK_VMED_DMUJ_MUNICIPIOS` (`JUZGADO_MUNICIPIO_ID`);

--
-- Indices de la tabla `datos_vprocesados_adojc`
--
ALTER TABLE `datos_vprocesados_adojc`
  ADD PRIMARY KEY (`CAUSA_CLAVE`,`PROCESADO_CLAVE`,`VICTIMA_CLAVE`,`RELACION`),
  ADD KEY `FK_VPROCESADOS_ENTIDADES` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_VPROCESADOS_MUNICIPIOS` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_VPROCESADOS_RIMPUTADO` (`RELACION`),
  ADD KEY `FK_VPROCESADOS_VICTIMAS` (`CAUSA_CLAVE`,`VICTIMA_CLAVE`);

--
-- Indices de la tabla `datos_vprocesados_adojo`
--
ALTER TABLE `datos_vprocesados_adojo`
  ADD PRIMARY KEY (`CAUSA_CLAVEJO`,`PROCESADO_CLAVE`,`VICTIMA_CLAVE`,`RELACION`),
  ADD KEY `FK_VPRO_ENTIDADJO` (`JUZGADO_ENTIDAD_ID`),
  ADD KEY `FK_VPRO_MUNICIPIOJO` (`JUZGADO_MUNICIPIO_ID`),
  ADD KEY `FK_VPRO_VICTIMACLAVEJO` (`CAUSA_CLAVEJO`,`VICTIMA_CLAVE`),
  ADD KEY `FK_VPRO_RELACIONJO` (`RELACION`);

--
-- Indices de la tabla `tipo_usuarios`
--
ALTER TABLE `tipo_usuarios`
  ADD PRIMARY KEY (`TIPO_USUARIO_ID`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`USUARIO_ID`),
  ADD KEY `FK_USUARIO_TIPO_USUARIO` (`TIPO_USUARIO`),
  ADD KEY `FK_USUARIO_ENTIDAD` (`ENTIDAD`);

--
-- Indices de la tabla `usuarios_control`
--
ALTER TABLE `usuarios_control`
  ADD PRIMARY KEY (`CAUSA_CLAVE`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `USUARIO_ID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `datos_audiencias_adojc`
--
ALTER TABLE `datos_audiencias_adojc`
  ADD CONSTRAINT `FK_AUDI_CAUSACLAVE` FOREIGN KEY (`CAUSA_CLAVE`) REFERENCES `datos_causas_penales_adojc` (`CAUSA_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_AUDI_ENTIDADES` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_AUDI_INVESTIGACION` FOREIGN KEY (`AUDIENCIA_INVESTIGACION`) REFERENCES `catalogos_audiencias_investigacion` (`AUDIENCIA_ID`),
  ADD CONSTRAINT `FK_AUDI_JUEZ1` FOREIGN KEY (`JUZGADO_CLAVE`,`JUEZ_CLAVE1`) REFERENCES `datos_jueces_adojc` (`JUZGADO_CLAVE`, `JUEZ_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_AUDI_JUEZ2` FOREIGN KEY (`JUZGADO_CLAVE`,`JUEZ_CLAVE2`) REFERENCES `datos_jueces_adojc` (`JUZGADO_CLAVE`, `JUEZ_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_AUDI_JUEZ3` FOREIGN KEY (`JUZGADO_CLAVE`,`JUEZ_CLAVE3`) REFERENCES `datos_jueces_adojc` (`JUZGADO_CLAVE`, `JUEZ_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_AUDI_JUZGADOCLAVE` FOREIGN KEY (`JUZGADO_CLAVE`) REFERENCES `datos_juzgados_adojc` (`JUZGADO_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_AUDI_MUNICIPIOS` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`);

--
-- Filtros para la tabla `datos_audiencias_adojo`
--
ALTER TABLE `datos_audiencias_adojo`
  ADD CONSTRAINT `FK_AUDI_CAUSACLAVEJO` FOREIGN KEY (`CAUSA_CLAVEJO`) REFERENCES `datos_causas_penales_adojo` (`CAUSA_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_AUDI_ENTIDADJO` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_AUDI_JUEZ1JO` FOREIGN KEY (`JUZGADO_CLAVE`,`JUEZ_CLAVE1`) REFERENCES `datos_jueces_adojc` (`JUZGADO_CLAVE`, `JUEZ_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_AUDI_JUEZ2JO` FOREIGN KEY (`JUZGADO_CLAVE`,`JUEZ_CLAVE2`) REFERENCES `datos_jueces_adojc` (`JUZGADO_CLAVE`, `JUEZ_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_AUDI_JUEZ3JO` FOREIGN KEY (`JUZGADO_CLAVE`,`JUEZ_CLAVE3`) REFERENCES `datos_jueces_adojc` (`JUZGADO_CLAVE`, `JUEZ_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_AUDI_JUICIOORAL` FOREIGN KEY (`AUDIENCIA_JUICIOORAL`) REFERENCES `catalogos_audiencias_juiciooral` (`AUDIENCIA_ID`),
  ADD CONSTRAINT `FK_AUDI_JUZGADOCLAVEJO` FOREIGN KEY (`JUZGADO_CLAVE`) REFERENCES `datos_juzgados_adojc` (`JUZGADO_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_AUDI_MUNICIPIOJO` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`);

--
-- Filtros para la tabla `datos_causas_penales_adojc`
--
ALTER TABLE `datos_causas_penales_adojc`
  ADD CONSTRAINT `FK_CAUSA_JUEZ` FOREIGN KEY (`JUZGADO_CLAVE`,`JUEZ_CLAVE`) REFERENCES `datos_jueces_adojc` (`JUZGADO_CLAVE`, `JUEZ_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAUSA_JUZGADOS` FOREIGN KEY (`JUZGADO_CLAVE`) REFERENCES `datos_juzgados_adojc` (`JUZGADO_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DERIVAACCIONPENAL` FOREIGN KEY (`DERIVA_ACCION_PENAL`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_EXPEDIENTES_COMPETENCIA` FOREIGN KEY (`COMPETENCIA`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_EXPEDIENTES_ENTIDADES` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_EXPEDIENTES_MUNICIPIOS` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_EXPEDIENTES_TIPOINCOMPETENCIA` FOREIGN KEY (`TIPO_INCOMPETENCIA`) REFERENCES `catalogos_incompetencia` (`INCOMPETENCIA_ID`),
  ADD CONSTRAINT `FK_EXPEDIENTE_ACUMULADO` FOREIGN KEY (`EXPEDIENTE_ACUMULADO`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`);

--
-- Filtros para la tabla `datos_causas_penales_adojo`
--
ALTER TABLE `datos_causas_penales_adojo`
  ADD CONSTRAINT `FK_ATENDIDA_ORGANODIFERENTEJO` FOREIGN KEY (`ATENDIDA_ORGDIFERENTE`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_CAUSA_CLAVEJC` FOREIGN KEY (`CAUSA_CLAVEJC`) REFERENCES `datos_causas_penales_adojc` (`CAUSA_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ENTIDADJO` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_JUEZCLAVE_1JO` FOREIGN KEY (`JUZGADO_CLAVE`,`JUEZ_CLAVE_1`) REFERENCES `datos_jueces_adojc` (`JUZGADO_CLAVE`, `JUEZ_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_JUEZCLAVE_2JO` FOREIGN KEY (`JUZGADO_CLAVE`,`JUEZ_CLAVE_2`) REFERENCES `datos_jueces_adojc` (`JUZGADO_CLAVE`, `JUEZ_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_JUEZCLAVE_3JO` FOREIGN KEY (`JUZGADO_CLAVE`,`JUEZ_CLAVE_3`) REFERENCES `datos_jueces_adojc` (`JUZGADO_CLAVE`, `JUEZ_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_JUZGADOSJO` FOREIGN KEY (`JUZGADO_CLAVE`) REFERENCES `datos_juzgados_adojc` (`JUZGADO_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_MUNICIPIOJO` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`);

--
-- Filtros para la tabla `datos_conclusiones_adojc`
--
ALTER TABLE `datos_conclusiones_adojc`
  ADD CONSTRAINT `FK_CONCLUISONES_ACUERDO_REPARATORIO` FOREIGN KEY (`MECANISMO_ACUERDO`) REFERENCES `catalogos_acuerdo_reparatorio` (`AREPARATORIO_ID`),
  ADD CONSTRAINT `FK_CONCLUISONES_PROCEDIMIENTO_ABREV` FOREIGN KEY (`TIPO_CONCLUSION_PA`) REFERENCES `catalogos_proc_abreviado` (`PROCABREV_ID`),
  ADD CONSTRAINT `FK_CONCLUSIONES_ENTIDADES` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_CONCLUSIONES_EXCLUSION_AP` FOREIGN KEY (`EXCLUSION_ACCIONP`) REFERENCES `catalogos_exclusion_accionp` (`EXCLUSION_ID`),
  ADD CONSTRAINT `FK_CONCLUSIONES_EXPEDIENTE` FOREIGN KEY (`CAUSA_CLAVE`) REFERENCES `datos_causas_penales_adojc` (`CAUSA_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CONCLUSIONES_IMPUGNACION` FOREIGN KEY (`IMPUGNACION`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_CONCLUSIONES_IMPUGNA_RESOL` FOREIGN KEY (`PERSONA_IMPUGNA`) REFERENCES `catalogos_figura_proceso` (`FIGURA_PRO_ID`),
  ADD CONSTRAINT `FK_CONCLUSIONES_INTERNAMIENTO` FOREIGN KEY (`TIEMPO_INTERNAMIENTO`) REFERENCES `catalogos_tiempo_internamiento` (`INTERNAMIENTO_ID`),
  ADD CONSTRAINT `FK_CONCLUSIONES_MPRIVATIVAS` FOREIGN KEY (`MEDIDA_PRIVATIVA`) REFERENCES `catalogos_privativas` (`PRIVATIVAS_ID`),
  ADD CONSTRAINT `FK_CONCLUSIONES_MULTA` FOREIGN KEY (`MONTO_REPARA`) REFERENCES `catalogos_multa` (`MULTA_ID`),
  ADD CONSTRAINT `FK_CONCLUSIONES_MUNICIPIOS` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_CONCLUSIONES_NOM_PRIVACION` FOREIGN KEY (`MEDIDA_NOPRIVATIVA`) REFERENCES `catalogos_noprivativas` (`NOPRIVATIVAS_ID`),
  ADD CONSTRAINT `FK_CONCLUSIONES_PROCEDENCIA_SOB` FOREIGN KEY (`PROCEDENCIA_SOBRESEIMIENTO`) REFERENCES `catalogos_sobreseimiento` (`SOBRESEIMIENTO_ID`),
  ADD CONSTRAINT `FK_CONCLUSIONES_PROCE_INICIAL` FOREIGN KEY (`CAUSA_CLAVE`,`PROCESADO_CLAVE`) REFERENCES `datos_etapa_inicial_adojc` (`CAUSA_CLAVE`, `PROCESADO_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CONCLUSIONES_RDANIO` FOREIGN KEY (`REPARACION_DANIO`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_CONCLUSIONES_SUSPENCIONC` FOREIGN KEY (`SUSPENCION_CONDICIONAL`) REFERENCES `catalogos_suspension_condicional` (`SUSPENSION_ID`),
  ADD CONSTRAINT `FK_CONCLUSIONES_TDANIO` FOREIGN KEY (`TIPO_REPARACION_DANIO`) REFERENCES `catalogos_reparacion_dano` (`REPARACION_ID`),
  ADD CONSTRAINT `FK_CONCLUSIONES_TIMPUGNACION` FOREIGN KEY (`TIPO_IMPUGNACION`) REFERENCES `catalogos_tipo_impugnacion` (`IMPUGNACION_ID`),
  ADD CONSTRAINT `FK_CONCLUSIONES_TIPOR` FOREIGN KEY (`TIPO_RESOLUCION`) REFERENCES `catalogos_tipo_resolucion` (`RESOLUCION_ID`),
  ADD CONSTRAINT `FK_CONCLUSIONES_TSOBRESEIMIENTO` FOREIGN KEY (`TIPO_SOBRESEIMIENTO`) REFERENCES `catalogos_tipo_sobreseimiento` (`TSOBRESEIMIENTO_ID`);

--
-- Filtros para la tabla `datos_conclusiones_adojo`
--
ALTER TABLE `datos_conclusiones_adojo`
  ADD CONSTRAINT `FKK_CONCLU_IMPUGNACIONJO` FOREIGN KEY (`IMPUGNACION`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_CONCLU_CAUSACLAVEJO` FOREIGN KEY (`CAUSA_CLAVEJO`) REFERENCES `datos_causas_penales_adojo` (`CAUSA_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CONCLU_ENTIDADJO` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_CONCLU_EXTINAPENALJO` FOREIGN KEY (`EXCLUSION_ACCIONP`) REFERENCES `catalogos_exclusion_accionp` (`EXCLUSION_ID`),
  ADD CONSTRAINT `FK_CONCLU_INTERNAMIENTOJO` FOREIGN KEY (`TIEMPO_INTERNAMIENTO`) REFERENCES `catalogos_tiempo_internamiento` (`INTERNAMIENTO_ID`),
  ADD CONSTRAINT `FK_CONCLU_MONTOREPARAJO` FOREIGN KEY (`MONTO_REPARA`) REFERENCES `catalogos_multa` (`MULTA_ID`),
  ADD CONSTRAINT `FK_CONCLU_MUNICIPIOJO` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_CONCLU_NOPRIVATIVAJO` FOREIGN KEY (`MEDIDA_NOPRIVATIVA`) REFERENCES `catalogos_noprivativas` (`NOPRIVATIVAS_ID`),
  ADD CONSTRAINT `FK_CONCLU_PERSONAIMPUGJO` FOREIGN KEY (`PERSONA_IMPUGNA`) REFERENCES `catalogos_figura_proceso` (`FIGURA_PRO_ID`),
  ADD CONSTRAINT `FK_CONCLU_PRIVATIVAJO` FOREIGN KEY (`MEDIDA_PRIVATIVA`) REFERENCES `catalogos_privativas` (`PRIVATIVAS_ID`),
  ADD CONSTRAINT `FK_CONCLU_PROCESACLAVEJO` FOREIGN KEY (`CAUSA_CLAVEJO`,`PROCESADO_CLAVE`) REFERENCES `datos_procesados_adojo` (`CAUSA_CLAVEJO`, `PROCESADO_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CONCLU_REPARADANIOJO` FOREIGN KEY (`REPARACION_DANIO`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_CONCLU_SENTENCIAJO` FOREIGN KEY (`TIPO_SENTENCIA`) REFERENCES `catalogos_proc_abreviado` (`PROCABREV_ID`),
  ADD CONSTRAINT `FK_CONCLU_SOBRESEIJO` FOREIGN KEY (`PROCEDENCIA_SOBRESEIMIENTO`) REFERENCES `catalogos_sobreseimiento` (`SOBRESEIMIENTO_ID`),
  ADD CONSTRAINT `FK_CONCLU_TIPOIMPUGNAJO` FOREIGN KEY (`TIPO_IMPUGNACION`) REFERENCES `catalogos_tipo_impugnacion` (`IMPUGNACION_ID`),
  ADD CONSTRAINT `FK_CONCLU_TIPOREPARAJO` FOREIGN KEY (`TIPO_REPARACION_DANIO`) REFERENCES `catalogos_reparacion_dano` (`REPARACION_ID`),
  ADD CONSTRAINT `FK_CONCLU_TIPORESOLUJO` FOREIGN KEY (`TIPO_RESOLUCION`) REFERENCES `catalogos_tipo_resolucionjo` (`RESOLUCION_ID`),
  ADD CONSTRAINT `FK_CONCLU_TIPOSOBRESEIJO` FOREIGN KEY (`TIPO_SOBRESEIMIENTO`) REFERENCES `catalogos_tipo_sobreseimiento` (`TSOBRESEIMIENTO_ID`);

--
-- Filtros para la tabla `datos_dconclusiones_adojc`
--
ALTER TABLE `datos_dconclusiones_adojc`
  ADD CONSTRAINT `FK_DCONCLUSIONES_DELITOS` FOREIGN KEY (`CAUSA_CLAVE`,`DELITO_CLAVE`) REFERENCES `datos_delitos_adojc` (`CAUSA_CLAVE`, `DELITO_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DCONCLUSIONES_ENTIDADES` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_DCONCLUSIONES_MUNICIPIOS` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_DCONCLUSIONES_PROCESADOS` FOREIGN KEY (`CAUSA_CLAVE`,`PROCESADO_CLAVE`) REFERENCES `datos_conclusiones_adojc` (`CAUSA_CLAVE`, `PROCESADO_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DCONCLUSIONES_TCONCLUSIONDELI` FOREIGN KEY (`TIPO_CONCLUSION_PA`) REFERENCES `catalogos_proc_abreviado` (`PROCABREV_ID`),
  ADD CONSTRAINT `FK_DCONCLUSIONES_TRESOLUCION` FOREIGN KEY (`TIPO_RESOLUCION`) REFERENCES `catalogos_tipo_resolucion` (`RESOLUCION_ID`);

--
-- Filtros para la tabla `datos_dconclusiones_adojo`
--
ALTER TABLE `datos_dconclusiones_adojo`
  ADD CONSTRAINT `FK_DCON_CAUSACLAVEJO` FOREIGN KEY (`CAUSA_CLAVEJO`) REFERENCES `datos_causas_penales_adojo` (`CAUSA_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DCON_CONCLUJO` FOREIGN KEY (`CAUSA_CLAVEJO`,`PROCESADO_CLAVE`) REFERENCES `datos_conclusiones_adojo` (`CAUSA_CLAVEJO`, `PROCESADO_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DCON_DELITOCLAVEJO` FOREIGN KEY (`CAUSA_CLAVEJO`,`DELITO_CLAVE`) REFERENCES `datos_delitos_adojo` (`CAUSA_CLAVEJO`, `DELITO_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DCON_ENTIDADJO` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_DCON_MUNICIPIOJO` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_DCON_PROCESACLAVEJO` FOREIGN KEY (`CAUSA_CLAVEJO`,`PROCESADO_CLAVE`) REFERENCES `datos_procesados_adojo` (`CAUSA_CLAVEJO`, `PROCESADO_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DCON_SENTENCIAJO` FOREIGN KEY (`TIPO_SENTENCIA`) REFERENCES `catalogos_proc_abreviado` (`PROCABREV_ID`);

--
-- Filtros para la tabla `datos_delitos_adojc`
--
ALTER TABLE `datos_delitos_adojc`
  ADD CONSTRAINT `FK_CAUSA_CLAVE` FOREIGN KEY (`CAUSA_CLAVE`) REFERENCES `datos_causas_penales_adojc` (`CAUSA_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DELITOCODIGOPENAL` FOREIGN KEY (`DELITO_CODIGO_PENAL`) REFERENCES `catalogos_codigo_norma` (`ID_CODIGO`),
  ADD CONSTRAINT `FK_DELITORECLASIFICADO` FOREIGN KEY (`DELITO_RECLASIFICADO`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_DELITOS_CALIFICACION` FOREIGN KEY (`CALIFICACION`) REFERENCES `catalogos_calificacion_delito` (`CALIFICACION_ID`),
  ADD CONSTRAINT `FK_DELITOS_CLASIFICACION` FOREIGN KEY (`CLASIFICACION`) REFERENCES `catalogos_clasificacion` (`CLASIFICACION_ID`),
  ADD CONSTRAINT `FK_DELITOS_COMISION` FOREIGN KEY (`FORMA_COMISION`) REFERENCES `catalogos_forma_comision` (`COMISION_ID`),
  ADD CONSTRAINT `FK_DELITOS_CONCURSO` FOREIGN KEY (`CONCURSO`) REFERENCES `catalogos_concurso` (`CONCURSO_ID`),
  ADD CONSTRAINT `FK_DELITOS_CONSUMACION` FOREIGN KEY (`GRADO_CONSUMACION`) REFERENCES `catalogos_consumacion` (`CONSUMACION_ID`),
  ADD CONSTRAINT `FK_DELITOS_ENTIDADES` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_DELITOS_FORMAACCION` FOREIGN KEY (`FORMA_ACCION`) REFERENCES `catalogos_forma_accion` (`ACCION_ID`),
  ADD CONSTRAINT `FK_DELITOS_ISNTRUMENTOCOMISION` FOREIGN KEY (`INSTRUMENTO_COMISION`) REFERENCES `catalogos_instrumento_comision` (`INSTRUMENTO_ID`),
  ADD CONSTRAINT `FK_DELITOS_MODALIDAD` FOREIGN KEY (`MODALIDAD`) REFERENCES `catalogos_modalidad` (`MODALIDAD_ID`),
  ADD CONSTRAINT `FK_DELITOS_MUNICIPIOS` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_DELITOS_NORMATECNICA` FOREIGN KEY (`DELITO_NORMA_TECNICA`) REFERENCES `catalogos_delitos_norma` (`ID_DELITO`),
  ADD CONSTRAINT `FK_DELITOS_OCURRIOENTIDAD` FOREIGN KEY (`OCURRIO_ENTIDAD`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_DELITOS_OCURRIO_MUNICIPIO` FOREIGN KEY (`OCURRIO_MUNICIPIO`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_DELITOS_SITIOOCURERENCIA` FOREIGN KEY (`SITIO_OCURRENCIA`) REFERENCES `catalogos_sitio_ocurrencia` (`SITIO_ID`),
  ADD CONSTRAINT `FK_DELITOS_TIPOFUERO` FOREIGN KEY (`TIPO_FUERO`) REFERENCES `catalogos_fuero` (`FUERO_ID`);

--
-- Filtros para la tabla `datos_delitos_adojo`
--
ALTER TABLE `datos_delitos_adojo`
  ADD CONSTRAINT `FK_CAUSA_CLAVEJO` FOREIGN KEY (`CAUSA_CLAVEJO`) REFERENCES `datos_causas_penales_adojo` (`CAUSA_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DELITO_CLAVEJC` FOREIGN KEY (`CAUSA_CLAVEJC`,`DELITO_CLAVEJC`) REFERENCES `datos_delitos_adojc` (`CAUSA_CLAVE`, `DELITO_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DELI_CALIFICACIONJO` FOREIGN KEY (`CALIFICACION`) REFERENCES `catalogos_calificacion_delito` (`CALIFICACION_ID`),
  ADD CONSTRAINT `FK_DELI_CLASIFICACIONJO` FOREIGN KEY (`CLASIFICACION`) REFERENCES `catalogos_clasificacion` (`CLASIFICACION_ID`),
  ADD CONSTRAINT `FK_DELI_CODIGOPENALJO` FOREIGN KEY (`DELITO_CODIGO_PENAL`) REFERENCES `catalogos_codigo_norma` (`ID_CODIGO`),
  ADD CONSTRAINT `FK_DELI_CONCURSOJO` FOREIGN KEY (`CONCURSO`) REFERENCES `catalogos_concurso` (`CONCURSO_ID`),
  ADD CONSTRAINT `FK_DELI_CONSUMACIONJO` FOREIGN KEY (`GRADO_CONSUMACION`) REFERENCES `catalogos_consumacion` (`CONSUMACION_ID`),
  ADD CONSTRAINT `FK_DELI_ENTIDADESJO` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_DELI_FORMAACCIONJO` FOREIGN KEY (`FORMA_ACCION`) REFERENCES `catalogos_forma_accion` (`ACCION_ID`),
  ADD CONSTRAINT `FK_DELI_FORMACOMISIONJO` FOREIGN KEY (`FORMA_COMISION`) REFERENCES `catalogos_forma_comision` (`COMISION_ID`),
  ADD CONSTRAINT `FK_DELI_INSTRUMENTOSJO` FOREIGN KEY (`INSTRUMENTO_COMISION`) REFERENCES `catalogos_instrumento_comision` (`INSTRUMENTO_ID`),
  ADD CONSTRAINT `FK_DELI_MODALIDAD` FOREIGN KEY (`MODALIDAD`) REFERENCES `catalogos_modalidad` (`MODALIDAD_ID`),
  ADD CONSTRAINT `FK_DELI_MUNICIPIOSJO` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_DELI_NORMATECNICAJO` FOREIGN KEY (`DELITO_NORMA_TECNICA`) REFERENCES `catalogos_delitos_norma` (`ID_DELITO`),
  ADD CONSTRAINT `FK_DELI_OCURRIOENTIJO` FOREIGN KEY (`OCURRIO_ENTIDAD`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_DELI_OCURRIOMUNJO` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_DELI_RECLASIFICADOJO` FOREIGN KEY (`DELITO_RECLASIFICADO`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_DELI_SITIOOCURRENCIA` FOREIGN KEY (`SITIO_OCURRENCIA`) REFERENCES `catalogos_sitio_ocurrencia` (`SITIO_ID`),
  ADD CONSTRAINT `FK_DELI_TIPOFUEROJO` FOREIGN KEY (`TIPO_FUERO`) REFERENCES `catalogos_fuero` (`FUERO_ID`);

--
-- Filtros para la tabla `datos_dhomicidio_adojc`
--
ALTER TABLE `datos_dhomicidio_adojc`
  ADD CONSTRAINT `FK_DHOMCIDIO_CSITUACIONAL` FOREIGN KEY (`CONTEXTO_SITUACIONAL`) REFERENCES `catalogos_contexto_situacional` (`CONTEXTO_ID`),
  ADD CONSTRAINT `FK_DHOMICIDIOS_ENTIDADES` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_DHOMICIDIO_CAUSASP` FOREIGN KEY (`CAUSA_CLAVE`) REFERENCES `datos_causas_penales_adojc` (`CAUSA_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DHOMICIDIO_DELITOS` FOREIGN KEY (`CAUSA_CLAVE`,`DELITO_CLAVE`) REFERENCES `datos_delitos_adojc` (`CAUSA_CLAVE`, `DELITO_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DHOMICIDIO_MUNICIPIOS` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`);

--
-- Filtros para la tabla `datos_dhomicidio_adojo`
--
ALTER TABLE `datos_dhomicidio_adojo`
  ADD CONSTRAINT `FK_DHOMI_CAUSA_CLAVE` FOREIGN KEY (`CAUSA_CLAVEJO`) REFERENCES `datos_causas_penales_adojo` (`CAUSA_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DHOMI_CONTEXTOSITUAJO` FOREIGN KEY (`CONTEXTO_SITUACIONAL`) REFERENCES `catalogos_contexto_situacional` (`CONTEXTO_ID`),
  ADD CONSTRAINT `FK_DHOMI_DELITOCLAVE` FOREIGN KEY (`CAUSA_CLAVEJO`,`DELITO_CLAVE`) REFERENCES `datos_delitos_adojo` (`CAUSA_CLAVEJO`, `DELITO_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DHOMI_ENTIDADJO` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_DHOMI_MUNICIPIOJO` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`);

--
-- Filtros para la tabla `datos_drobo_adojc`
--
ALTER TABLE `datos_drobo_adojc`
  ADD CONSTRAINT `FK_DROBOS_MUNICIPIO` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_DROBO_COSAROBADA` FOREIGN KEY (`TIPO_COSA_ROBADA`) REFERENCES `catalogos_cosa_robada` (`COSA_ID`),
  ADD CONSTRAINT `FK_DROBO_DELITOS` FOREIGN KEY (`CAUSA_CLAVE`,`DELITO_CLAVE`) REFERENCES `datos_delitos_adojc` (`CAUSA_CLAVE`, `DELITO_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DROBO_ENTIDADES` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_DROBO_EXPEDIENTES` FOREIGN KEY (`CAUSA_CLAVE`) REFERENCES `datos_causas_penales_adojc` (`CAUSA_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `datos_drobo_adojo`
--
ALTER TABLE `datos_drobo_adojo`
  ADD CONSTRAINT `FK_DROBO_CAUSA_CLAVEJO` FOREIGN KEY (`CAUSA_CLAVEJO`) REFERENCES `datos_causas_penales_adojo` (`CAUSA_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DROBO_COSAROBADAJO` FOREIGN KEY (`TIPO_COSA_ROBADA`) REFERENCES `catalogos_cosa_robada` (`COSA_ID`),
  ADD CONSTRAINT `FK_DROBO_DELITOCLAVEJO` FOREIGN KEY (`CAUSA_CLAVEJO`,`DELITO_CLAVE`) REFERENCES `datos_delitos_adojo` (`CAUSA_CLAVEJO`, `DELITO_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DROBO_ENTIDADJO` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_DROBO_MUNICIPIOJO` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`);

--
-- Filtros para la tabla `datos_etapa_inicial_adojc`
--
ALTER TABLE `datos_etapa_inicial_adojc`
  ADD CONSTRAINT `FK_EINICIAL_AVINCULACION` FOREIGN KEY (`AUTO_VINCULACION`) REFERENCES `catalogos_auto_vinculacion` (`AUTO_ID`),
  ADD CONSTRAINT `FK_EINICIAL_FACUSACION` FOREIGN KEY (`FORMULO_ACUSACION`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_ESTAPAINICIAL_PCONSTITUCIONAL` FOREIGN KEY (`PLAZO_CONSTITUCIONAL`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_ETAPAINCIAL_CAUSASUSPENSION` FOREIGN KEY (`CAUSA_SUSPENSION_PROCESO`) REFERENCES `catalogos_causa_suspencion` (`CSUSPENSION_ID`),
  ADD CONSTRAINT `FK_ETAPAINCIAL_CINVCOMPLEMENTARIA` FOREIGN KEY (`INVESTIGACION_COMPLEMENTARIA`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_ETAPAINCIAL_SUSPENSIONP` FOREIGN KEY (`SUSPENSION_PROCESO`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_ETAPAINICIAL_AUTOVINCULACION` FOREIGN KEY (`AUTO_VINCULACION`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_ETAPAINICIAL_CELEBRACION` FOREIGN KEY (`AUDIENCIA_INICIAL`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_ETAPAINICIAL_CTRLDETENCION` FOREIGN KEY (`CTRL_DETENCION`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_ETAPAINICIAL_DETENCIONLEGAL` FOREIGN KEY (`DETENCION_LEGAL`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_ETAPAINICIAL_ENTIDADES` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_ETAPAINICIAL_ETAPAS` FOREIGN KEY (`ETAPA`) REFERENCES `catalogos_etapas` (`ETAPA_ID`),
  ADD CONSTRAINT `FK_ETAPAINICIAL_FORMIMPUTACION` FOREIGN KEY (`FORMULACION_IMPUTACION`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_ETAPAINICIAL_IMPUTADODECLARO` FOREIGN KEY (`IMPUTADO_DECLARO`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_ETAPAINICIAL_MEDIDACAUTELAR` FOREIGN KEY (`IMPUSO_MCAUTELARES`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_ETAPAINICIAL_MUNICIPIOS` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_ETAPAINICIAL_PCIERRE` FOREIGN KEY (`PLAZO_CIERRE_INVESTIGACION`) REFERENCES `catalogos_plazo_cierre` (`CIERRE_ID`),
  ADD CONSTRAINT `FK_ETAPAINICIAL_PCONSTITUCIONAL` FOREIGN KEY (`TIEMPO_PLAZO`) REFERENCES `catalogos_plazo_constitucional` (`PLAZO_ID`),
  ADD CONSTRAINT `FK_ETAPAINICIAL_PROCESADOS` FOREIGN KEY (`CAUSA_CLAVE`,`PROCESADO_CLAVE`) REFERENCES `datos_procesados_adojc` (`CAUSA_CLAVE`, `PROCESADO_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ETAPAINICIAL_PRORROGAPCIERRE` FOREIGN KEY (`PRORROGA_PLAZO_CIERRE`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_ETAPAINICIAL_REAPERTURA` FOREIGN KEY (`SOLICITO_REAPERTURA`) REFERENCES `catalogos_figura_proceso` (`FIGURA_PRO_ID`),
  ADD CONSTRAINT `FK_ETAPAINICIAL_REAPERTURA_PRO` FOREIGN KEY (`REAPERTURA_PROCESO`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_ETAPAINICIAL_SOBRESEIMIENTOCAUSAP` FOREIGN KEY (`SOBRESEIMIENTO_CAUSAP`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`);

--
-- Filtros para la tabla `datos_etapa_intermedia_adojc`
--
ALTER TABLE `datos_etapa_intermedia_adojc`
  ADD CONSTRAINT `FK_EINTERMEDIA_AINTERMEDIA` FOREIGN KEY (`AUDIENCIA_INTERMEDIA`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_EINTERMEDIA_AJUICIOORAL` FOREIGN KEY (`APERTURA_JUICIO_ORAL`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_EINTERMEDIA_APROBATORIOS` FOREIGN KEY (`ACUERDOS_PROBATORIOS`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_EINTERMEDIA_DPROBATORIO` FOREIGN KEY (`DESCUBRIMIENTO_PROBATORIO`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_EINTERMEDIA_ENTIDADES` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_EINTERMEDIA_MP_MP` FOREIGN KEY (`PRESENTA_MP_MINISTERIO`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_EINTERMEDIA_MUNICIPIOS` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_EINTERMEDIA_PMPRUEBA` FOREIGN KEY (`PRESENTACION_MPRUEBA`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_EINTERMEDIA_PRESENTA_MP_ASESOR` FOREIGN KEY (`PRESENTA_MP_ASESOR`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_EINTERMEDIA_PRESENTA_MP_DEFENSA` FOREIGN KEY (`PRESENTA_MP_DEFENSA`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_EINTERMEDIA_PROCESADOS` FOREIGN KEY (`CAUSA_CLAVE`,`PROCESADO_CLAVE`) REFERENCES `datos_etapa_inicial_adojc` (`CAUSA_CLAVE`, `PROCESADO_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EINTERMEDIA_SACUSACION` FOREIGN KEY (`SEPARACION_ACUSACION`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`);

--
-- Filtros para la tabla `datos_etapa_oral_adojo`
--
ALTER TABLE `datos_etapa_oral_adojo`
  ADD CONSTRAINT `FK_EORAL_CAUSACLAVEJO` FOREIGN KEY (`CAUSA_CLAVEJO`) REFERENCES `datos_causas_penales_adojo` (`CAUSA_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EORAL_DACUSADOJO` FOREIGN KEY (`PD_DECLARACION_ACUSADO`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_EORAL_DELIBERACIONJO` FOREIGN KEY (`DELIBERACION`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_EORAL_DISCIPLINARIASJO` FOREIGN KEY (`MEDIDAS_DISCIPLINARIAS`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_EORAL_DOCMATERIALJO` FOREIGN KEY (`PD_DOCUMENTAL_MATERIAL`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_EORAL_ENTIDADJO` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_EORAL_HUBOINCIDENTEJO` FOREIGN KEY (`INCIDENTES_AUDIENCIA`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_EORAL_MUNICIPIOJO` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_EORAL_OTRAPRUEBAJO` FOREIGN KEY (`PD_OTRA_PRUEBA`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_EORAL_PERICIALJO` FOREIGN KEY (`PD_PERICIAL`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_EORAL_PROCESACLAVEJO` FOREIGN KEY (`CAUSA_CLAVEJO`,`PROCESADO_CLAVE`) REFERENCES `datos_procesados_adojo` (`CAUSA_CLAVEJO`, `PROCESADO_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EORAL_PROMUEVEINCJO` FOREIGN KEY (`PROMUEVE_INCIDENTE`) REFERENCES `catalogos_promueve_incidente` (`PROMUEVE_ID`),
  ADD CONSTRAINT `FK_EORAL_SENTIDOJO` FOREIGN KEY (`SENTIDO_FALLO`) REFERENCES `catalogos_sentido_fallo` (`SENTIDO_ID`),
  ADD CONSTRAINT `FK_EORAL_SUSPENCIONAUDIJO` FOREIGN KEY (`SUSPENCION_AUDIENCIA`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_EORAL_TESTIMONIALJO` FOREIGN KEY (`PD_TESTIMONIAL`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_EORAL_TIPODISCIPLIJO` FOREIGN KEY (`TIPO_DISCIPLINARIA`) REFERENCES `catalogos_medidas_disciplinarias` (`MEDIDA_ID`),
  ADD CONSTRAINT `FK_ETAPAS` FOREIGN KEY (`ETAPA`) REFERENCES `catalogos_etapas` (`ETAPA_ID`);

--
-- Filtros para la tabla `datos_informe_adojc`
--
ALTER TABLE `datos_informe_adojc`
  ADD CONSTRAINT `FK_INFORME_JUZGADO` FOREIGN KEY (`JUZGADO_CLAVE`) REFERENCES `datos_juzgados_adojc` (`JUZGADO_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `datos_jueces_adojc`
--
ALTER TABLE `datos_jueces_adojc`
  ADD CONSTRAINT `FK_JUECES_EDAD` FOREIGN KEY (`EDAD`) REFERENCES `catalogos_numero` (`NUMERO_ID`),
  ADD CONSTRAINT `FK_JUECES_ESTUDIOPROF` FOREIGN KEY (`GRADO_ESTUDIOS`) REFERENCES `catalogos_estudio_profesional` (`ESTUDIO_PRO_ID`),
  ADD CONSTRAINT `FK_JUECES_FUNCION` FOREIGN KEY (`FUNCION_DESEMPENA`) REFERENCES `catalogos_funcion_juzgado` (`FUNCION_JUZ_ID`),
  ADD CONSTRAINT `FK_JUECES_SEXO` FOREIGN KEY (`SEXO`) REFERENCES `catalogos_sexo` (`SEXO_ID`),
  ADD CONSTRAINT `FK_JUZGADO_CLAVE` FOREIGN KEY (`JUZGADO_CLAVE`) REFERENCES `datos_juzgados_adojc` (`JUZGADO_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `datos_juzgados_adojc`
--
ALTER TABLE `datos_juzgados_adojc`
  ADD CONSTRAINT `FK_ASENTAMIENTOHUMANO` FOREIGN KEY (`ASENTAMIENTO_HUMANO`) REFERENCES `catalogos_asentamiento_humano` (`ASENTAMIENTO_ID`),
  ADD CONSTRAINT `FK_FUNCION_JUZGADO` FOREIGN KEY (`JUZGADO_FUNCION`) REFERENCES `catalogos_funcion_juzgado` (`FUNCION_JUZ_ID`),
  ADD CONSTRAINT `FK_JURISDICCION` FOREIGN KEY (`JUZGADO_JURISDICCION`) REFERENCES `catalogos_jurisdiccion` (`JURISDICCION_ID`),
  ADD CONSTRAINT `FK_JUZGADOS_MUNICIPIOS` FOREIGN KEY (`MUNICIPIO`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_JUZGADOS_VIALIDAD` FOREIGN KEY (`TIPO_VIALIDAD`) REFERENCES `catalogos_vialidad` (`VIALIDAD_ID`),
  ADD CONSTRAINT `FK_JUZGADO_ENTIDADES` FOREIGN KEY (`ENTIDAD`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_JUZGADO_FORMADIVISION` FOREIGN KEY (`FORMA_DIVISION`) REFERENCES `catalogos_forma_division` (`DIVISION_ID`),
  ADD CONSTRAINT `FK_JUZGADO_NUMERO` FOREIGN KEY (`JUZGADO_NUMERO`) REFERENCES `catalogos_numero` (`NUMERO_ID`);

--
-- Filtros para la tabla `datos_pdelitos_adojc`
--
ALTER TABLE `datos_pdelitos_adojc`
  ADD CONSTRAINT `FK_PDELITOS_CAUSAP` FOREIGN KEY (`CAUSA_CLAVE`) REFERENCES `datos_causas_penales_adojc` (`CAUSA_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PDELITOS_DELITOS` FOREIGN KEY (`CAUSA_CLAVE`,`DELITO_CLAVE`) REFERENCES `datos_delitos_adojc` (`CAUSA_CLAVE`, `DELITO_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PDELITOS_ENTIDADES` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_PDELITOS_MUNICIPIOS` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_PDELITOS_PROCESADOS` FOREIGN KEY (`CAUSA_CLAVE`,`PROCESADO_CLAVE`) REFERENCES `datos_procesados_adojc` (`CAUSA_CLAVE`, `PROCESADO_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `datos_pdelitos_adojo`
--
ALTER TABLE `datos_pdelitos_adojo`
  ADD CONSTRAINT `FK_PDELI_CAUSACLAVEJO` FOREIGN KEY (`CAUSA_CLAVEJO`) REFERENCES `datos_causas_penales_adojo` (`CAUSA_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PDELI_DELITOCLAVEJO` FOREIGN KEY (`CAUSA_CLAVEJO`,`DELITO_CLAVE`) REFERENCES `datos_delitos_adojo` (`CAUSA_CLAVEJO`, `DELITO_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PDELI_ENTIDADJO` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_PDELI_MUNICIPIOJO` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_PDELI_PROCESADOCLAVEJO` FOREIGN KEY (`CAUSA_CLAVEJO`,`PROCESADO_CLAVE`) REFERENCES `datos_procesados_adojo` (`CAUSA_CLAVEJO`, `PROCESADO_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `datos_pfuente_ingresos_adojc`
--
ALTER TABLE `datos_pfuente_ingresos_adojc`
  ADD CONSTRAINT `FK_PFUENTE_ENTIDADES` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_PFUENTE_FINGRESOS` FOREIGN KEY (`INGRESO`) REFERENCES `catalogos_fuente_ingresos` (`FUENTE_ID`),
  ADD CONSTRAINT `FK_PFUENTE_MUNICIPIOS` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_PFUENTE_PROCESADO` FOREIGN KEY (`CAUSA_CLAVE`,`PROCESADO_CLAVE`) REFERENCES `datos_procesados_adojc` (`CAUSA_CLAVE`, `PROCESADO_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `datos_pfuente_ingresos_adojo`
--
ALTER TABLE `datos_pfuente_ingresos_adojo`
  ADD CONSTRAINT `FK_PFUENT_ENTIDADJO` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_PFUENT_INGRESOSJO` FOREIGN KEY (`INGRESO`) REFERENCES `catalogos_fuente_ingresos` (`FUENTE_ID`),
  ADD CONSTRAINT `FK_PFUENT_MUNICIPIOJO` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_PFUENT_PROCECLAVEJO` FOREIGN KEY (`CAUSA_CLAVEJO`,`PROCESADO_CLAVE`) REFERENCES `datos_procesados_adojo` (`CAUSA_CLAVEJO`, `PROCESADO_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `datos_pmedidas_adojc`
--
ALTER TABLE `datos_pmedidas_adojc`
  ADD CONSTRAINT `FK_PMEDIDAS_DURACION` FOREIGN KEY (`DURACION_MEDIDA`) REFERENCES `catalogos_medidas_duracion` (`MEDIDA_DURA_ID`),
  ADD CONSTRAINT `FK_PMEDIDAS_ENTIDADES` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_PMEDIDAS_MCAUTELARES` FOREIGN KEY (`CAUTELARES`) REFERENCES `catalogos_medidas_cautelares` (`CAUTELARES_ID`),
  ADD CONSTRAINT `FK_PMEDIDAS_MUNICIPIOS` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_PMEDIDAS_PROCESADOS` FOREIGN KEY (`CAUSA_CLAVE`,`PROCESADO_CLAVE`) REFERENCES `datos_etapa_inicial_adojc` (`CAUSA_CLAVE`, `PROCESADO_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PMEDIDAS_SOLICITA` FOREIGN KEY (`SOLICITA_MEDIDA`) REFERENCES `catalogos_medidas_solicita` (`MEDIDA_SOLICITA_ID`);

--
-- Filtros para la tabla `datos_presenta_mp_adojc`
--
ALTER TABLE `datos_presenta_mp_adojc`
  ADD CONSTRAINT `FK_MEDIOPRUEBA_ENTIDADES` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_MEDIOPRUEBA_FIGURA` FOREIGN KEY (`FIGURA_MPRUEBA`) REFERENCES `catalogos_figura_mprueba` (`FIGURA_MPRU_ID`),
  ADD CONSTRAINT `FK_MEDIOPRUEBA_MEDIOSP` FOREIGN KEY (`MEDIO_PRUEBA_ID`) REFERENCES `catalogos_medios_prueba` (`PRUEBA_ID`),
  ADD CONSTRAINT `FK_MEDIOPRUEBA_MUNICIPIOS` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_MEDIOPRUEBA_PROCESADOS` FOREIGN KEY (`CAUSA_CLAVE`,`PROCESADO_CLAVE`) REFERENCES `datos_etapa_intermedia_adojc` (`CAUSA_CLAVE`, `PROCESADO_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `datos_procesados_adojc`
--
ALTER TABLE `datos_procesados_adojc`
  ADD CONSTRAINT `FK_PORCESADOS_NACIMIENTOENTIDADES` FOREIGN KEY (`NACIMIENTO_ENTIDAD`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_PORCESADOS_NACIMIENTOMUNICIPIO` FOREIGN KEY (`NACIMIENTO_MUNICIPIO`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_PORCESADOS_PSICOFISICO` FOREIGN KEY (`ESTADO_PSICOFISICO`) REFERENCES `catalogos_estado_psicofisico` (`ESTADO_PSICO_ID`),
  ADD CONSTRAINT `FK_PORCESADOS_RINGRESOS` FOREIGN KEY (`RANGO_INGRESOS`) REFERENCES `catalogos_rango_ingresos` (`ID_INGRESOS`),
  ADD CONSTRAINT `FK_PROCESADOSLINGUISTICAS` FOREIGN KEY (`FAMILIA_LINGUISTICA`) REFERENCES `catalogos_linguisticas` (`LINGUISTICA_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_ALFABETISMO` FOREIGN KEY (`CONDICION_ALFABETISMO`) REFERENCES `catalogos_alfabetismo` (`ALFABETISMO_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_CONDICIONACTIVIDAD` FOREIGN KEY (`CONDICION_ACTIVIDAD`) REFERENCES `catalogos_condicion_actividad` (`CONDICIONA_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_CONDICIONESTUDIANTE` FOREIGN KEY (`CONDICION_ESTUDIANTE`) REFERENCES `catalogos_condicion_estudiante` (`CONDICIONE_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_CONSIGNACION` FOREIGN KEY (`INICIO_IMPUTADO`) REFERENCES `catalogos_tipo_consignacion` (`CONSIGNACION_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_DISCAPACIDAD` FOREIGN KEY (`DISCAPACIDAD`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_DOMINIOESPANOL` FOREIGN KEY (`HABLA_ESPANOL`) REFERENCES `catalogos_dominio_espanol` (`DOMINIO_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_EDAD` FOREIGN KEY (`EDAD`) REFERENCES `catalogos_numero` (`NUMERO_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_ENTIDADES` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_EXPEDIENTES` FOREIGN KEY (`CAUSA_CLAVE`) REFERENCES `datos_causas_penales_adojc` (`CAUSA_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PROCESADOS_FORMACONDUCCION` FOREIGN KEY (`FORMA_CONDUCCION`) REFERENCES `catalogos_forma_conduccion` (`CONDUCCION_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_GRADOESTUDIOS` FOREIGN KEY (`ULTIMO_GRADO_ESTUDIOS`) REFERENCES `catalogos_grado_estudios` (`ESTUDIO_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_GRADOPARTICIPACION` FOREIGN KEY (`GRADO_PARTICIPACION`) REFERENCES `catalogos_grado_participacion` (`PARTICIPACION_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_HABLAINDIGENA` FOREIGN KEY (`HABLA_INDIGENA`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_INTERPRETE` FOREIGN KEY (`INTERPRETE`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_LENGUAEXTRANJERA` FOREIGN KEY (`LENGUA_EXTRANJERA`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_MUNICIPIOS` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_NACIMIENTOPAIS` FOREIGN KEY (`NACIMIENTO_PAIS`) REFERENCES `catalogos_pais` (`PAIS_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_NACIONALIDAD` FOREIGN KEY (`NACIONALIDAD`) REFERENCES `catalogos_nacionalidad` (`NACIONALIDAD_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_OCUPACION` FOREIGN KEY (`OCUPACION`) REFERENCES `catalogos_ocupacion` (`OCUPACION_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_PERCIBEINGRESO` FOREIGN KEY (`INGRESOS`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_POBLACIONINDIGENA` FOREIGN KEY (`POBLACION_INDIGENA`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_PUEBLOINDIGENA` FOREIGN KEY (`TIPO_PUEBLO_INDIGENA`) REFERENCES `catalogos_pueblo_indigena` (`PUEBLO_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_REINCIDENCIA` FOREIGN KEY (`REINCIDENCIA`) REFERENCES `catalogos_reincidencia` (`REINCIDENCIA_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_REPRESENTANTELEGAL` FOREIGN KEY (`PERSONA_RESPONSABLE`) REFERENCES `catalogos_representante_legal` (`REPRESENTANTE_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_RESIDENCIA_ENTIDADES` FOREIGN KEY (`RESIDENCIA_ENTIDAD`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_RESIDENCIA_MUNICIPIOS` FOREIGN KEY (`RESIDENCIA_MUNICIPIO`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_RESIDENCIA_PAIS` FOREIGN KEY (`RESIDENCIA_PAIS`) REFERENCES `catalogos_pais` (`PAIS_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_SEXO` FOREIGN KEY (`SEXO`) REFERENCES `catalogos_sexo` (`SEXO_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_SITUACIONCONYUGAL` FOREIGN KEY (`ESTADO_CIVIL`) REFERENCES `catalogos_estado_civil` (`ESTADO_CIVIL_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_TIPODEFENSOR` FOREIGN KEY (`TIPO_DEFENSOR`) REFERENCES `catalogos_tipo_defensor` (`DEFENSOR_ID`),
  ADD CONSTRAINT `FK_PROCESADOS_TIPODETENCION` FOREIGN KEY (`TIPO_DETENCION`) REFERENCES `catalogos_tipo_detencion` (`TDETENCION_ID`),
  ADD CONSTRAINT `FK_PROCESADO_PERTENECEGPODELICTIVO` FOREIGN KEY (`DELICTIVO`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`);

--
-- Filtros para la tabla `datos_procesados_adojo`
--
ALTER TABLE `datos_procesados_adojo`
  ADD CONSTRAINT `FK_PROCESADO_CLAVEJC` FOREIGN KEY (`CAUSA_CLAVEJC`,`PROCESADO_CLAVEJC`) REFERENCES `datos_procesados_adojc` (`CAUSA_CLAVE`, `PROCESADO_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PRO_ACTIVIDADJO` FOREIGN KEY (`CONDICION_ACTIVIDAD`) REFERENCES `catalogos_condicion_actividad` (`CONDICIONA_ID`),
  ADD CONSTRAINT `FK_PRO_ALFABETISMOJO` FOREIGN KEY (`CONDICION_ALFABETISMO`) REFERENCES `catalogos_alfabetismo` (`ALFABETISMO_ID`),
  ADD CONSTRAINT `FK_PRO_CAUSACLAVEJO` FOREIGN KEY (`CAUSA_CLAVEJO`) REFERENCES `datos_causas_penales_adojo` (`CAUSA_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PRO_CONDICIONESTUJO` FOREIGN KEY (`CONDICION_ESTUDIANTE`) REFERENCES `catalogos_condicion_estudiante` (`CONDICIONE_ID`),
  ADD CONSTRAINT `FK_PRO_DEFENSORJO` FOREIGN KEY (`TIPO_DEFENSOR`) REFERENCES `catalogos_tipo_defensor` (`DEFENSOR_ID`),
  ADD CONSTRAINT `FK_PRO_DELICTIVOJO` FOREIGN KEY (`DELICTIVO`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_PRO_DISCAPACIDADJO` FOREIGN KEY (`DISCAPACIDAD`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_PRO_EDADJO` FOREIGN KEY (`EDAD`) REFERENCES `catalogos_numero` (`NUMERO_ID`),
  ADD CONSTRAINT `FK_PRO_EDOCIVILJO` FOREIGN KEY (`ESTADO_CIVIL`) REFERENCES `catalogos_estado_civil` (`ESTADO_CIVIL_ID`),
  ADD CONSTRAINT `FK_PRO_ENTIDADJO` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_PRO_ESPANIOLJO` FOREIGN KEY (`HABLA_ESPANOL`) REFERENCES `catalogos_dominio_espanol` (`DOMINIO_ID`),
  ADD CONSTRAINT `FK_PRO_ESTUDIOSJO` FOREIGN KEY (`ULTIMO_GRADO_ESTUDIOS`) REFERENCES `catalogos_grado_estudios` (`ESTUDIO_ID`),
  ADD CONSTRAINT `FK_PRO_FAMILIALINJO` FOREIGN KEY (`FAMILIA_LINGUISTICA`) REFERENCES `catalogos_linguisticas` (`LINGUISTICA_ID`),
  ADD CONSTRAINT `FK_PRO_HABLAINDIGENAJO` FOREIGN KEY (`HABLA_INDIGENA`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_PRO_INGRESOSJO` FOREIGN KEY (`INGRESOS`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_PRO_INTERPRETEJO` FOREIGN KEY (`INTERPRETE`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_PRO_LENGUAEXTRANJO` FOREIGN KEY (`LENGUA_EXTRANJERA`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_PRO_MUNICIPIOJO` FOREIGN KEY (`NACIMIENTO_MUNICIPIO`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_PRO_NACIENTIDADJO` FOREIGN KEY (`NACIMIENTO_ENTIDAD`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_PRO_NACIMIENTOPAISJO` FOREIGN KEY (`NACIMIENTO_PAIS`) REFERENCES `catalogos_pais` (`PAIS_ID`),
  ADD CONSTRAINT `FK_PRO_NACIMUNICIPIOJO` FOREIGN KEY (`NACIMIENTO_MUNICIPIO`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_PRO_NACIONALIDADJO` FOREIGN KEY (`NACIONALIDAD`) REFERENCES `catalogos_nacionalidad` (`NACIONALIDAD_ID`),
  ADD CONSTRAINT `FK_PRO_OCUPACIONJO` FOREIGN KEY (`OCUPACION`) REFERENCES `catalogos_ocupacion` (`OCUPACION_ID`),
  ADD CONSTRAINT `FK_PRO_PARTICIPACIONJO` FOREIGN KEY (`GRADO_PARTICIPACION`) REFERENCES `catalogos_grado_participacion` (`PARTICIPACION_ID`),
  ADD CONSTRAINT `FK_PRO_POBLAINDIGENAJO` FOREIGN KEY (`POBLACION_INDIGENA`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_PRO_PSICOFISICOJO` FOREIGN KEY (`ESTADO_PSICOFISICO`) REFERENCES `catalogos_estado_psicofisico` (`ESTADO_PSICO_ID`),
  ADD CONSTRAINT `FK_PRO_PUEBLOINDIGEJO` FOREIGN KEY (`TIPO_PUEBLO_INDIGENA`) REFERENCES `catalogos_pueblo_indigena` (`PUEBLO_ID`),
  ADD CONSTRAINT `FK_PRO_RANGOINGRESOJO` FOREIGN KEY (`RANGO_INGRESOS`) REFERENCES `catalogos_rango_ingresos` (`ID_INGRESOS`),
  ADD CONSTRAINT `FK_PRO_REINCIDENCIAJO` FOREIGN KEY (`REINCIDENCIA`) REFERENCES `catalogos_reincidencia` (`REINCIDENCIA_ID`),
  ADD CONSTRAINT `FK_PRO_RESIDENCIAPAISJO` FOREIGN KEY (`RESIDENCIA_PAIS`) REFERENCES `catalogos_pais` (`PAIS_ID`),
  ADD CONSTRAINT `FK_PRO_RESIENTIDADJO` FOREIGN KEY (`RESIDENCIA_ENTIDAD`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_PRO_RESIMUNICIPIOJO` FOREIGN KEY (`RESIDENCIA_MUNICIPIO`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_PRO_RESPONSABLEJO` FOREIGN KEY (`PERSONA_RESPONSABLE`) REFERENCES `catalogos_representante_legal` (`REPRESENTANTE_ID`),
  ADD CONSTRAINT `FK_PRO_SEXOJO` FOREIGN KEY (`SEXO`) REFERENCES `catalogos_sexo` (`SEXO_ID`);

--
-- Filtros para la tabla `datos_tramites_adojc`
--
ALTER TABLE `datos_tramites_adojc`
  ADD CONSTRAINT `FK_TRAMITES_ENTIDADES` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_TRAMITES_EPROCESAL` FOREIGN KEY (`ETAPA_PROCESAL`) REFERENCES `catalogos_etapa_procesal` (`PROCESAL_ID`),
  ADD CONSTRAINT `FK_TRAMITES_MUNICIPIOS` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_TRAMITES_PROCE_INICIAL` FOREIGN KEY (`CAUSA_CLAVE`,`PROCESADO_CLAVE`) REFERENCES `datos_etapa_inicial_adojc` (`CAUSA_CLAVE`, `PROCESADO_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TRAMITE_ESTATUSINTERMEDIA` FOREIGN KEY (`ESTATUS_INTERMEDIA`) REFERENCES `catalogos_etapa_intermedia` (`INTERMEDIA_ID`),
  ADD CONSTRAINT `FK_TRAMITE_INVESTIGACION` FOREIGN KEY (`ESTATUS_INVESTIGACION`) REFERENCES `catalogos_etapa_inicial` (`INICIAL_ID`);

--
-- Filtros para la tabla `datos_tramites_adojo`
--
ALTER TABLE `datos_tramites_adojo`
  ADD CONSTRAINT `FK_TRAM_CAUSACLAVEJO` FOREIGN KEY (`CAUSA_CLAVEJO`) REFERENCES `datos_causas_penales_adojo` (`CAUSA_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TRAM_ENTIDADJO` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_TRAM_ESTATUSJO` FOREIGN KEY (`ESTATUS`) REFERENCES `catalogos_estatusjo` (`ESTATUS_ID`),
  ADD CONSTRAINT `FK_TRAM_MUNICIPIOJO` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_TRAM_PROCESACLAVEJO` FOREIGN KEY (`CAUSA_CLAVEJO`,`PROCESADO_CLAVE`) REFERENCES `datos_procesados_adojo` (`CAUSA_CLAVEJO`, `PROCESADO_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `datos_vdelitos_adojc`
--
ALTER TABLE `datos_vdelitos_adojc`
  ADD CONSTRAINT `FK_VDELITOS_CAUSASP` FOREIGN KEY (`CAUSA_CLAVE`) REFERENCES `datos_causas_penales_adojc` (`CAUSA_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_VDELITOS_DELITOS` FOREIGN KEY (`CAUSA_CLAVE`,`DELITO_CLAVE`) REFERENCES `datos_delitos_adojc` (`CAUSA_CLAVE`, `DELITO_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_VDELITOS_ENTIDADES` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_VDELITOS_EXPEDIENTES` FOREIGN KEY (`CAUSA_CLAVE`) REFERENCES `datos_causas_penales_adojc` (`CAUSA_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_VDELITOS_MUNICIPIOS` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_VDELITOS_VICTIMAS` FOREIGN KEY (`CAUSA_CLAVE`,`VICTIMA_CLAVE`) REFERENCES `datos_victimas_adojc` (`CAUSA_CLAVE`, `VICTIMA_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `datos_vdelitos_adojo`
--
ALTER TABLE `datos_vdelitos_adojo`
  ADD CONSTRAINT `FK_VDELI_CAUSACLAVEJO` FOREIGN KEY (`CAUSA_CLAVEJO`) REFERENCES `datos_causas_penales_adojo` (`CAUSA_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_VDELI_DELITOCLAVEJO` FOREIGN KEY (`CAUSA_CLAVEJO`,`DELITO_CLAVE`) REFERENCES `datos_delitos_adojo` (`CAUSA_CLAVEJO`, `DELITO_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_VDELI_ENTIDADJO` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_VDELI_MUNICIPIOJO` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_VDELI_VICTIMACLAVEJO` FOREIGN KEY (`CAUSA_CLAVEJO`,`VICTIMA_CLAVE`) REFERENCES `datos_victimas_adojo` (`CAUSA_CLAVEJO`, `VICTIMA_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `datos_vfuente_ingresos_adojc`
--
ALTER TABLE `datos_vfuente_ingresos_adojc`
  ADD CONSTRAINT `FK_VFUENTE_ENTIDADES` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_VFUENTE_EXPEDIENTES` FOREIGN KEY (`CAUSA_CLAVE`) REFERENCES `datos_causas_penales_adojc` (`CAUSA_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_VFUENTE_INGRESOS` FOREIGN KEY (`INGRESO`) REFERENCES `catalogos_fuente_ingresos` (`FUENTE_ID`),
  ADD CONSTRAINT `FK_VFUENTE_MUNICIPIOS` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_VFUENTE_VICTIMA` FOREIGN KEY (`CAUSA_CLAVE`,`VICTIMA_CLAVE`) REFERENCES `datos_victimas_adojc` (`CAUSA_CLAVE`, `VICTIMA_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `datos_vfuente_ingresos_adojo`
--
ALTER TABLE `datos_vfuente_ingresos_adojo`
  ADD CONSTRAINT `FK_VFUENT_CAUSACLAVEJO` FOREIGN KEY (`CAUSA_CLAVEJO`) REFERENCES `datos_causas_penales_adojo` (`CAUSA_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_VFUENT_ENTIDADJO` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_VFUENT_INGRESO` FOREIGN KEY (`INGRESO`) REFERENCES `catalogos_fuente_ingresos` (`FUENTE_ID`),
  ADD CONSTRAINT `FK_VFUENT_MUNICIPIOJO` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_VFUENT_VICTIMACLAVE` FOREIGN KEY (`CAUSA_CLAVEJO`,`VICTIMA_CLAVE`) REFERENCES `datos_victimas_adojo` (`CAUSA_CLAVEJO`, `VICTIMA_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `datos_victimas_adojc`
--
ALTER TABLE `datos_victimas_adojc`
  ADD CONSTRAINT `FK_VICITIMAS_NACIONALIDAD` FOREIGN KEY (`NACIONALIDAD`) REFERENCES `catalogos_nacionalidad` (`NACIONALIDAD_ID`),
  ADD CONSTRAINT `FK_VICITIMAS_RANGOINGRESOS` FOREIGN KEY (`RANGO_INGRESOS`) REFERENCES `catalogos_rango_ingresos` (`ID_INGRESOS`),
  ADD CONSTRAINT `FK_VICITMAS_ENTIDADESNAC` FOREIGN KEY (`NACIMIENTO_ENTIDAD`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_VICTIMAS_ALFABETISMO` FOREIGN KEY (`CONDICION_ALFABETISMO`) REFERENCES `catalogos_alfabetismo` (`ALFABETISMO_ID`),
  ADD CONSTRAINT `FK_VICTIMAS_ASESOR` FOREIGN KEY (`ASESOR`) REFERENCES `catalogos_tipo_defensor` (`DEFENSOR_ID`),
  ADD CONSTRAINT `FK_VICTIMAS_CAUSASP` FOREIGN KEY (`CAUSA_CLAVE`) REFERENCES `datos_causas_penales_adojc` (`CAUSA_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_VICTIMAS_CONTOASESOR` FOREIGN KEY (`CONTO_ASESOR`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_VICTIMAS_DOMINIOESPANIOL` FOREIGN KEY (`HABLA_ESPANOL`) REFERENCES `catalogos_dominio_espanol` (`DOMINIO_ID`),
  ADD CONSTRAINT `FK_VICTIMAS_EDAD` FOREIGN KEY (`EDAD`) REFERENCES `catalogos_numero` (`NUMERO_ID`),
  ADD CONSTRAINT `FK_VICTIMAS_EDOCIVIL` FOREIGN KEY (`ESTADO_CIVIL`) REFERENCES `catalogos_estado_civil` (`ESTADO_CIVIL_ID`),
  ADD CONSTRAINT `FK_VICTIMAS_ENTIDADES` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_VICTIMAS_ENTIDADRESID` FOREIGN KEY (`RESIDENCIA_ENTIDAD`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_VICTIMAS_GRADOESTUDIOS` FOREIGN KEY (`GRADO_ESTUDIOS`) REFERENCES `catalogos_grado_estudios` (`ESTUDIO_ID`),
  ADD CONSTRAINT `FK_VICTIMAS_HABLAINDIGENA` FOREIGN KEY (`HABLA_INDIGENA`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_VICTIMAS_INGRESOS` FOREIGN KEY (`INGRESOS`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_VICTIMAS_INTERPRETE` FOREIGN KEY (`INTERPRETE`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_VICTIMAS_LENGUAEXTRANJERA` FOREIGN KEY (`LENGUA_EXTRANJERA`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_VICTIMAS_LENGUAINDIGENA` FOREIGN KEY (`LENGUA_INDIGENA`) REFERENCES `catalogos_linguisticas` (`LINGUISTICA_ID`),
  ADD CONSTRAINT `FK_VICTIMAS_MMUJER` FOREIGN KEY (`MEDIDAS_MUJER`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_VICTIMAS_MPORTECCION` FOREIGN KEY (`MEDIDAS_PROTECCION`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_VICTIMAS_MUNICIPIONAC` FOREIGN KEY (`NACIMIENTO_MUNICIPIO`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_VICTIMAS_MUNICIPIOS` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_VICTIMAS_MUNICIPIOSRESID` FOREIGN KEY (`RESIDENCIA_MUNICIPIO`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_VICTIMAS_OCUPACION` FOREIGN KEY (`OCUPACION`) REFERENCES `catalogos_ocupacion` (`OCUPACION_ID`),
  ADD CONSTRAINT `FK_VICTIMAS_PAISNAC` FOREIGN KEY (`NACIMIENTO_PAIS`) REFERENCES `catalogos_pais` (`PAIS_ID`),
  ADD CONSTRAINT `FK_VICTIMAS_PAISRESID` FOREIGN KEY (`RESIDENCIA_PAIS`) REFERENCES `catalogos_pais` (`PAIS_ID`),
  ADD CONSTRAINT `FK_VICTIMAS_SEXO` FOREIGN KEY (`SEXO`) REFERENCES `catalogos_sexo` (`SEXO_ID`),
  ADD CONSTRAINT `FK_VICTIMAS_TVICTIMA` FOREIGN KEY (`TIPO_VICTIMA`) REFERENCES `catalogos_tipo_victima` (`VICTIMA_ID`),
  ADD CONSTRAINT `FK_VICTIMAS_VMORAL` FOREIGN KEY (`TIPO_VICTIMA_MORAL`) REFERENCES `catalogos_victima_moral` (`MORAL_ID`),
  ADD CONSTRAINT `FK_VICTIMAS_VULNERABILIDAD` FOREIGN KEY (`VULNERABILIDAD`) REFERENCES `catalogos_vulnerabilidad` (`VULNERABILIDAD_ID`);

--
-- Filtros para la tabla `datos_victimas_adojo`
--
ALTER TABLE `datos_victimas_adojo`
  ADD CONSTRAINT `FK_VICTIMA_CLAVEJC` FOREIGN KEY (`CAUSA_CLAVEJC`,`VICTIMA_CLAVEJC`) REFERENCES `datos_victimas_adojc` (`CAUSA_CLAVE`, `VICTIMA_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_VICT_ALFABETISMOJO` FOREIGN KEY (`CONDICION_ALFABETISMO`) REFERENCES `catalogos_alfabetismo` (`ALFABETISMO_ID`),
  ADD CONSTRAINT `FK_VICT_ASESORJO` FOREIGN KEY (`ASESOR`) REFERENCES `catalogos_tipo_defensor` (`DEFENSOR_ID`),
  ADD CONSTRAINT `FK_VICT_CAUSACLAVEJO` FOREIGN KEY (`CAUSA_CLAVEJO`) REFERENCES `datos_causas_penales_adojo` (`CAUSA_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_VICT_CONTOASESORJO` FOREIGN KEY (`CONTO_ASESOR`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_VICT_EDADJO` FOREIGN KEY (`EDAD`) REFERENCES `catalogos_numero` (`NUMERO_ID`),
  ADD CONSTRAINT `FK_VICT_EDOCIVILJO` FOREIGN KEY (`ESTADO_CIVIL`) REFERENCES `catalogos_estado_civil` (`ESTADO_CIVIL_ID`),
  ADD CONSTRAINT `FK_VICT_ENTIDADJO` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_VICT_ESPANIOLJO` FOREIGN KEY (`HABLA_ESPANOL`) REFERENCES `catalogos_dominio_espanol` (`DOMINIO_ID`),
  ADD CONSTRAINT `FK_VICT_ESTUDIOSJO` FOREIGN KEY (`GRADO_ESTUDIOS`) REFERENCES `catalogos_grado_estudios` (`ESTUDIO_ID`),
  ADD CONSTRAINT `FK_VICT_HABLAEXTRAGERAJO` FOREIGN KEY (`LENGUA_EXTRANJERA`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_VICT_HABLAINDIGENAJO` FOREIGN KEY (`HABLA_INDIGENA`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_VICT_INGRESOSJO` FOREIGN KEY (`INGRESOS`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_VICT_INTERPRETE` FOREIGN KEY (`INTERPRETE`) REFERENCES `catalogos_respuesta_simple` (`RESPUESTA_ID`),
  ADD CONSTRAINT `FK_VICT_LENGUAINDIGENAJO` FOREIGN KEY (`LENGUA_INDIGENA`) REFERENCES `catalogos_linguisticas` (`LINGUISTICA_ID`),
  ADD CONSTRAINT `FK_VICT_MUNICIPIOJO` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_VICT_NACIMTOENTIDADJO` FOREIGN KEY (`NACIMIENTO_ENTIDAD`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_VICT_NACIMTOPAISJO` FOREIGN KEY (`NACIMIENTO_PAIS`) REFERENCES `catalogos_pais` (`PAIS_ID`),
  ADD CONSTRAINT `FK_VICT_NACIONALIDADJO` FOREIGN KEY (`NACIONALIDAD`) REFERENCES `catalogos_nacionalidad` (`NACIONALIDAD_ID`),
  ADD CONSTRAINT `FK_VICT_NACMUNICIPIOJO` FOREIGN KEY (`NACIMIENTO_MUNICIPIO`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_VICT_OCUPACIONJO` FOREIGN KEY (`OCUPACION`) REFERENCES `catalogos_ocupacion` (`OCUPACION_ID`),
  ADD CONSTRAINT `FK_VICT_RANGOINGRESOSJO` FOREIGN KEY (`RANGO_INGRESOS`) REFERENCES `catalogos_rango_ingresos` (`ID_INGRESOS`),
  ADD CONSTRAINT `FK_VICT_RESIDENPAISJO` FOREIGN KEY (`RESIDENCIA_PAIS`) REFERENCES `catalogos_pais` (`PAIS_ID`),
  ADD CONSTRAINT `FK_VICT_RESIENTIDADJO` FOREIGN KEY (`RESIDENCIA_ENTIDAD`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_VICT_RESIMUNICIPIOJO` FOREIGN KEY (`RESIDENCIA_MUNICIPIO`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_VICT_SEXOJO` FOREIGN KEY (`SEXO`) REFERENCES `catalogos_sexo` (`SEXO_ID`),
  ADD CONSTRAINT `FK_VICT_TIPOVICTIMAJO` FOREIGN KEY (`TIPO_VICTIMA`) REFERENCES `catalogos_tipo_victima` (`VICTIMA_ID`),
  ADD CONSTRAINT `FK_VICT_VICTMORALJO` FOREIGN KEY (`TIPO_VICTIMA_MORAL`) REFERENCES `catalogos_victima_moral` (`MORAL_ID`),
  ADD CONSTRAINT `FK_VICT_VULNERABLEJO` FOREIGN KEY (`VULNERABILIDAD`) REFERENCES `catalogos_vulnerabilidad` (`VULNERABILIDAD_ID`);

--
-- Filtros para la tabla `datos_vmedidas_adojc`
--
ALTER TABLE `datos_vmedidas_adojc`
  ADD CONSTRAINT `FK_VMEDIDAS_ENTIDADES` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_VMEDIDAS_EXPEDIENTES` FOREIGN KEY (`CAUSA_CLAVE`) REFERENCES `datos_causas_penales_adojc` (`CAUSA_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_VMEDIDAS_MPROTECCION` FOREIGN KEY (`TIPO_MEDIDA_PROT`) REFERENCES `catalogos_medidas_proteccion` (`PROTECCION_ID`),
  ADD CONSTRAINT `FK_VMEDIDAS_MUNICIPIOS` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_VMEDIDAS_VICTIMAS` FOREIGN KEY (`CAUSA_CLAVE`,`VICTIMA_CLAVE`) REFERENCES `datos_victimas_adojc` (`CAUSA_CLAVE`, `VICTIMA_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `datos_vmedidas_dmuj_adojc`
--
ALTER TABLE `datos_vmedidas_dmuj_adojc`
  ADD CONSTRAINT `FK_VMED_DMUJ_ENTIDADES` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_VMED_DMUJ_MEDIDAS` FOREIGN KEY (`TIPO_MEDIDA_MUJER`) REFERENCES `catalogos_medidas_mujer` (`MUJER_ID`),
  ADD CONSTRAINT `FK_VMED_DMUJ_MUNICIPIOS` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_VMED_DMUJ_VICTIMAS` FOREIGN KEY (`CAUSA_CLAVE`,`VICTIMA_CLAVE`) REFERENCES `datos_victimas_adojc` (`CAUSA_CLAVE`, `VICTIMA_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `datos_vprocesados_adojc`
--
ALTER TABLE `datos_vprocesados_adojc`
  ADD CONSTRAINT `FK_VPROCESADOS_ENTIDADES` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_VPROCESADOS_EXPEDIENTES` FOREIGN KEY (`CAUSA_CLAVE`) REFERENCES `datos_causas_penales_adojc` (`CAUSA_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_VPROCESADOS_MUNICIPIOS` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_VPROCESADOS_PROCESADOS` FOREIGN KEY (`CAUSA_CLAVE`,`PROCESADO_CLAVE`) REFERENCES `datos_procesados_adojc` (`CAUSA_CLAVE`, `PROCESADO_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_VPROCESADOS_RIMPUTADO` FOREIGN KEY (`RELACION`) REFERENCES `catalogos_relacion_imputado` (`RELACION_ID`),
  ADD CONSTRAINT `FK_VPROCESADOS_VICTIMAS` FOREIGN KEY (`CAUSA_CLAVE`,`VICTIMA_CLAVE`) REFERENCES `datos_victimas_adojc` (`CAUSA_CLAVE`, `VICTIMA_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `datos_vprocesados_adojo`
--
ALTER TABLE `datos_vprocesados_adojo`
  ADD CONSTRAINT `FK_VPRO_CAUSACLAVEJO` FOREIGN KEY (`CAUSA_CLAVEJO`) REFERENCES `datos_causas_penales_adojo` (`CAUSA_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_VPRO_ENTIDADJO` FOREIGN KEY (`JUZGADO_ENTIDAD_ID`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_VPRO_MUNICIPIOJO` FOREIGN KEY (`JUZGADO_MUNICIPIO_ID`) REFERENCES `catalogos_municipios` (`MUNICIPIO_ID`),
  ADD CONSTRAINT `FK_VPRO_PROCESCLAVEJO` FOREIGN KEY (`CAUSA_CLAVEJO`,`PROCESADO_CLAVE`) REFERENCES `datos_procesados_adojo` (`CAUSA_CLAVEJO`, `PROCESADO_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_VPRO_RELACIONJO` FOREIGN KEY (`RELACION`) REFERENCES `catalogos_relacion_imputado` (`RELACION_ID`),
  ADD CONSTRAINT `FK_VPRO_VICTIMACLAVEJO` FOREIGN KEY (`CAUSA_CLAVEJO`,`VICTIMA_CLAVE`) REFERENCES `datos_victimas_adojo` (`CAUSA_CLAVEJO`, `VICTIMA_CLAVEJO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `FK_USUARIO_ENTIDAD` FOREIGN KEY (`ENTIDAD`) REFERENCES `catalogos_entidades` (`ENTIDAD_ID`),
  ADD CONSTRAINT `FK_USUARIO_TIPO_USUARIO` FOREIGN KEY (`TIPO_USUARIO`) REFERENCES `tipo_usuarios` (`TIPO_USUARIO_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios_control`
--
ALTER TABLE `usuarios_control`
  ADD CONSTRAINT `FK_CONTROL_CAUSA` FOREIGN KEY (`CAUSA_CLAVE`) REFERENCES `datos_causas_penales_adojc` (`CAUSA_CLAVE`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
