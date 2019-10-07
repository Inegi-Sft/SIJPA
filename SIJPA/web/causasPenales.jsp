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
        <link href="css/datatables.min.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="js/datatables.min.js"></script>
        <script type="text/javascript" src="js/funcion-DataTable.js"></script>
        <script type="text/javascript" src="js/menu.js"></script>
    </head>
    <body>
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
                        <%for(int x = 1; x < 20; x++){%>
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
    </body>
</html>
