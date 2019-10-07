<%-- 
    Document   : Victimas
    Created on : 26/09/2019, 08:59:09 AM
    Author     : CESAR.OSORIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Víctimas</title>
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/datatables.min.css">
        <link rel="stylesheet" href="css/jquery.fancybox.css">
        <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.fancybox.js"></script>
        <script type="text/javascript" src="js/funciones.js"></script>
        <script type="text/javascript" src="js/datatables.min.js"></script>
    </head>
    <body>

        <%@include file="cabecera.jsp" %>
        <section class="contenedor">
            <h1>Víctimas</h1>
            <span class="totExp">Total de Victimas:</span>
            <button class="btnTabla" name="agrgavic" id="agegavic"><img src="img/add3.png" width="20" height="20" /> Agregar Víctima</button>
            <table id="victima" class="tablasRegis">
                <thead>
<!--                    <tr>
                        <th colspan="5" class="boton">
                            <button class="btnTabla"><img src="img/add3.png" width="20" height="20" /> Agregar Víctima</button>
                        </th>
                    </tr>-->
                    <tr>
                        <th>Victima Clave</th>
                        <th>Tipo de Victima</th>
                        <th>Sexo</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>a</td>
                        <td>b</td>
                        <td>c</td>
                        <td style="width: 30px;"><a href="#"><img src='img/editar.png' title="Modificar"/></a></td>
                        <td style="width: 35px;"><a href="#"><img src='img/delete.png' title="Eliminar"/></a></td>
                    </tr>
                    
                </tbody>    



            </table>    
            
            <a class='exp' href='victimas.jsp'><img src='img/add.png'></a> 

        </section>    
    </body>
</html>
