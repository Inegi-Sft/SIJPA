<%-- 
    Document   : procesadosJO
    Created on : 08/05/2020, 09:04:33 AM
    Author     : FERMIN.GOMEZ
--%>

<%@page import="clasesAuxiliar.FechaMax"%>
<%@page import="clasesAuxiliar.showProcesadosJO"%>
<%@page import="clasesAuxiliar.showCausasPenalesJO"%>
<%@page import="clasesAuxiliar.showDelitosJO"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::ProcesadosJO</title>
        <%@include file="librerias.jsp" %>
        <script type="text/javascript" src="js/funcionesProJO.js"></script>
        <%
            catalogos cat = new catalogos();
            showDelitosJO sDeli = new showDelitosJO();
            showCausasPenalesJO sCausaPen = new showCausasPenalesJO();
            showProcesadosJO sProcesa = new showProcesadosJO();
            FechaMax fecha =new FechaMax();
            String fechas= fecha.FechaValida();
            ArrayList<String[]> lista, procesado;
            ArrayList<String> pIngre, pDelito = new ArrayList();
            
            String proceClave = "", posicion = "", edicion = "";
            if (request.getParameter("proceClave") != null || request.getParameter("posicion") != null) {
                proceClave = request.getParameter("proceClave");
                posicion = request.getParameter("posicion");
            }
            
            String juzgadoClave = (String) session.getAttribute("juzgadoClave");
            String causaClaveJC = (String)session.getAttribute("causaClave");//Obtenemos la causa clave de JC
            String causaClaveJO = (String)session.getAttribute("causaClaveJO");//Obtenemos la causa clave de JO
            String operacion = "";//Variable de control para saber si se inserta o se actualiza
            String nomProce = "";
            String aPaterno = "";
            String aMaterno = "";
            String alias = "";
            String curp = "";
            String fechaNaci = "";
            String sexo = "";
            String edad = "";
            String naciPais = "";
            String naciEnti = "";
            String naciMuni = "";
            String nacionali = "";
            String resiPais = "";
            String resiEnti = "";
            String resiMuni = "";
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
            String gradoParti = "";
            String reinciden = "";
            String edoPsicofi = "";
            String gpoDeli = "";
            String nomGpoDeli = "";
            String defensor = "";
            String personaRes = "";
            String comen = "";
            if(request.getParameter("edita") != null){//Si la variable edita es diferente de null recuperamos los datos de JO
                edicion = request.getParameter("edita");
                if(edicion.equals("Si")){
                    procesado = sProcesa.findProcesadosJO(causaClaveJO, proceClave + juzgadoClave.replace("-", ""));
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
                        edoCivil = procesado.get(0)[15];
                        discapaci = procesado.get(0)[16];
                        condAlfabeto = procesado.get(0)[17];
                        gradoEstu = procesado.get(0)[18];
                        condiEstudi = procesado.get(0)[19];
                        hablaEspa = procesado.get(0)[20];
                        poblaIndi = procesado.get(0)[21];
                        tiPoblaIndi = procesado.get(0)[22];
                        hablaIndi = procesado.get(0)[23];
                        lenguaIndi = procesado.get(0)[24];
                        lenguaExtra = procesado.get(0)[25];
                        interprete = procesado.get(0)[26];
                        ingresos = procesado.get(0)[27];
                        rangoIngre = procesado.get(0)[28];
                        ocupacion = procesado.get(0)[29];
                        condiActi = procesado.get(0)[30];
                        gradoParti = procesado.get(0)[31];
                        reinciden = procesado.get(0)[32];
                        edoPsicofi = procesado.get(0)[33];
                        gpoDeli = procesado.get(0)[34];
                        nomGpoDeli = procesado.get(0)[35];
                        defensor = procesado.get(0)[36];
                        personaRes = procesado.get(0)[37];
                        comen = procesado.get(0)[38];
                    }else{
                        out.println("<script>alert('Procesado " + proceClave + " no encontrado dentro de la Causa Penal "  + causaClaveJO + "'); "
                                + "parent.$.fancybox.close();</script>");
                    }
                }
            }else{//Si la variable edita viene null entonces recuperamos datos de JC
                procesado = sProcesa.findProcesadosJC(causaClaveJC, proceClave + juzgadoClave.replace("-", ""));
                if(procesado.size() > 0){
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
                    edoCivil = procesado.get(0)[15];
                    discapaci = procesado.get(0)[16];
                    condAlfabeto = procesado.get(0)[17];
                    gradoEstu = procesado.get(0)[18];
                    condiEstudi = procesado.get(0)[19];
                    hablaEspa = procesado.get(0)[20];
                    poblaIndi = procesado.get(0)[21];
                    tiPoblaIndi = procesado.get(0)[22];
                    hablaIndi = procesado.get(0)[23];
                    lenguaIndi = procesado.get(0)[24];
                    lenguaExtra = procesado.get(0)[25];
                    interprete = procesado.get(0)[26];
                    ingresos = procesado.get(0)[27];
                    rangoIngre = procesado.get(0)[28];
                    ocupacion = procesado.get(0)[29];
                    condiActi = procesado.get(0)[30];
                    gradoParti = procesado.get(0)[34];
                    reinciden = procesado.get(0)[35];
                    edoPsicofi = procesado.get(0)[36];
                    gpoDeli = procesado.get(0)[37];
                    nomGpoDeli = procesado.get(0)[38];
                    defensor = procesado.get(0)[39];
                    personaRes = procesado.get(0)[40];
                    comen = procesado.get(0)[41];
                }else{
                    out.println("<script>alert('Procesado " + proceClave + " no encontrado dentro de la Causa Penal "  + causaClaveJC + "'); "
                            + "parent.$.fancybox.close();</script>");
                }
            }
        %>
    </head>
    <body style="zoom: .9;">
        <%--<%@include file="cabecera.jsp" %>--%>
        <section class="contenedor">
            <h1>Procesados</h1>
            <form method="post" name="formProcesadosJO" id="formProcesadosJO">
                <fieldset>
                    <legend>Características Sociodemográficas </legend>
                    <table class="tablaFormu">
                        <tr>
                            <td colspan="4">
                                <label>Procesado Clave</label>
                                <input type="text" name="proceClave" id="proceClave" value="<%=proceClave%>" readonly>
                                <input type="hidden" name="posicion" id="posicion" value="<%=posicion%>">
                                <input type="hidden" name="opera" id="opera" value="<%=operacion%>">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="nombre">Nombre(s)</label>
                                <input type="text" name="nombre" id="nombre" value="<%=nomProce%>" required>
                            </td>
                            <td>
                                <label for="apaterno">Apellido Paterno</label>
                                <input type="text" name="apaterno" id="apaterno" value="<%=aPaterno%>" required>
                            </td>
                            <td>
                                <label for="amaterno">Apellido Materno</label>
                                <input type="text" name="amaterno" id="amaterno" value="<%=aMaterno%>" required>
                            </td>
                            <td>
                                <label for="alias">Alias</label>
                                <input type="text" name="alias" id="alias" value="<%=alias%>" required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="curp">Curp</label>
                                <input type="text" name="curp" id="curp" value="<%=curp%>" maxlength="18" minlength="18" required>
                            </td>
                            <td>
                                <label for="fNacimiento">Fecha nacimiento</label>
                                <input type="date" name="fNacimiento" id="fNacimiento"  value="<%=fechaNaci%>" max="<%=fechas%>" onblur="ValFechaNacPRO('#fNacimiento','#edad')" onkeydown="return false" required>
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
                                <label for="edad">Edad</label>
                                <select name="edad" id="edad" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        for (int i = 12; i <= 17; i++) {
                                            out.println("<option value='" + i + "'");
                                            if(Integer.toString(i).equals(edad)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + i + "</option>");
                                                    
                                        }
                                    %>
                                    <option value="-9">No identificado</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <fieldset>
                                    <legend>Lugar de nacimiento</legend>
                                    <div class="colsx">
                                        <label for="nPais">Pais</label>
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
                                        <label for="nEntidad">Entidad</label>
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
                                        <label for="nMunicipio" class="lblExBig">Municipio o Demarcacion Territorial</label>
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
                                        <label for="residencia">Lugar de residencia</label>
                                        <select name="residencia" id="residencia" onchange="lugarResidencia('#residencia', '#dREntidad', '#dRMunicipio', '#rEntidad', '#rMunicipio');" required >
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
                                        <label for="rEntidad">Entidad</label>
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
                                        <label for="rMunicipio">Municipio</label>
                                        <select name="rMunicipio" id="rMunicipio">
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
                                <label for="alfabet">Condicion alfabetismo</label>
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
                                <label for="estudios">Grado de Estudios Concluido</label>
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
                                <label for="hablaEsp">Dominio del español</label>
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
                                        <label for="hablaIndigena" class="lblExBig">¿Habla lengua indígena o dialecto?</label>
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
                                        <label for="lenguaIndigena">Familia lingüística</label>
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
                                        <label for="indigena">Rango de ingresos </label>
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
                                                if(!edicion.equals("")){
                                                    pIngre = sProcesa.findPIngresosJO(causaClaveJO, proceClave + juzgadoClave.replace("-", ""), ls[0]);
                                                    if(pIngre.size() != 0){
                                                        out.println("<input type='checkbox' name='chkIngresosPro' id='chkIngresosPro"+ls[0]+"' value=" + ls[0] + " checked>");
                                                    }else{
                                                        out.println("<input type='checkbox' name='chkIngresosPro' id='chkIngresosPro"+ls[0]+"' value=" + ls[0] + ">");
                                                    }
                                                }else{
                                                    pIngre = sProcesa.findPIngresosJC(causaClaveJC, proceClave + juzgadoClave.replace("-", ""), ls[0]);
                                                    if(pIngre.size() != 0){
                                                        out.println("<input type='checkbox' name='chkIngresosPro' id='chkIngresosPro"+ls[0]+"' value=" + ls[0] + " checked>");
                                                    }else{
                                                        out.println("<input type='checkbox' name='chkIngresosPro' id='chkIngresosPro"+ls[0]+"' value=" + ls[0] + ">");
                                                    }
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
                                        <label for="condicionActi">Condicion de Actividad</label>
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
                    <div class="colsx"> 
                        <label for="participacion">Grado de participacion</label>
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
                        <label for="reincidencia">Condicion de reincidencia</label>
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
                    <div class="colsx">
                        <label for="psicofisico">Estado psicofisico al momento de cometer la conducta</label>
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
                    <br>
                    <fieldset class="subField colsA">
                        <div class="colsx">
                            <label for="presentAdo">¿Forma parte o pertenece a algún grupo delictivo?</label>
                            <select  name="grupoDelictivo" id="grupoDelictivo" onchange="respuestaSimpleSelect('#grupoDelictivo', '#gruDeli', '#delictivo');" required>
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
                            <label for="presentAdo">Grupo delictivo del que forma parte</label>
                            <input type="text" class="txtLong"  name="delictivo" id="delictivo" value="<%=nomGpoDeli%>">
                            <div class="noIdentificada">
                                <input type="checkbox" id="chkdelictivo">
                                <label>No identificada</label>
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
                    <div class="colsx">
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
                    </div>
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
                        if(!edicion.equals("")){
                            lista = sDeli.findDelitosVictiJO(causaClaveJO);
                        }else{
                            lista = sDeli.findDelitosVictiJC(causaClaveJC);
                        }
                        for (String[] ls : lista) {
                            out.println("<tr>");
                            out.println("<td>" + ls[0].replace(juzgadoClave.replace("-", ""), "") + "</td>");
                            out.println("<td>" + ls[1] + "</td>");
                            if(!edicion.equals("")){
                                pDelito = sProcesa.findPDelitosJO(causaClaveJO, proceClave + juzgadoClave.replace("-", ""), ls[0]);
                            }else{
                                pDelito = sProcesa.findPDelitosJC(causaClaveJC, proceClave + juzgadoClave.replace("-", ""), ls[0]);
                            }
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
