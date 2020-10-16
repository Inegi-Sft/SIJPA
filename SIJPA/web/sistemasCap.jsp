<%-- 
    Document   : sistemasCap
    Created on : 14/01/2020, 03:14:20 PM
    Author     : CARLOS.SANCHEZG
--%>

<%@page import="clasesAuxiliar.showJueces"%>
<%@page import="clasesAuxiliar.showJuzgados"%>
<%@page import="clasesAuxiliar.usuario"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>SIJPA::Sistemas de Captura</title>
        <%@include file="librerias.jsp" %>
        <%
            //Verifica el numero de viita que es del ususario para saber a donde mandarlo
            usuario usuario = new usuario();
            showJuzgados juz = new showJuzgados();
            int visita = usuario.findVisitaUsu((String) session.getAttribute("usuActivo"));
            if(visita == 0){
                //Si es la primera vez lo mandamos a aceptar los terminos
                response.sendRedirect("bienvenida.jsp");
            }else if(juz.findTotJuzgado() == 0){
                //Si llegara a fallar la captura del primer juzgado aqui lo controlamos y lo mandamos de nuevo
                response.sendRedirect("capturaJuzgado.jsp");
            }
        %>
    </head>
    <body>
        <%@include file="cabecera.jsp"%>
        <section class="contenedor">
            <h1>SISTEMAS CAPTURA SIJPA</h1>
            <button class="btnSisCap" id="btnJuzga" name="btnJuzga">Juzgados</button>
            <button class="btnSisCap" id="btnJuez" name="btnJuez">Jueces</button>
            <button class="btnSisCap" id="btnJc" name="btnJc">Juzgado de Control</button>
            <button class="btnSisCap" id="btnJo" name="btnJo">Juicio Oral</button>
            <button class="btnSisCap" id="btnAudi" name="btnAudi">Audiencias</button>
            <button class="btnSisCap" id="btnExport" name="btnExport">Exportar BD</button>
            <button class="btnSisCap" id="btnImport" name="btnExport">Importar BD</button>
            <button class="btnSisCap" id="btnRepor" name="btnRepor">Reportes</button>
            <button class="btnSisCap" id="btnValidar" name="btnValidar">Validar Datos</button>
            <button class="btnSisCap" id="btnAcuerdo" name="btnAcuerdo">Acuerdo</button>
            <%
                //Control de usuarios si es administrador entonces mostramos la opcion de Usuarios
                if(session.getAttribute("tipoUsuario") != null){
                    if((Integer)session.getAttribute("tipoUsuario") == 1){
                        out.print("<button class='btnSisCap' id='btnUsuario' name='btnUsuario'>Usuarios</button>");
                    }
                }else{
                    response.sendRedirect("index.jsp");
                }
            %>
            <br><br>
        </section>
    </body>
</html>
