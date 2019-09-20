<%-- 
    Document   : datosGral
    Created on : 20/09/2019, 10:19:58 AM
    Author     : CARLOS.SANCHEZG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Datos Generales</title>
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="cabecera.jsp"%>
        <section class="contenedor">
            <h1>Datos Generales</h1>
            <form action="" method="post">
                <label for="nombre">Nombre(s):</label>
                <input type="text" name="nombre" id="nombre">
                <label for="appellidoP">Apellido Paterno:</label>
                <input type="text" name="appellidoP" id="appellidoP">
                <label for="appellidoM">Apellido Materno:</label>
                <input type="text" name="appellidoM" id="appellidoM">
            </form>
        </section>
    </body>
</html>
