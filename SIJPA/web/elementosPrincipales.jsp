<%-- 
    Document   : elementos
    Created on : 4/10/2019, 11:24:50 AM
    Author     : FERMIN.GOMEZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Elementos del Expediente</title>
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="js/pestanas.js"></script>
    </head>
    <body>
        <%@include file="cabecera.jsp"%>
        <section class="contenedor">
            <br/>
            <div class="pestana">
                <button class="pestanaLinks active" onclick="openPestana(event, 'p1')" id="btn1" style="display: block">Expediente</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p2')">Delitos</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p3')">Adolescentes</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p4')">Victimas</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p5')">Inicial</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p6')">Intermedia</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p7')">Conclusion y/o Terminacion</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p8')">Tramite</button>
            </div>
            <div id="p1" class="pestanaContent" style="display: block">
                <%@include file="capturaExpediente.jsp"%>
            </div>
            <div id="p2" class="pestanaContent">
                <h1>Delitos</h1>
                <table id="causas" class="myTable" border="1">
                    <tr>
                        <th>Delito clave</th>
                        <th>Delito (Cod. Penal)</th>
                        <th>Delito (Norma Tec.)</th>
                        <th>Grado</th>
                        <th>Comisión</th>
                        <th>Acción</th>
                        <th>Elemento para comisión</th>
                        <th>No. Adolescentes</th>
                        <th>No. Victimas</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                        <td>0002/2019-d1</td>
                        <td>Homicidio</td>
                        <td>Homicidio</td>
                        <td>Consumado</td>
                        <td>Doloso</td>
                        <td>Con violencia</td>
                        <td>Con Arma blanca</td>
                        <td>1</td>
                        <td>2</td>
                        <td><a href="#"><img src='img/editar.png' title="Modificar"/></a></td>
                        <td><a href="#"><img src='img/delete.png' title="Eliminar"/></a></td>
                    <tr>
                    </tr>
                        <td>0002/2019-d2</td>
                        <td>Lesiones</td>
                        <td>Lesiones</td>
                        <td>Consumado</td>
                        <td>Doloso</td>
                        <td>Con violencia</td>
                        <td>Con Arma blanca</td>
                        <td>1</td>
                        <td>2</td>
                        <td><a href="#"><img src='img/editar.png' title="Modificar"/></a></td>
                        <td><a href="#"><img src='img/delete.png' title="Eliminar"/></a></td>
                    <tr>
                </table>
            </div>
            <div id="p3" class="pestanaContent">
                <h1>Adolescentes</h1>
                <table id="causas" class="myTable" border="1">
                    <tr>
                        <th>Adolescente clave</th>
                        <th>Tipo de Presentación</th>
                        <th>Sexo</th>
                        <th>Fecha nacimiento</th>
                        <th>Lugar nacimiento</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                    <tr>
                        <td>0002/2019-p1</td>
                        <td>Detenido</td>
                        <td>Hombre</td>
                        <td>15-08-1987</td>
                        <td>Ciudad Valles, San Luis Potosi</td>
                        <td><a href="#"><img src='img/editar.png' title="Modificar"/></a></td>
                        <td><a href="#"><img src='img/delete.png' title="Eliminar"/></a></td>
                    <tr>
                    <tr>
                        <td>0002/2019-p2</td>
                        <td>Detenido</td>
                        <td>Mujer</td>
                        <td>15-08-1987</td>
                        <td>Ciudad Valles, San Luis Potosi</td>
                        <td><a href="#"><img src='img/editar.png' title="Modificar"/></a></td>
                        <td><a href="#"><img src='img/delete.png' title="Eliminar"/></a></td>
                    <tr>
                </table>
            </div>
            <div id="p4" class="pestanaContent">
                <h1>Victimas</h1>
                <table id="causas" class="myTable" border="1">
                    <tr>
                        <th>Victima clave</th>
                        <th>Tipo de Víctima</th>
                        <th>Sexo</th>
                        <th>Fecha nacimiento</th>
                        <th>Lugar nacimiento</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                    <tr>
                        <td>0002/2019-v1</td>
                        <td>Persona Fisica</td>
                        <td>Hombre</td>
                        <td>15-08-1987</td>
                        <td>Ciudad Valles, San Luis Potosi</td>
                        <td><a href="#"><img src='img/editar.png' title="Modificar"/></a></td>
                        <td><a href="#"><img src='img/delete.png' title="Eliminar"/></a></td>
                    <tr>
                    <tr>
                        <td>0002/2019-v2</td>
                        <td>Persona Fisica</td>
                        <td>Mujer</td>
                        <td>15-08-1987</td>
                        <td>Ciudad Valles, San Luis Potosi</td>
                        <td><a href="#"><img src='img/editar.png' title="Modificar"/></a></td>
                        <td><a href="#"><img src='img/delete.png' title="Eliminar"/></a></td>
                    <tr>
                </table>
            </div>
            <div id="p5" class="pestanaContent">
                <h1>Etapa Inicial</h1>
                <table id="causas" class="myTable" border="1">
                    <tr>
                        <th>Adolescente clave</th>
                        <th>Control detencion</th>
                        <th>Audiencia inicial</th>
                        <th>Auto vinculacion</th>
                        <th>Medida cautelar</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                    <tr>
                        <td>0002/2019-p1</td>
                        <td>Si</td>
                        <td>Si</td>
                        <td>Vinculación a proceso</td>
                        <td>No</td>
                        <td><a href="#"><img src='img/editar.png' title="Modificar"/></a></td>
                        <td><a href="#"><img src='img/delete.png' title="Eliminar"/></a></td>
                    <tr>
                    <tr>
                        <td>0002/2019-p2</td>
                        <td>Si</td>
                        <td>No</td>
                        <td>No vinculacion a proceso</td>
                        <td>No</td>
                        <td><a href="#"><img src='img/editar.png' title="Modificar"/></a></td>
                        <td><a href="#"><img src='img/delete.png' title="Eliminar"/></a></td>
                    <tr>
                </table>
            </div>
            <div id="p6" class="pestanaContent">
                <h1>. . . . Trabajando en ello . . .</h1>
            </div>
            <div id="p7" class="pestanaContent">
                <h1>Resoluciones dictadas</h1>
                <table id="causas" class="myTable" border="1">
                    <tr>
                        <th>Conclusión clave</th>
                        <th>Fecha conclusión</th>
                        <th>Adolescente clave</th>
                        <th>Tipo conclusión/terminación</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                    <tr>
                        <td>0002/2019-c1</td>
                        <td>12/07/2019</td>
                        <td>0002/2019-p1</td>
                        <td>Sobreseimiento</td>
                        <td><a href="#"><img src='img/editar.png' title="Modificar"/></a></td>
                        <td><a href="#"><img src='img/delete.png' title="Eliminar"/></a></td>
                    <tr>
                    <tr>
                        <td>0002/2019-c2</td>
                        <td>15/04/2019</td>
                        <td>0002/2019-p2</td>
                        <td>Suspension condicional del proceso</td>
                        <td><a href="#"><img src='img/editar.png' title="Modificar"/></a></td>
                        <td><a href="#"><img src='img/delete.png' title="Eliminar"/></a></td>
                    <tr>
                </table>
            </div>
            <div id="p8" class="pestanaContent">
                <h1>Pendientes de resolución</h1>
                <table id="causas" class="myTable" border="1">
                    <tr>
                        <th>Tramite clave</th>
                        <th>Etapa procesal</th>
                        <th>Adolescente clave</th>
                        <th>Fecha última actuación</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                    <tr>
                        <td>0002/2019-t1</td>
                        <td>Investigacion</td>
                        <td>0002/2019-p1</td>
                        <td>27/09/2019</td>
                        <td><a href="#"><img src='img/editar.png' title="Modificar"/></a></td>
                        <td><a href="#"><img src='img/delete.png' title="Eliminar"/></a></td>
                    <tr>
                    <tr>
                        <td>0002/2019-t2</td>
                        <td>Intermedia</td>
                        <td>0002/2019-p2</td>
                        <td>12/01/2019</td>
                        <td><a href="#"><img src='img/editar.png' title="Modificar"/></a></td>
                        <td><a href="#"><img src='img/delete.png' title="Eliminar"/></a></td>
                    <tr>
                </table>
            </div>
        </section>
    </body>
</html>
