<%-- 
    Document   : procesados
    Created on : 26/09/2019, 09:04:33 AM
    Author     : FERMIN.GOMEZ
--%>

<%@page import="clasesAuxiliar.showProcesados"%>
<%@page import="clasesAuxiliar.showCausasPenales"%>
<%@page import="clasesAuxiliar.showDelitos"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clasesAuxiliar.FechaMax"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Procesados</title>
        <%@include file="librerias.jsp" %>
        <script type="text/javascript" src="js/funcionesPro.js?v=<%=(int)(Math.random()*10+1)%>"></script>
        <%
            catalogos cat = new catalogos();
            showDelitos sd = new showDelitos();
            showCausasPenales causaPen = new showCausasPenales();
            showProcesados sProcesa = new showProcesados();
            FechaMax fecha =new FechaMax();
            String fechas= fecha.FechaValida();
            ArrayList<String[]> lista, procesado;
            ArrayList<String> pIngre,pDelito = new ArrayList();
            
            String proceClave = "", posicion = "", edicion = "";
            if (request.getParameter("proceClave") != null || request.getParameter("posicion") != null) {
                proceClave = request.getParameter("proceClave");
                posicion = request.getParameter("posicion");
            }
            
            String juzgadoClave = (String) session.getAttribute("juzgadoClave");
            String causaClave = (String) session.getAttribute("causaClave");
            String operacion = "";//Variable de control para saber si se inserta o se actualiza
            String nomProce = "";
            String aPaterno = "";
            String aMaterno = "";
            String alias = "";
            String curp = "";
            String fechaNaci = "";
            String sexo = "";
            String edad = "";
            String edadJuzgado="";
            String naciPais = "";
            String naciEnti = "";
            String naciMuni = "";
            String nacionali = "";
            String resiPais = "";
            String resiEnti = "";
            String resiMuni = "";
            String resiCol = "";
            String edoCivil = "";
            String discapaci = "";
            String condAlfabeto = "";
            String gradoEstu = "";
            String condiEstudi = "";
            String hablaEspa = "";
            String poblaIndi = "";
            String tiPoblaIndi = "";
            String hablaIndi = "";
            String lenguaIndi = "";
            String lenguaExtra = "";
            String interprete = "";
            String ingresos = "";
            String rangoIngre = "";
            String ocupacion = "";
            String condiActi = "";
            String inicioPro = "";
            String tipoDeten = "";
            String formaCondu = "";
            String gradoParti = "";
            String reinciden = "";
            String edoPsicofi = "";
            String gpoDeli = "";
            String nomGpoDeli = "";
            String defensor = "";
            String personaRes = "";
            String comen = "";
            if(request.getParameter("edita") != null){//Sabremos si es para edicion de datos o captura de datos
                edicion = request.getParameter("edita");
                if(edicion.equals("Si")){
                    procesado = sProcesa.findProcesados(causaClave, proceClave + juzgadoClave.replace("-", ""));
                    if(procesado.size() > 0){
                        operacion = "actualizar";
                        nomProce = procesado.get(0)[0];
                        aPaterno = procesado.get(0)[1];
                        aMaterno = procesado.get(0)[2];
                        alias = procesado.get(0)[3];
                        curp = procesado.get(0)[4];
                        fechaNaci = procesado.get(0)[5];
                        sexo = procesado.get(0)[6];
                        edad = procesado.get(0)[7];
                        naciPais = procesado.get(0)[8];
                        naciEnti = procesado.get(0)[9];
                        naciMuni = procesado.get(0)[10];
                        nacionali = procesado.get(0)[11];
                        resiPais = procesado.get(0)[12];
                        resiEnti = procesado.get(0)[13];
                        resiMuni = procesado.get(0)[14];
                        resiCol = procesado.get(0)[15];
                        edoCivil = procesado.get(0)[16];
                        discapaci = procesado.get(0)[17];
                        condAlfabeto = procesado.get(0)[18];
                        gradoEstu = procesado.get(0)[19];
                        condiEstudi = procesado.get(0)[20];
                        hablaEspa = procesado.get(0)[21];
                        poblaIndi = procesado.get(0)[22];
                        tiPoblaIndi = procesado.get(0)[23];
                        hablaIndi = procesado.get(0)[24];
                        lenguaIndi = procesado.get(0)[25];
                        lenguaExtra = procesado.get(0)[26];
                        interprete = procesado.get(0)[27];
                        ingresos = procesado.get(0)[28];
                        rangoIngre = procesado.get(0)[29];
                        ocupacion = procesado.get(0)[30];
                        condiActi = procesado.get(0)[31];
                        inicioPro = procesado.get(0)[32];
                        tipoDeten = procesado.get(0)[33];
                        formaCondu = procesado.get(0)[34];
                        gradoParti = procesado.get(0)[35];
                        reinciden = procesado.get(0)[36];
                        edoPsicofi = procesado.get(0)[37];
                        gpoDeli = procesado.get(0)[38];
                        nomGpoDeli = procesado.get(0)[39];
                        defensor = procesado.get(0)[40];
                        personaRes = procesado.get(0)[41];
                        comen = procesado.get(0)[42];
                        edadJuzgado=procesado.get(0)[43];
                    }else{
                        out.println("<script>alert('Procesado " + proceClave + " no encontrado dentro de la Causa Penal "  + causaClave + "'); "
                                + "window.location.href = 'elementosPrincipales.jsp'</script>");
                    }
                }
            }
        %>
    </head>
    <body style="zoom: .9;">
        <%--<%@include file="cabecera.jsp" %>--%>
        <section class="contenedor">
            <h1>Imputados</h1>
            <form method="post" name="formProcesados" id="formProcesados">
                <fieldset>
                    <legend>Características Sociodemográficas </legend>
                    <table class="tablaFormu">
                        <tr>
                            <td colspan="4">
                                <label>Imputado Clave</label>
                                <input type="text" name="proceClave" id="proceClave" value="<%=proceClave%>" readonly>
                                <input type="hidden" name="posicion" id="posicion" value="<%=posicion%>">
                                <input type="hidden" name="opera" id="opera" value="<%=operacion%>">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="nombre">Nombre(s)</label>
                                <input type="text" name="nombre" id="nombre" onkeypress="return /[[A-ZÑ ]|[Á,É,Í,Ó,Ú,Ä,Ë,Ï,Ö,Ü]/i.test(event.key)" value="<%=nomProce%>" required>
                            </td>
                            <td>
                                <label for="apaterno">Apellido paterno</label>
                                <input type="text" name="apaterno" id="apaterno" onkeypress="return /[[A-ZÑ ]|[Á,É,Í,Ó,Ú,Ä,Ë,Ï,Ö,Ü]/i.test(event.key)" value="<%=aPaterno%>" required>
                            </td>
                            <td>
                                <label for="amaterno">Apellido materno</label>
                                <input type="text" name="amaterno" id="amaterno" onkeypress="return /[[A-ZÑ ]|[Á,É,Í,Ó,Ú,Ä,Ë,Ï,Ö,Ü]/i.test(event.key)" value="<%=aMaterno%>" required>
                            </td>
                            <td>
                                <label for="alias">Alias</label>
                                <input type="text" name="alias" id="alias" value="<%=alias%>" required>
                                <div class='noIdentificada'>
                                    <input type='checkbox' id='chkAlias' onclick="chkNoApl('#chkAlias', '#alias')">
                                    <label>No Aplica</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="curp">CURP</label>
                                <input type="text" name="curp" id="curp" value="<%=curp%>" maxlength="18" minlength="18" required>
                                <div class='noIdentificada'>
                                    <input type='checkbox' id='chkCurp' onclick="curpNoIdent('#chkCurp', '#curp')">
                                    <label>No identificado</label>
                                </div>
                            </td>
                            <td>
                                <label for="fNacimiento">Fecha nacimiento</label>
                                <input type="date" name="fNacimiento" id="fNacimiento"  value="<%=fechaNaci%>" max="<%=fechas%>" title="Fecha de nacimiento del procesado" onchange="ValFechaNacPRO('#fNacimiento','#edadJuzgado')" onkeydown="return false" required>
                                <div class='noIdentificada'>
                                    <input type='checkbox' id='chkFechaNac' onclick="fechaNoIdent('#chkFechaNac', '#fNacimiento')">
                                    <label>No identificada</label>
                                </div>
                            </td>
                            <td>
                                <label for="sexo">Sexo</label>
                                <select name="sexo" id="sexo" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findSexo();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(sexo)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="edad">Edad al momento de cometer los hechos</label>
                                <select name="edad" id="edad" onchange="ValEdadDelito('#edad','#fNacimiento')" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        for (int i = 12; i <= 17; i++) {
                                            out.println("<option value='" + i + "'");
                                            if(Integer.toString(i).equals(edad)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + i + "</option>");
                                        }
                                        if(edad.equals("-9")){
                                            out.println("<option value='-9' selected>No identificado</option>");
                                        }else{
                                            out.println("<option value='-9'>No identificado</option>");
                                        }
                                    %>
                                </select>
                            </td>
                       </tr>
                       <tr>
                           <td>
                                <label for="edadJuzgado">Edad al momento de iniciar el proceso</label>
                                <select name="edadJuzgado" id="edadJuzgado" onchange="ValEdadJuzgado('#edadJuzgado','#fNacimiento')" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        for (int i = 12; i <= 99; i++) {
                                            out.println("<option value='" + i + "'");
                                            if(Integer.toString(i).equals(edadJuzgado)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + i + "</option>");
                                                    
                                        }
                                        if(edadJuzgado.equals("-9")){
                                            out.println("<option value='-9' selected>No identificado</option>");
                                        }else{
                                            out.println("<option value='-9'>No identificado</option>");
                                        }
                                    %>
                                </select>
                            </td>
                           
                       </tr>
                        <tr>
                            <td colspan="3">
                                <fieldset>
                                    <legend>Lugar de nacimiento</legend>
                                    <div class="colsx">
                                        <label for="nPais">País</label>
                                        <select name="nPais" id="nPais" onchange="lugarNacimiento('#nPais', '#dNEntidad', '#dNMunicipio', '#nEntidad', '#nMunicipio');" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findPais();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(naciPais)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="colsx oculto" id="dNEntidad">
                                        <label for="nEntidad">Entidad federativa</label>
                                        <select name="nEntidad" id="nEntidad" onchange="llenaMun('#nEntidad', '#nMunicipio')">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findEntidades();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(naciEnti)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="colsx oculto" id="dNMunicipio">
                                        <label for="nMunicipio" class="lblExBig">Municipio (Para CDMX Demarcación Territorial)</label>
                                        <select name="nMunicipio" id="nMunicipio">
                                            <%
                                                if(!naciPais.equals("1")){//Si es diferente de mexico se muestra vacio para ser llenado con jquery
                                                    out.println("<option value=''>--Seleccione--</option>");
                                                }else{//Si el pais es mexico entonces se llena el catalogo con municipios del estado
                                                    out.println("<option value=''>--Seleccione--</option>");
                                                    lista = cat.findMunicipios(Integer.parseInt(naciEnti));
                                                    for (String[] ls : lista) {
                                                        out.println("<option value='" + ls[0] + "'");
                                                        if(ls[0].equals(naciMuni)){
                                                            out.println(" selected ");
                                                        }
                                                        out.println(">" + ls[1] + "</option>");
                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <label for="nacionalidad">Nacionalidad</label>
                                <select name="nacionalidad" id="nacionalidad" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findNacionalidad();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(nacionali)){
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
                                    <legend>Lugar habitual de residencia</legend>
                                    <div class="colsx">
                                        <label for="residencia">Lugar habitual de residencia</label>
                                        <select name="residencia" id="residencia" onchange="lugarResidencia('#residencia', '#dREntidad', '#dRMunicipio', '#dRColonia', '#rEntidad', '#rMunicipio', '#rColonia');" required >
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findPais();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(resiPais)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="colsx oculto" id="dREntidad">
                                        <label for="rEntidad">Entidad federativa</label>
                                        <select name="rEntidad" id="rEntidad" onchange="llenaMun('#rEntidad', '#rMunicipio')">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findEntidades();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(resiEnti)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="colsx oculto" id="dRMunicipio">
                                        <label for="rMunicipio">Municipio (Para CDMX Demarcación Territorial)</label>
                                        <select name="rMunicipio" id="rMunicipio" onchange="llenaColonia('#rEntidad', '#rMunicipio', '#rColonia')">
                                            <%
                                                if(!resiPais.equals("1")){//Si es diferente de mexico se muestra vacio para ser llenado con jquery
                                                    out.println("<option value=''>--Seleccione--</option>");
                                                }else{//Si el pais es mexico entonces se llena el catalogo con municipios del estado
                                                    out.println("<option value=''>--Seleccione--</option>");
                                                    lista = cat.findMunicipios(Integer.parseInt(resiEnti));
                                                    for (String[] ls : lista) {
                                                        out.println("<option value='" + ls[0] + "'");
                                                        if(ls[0].equals(resiMuni)){
                                                            out.println(" selected ");
                                                        }
                                                        out.println(">" + ls[1] + "</option>");
                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="colsx oculto" id="dRColonia">
                                        <label for="rColonia">Colonia</label>
                                        <select name="rColonia" id="rColonia">
                                            <%
                                                if(!resiPais.equals("1")){//Si es diferente de mexico se muestra vacio para ser llenado con jquery
                                                    out.println("<option value=''>--Seleccione--</option>");
                                                }else{//Si el pais es mexico entonces se llena el catalogo con municipios del estado
                                                    out.println("<option value=''>--Seleccione--</option>");
                                                    lista = cat.findColonias(Integer.parseInt(resiEnti), Integer.parseInt(resiMuni));
                                                    for (String[] ls : lista) {
                                                        out.println("<option value='" + ls[0] + "'");
                                                        if(ls[0].equals(resiCol)){
                                                            out.println(" selected ");
                                                        }
                                                        out.println(">" + ls[1] + "</option>");
                                                    }
                                                    if(resiCol.equals("9999-9999")){
                                                        out.println("<option value='-9' selected>No identificado</option>");
                                                    }else{
                                                        out.println("<option value='-9'>No identificado</option>");
                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <label for="edoCivil">Situación conyugal</label>
                                <select name="edoCivil" id="edoCivil" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findEstadoCivil();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(edoCivil)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="discapacidad">¿Tiene alguna discapacidad?</label>
                                <select name="discapacidad" id="discapacidad" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findRespuestaSimple();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(discapaci)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select> 
                            </td>
                            <td>
                                <label for="alfabet">Condición de alfabetismo</label>
                                <select name="alfabet" id="alfabet" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findAlfabetismo();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(condAlfabeto)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="estudios">Grado de estudios concluido</label>
                                <select name="estudiosPro" id="estudiosPro" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findGradoEstudios();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(gradoEstu)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="condiEstudiante">Condición de estudiante</label>
                                <select name="condiEstudiante" id="condiEstudiante" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findCondicionEstudiante();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(condiEstudi)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="hablaEsp">Condición de dominio del español</label>
                                <select name="hablaEsp" id="hablaEsp" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findDominioEspanol();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(hablaEspa)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td colspan="3">
                                <fieldset>
                                    <div class="colsx lblExBig">
                                        <label for="poblaIndigena" class="lblExBig">¿Pertenece a alguna población indígena?</label>
                                        <select name="poblaIndigena" id="poblaIndigena" onchange="respuestaSimpleSelect('#poblaIndigena', '#dPuebloIndigena', '#puebloIndigena');" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findRespuestaSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(poblaIndi)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="colsx oculto" id="dPuebloIndigena">
                                        <label for="puebloIndigena">Tipo de pueblo indígena</label>
                                        <select name="puebloIndigena" id="puebloIndigena">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findPuebloIndigena();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(tiPoblaIndi)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <fieldset>
                                    <div class="cols">
                                        <label for="hablaIndigena" class="lblExBig">¿Habla alguna lengua indígena o dialecto?</label>
                                        <select name="hablaIndigena" id="hablaIndigena" onchange="respuestaSimpleSelect('#hablaIndigena', '#dLenguaIndigena', '#lenguaIndigena');" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findRespuestaSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(hablaIndi)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="cols lblExBig oculto" id="dLenguaIndigena">
                                        <label for="lenguaIndigena">Familia lingüísticas</label>
                                        <select name="lenguaIndigena" id="lenguaIndigena">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findLinguisticas();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(lenguaIndi)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <label for="lenExtranjera">¿Habla alguna lengua extranjera?</label>
                                <select name="lenExtranjera" id="lenExtranjera" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findRespuestaSimple();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(lenguaExtra)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="hablaEsp">¿Requirió traductor y/o intérprete?</label>
                                <select name="traductorPro" id="traductorPro" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findRespuestaSimple();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(interprete)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <fieldset>
                                    <div class="colsA">
                                        <label for="ingresosPro">¿Percibe algún tipo de ingresos? </label>
                                        <select name="ingresosPro" id="ingresosPro" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findRespuestaSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(ingresos)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    <div class="colsA oculto" id="rangoIngePro">
                                        <label for="indigena">Rango de ingresos mensual</label>
                                        <select name="rangoIngresosPro" id="rangoIngresosPro">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findRangoIngresos();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(rangoIngre)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    <table class="tablasRegis oculto" id="tblFuenteIngrePro">
                                        <tr>
                                            <th>ID</th>
                                            <th>Fuente de ingresos</th>
                                            <th>Aplica</th>
                                        </tr>
                                        <%
                                            lista = cat.findFuenteIngresos();
                                            for (String[] ls : lista) {
                                                out.println("<tr>");
                                                out.println("<td>" + ls[0] + "</td>");
                                                out.println("<td>" + ls[1] + "</td>");
                                                out.println("<td>");
                                                pIngre = sProcesa.findPIngresos(causaClave, proceClave + juzgadoClave.replace("-", ""), ls[0]);
                                                if(pIngre.size() != 0){
                                                    out.println("<input type='checkbox' name='chkIngresosPro' id='chkIngresosPro"+ls[0]+"' value=" + ls[0] + " checked>");
                                                }else{
                                                    out.println("<input type='checkbox' name='chkIngresosPro' id='chkIngresosPro"+ls[0]+"' value=" + ls[0] + ">");
                                                }
                                                out.println("</td>");
                                                out.println("</tr>");
                                            }
                                        %>
                                    </table>
                                </fieldset>
                            </td>
                            <td colspan="2">
                                <fieldset>
                                    <div class="cols">
                                        <label for="ocupacion">Ocupación</label>
                                        <select name="ocupacion" id="ocupacion" onchange="ocupacionAdo('#ocupacion', '#dCondicionActi', '#condicionActi');" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findOcupacion();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(ocupacion)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="cols lblExBig oculto" id="dCondicionActi">
                                        <label for="condicionActi">Condición de actividad</label>
                                        <select name="condicionActi" id="condicionActi">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findCondicionActividad();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(condiActi)){
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
                <fieldset>
                    <legend>Características Procesales</legend>
                    <fieldset class="subField colsA">
                        <div class="colsx">
                            <label for="presentAdo">Forma en la que inició el proceso</label>
                            <select  name="presentAdo" id="presentAdo" title="Forma en la que inició el imputado el proceso" required>
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findTipoConsignacion();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(inicioPro)){
                                            out.println(" selected ");
                                        }
                                        out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %>
                            </select>
                        </div>
                        <div class="colsx oculto" id="dTipoDetencion">
                            <label for="tipoDetencion">Tipo de detención</label>
                            <select name="tipoDetencion" id="tipoDetencion" required>
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findTipoDetencion();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(tipoDeten)){
                                            out.println(" selected ");
                                        }
                                        out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %>
                            </select>
                        </div>
                        <div class="colsx oculto" id="formCondu">
                            <label for="tipoDetencion">Forma de conducción del imputado al proceso</label>
                            <select name="formaConduc" id="formaConduc">
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findFormaConduccion();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(formaCondu)){
                                            out.println(" selected ");
                                        }
                                        out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %>
                            </select>
                        </div>
                    </fieldset>
                    <div class="colsx"> 
                        <label for="participacion">Grado de participación</label>
                        <select name="participacion" id="participacion" required>
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findGradoParticipacion();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'");
                                    if(ls[0].equals(gradoParti)){
                                        out.println(" selected ");
                                    }
                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="colsx">
                        <label for="reincidencia">Condición de reincidencia</label>
                        <select name="reincidencia" id="reincidencia" required>
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findReincidencia();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'");
                                    if(ls[0].equals(reinciden)){
                                        out.println(" selected ");
                                    }
                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <br>
                    <div class="colsx">
                        <label for="psicofisico">Estado psicofísico al momento de cometer la conducta</label>
                        <select name="psicofisico" id="psicofisico" required>
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findEstadoPsicofisico();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'");
                                    if(ls[0].equals(edoPsicofi)){
                                        out.println(" selected ");
                                    }
                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <fieldset class="subField colsA">
                        <div class="colsx">
                            <label for="presentAdo">¿Forma parte o pertenece a algún grupo delictivo?</label>
                            <select  name="grupoDelictivo" id="grupoDelictivo" required>
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findRespuestaSimple();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(gpoDeli)){
                                            out.println(" selected ");
                                        }
                                        out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %>
                            </select>
                        </div>
                        <div class="colsx oculto" id="gruDeli">
                            <label for="delictivo">Grupo delictivo del que forma parte</label>
                            <input type="text" class="txtLong"  name="delictivo" id="delictivo" value="<%=nomGpoDeli%>" onkeypress="return /[[A-Z Ñ]|[Á,É,Í,Ó,Ú,Ä,Ë,Ï,Ö,Ü]/i.test(event.key)">
                            <div class="noIdentificada">
                                <input type="checkbox" id="chkdelictivo">
                                <label>No identificado</label>
                            </div>
                        </div>
                    </fieldset>
                    <div class="colsx">    
                        <label for="defensor">Tipo de defensor</label>
                        <select name="defensor" id="defensor" required>
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findTipoDefensor();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'");
                                    if(ls[0].equals(defensor)){
                                        out.println(" selected ");
                                    }
                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <label for="representante">Tipo de persona responsable</label>
                    <select name="representante" id="representante" required>
                        <option value="">--Seleccione--</option>
                        <%
                            lista = cat.findRepresentanteLegal();
                            for (String[] ls : lista) {
                                out.println("<option value='" + ls[0] + "'");
                                if(ls[0].equals(personaRes)){
                                    out.println(" selected ");
                                }
                                out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                            }
                        %>
                    </select>  
                </fieldset>
                <fieldset>
                    <legend>Delitos Atribuidos al Adolescente</legend>
                    <table class="tablasRegis">
                        <tr>
                            <th>Delito Clave</th>
                            <th>Delito</th>
                            <th>Delito cometido</th>
                        </tr>
                    <%
                        lista = sd.findDelitosCausa(causaClave);
                        for (String[] ls : lista) {
                            out.println("<tr>");
                            out.println("<td>" + ls[0].replace(juzgadoClave.replace("-", ""), "") + "</td>");
                            out.println("<td>" + ls[1] + "</td>");
                            pDelito = sProcesa.findPDelitos(causaClave, proceClave + juzgadoClave.replace("-", ""), ls[0]);
                            out.println("<td>");
                            if(pDelito.size() != 0){
                                out.println("<input type='checkbox' name='arrayDelito' value='" + ls[0] + "' checked/> ");
                            }else{
                                out.println("<input type='checkbox' name='arrayDelito' value='" + ls[0] + "'/> ");
                            }
                            out.println("</td>");
                        }
                    %>
                    </table>
                </fieldset>
                <div class="comentarios">
                    <h2>Comentarios</h2>
                    <textarea name="comentarios" id="comentarios"><%=comen%></textarea>
                </div>
                <br/>
                <input type="submit" name="guardar" value="Guardar" class="btnFlotante"/>
            </form>
        </section>
    </body>
</html>
