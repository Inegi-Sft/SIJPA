<%-- 
    Document   : causasPenales
    Created on : 24/09/2019, 11:34:36 AM
    Author     : FERMIN.GOMEZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Causas Penales</title>
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
        <%@include file="librerias.jsp" %>
        <style type="text/css">
            .load {
                position: fixed;
                left: 0px;
                top: 0px;
                width: 100%;
                height: 100%;
                z-index: 999;
                background: url('img/loading-35.gif') 50% 50% no-repeat rgb(249,249,249);
                opacity: .8;
            }
        </style>
    </head>
    <body>
        <div class="load"></div>

        <%@include file="cabecera.jsp" %>
        <%@include file="menu.jsp"%>
        <section class="contenedor">
            <div class="toggle-nav">
                <div class="toggle-nav-inner"></div>
            </div>
            <h1>Causas Penales</h1>
            <form action="#" method="post">
                <span class="totExp">Total de Causas Penales:</span>
                <a class="add" href="elementosPrincipales.jsp"><img src="img/add3.png" width="20" height="20" /> Agregar Expediente</a>
                <table id="causas" class="myTable">
                    <thead>
                        <tr>
                            <th>Expediente</th>
                            <th>Tipo de Accion de Remision</th>
                            <th>Adolescentes</th>
                            <th>Victimas</th>
                            <th>Conductas Antisociales</th>
                            <th>Organo Competente</th>
                            <th>Fecha Ingreso</th>
                            <th>Inconsistencias</th>
                            <th>Editar</th>
                            <th>Eliminar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%for (int x = 1; x < 20; x++) {%>
                        <tr>
                            <td>asdf</td>
                            <td>2</td>
                            <td>asdf</td>
                            <td>asdf</td>
                            <td>asdf</td>
                            <td>asdf</td>
                            <td>asdf</td>
                            <td>asdf</td>
                            <td><a href="elementosPrincipales.jsp"><img src='img/editar.png' title="Editar"/></a></td>
                            <td><a href="#"><img src='img/delete.png' title="Eliminar"/></a></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </form>
        </section>
        <script type="text/javascript">
            $(document).ready(function() {
                $(".load").fadeOut("slow");;
               });
        </script>
    </body>
</html>
