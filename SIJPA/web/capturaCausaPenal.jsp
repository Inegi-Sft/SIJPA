<%-- 
    Document   : captura_Causa_Penal
    Created on : 24/09/2019, 09:42:00 AM
    Author     : CESAR.OSORIO
--%>
<%@page import="clasesAuxiliar.showJueces"%>
<%@page import="clasesAuxiliar.showCausasPenales"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="clasesAuxiliar.FechaMax"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Captura Causa Penal</title>
        <script type="text/javascript" src="js/funcionesCP.js"></script>
        <%            
            FechaMax fecha =new FechaMax();
            String fechas= fecha.FechaValida();
            catalogos cat = new catalogos();
            showJueces juez = new showJueces();
            ArrayList<String[]> lista, causa;
            
            String juzgadoClave = (String)session.getAttribute("juzgadoClave");
            String operacion = "";//Variable de control para saber si se inserta o se actualiza
            String causaClave = "";
            String carpInves = "";
            String fechaIngre = "";
            String nomJuez = "";
            String accionPenal = "";
            String expAcomula = "";
            String expReferencia = "";
            String competencia = "";
            String tipoCompe = "";
            String totDelitos = "";
            String totProce = "";
            String totVictimas = "";
            String comen = "";
            if(request.getParameter("causaClave") != null){//Si viene la causa penal, recuperamos datos
                causaClave = request.getParameter("causaClave");
                showCausasPenales causas = new showCausasPenales();
                causa = causas.findCausaPenal(juzgadoClave, causaClave + juzgadoClave.replace("-", ""));
                if(causa.size() > 0){
                    session.setAttribute("causaClave", causaClave + juzgadoClave.replace("-", ""));//Iniciamos variable de sesion con causa clave
                    operacion = "actualizar";
                    carpInves = causa.get(0)[0];
                    fechaIngre = causa.get(0)[1];
                    nomJuez = causa.get(0)[2];
                    accionPenal = causa.get(0)[3];
                    expAcomula = causa.get(0)[4];
                    expReferencia = causa.get(0)[5];
                    competencia = causa.get(0)[6];
                    tipoCompe = causa.get(0)[7];
                    totDelitos = causa.get(0)[8];
                    totProce = causa.get(0)[9];
                    totVictimas = causa.get(0)[10];
                    comen = causa.get(0)[11];
                }else{
                    out.println("<script>alert('Causa Penal " + causaClave + " no encontrada dentro del Juzgado "  + juzgadoClave + "'); "
                            + "window.location.href = 'causasPenales.jsp'</script>");
                }
            }
            
        %>
    </head>
    <body>
        <%--<%@include file="cabecera.jsp"%>--%>
        <section class="contenedor">
            <h2>Causa Penal</h2>
            <form  method="post" name="formCausaPenal" id="formCausaPenal">
                <fieldset>
                    <legend>Características de la Causa Penal</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <label for="jClave">Juzgado Clave</label>
                                <input type="text" name="jClave" id="jClave" value="${sessionScope.juzgadoClave}" disabled>
                                <input type="hidden" name="opera" id="opera" value="<%=operacion%>">
                            </td>
                            <td>
                                <label for="carpInves">No. Carpeta Investigación</label>
                                <input type="text" name="carpInves" id="carpInves" value="<%=carpInves%>" required>
                            </td>
                            <td>
                                <label for="expClave">No. Asunto Asignado</label>
                                <input type="text" name="expClave" id="expClave" onblur="ValidaCarpeInvest('#expClave')" value="<%=causaClave%>" required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="fIngreso">Fecha de ingreso</label>
                                <input type="date" name="fIngreso" id="fIngreso" value="<%=fechaIngre%>" required max="<%=fechas%>" onkeydown="return false">
                                <div class="noIdentificada">
                                    <input type="checkbox" id="chkFechaIngre" onclick="fechaNoIdent('#chkFechaIngre', '#fIngreso')">
                                    <label>No identificada</label>
                                </div>
                            </td>
                            <td>
                                <label for="nomJuez">Juez encargado de atender la causa penal</label>
                                <select name="nomJuez" id="nomJuez" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = juez.findJuez(juzgadoClave);
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(nomJuez)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[1] + "</option>");
                                        }
                                        out.println("<option value='100'>--Captura Juez--</option>");
                                    %>  
                                </select>
                            </td>
                            <td>
                                <label for="Pparticular">¿La causa penal deriva de acción penal por particular?</label>
                                <select name="Pparticular" id="Pparticular" required >
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findRespuestaSimple();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(accionPenal)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>  
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <fieldset>
                                    <div class="cols" id="expAcomulado">
                                        <label for="ExpAcomu" >Expediente acumulado</label>
                                        <select name="ExpAcomu" id="ExpAcomu" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findRespuestaSimple();
                                                for (int x = 0; x < 3; x++) {
                                                    out.println("<option value='" + lista.get(x)[0] + "'");
                                                    if(lista.get(x)[0].equals(expAcomula)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + lista.get(x)[0] + ".- " + lista.get(x)[1] + "</option>");
                                                }
                                            %>  
                                        </select>
                                    </div>
                                    <div class="cols oculto" id="expReferen">
                                        <label for="ExpRefe">Expediente al que hace referencia</label>
                                        <input type="text" name="ExpRefe" id="ExpRefe" class="txtMedia" value="<%=expReferencia%>">
                                    </div>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <fieldset>
                                    <div class="cols">
                                        <label for="compe">Organo Competente</label>
                                        <select name="compe" id="compe" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findRespuestaSimple();
                                                for (int x = 0; x < 3; x++) {
                                                    out.println("<option value='" + lista.get(x)[0] + "'");
                                                    if(lista.get(x)[0].equals(competencia)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + lista.get(x)[0] + ".- " + lista.get(x)[1] + "</option>");
                                                }
                                            %>  
                                        </select>
                                    </div>
                                    <div class="cols oculto" id="tipoIncopetencia">
                                        <label for="Tincompe">Tipo de incompetencia</label>
                                        <select name="Tincompe" id="Tincompe" class="txtMedia" >
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findIncompetencia();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(tipoCompe)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>  
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <fieldset class="oculto" id="totalElementos">
                    <legend>Contenidos de la causa penal</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <label for="Tdelitos">Total de delitos</label>
                                <input type="number" name="Tdelitos" id="Tdelitos" value="<%=totDelitos%>" min="0">

                            </td>
                            <td>
                                <label for="Tadolescentes">Total de imputados</label>
                                <input type="number" name="Tadolescentes" id="Tadolescentes" value="<%=totProce%>" min="0">
                            </td>
                            <td>
                                <label for="Tvictimas">Total de víctimas</label>
                                <input type="number" name="Tvictimas" id="Tvictimas" value="<%=totVictimas%>" min="0">
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <div class="comentarios">
                    <h2>Comentarios</h2>
                    <textarea name="ComentaExpe" id="ComentaExpe"><%=comen%></textarea>
                </div>
                <br>
                <input type="submit" name="guardarExp" id="guardarExp" value="Guardar"> 
            </form>
        </section>
    </body>
</html>
