/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



import java.io.IOException;
import java.io.*;
import clasesAuxiliar.exportaExcel;
import ConexionDB.Conexion_Mysql;
import java.nio.file.Paths;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.ooxml.POIXMLProperties;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
/**
 *
 * @author JONATHAN.AGUIRRE
 */
@WebServlet(urlPatterns = {"/exportaError"})
public class exportaError extends HttpServlet {
   //Path ruta_absoluta = FileSystems.getDefault().getPath(".").toAbsolutePath();
    //private final String[] ruta_dividida = ruta_absoluta.toString().split(":");
    //private final String RUTA = ruta_dividida[0]+":\\xampp\\inegi_conf\\Archivos\\";
    private final String RUTA = ".\\";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @javax.servlet.annotation.MultipartConfig
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * 
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {           
        
            if(request.getParameter("accionError").equalsIgnoreCase("Finalizar")){
                Conexion_Mysql conn = new Conexion_Mysql();
                conn.Conectar_espejo();
                System.out.println("Se borran registros con id: "+request.getParameter("idSubida"));
                conn.escribir("DELETE FROM TABLA_ERRORES_TABLASFALTANTES WHERE ID_ERROR='"+request.getParameter("idSubida")+"'");
                conn.escribir("DELETE FROM TABLA_ERRORES_COLUMNASFALTANTES WHERE ID_ERROR='"+request.getParameter("idSubida")+"'");
                conn.escribir("DELETE FROM TABLA_ERRORES_EXCEPCIONES WHERE ID_ERROR='"+request.getParameter("idSubida")+"'");
                conn.close();
                response.sendRedirect("importarBD.jsp");
            }
            if(request.getParameter("accionError").equalsIgnoreCase("Descargar Excel")){
                
                String nombre_archivo = "Error_"+request.getParameter("idSubida");
                SXSSFWorkbook mi_libro = new SXSSFWorkbook();
                exportaExcel exportarExcel = new exportaExcel(mi_libro);
                exportarExcel.exportarTablasFaltantes(request.getParameter("idSubida"));
                exportarExcel.exportarColumnasFaltantes(request.getParameter("idSubida"));
                exportarExcel.exportarTablasConErroresAlImportar(request.getParameter("idSubida"));
                
                File mi_archivo;
                mi_archivo = new File(RUTA+nombre_archivo+".xlsx");
                try(FileOutputStream mi_archivo_salida = new FileOutputStream(mi_archivo)){
                    if(mi_archivo.exists()){
                        mi_archivo.delete();
                    }
                    POIXMLProperties propiedadesXML = mi_libro.getXSSFWorkbook().getProperties();    
                    POIXMLProperties.CoreProperties propiedades =  propiedadesXML.getCoreProperties();
                    propiedades.setCreator("SIJPA");
                    mi_libro.write(mi_archivo_salida);
                    mi_libro.close();
                    mi_archivo_salida.flush();
                    mi_archivo_salida.close();
                }catch(FileNotFoundException e){
                    e.printStackTrace();
                }catch(IOException e){
                    e.printStackTrace();
                }
                
                response.setContentType("application/vnd.ms-excel");
                response.setHeader("Content-Disposition","attachment;filename=\"" +nombre_archivo+".xlsx" + "\"");
                File f = new File(RUTA+nombre_archivo+".xlsx");
                byte[] arBytes = new byte[(int)f.length()];
                FileInputStream is = new FileInputStream(f);
                is.read(arBytes);
                ServletOutputStream op = response.getOutputStream();
                op.write(arBytes);
                op.flush();
                op.close();
                is.close();
                Paths.get(RUTA+nombre_archivo+".xlsx").toFile().delete();
            }
    }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(exportaError.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(exportaBD.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
