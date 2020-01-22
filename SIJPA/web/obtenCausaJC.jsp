<%-- 
    Document   : obtenCausaJC
    Created on : 16/01/2020, 11:13:19 AM
    Author     : CESAR.OSORIO
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="clasesAuxiliar.showCausasPenalesJO"%>
<%
    showCausasPenalesJO cat = new showCausasPenalesJO();
    ArrayList<String[]> lista;
    String juzClave = null;
    String causaClave = null;

    if (request.getParameter("juzClave") != null) {
        juzClave = request.getParameter("juzClave");
        out.println("<option value='" + juzClave + "'>--Seleccione--</option>");

        lista = cat.findcausaClaveJC(juzClave);
        for (String[] ls : lista) {
            out.println("<option value='" + ls[0] + "'>" + ls[0] + "</option>");
        }
    }
    else if (request.getParameter("causaClave") != null) {
        causaClave = request.getParameter("causaClave");
        out.println("<option value='" + causaClave + "'>--Seleccione--</option>");
        
        juzClave = request.getParameter("jClave");
        switch(Integer.parseInt(request.getParameter("bandera"))){
            case 1:
                lista = cat.findTotalDelitos(juzClave,causaClave);
                for (String[] ls : lista) {
                    out.println("<option value='" + ls[0] + "'>" + ls[0] + "</option>");
                }
                break;
            case 2:
                  lista = cat.findTotalProce(causaClave);
                for (String[] ls : lista) {
                    out.println("<option value='" + ls[0] + "'>" + ls[0] + "</option>");
                }
                break;
             case 3:
                  lista = cat.findTotalVic(causaClave);
                for (String[] ls : lista) {
                    out.println("<option value='" + ls[0] + "'>" + ls[0] + "</option>");
                }
                break;
        }
    }
    


%>