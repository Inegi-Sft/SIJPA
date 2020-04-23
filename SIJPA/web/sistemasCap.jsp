<%-- 
    Document   : sitemasCap
    Created on : 14/01/2020, 03:14:20 PM
    Author     : CARLOS.SANCHEZG
--%>

<%@page import="clasesAuxiliar.usuario"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>SIJPA::Sistemas de Captura</title>
        <%@include file="librerias.jsp" %>
    </head>
    <body>
        <%@include file="cabecera.jsp"%>
        <section class="contenedor">
            <h1>SISTEMAS CAPTURA SIJPA</h1><br>
            <button id="btnJc" name="btnJc">Juzgado de Control</button>
            <button id="btnJo" name="btnJo">Juicio Oral</button>
        </section>
    </body>
</html>
