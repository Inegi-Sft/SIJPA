<%-- 
    Document   : juzgados
    Created on : 20/09/2019, 10:55:04 AM
    Author     : FERMIN.GOMEZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" Content="text/html; charset=UTF-8">
        <title>SIJPA::Juzgados</title>
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
    </head>
    <body >
        <%@include file="cabecera.jsp"%>
        <section class="contenedor">
            <h1>Juzgados</h1>

            <div class="pestana">
                <button class="pestanaLinks" onclick="openPestana(event, 'p1')" id="btn1">Datos del Juez</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p2')">Datos Órgano Jurisdiccional</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p3')">Forma de Organizacion del Órgano</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p4')">Datos Geográficos</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p5')">Datos de quien captura</button>
            </div>

            <form action="" method="post">
                <!-- Contenido pestañas -->
                <div id="p1" class="pestanaContent">
                    <br/><h3>Datos del Juez</h3><br/>
                    <input type="text" name="nombre" id="nombre" placeholder="Nombre(s)" required/>
                    <input type="text" name="apaterno" id="apaterno" placeholder="Apellido Paterno" required/>
                    <input type="text" name="amaterno" id="amaterno" placeholder="Apellido Materno" required/>
                    <label for="fGestion">Fecha inicio gestion:</label>
                    <input type="date" name="fGestion" id="fGestion" />
                </div>

                <div id="p2" class="pestanaContent">
                    <h3>Datos Órgano Jurisdiccional</h3>
                    <p>Paris is the capital of France.</p> 
                </div>

                <div id="p3" class="pestanaContent">
                    <h3>Forma de Organizacion del Órgano</h3>
                    <p>Tokyo is the capital of Japan.</p>
                </div>
                <div id="p4" class="pestanaContent">
                    <h3>Datos Geográficos</h3>
                    <p>Tokyo is the capital of Japan.</p>
                </div>
                <div id="p5" class="pestanaContent">
                    <h3>Datos de quien captura</h3>
                    <p>Tokyo is the capital of Japan.</p>
                </div>
            </form>
        </section>
        <script type="text/javascript" src="js/pestanas.js"></script>
    </body>
</html>
