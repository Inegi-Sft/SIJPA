<%-- 
    Document   : conclusiones
    Created on : 3/10/2019, 02:16:37 PM
    Author     : FERMIN.GOMEZ
--%>
<%@page import="clasesAuxiliar.showProcesados"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Resoluciones</title>
        <%@include file="librerias.jsp" %>
        <script type="text/javascript" src="js/jquery-ui.js"></script>
<!--        <style type="text/css">
            .contenido{
               display: inline-block;
               vertical-align: top; 
            }
            .encabezado{
                width: 20em;
                padding: 10px 18px;
                background-color: #003057;
                color: white;
                margin: 0 1em 0 1em;
                border-top-left-radius:10px; 
                border-top-right-radius: 10px;
            }
            .dragDrop {
                border: 3px dashed transparent;
                /*background: #ccc;*/
                background: rgb(140, 139, 139, 0.4);
                margin: 0 1em 1em 1em;
                min-height: 8em;
                padding: 1em;
                width: 20em;
            }

            .dragDrop.hovering {
                background: #b6d6fb;
                border-color: #276cbc;
            }
            .item {
                font-size: 16px;
                background: white;
                cursor: pointer;
                display: block;
                padding: 8px;
                margin: 8px;
                border-radius: 10px;
                border: 1px solid #a7a4a4;
            } 
          
         </style>
        <script>
        $( function(){
            $( "ul.dragDrop" ).sortable({
                connectWith: "ul"
            }).disableSelection();
            $( '.dragDrop' ).droppable({
                accept: '.item',
                hoverClass: 'hovering'
            });
        });
        </script>-->
    </head>
    <body style="zoom: .9;">
        <%
            HttpSession sesion= request.getSession();
            
            catalogos cat = new catalogos();
            showProcesados proce=new showProcesados();
            ArrayList<String[]> lista = new ArrayList();
            
            String entidad =(String) sesion.getAttribute("entidad");
            String municipio =(String) sesion.getAttribute("municipio");
            String distrito =(String) sesion.getAttribute("distrito");
            String numero =(String) sesion.getAttribute("numero");
            String jConcatenado =entidad+municipio+distrito+numero;
            String claveCausa =(String) sesion.getAttribute("claveCausa");
        %>
        <%--<%@include file="cabecera.jsp" %>--%>
        <section class="contenedor">
            <h1>Resoluciones dictadas por el juez de control</h1>
            <form action="" method="post" name="formConclusiones" id="formConclusiones">
                <label for="idProcesado">Id Adolescente</label>
                <select class="lblExBig" name="idProcesado" id="idProcesado">
                    <option value="">--Seleccione--</option>
                    <%  lista = proce.findProcesadoExp(claveCausa+jConcatenado);
                        for (String[] ls : lista) {
                            out.println("<option value='" + ls[0] + "'>" + ls[0].replace(jConcatenado, "") + ".- " + ls[1] + "</option>");
                        }
                    %> 
                </select>
                <fieldset>
                    <legend>Resolución</legend>
                    
                    <div class="cols">
                        <label for="fechaReso">Fecha en que se dictó la resolución</label>
                        <input type="date" name="fechaReso" id="fechaReso" required />
                        <div class="noIdentificada">
                            <input type="checkbox" id="chkFechaReso" onclick="fechaNoIdent('#chkFechaReso', '#fechaReso')"><label>No identificada</label>
                        </div>
                    </div>
                    <div class="cols">
                        <label for="resolucion">Tipo de resolución (Conclusión o terminación)</label>
                        <select class="txtLong" name="resolucion" id="resolucion" onchange="tipoResolucion();" required>
                            <option value="">--Seleccione--</option>
                            <%  lista = cat.findTipoResolucion();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %> 
                        </select>
                    </div>
                    <fieldset class="oculto subField" id="flsSobreseimto">
                        <legend>Sobreseimiento</legend>
                        <div class="cols" id="idSobre" >
                            <label for="tipoSobreseimto">Tipo de sobreseimiento</label>
                            <select class="txtMedia" name="tipoSobreseimto" id="tipoSobreseimto">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findTipoSobrese();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="cols" id="proceSobre"  >
                            <label for="proceSobreseimto">Procedencia del sobreseimiento</label>
                            <select class="txtLong" name="proceSobreseimto" id="proceSobreseimto" onchange="causasExclusion();">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findSobreseimiento();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="cols" id="dExcluAccion"  >
                            <label for="excluAccion" class="lblExBig">Causas de exclusión de la acción penal</label>
                            <select class="txtLong" name="excluAccion" id="excluAccion">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findExclusionAccionP();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                    </fieldset>
                    <fieldset class="oculto subField" id="flsSuspCP">
                        <legend>Suspensión condicional del proceso</legend>
                        <div class="colsA">
                            <label for="tipoCondiSCP">Tipo de condiciones impuestas durante la suspensión condicional del proceso</label>
                            <select class="txtMedia" name="tipoCondiSCP" id="tipoCondiSCP" required>
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findResSimple();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="colsA">
                            <label for="fechaExtAP" style="width:500px;">Fecha en que se decretó la extinción de la acción penal por cumplimiento de las condiciones establecidas en la suspensión condicional del proceso</label>
                            <input type="date" name="fechaExtSCP" id="fechaExtSCP" required/>
                            <div class="noIdentificada">
                                <input type="checkbox" id="chkFechaExtSCP" onclick="fechaNoIdent('#chkFechaExtSCP', '#fechaExtSCP')"><label>No identificada</label>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset class="oculto subField" id="flsAcuerdoR">
                        <legend>Acuerdo reparatorio</legend>
                        <div class="colsA">
                            <label for="tipoMecanismoAR">Tipo de mecanismo por el que se llegó al acuerdo reparatorio</label>
                            <select class="txtMedia" name="tipoMecanismoAR" id="tipoMecanismoAR" required>
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findResSimple();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="colsA">
                            <label for="fechaExtinAR" style="width:500px;">Fecha en que se decretó la extinción de la acción penal por cumplimiento de las obligaciones pactadas en el acuerdo reparatorio</label>
                            <input type="date" name="fechaExtinAR" id="fechaExtinAR" required/>
                            <div class="noIdentificada">
                                <input type="checkbox" id="chkFechaExtinAR" onclick="fechaNoIdent('#chkFechaExtinAR', '#fechaExtinAR')"><label>No identificada</label>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset class="oculto subField" id="flsProceAbreviado">
                        <legend>Procedimiento abreviado</legend>
                        <div class="cols" id="dTipoResolucionPA" >
                            <label for="tipoResolucionPA">Tipo de resolución en el procedimiento abreviado</label>
                            <select class="txtLong" name="tipoResolucionPA" id="tipoResolucionPA" onchange="tipoProcedimientoAbrev()">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findProcAbreviado();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="cols oculto" id="dTipoMedidaPL">
                            <label for="tipoMedidaPL">Tipo de medidas privativa de la libertad</label>
                            <select class="txtMedia" name="tipoMedidaPL" id="tipoMedidaPL"  onchange="rInternamiento()" >
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findPrivLibertad();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="cols oculto" id="dTipoMedidaNPL">
                            <label for="tipoMedidaNPL" id="DtipoMedidaNPL">Tipo de medidas no privativa de la libertad</label>
                            <select class="txtMedia" name="tipoMedidaNPL" id="tipoMedidaNPL" >
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findNoPrivacion();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="cols oculto" id="Dinternamiento">
                            <label for="internamiento">Tiempo en internamiento</label>
                            <select class="txtMedia" name="internamiento" id="internamiento">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findTiempoInterna();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <br/><br/>
                        <table class="tablasRegis" id="tblDConclusiones" style="width:auto;">
                            <tr>
                                <th>Delitos atribuidos al adolescente</th>
                                <th width="100">Privativo</th>
                                <th width="130">No privativo</th>
                                <th width="130">No identificado</th>
                            </tr>
                            <tr>
                                <td>Delitos en contra de la salud en su modalidad de narcomenudeo
                                    <input type="hidden" name="delitoConclu" value="d1">
                                </td>
                                <td><input type="radio" name="resolDelito0" value="1"></td>
                                <td><input type="radio" name="resolDelito0" value="2"></td>
                                <td><input type="radio" class="radValCambia" name="resolDelito0" value="9"></td>
                            </tr>
                            <tr>
                                <td>Homicidio
                                    <input type="hidden" name="delitoConclu" value="d2">
                                </td>
                                <td><input type="radio" name="resolDelito1" value="1"></td>
                                <td><input type="radio" name="resolDelito1" value="2"></td>
                                <td><input type="radio" class="radValCambia" name="resolDelito1" value="9"></td>
                            </tr>
                            <tr>
                                <td>lesiones graves
                                <input type="hidden"  name="delitoConclu" value="d3">
                                </td>
                                <td><input type="radio" name="resolDelito2" value="1"></td>
                                <td><input type="radio" name="resolDelito2" value="2"></td>
                                <td><input type="radio" class="radValCambia" name="resolDelito2" value="9"></td>
                            </tr>
                            <tr>
                                <td>contra el medio ambiente
                                <input type="hidden" name="delitoConclu" value="d4">
                                </td>
                                <td><input type="radio" name="resolDelito3" value="1"></td>
                                <td><input type="radio" name="resolDelito3" value="2"></td>
                                <td><input type="radio" class="radValCambia" name="resolDelito3" value="9"></td>
                            </tr>
                        </table>
