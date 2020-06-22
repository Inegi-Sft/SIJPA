<%-- 
    Document   : conclusionesJO
    Created on : 4/05/2020, 02:16:37 PM
    Author     : FERMIN.GOMEZ
--%>
<%@page import="clasesAuxiliar.FechaMax"%>
<%@page import="clasesAuxiliar.showJuicio"%>
<%@page import="clasesAuxiliar.showConclusionesJO"%>
<%@page import="clasesAuxiliar.showProcesadosJO"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::ResolucionesJO</title>
        <%@include file="librerias.jsp" %>
        <script type="text/javascript" src="js/funcionesConcJO.js"></script>
        <%
            catalogos cat = new catalogos();
            showConclusionesJO sConclu = new showConclusionesJO();
            showProcesadosJO sProce = new showProcesadosJO();
            showJuicio sEtaOral = new showJuicio();
            ArrayList<String[]> lista, conclusiones, concluPA = new ArrayList();
            FechaMax fecha =new FechaMax();
            String fechas= fecha.FechaValida();
            
            String proceClave = "", posicion = "", edicion = "";
            if (request.getParameter("proceClave") != null || request.getParameter("posicion") != null) {
                proceClave = request.getParameter("proceClave");
                posicion = request.getParameter("posicion");
            }
            
            String juzgadClave = (String) session.getAttribute("juzgadoClave");
            String jDividido[] = juzgadClave.split("-"); //Esto separa en un array basandose en el separador que le pases
            String jEntidad = jDividido[0];
            String jMunicipio = jDividido[1];
            String jNumero = jDividido[2];
            String jConcatenado = jEntidad + jMunicipio + jNumero;
            String causaClaveJC = (String)session.getAttribute("causaClave");//Obtenemos la causa clave de JC
            String causaClaveJO = (String)session.getAttribute("causaClaveJO");//Obtenemos la causa clave de JO
            String operacion = "";//Variable de control para saber si se inserta o se actualiza
            String fechaResol = "";
            String tipoResol = "";
            String sobreseimto = "";
            String proceSobre = "";
            String excluAccion = "";
            String fechaSentencia = "";
            String tipoSentencia = "";
            String medidaPriva = "";
            String medidaNoPriva = "";
            String tiempoInter = "";
            String reparaDanio = "";
            String tipoRepara = "";
            String montoRepara = "";
            String impugna = "";
            String tipoImpugna = "";
            String fechaImpugna = "";
            String persoImpugna = "";
            String comen = "";
            if(request.getParameter("edita") != null){//Sabremos si es para edicion de datos o captura de datos
                edicion = request.getParameter("edita");
                if(edicion.equals("Si")){
                    conclusiones = sConclu.findConclusionJO(causaClaveJO, proceClave + jConcatenado);
                    if(conclusiones.size() > 0){
                        operacion = "actualizar";
                        fechaResol = conclusiones.get(0)[0];
                        tipoResol = conclusiones.get(0)[1];
                        sobreseimto = conclusiones.get(0)[2];
                        proceSobre = conclusiones.get(0)[3];
                        excluAccion = conclusiones.get(0)[4];
                        fechaSentencia = conclusiones.get(0)[5];
                        tipoSentencia = conclusiones.get(0)[6];
                        medidaPriva = conclusiones.get(0)[7];
                        medidaNoPriva = conclusiones.get(0)[8];
                        tiempoInter = conclusiones.get(0)[9];
                        reparaDanio = conclusiones.get(0)[10];
                        tipoRepara = conclusiones.get(0)[11];
                        montoRepara = conclusiones.get(0)[12];
                        impugna = conclusiones.get(0)[13];
                        tipoImpugna = conclusiones.get(0)[14];
                        fechaImpugna = conclusiones.get(0)[15];
                        persoImpugna = conclusiones.get(0)[16];
                        comen = conclusiones.get(0)[17];
                    }else{
                        out.println("<script>alert('Delito " + proceClave + " no encontrado dentro de la Causa Penal "  + causaClaveJC + "'); "
                                + "parent.$.fancybox.close();</script>");
                    }
                }
            }
            
            //Control verifica cual es tu tipo de resolucion en etapa oral
            String fallo = sEtaOral.verificFalloJO(causaClaveJO, proceClave + jConcatenado);
            if(!fallo.equals("9")){
                tipoResol = fallo;
            }
            System.out.println("Tipo res: " + tipoResol);
            
        %>
          
    </head>
    <body style="zoom: .9;">
        <%--<%@include file="cabecera.jsp" %>--%>
        <section class="contenedor">
            <h1>Resoluciones dictadas por el tribunal de enjuiciamiento</h1>
            <form method="post" name="formConclusionesJO" id="formConclusionesJO">
                <label for="procesado">Id Adolescente</label>
                <input type="text" name="proceClave" id="proceClave" value="<%=proceClave%>" readonly>
                <input type="hidden" name="posicion" id="posicion" value="<%=posicion%>">
                <input type="hidden" name="opera" id="opera" value="<%=operacion%>">
                <fieldset>
                    <legend>Resolución</legend>
                    <div class="cols">
                        <label for="fechaReso">Fecha en que se dictó la resolución</label>
                        <input type="date" name="fechaReso" id="fechaReso" value="<%=fechaResol%>" max="<%=fechas%>" required>
                        <div class="noIdentificada">
                            <input type="checkbox" id="chkFechaReso" onclick="fechaNoIdent('#chkFechaReso', '#fechaReso')">
                            <label>No identificada</label>
                        </div>
                    </div>
                    <div class="cols">
                        <label for="resolucion">Tipo de resolución (Conclusión o terminación)</label>
                        <select name="resolucion" id="resolucion" required>
                            <option value="">--Seleccione--</option>
                            <%  
                                lista = cat.findTipoResolucionJO();
                                for (String[] ls : lista) {
                                    out.print("<option value='" + ls[0] + "'");
                                    if(ls[0].equals(tipoResol)){
                                        out.println(" selected ");
                                    }
                                    out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                }
                            %> 
                        </select>
                    </div>
                    <div class="cols">
                        <label for="fechaSenten">Fecha de lectura y explicación de la sentencia</label>
                        <input type="date" name="fechaSenten" id="fechaSenten" value="<%=fechaSentencia%>" required>
                        <div class="noIdentificada">
                            <input type="checkbox" id="chkFechaSenten" onclick="fechaNoIdent('#chkFechaSenten', '#fechaSenten')">
                            <label>No identificada</label>
                        </div>
                    </div>
                    <fieldset class="oculto subField" id="flsSobreseimto">
                        <legend>Sobreseimiento</legend>
                        <div class="cols" id="idSobre" >
                            <label for="tipoSobreseimto">Tipo de sobreseimiento</label>
                            <select name="tipoSobreseimto" id="tipoSobreseimto">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findTipoSobreseimiento();
                                    for (String[] ls : lista) {
                                        out.print("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(sobreseimto)){
                                            out.println(" selected ");
                                        }
                                        out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="cols" id="proceSobre"  >
                            <label for="proceSobreseimto">Procedencia del sobreseimiento</label>
                            <select name="proceSobreseimto" id="proceSobreseimto">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findSobreseimiento();
                                    for (String[] ls : lista) {
                                        out.print("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(proceSobre)){
                                            out.println(" selected ");
                                        }
                                        out.print( ">" + ls[0]+ ".- ");
                                        if(ls[0].equals("6"))
                                            out.print("Se hubiere extinguido la acción penal ");
                                        else
                                            out.println(ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="cols oculto" id="dExcluAccion"  >
                            <label for="excluAccion" class="lblExBig">Causas de extinción de la acción penal</label>
                            <select name="excluAccion" id="excluAccion">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findExclusionAccionp();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(excluAccion)){
                                            out.println(" selected ");
                                        }
                                        out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                    </fieldset>
                    
                    <fieldset class="oculto subField" id="flsSentencia">
                        <legend>Sentencia</legend>
                        <div class="cols" id="dTipoSentencia" >
                            <label for="tipoSentencia">Tipo de resolucion</label>
                            <select name="tipoSentencia" id="tipoSentencia">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findProcAbreviado();
                                    for (String[] ls : lista) {
                                        out.print("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(tipoSentencia)){
                                            out.println(" selected ");
                                        }
                                        out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="cols oculto" id="dTipoMedidaPL">
                            <label for="tipoMedidaPL" class="lblExBig">Tipo de medida privativa de la libertad</label>
                            <select name="tipoMedidaPL" id="tipoMedidaPL">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findPrivativas();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(medidaPriva)){
                                            out.println(" selected ");
                                        }
                                        out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="cols oculto" id="dTipoMedidaNPL">
                            <label for="tipoMedidaNPL" class="lblExBig">Tipo de medida no privativa de la libertad</label>
                            <select name="tipoMedidaNPL" id="tipoMedidaNPL" >
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findNoprivativas();
                                    for (String[] ls : lista) {
                                        out.print("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(medidaNoPriva)){
                                            out.println(" selected ");
                                        }
                                        out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="cols oculto" id="dInternamiento">
                            <label for="internamiento">Tiempo en internamiento</label>
                            <select name="internamiento" id="internamiento">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findTiempoInternamiento();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(tiempoInter)){
                                            out.println(" selected ");
                                        }
                                        out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <br/>
                        <table class="tablasRegis" id="tblDConclusiones">
                            <tr>
                                <th>Delitos atribuidos al adolescente</th>
                                <th>Privativo</th>
                                <th>No privativo</th>
                                <th>No identificado</th>
                            </tr>
                            <%
                                lista = sProce.findProcesadoDelitosJO(causaClaveJO, proceClave + jConcatenado);
                                for(int i = 0; i < lista.size(); i++){
                                    out.println("<tr>");
                                    out.println("<td>");
                                    out.println(lista.get(i)[1] + "<input type='hidden' name='delitoConclu' value='" + lista.get(i)[0] + "'>");
                                    out.println("</td>");
                                    concluPA = sConclu.findConcluAJO(causaClaveJO, proceClave + jConcatenado, lista.get(i)[0]);
                                    if(concluPA.size() != 0){
                                        int sentencia = Integer.parseInt(concluPA.get(0)[0]);
                                        String conclu = concluPA.get(0)[1];
                                        switch (sentencia){
                                            case 1:
                                                out.println("<td><input type='radio' name='resolDelito" + i + "' value='1' checked></td>");
                                                out.println("<td><input type='radio' name='resolDelito" + i + "' value='2'></td>");
                                                out.println("<td><input type='radio' name='resolDelito" + i + "' value='9' class='radValCambia'></td>");
                                                break;
                                            case 2:
                                                out.println("<td><input type='radio' name='resolDelito" + i + "' value='1'></td>");
                                                out.println("<td><input type='radio' name='resolDelito" + i + "' value='2' checked></td>");
                                                out.println("<td><input type='radio' name='resolDelito" + i + "' value='9' class='radValCambia'></td>");
                                                break;
                                            case 3:
                                                if(conclu.equals("1")){
                                                    out.println("<td><input type='radio' name='resolDelito" + i + "' value='1' checked></td>");
                                                    out.println("<td><input type='radio' name='resolDelito" + i + "' value='2'></td>");
                                                    out.println("<td><input type='radio' name='resolDelito" + i + "' value='9' class='radValCambia'></td>");
                                                }else{
                                                    out.println("<td><input type='radio' name='resolDelito" + i + "' value='1'></td>");
                                                    out.println("<td><input type='radio' name='resolDelito" + i + "' value='2' checked></td>");
                                                    out.println("<td><input type='radio' name='resolDelito" + i + "' value='9' class='radValCambia'></td>");
                                                }
                                                break;
                                            case 9:
                                                out.println("<td><input type='radio' name='resolDelito" + i + "' value='1'></td>");
                                                out.println("<td><input type='radio' name='resolDelito" + i + "' value='2'></td>");
                                                out.println("<td><input type='radio' name='resolDelito" + i + "' value='9' class='radValCambia' checked></td>");
                                                break;
                                        }
                                    }else{
                                        out.println("<td><input type='radio' name='resolDelito" + i + "' value='1'></td>");
                                        out.println("<td><input type='radio' name='resolDelito" + i + "' value='2'></td>");
                                        out.println("<td><input type='radio' name='resolDelito" + i + "' value='9' class='radValCambia'></td>");
                                    }
                                    out.println("</tr>");
                                }
                            %>
                        </table>
                    </fieldset>
                </fieldset>
                <fieldset id="flsReparaDanio">
                    <legend>Reparación del daño</legend>
                    <div class="cols">
                        <label for="reparaDanio">¿Hubo reparación del daño?</label>
                        <select name="reparaDanio" id="reparaDanio" required>
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findRespuestaSimple();
                                for (String[] ls : lista) {
                                    out.print("<option value='" + ls[0] + "'");
                                    if(ls[0].equals(reparaDanio)){
                                        out.println(" selected ");
                                    }
                                    out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                }
                            %> 
                        </select>
                    </div>
                    <div class="cols oculto" id="dTipoRepara" >
                        <label for="tipoReparaD">Tipo de reparación del daño</label>
                        <select name="tipoReparaD" id="tipoReparaD">
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findReparacionDano();
                                for (String[] ls : lista) {
                                    out.print("<option value='" + ls[0] + "'");
                                    if(ls[0].equals(tipoRepara)){
                                        out.println(" selected ");
                                    }
                                    out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                }
                            %> 
                        </select>
                    </div>
                    <div class="cols oculto" id="dMontoRepara" >
                        <label for="montoReparaD">Monto de la reparación del daño impuesta</label>
                        <select name="montoReparaD" id="montoReparaD">
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findMulta();
                                for (String[] ls : lista) {
                                    out.print("<option value='" + ls[0] + "'");
                                    if(ls[0].equals(montoRepara)){
                                        out.println(" selected ");
                                    }
                                    out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                }
                            %>
                        </select>
                    </div>
                </fieldset>
                <fieldset id="flsImpugnacion">
                    <legend>Impugnación</legend>
                    <div class="cols">
                        <label for="impugnacion">¿La resolución fue impugnada?</label>
                        <select name="impugnacion" id="impugnacion" required>
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findRespuestaSimple();
                                for (String[] ls : lista) {
                                    out.print("<option value='" + ls[0] + "'");
                                    if(ls[0].equals(impugna)){
                                        out.println(" selected ");
                                    }
                                    out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="cols oculto" id="dTipoImpugna">
                        <label for="tipoImpugnacion">Tipo de impugnación</label>
                        <select name="tipoImpugnacion" id="tipoImpugnacion">
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findTipoImpugnacion();
                                for (String[] ls : lista) {
                                    out.print("<option value='" + ls[0] + "'");
                                    if(ls[0].equals(tipoImpugna)){
                                        out.println(" selected ");
                                    }
                                    out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="cols oculto" id="dFechaImpugna">
                        <label for="fechaImpugnacion">Fecha de la impugnación </label>
                        <input type="date" name="fechaImpugnacion" id="fechaImpugnacion" value="<%=fechaImpugna%>">
                        <div class="noIdentificada">
                            <input type="checkbox" id="chkFechaImpugnacion" onclick="fechaNoIdent('#chkFechaImpugnacion', '#fechaImpugnacion')">
                            <label>No identificada</label>
                        </div>
                    </div>
                    <div class="cols oculto" id="dQuienImpugna">
                        <label for="personaImpugna">¿Por quién fue impugnada la resolución?</label>
                        <select name="personaImpugna" id="personaImpugna">
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findFiguraProceso();
                                for (String[] ls : lista) {
                                    out.print("<option value='" + ls[0] + "'");
                                    if(ls[0].equals(persoImpugna)){
                                        out.println(" selected ");
                                    }
                                    out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                }
                            %>
                        </select>
                    </div>
                </fieldset>
                <div class="comentarios">
                    <h2>Comentarios</h2>
                    <textarea name="comentarios" id="comentarios"><%=comen%></textarea>
                </div>
                <br/>
                <input type="submit" name="guardar" value="Guardar" class="btnFlotante"/>
            </form>
        </section>
        <%if(!fallo.equals("9")){ %>
            <script type="text/javascript"> 
                $(document).ready(function(){ 
                    //tipoResolucion(); 
                    $("#resolucion option:not(:selected)").attr("disabled", "disabled");
                });
            </script>
        <%  } %>
    </body>
</html>
