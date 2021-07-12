/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.io.*;
import ConexionDB.Conexion_Mysql;
import clasesAuxiliar.manipulaArchivoSIJPA;
import clasesAuxiliar.LeeSIJPA;
import clasesAuxiliar.manejaCSVComprimido;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author JONATHAN.AGUIRREmove
 */
@WebServlet(urlPatterns = {"/importaBD"})
public class importaBD extends HttpServlet {
    //Path ruta_absoluta = FileSystems.getDefault().getPath(".").toAbsolutePath();
    //private final String[] ruta_dividida = ruta_absoluta.toString().split(":");
    //private final String RUTA = ruta_dividida[0]+":\\xampp\\inegi_conf\\Archivos\\";
    private final String RUTA = ".\\";
    String operacion,idSubida,tipo_archivo;

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
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<FileItem> items = upload.parseRequest(request);
        Iterator iter = items.iterator();
        File file;
        while (iter.hasNext()) {
            FileItem item = (FileItem) iter.next();

            if (item.isFormField()) {

                String name = item.getFieldName();
                String value = item.getString();
                if (name.equalsIgnoreCase("tipo_operacion")) {
                    operacion = value;
                }
                if(name.equalsIgnoreCase("idSubida")){
                    idSubida = value;
                }
                if(name.equalsIgnoreCase("tipoArchivo")){
                    tipo_archivo = value;
                }

            } else {
                String fileName = item.getName();
                if (fileName.endsWith(".sijpa") == true || fileName.endsWith(".zip") == true) {
                    if (fileName.lastIndexOf("\\") >= 0) {
                        file = new File(RUTA + fileName.substring(fileName.lastIndexOf("\\")));
                    } else {
                        file = new File(RUTA + fileName.substring(fileName.lastIndexOf("\\") + 1));
                    }
                    item.write(file);
                }
                manipulaArchivoSIJPA mi_archivoSIJPA = new manipulaArchivoSIJPA();
                if (fileName.endsWith(".sijpa") == true || fileName.endsWith(".zip") == true) {
                    if (operacion.equalsIgnoreCase("importar")) {
                        if(fileName.endsWith(".sijpa") == true && tipo_archivo.equalsIgnoreCase("sijpa")){
                            try{
                                mi_archivoSIJPA.extraeArchivo(RUTA + fileName, RUTA + "archivo_descifrado.sijpa");
                                File archivo_borrar1 = new File(RUTA+fileName);
                                archivo_borrar1.delete();
                                LeeSIJPA leeSijpa = new LeeSIJPA();
                                leeSijpa.ejecutaScript(RUTA + "archivo_descifrado.sijpa");
                                File archivo_borrar2 = new File(RUTA + "archivo_descifrado.sijpa");
                                archivo_borrar2.delete();
                                out.write("1");
                            }catch(Exception e){
                                File archivo_borrar1 = new File(RUTA+fileName);
                                archivo_borrar1.delete();
                                Logger.getLogger(importaBD.class.getName()).log(Level.SEVERE, null, e);
                                out.write("4");
                            }
                        }else if((fileName.endsWith(".sijpa") == true && tipo_archivo.equalsIgnoreCase("zip")) || (fileName.endsWith(".zip") == true && tipo_archivo.equalsIgnoreCase("sijpa"))){
                            File archivo_borrar1 = new File(RUTA+fileName);
                            archivo_borrar1.delete();
                            out.write("5");
                        }else{
                            
                            manejaCSVComprimido maneja_csv = new manejaCSVComprimido(RUTA+fileName,RUTA); 
                            String resultado_contieneTodasLasTablas = maneja_csv.contieneTodaLasTablas();
                            if(resultado_contieneTodasLasTablas.equalsIgnoreCase("No se puede leer")){
                                File archivo_borrar1 = new File(RUTA+fileName);
                                archivo_borrar1.delete();
                                out.write("4");
                            }else{
                                maneja_csv.ExtraeComprimido();
                                maneja_csv.cambiaNombreArchivosMayusculas();
                                File archivo_borrar1 = new File(RUTA+fileName);
                                archivo_borrar1.delete();
                                String resultado_validaColumnas = maneja_csv.validaColumnasCSVs(maneja_csv.obtenerTablasFaltantes());
                                if(resultado_contieneTodasLasTablas.equalsIgnoreCase("Faltan") || resultado_validaColumnas.equalsIgnoreCase("Faltan")){
                                    Conexion_Mysql conn = new Conexion_Mysql();
                                    conn.Conectar_espejo();
                                    for(int i=0;i<maneja_csv.obtenerTablasFaltantes().size();i++){
                                        conn.escribir("INSERT INTO TABLA_ERRORES_TABLASFALTANTES VALUES('"+idSubida+"','"+maneja_csv.obtenerTablasFaltantes().get(i)+"')");
                                    }
                                    for(int i=0;i<maneja_csv.obtenerColumnasFaltantes().size();i++){
                                        conn.escribir("INSERT INTO TABLA_ERRORES_COLUMNASFALTANTES VALUES('"+idSubida+"','"+maneja_csv.obtenerColumnasFaltantes().get(i).getKey()+"','"+maneja_csv.obtenerColumnasFaltantes().get(i).getValue()+"')");
                                    }
                                    conn.close();
                                    File directorio_borrar = new File(RUTA+maneja_csv.obtenerDirectorio());
                                    String[]archivos = directorio_borrar.list();
                                    for(String a: archivos){
                                        File archivo_a_borrar = new File(directorio_borrar.getPath()+"\\",a);
                                        archivo_a_borrar.delete();
                                    }
                                    directorio_borrar.delete();
                                    out.write("3");
                                }else{
                                    Conexion_Mysql conn = new Conexion_Mysql();
                                    conn.Conectar_espejo();
                                    if(maneja_csv.importaCSVs().equalsIgnoreCase("Error")){
                                        for(int i=0;i<maneja_csv.obtenerTablasConErrorEnImportacion().size();i++){
                                            conn.escribir("INSERT INTO TABLA_ERRORES_EXCEPCIONES VALUES('"+idSubida+"','"+maneja_csv.obtenerTablasConErrorEnImportacion().get(i).getKey()+"','"+maneja_csv.obtenerTablasConErrorEnImportacion().get(i).getValue().replace("\'", "\"")+"')");
                                        }
                                        conn.close();
                                        File directorio_borrar = new File(RUTA+maneja_csv.obtenerDirectorio());
                                        String[]archivos = directorio_borrar.list();
                                        for(String a: archivos){
                                            File archivo_a_borrar = new File(directorio_borrar.getPath(),a);
                                            archivo_a_borrar.delete();
                                        }
                                        directorio_borrar.delete();
                                        out.write("3");
                                    }else{
                                        File directorio_borrar = new File(RUTA+maneja_csv.obtenerDirectorio());
                                        String[]archivos = directorio_borrar.list();
                                        for(String a: archivos){
                                            File archivo_a_borrar = new File(directorio_borrar.getPath(),a);
                                            archivo_a_borrar.delete();
                                        }
                                        directorio_borrar.delete();
                                        out.write("1");
                                    }
                                    conn.close();
                                }
                            }
                        }
                    } else {
                        mi_archivoSIJPA.extraeArchivo(RUTA + fileName, RUTA + "archivo_descifrado.sijpa");
                        File archivo_borrar1 = new File(RUTA+fileName);
                        archivo_borrar1.delete();
                        System.out.println("Genero archivo descifrado y redirecciona a ver");
                        out.write("2");
                    }
                } else {
                    out.write("0");
                }
            }
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (FileUploadException ex) {
            Logger.getLogger(importaBD.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(importaBD.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (FileUploadException ex) {
            Logger.getLogger(importaBD.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(importaBD.class.getName()).log(Level.SEVERE, null, ex);
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