<!--                        <span id="notaDC" class="oculto" style="display:block; font-size: 18px;color: maroon;"><b>Arrastra los delitos al apartado segun corresponda</b></span>
                        <br/>
                        <div class="contenido">
                            <div class="encabezado" id="encabezado"> - - - </div>
                            <ul class="dragDrop" id="privativaL">
                                <li class="item">Delitos en contra de la salud en su modalidad de narcomenudeo</li>
                                <li class="item">Homicidio</li>
                                <li class="item">lesiones</li>
                                <li class="item">Aborto no punible</li>
                            </ul>
                        </div>
                        <div class="contenido oculto" id="cont2">
                            <div class="encabezado">No privativa de la libertad</div>
                            <ul class="dragDrop" id="noPrivativaL">
                            </ul>
                        </div>-->
                        
                    </fieldset>
                </fieldset>
                <fieldset id="flsReparaDanio">
                    <legend>Reparación del daño</legend>
                    <div class="cols">
                        <label for="reparaDanio">¿Hubo reparación del daño?</label>
                        <select class="txtMedia" name="reparaDanio" id="reparaDanio" onchange="respuestaRepara()" required>
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findResSimple();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %> 
                        </select>
                    </div>
                    <div class="cols oculto" id="dTipoRepara" >
                        <label for="tipoReparaD">Tipo de reparación del daño</label>
                        <select class="txtMedia dependiente" name="tipoReparaD" id="tipoReparaD" onchange="pagoCosa()" >
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findRePDano();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %> 
                        </select>
                    </div>
                    <div class="cols oculto" id="dMontoRepara" >
                        <label for="montoReparaD">Monto de la reparación del daño impuesta</label>
                        <select class="txtMedia dependiente" name="montoReparaD" id="montoReparaD">
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findMulta();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %>
                        </select>
                    </div>
                </fieldset>
                <fieldset id="flsImpugnacion">
                    <legend>Impugnación</legend>
                    <div class="cols">
                        <label for="impugnacion">¿La resolución fue impugnada?</label>
                        <select class="txtMedia" name="impugnacion" id="impugnacion" onchange="impugna()" required>
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findResSimple();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="cols oculto" id="dTipoImpugna">
                        <label for="tipoImpugnacion">Tipo de impugnación</label>
                        <select class="txtMedia dependiente" name="tipoImpugnacion" id="tipoImpugnacion">
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findTipoImpugna();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="cols oculto" id="dFechaImpugna">
                        <label for="fechaImpugnacion">Fecha de la impugnación </label>
                        <input type="date" name="fechaImpugnacion" id="fechaImpugnacion" class="depenFecha"/>
                        <div class="noIdentificada">
                            <input type="checkbox" id="chkFechaImpugnacion" onclick="fechaNoIdent('#chkFechaImpugnacion', '#fechaImpugnacion')"><label>No identificada</label>
                        </div>
                    </div>
                    <div class="cols oculto" id="dQuienImpugna">
                        <label for="personaImpugna">¿Por quién fue impugnada la resolución?</label>
                        <select class="txtMedia dependiente" name="personaImpugna" id="personaImpugna">
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findImpugResolucion();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %>
                        </select>
                    </div>
                </fieldset>
                <div class="comentarios">
                    <h2>Comentarios</h2>
                    <textarea name="comentarios" id="comentarios"></textarea>
                </div>
                <br/>
                <input type="submit" name="guardar" value="Guardar" class="btnFlotante"/>
            </form>
        </section>
    </body>
</html>
