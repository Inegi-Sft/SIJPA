/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.io.*;
import clasesAuxiliar.ArchivoSIJPA;
import clasesAuxiliar.LeeSIJPA;
import clasesAuxiliar.manejaCSV;
import java.nio.file.FileSystems;
import java.nio.file.Path;
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
    Path ruta_absoluta = FileSystems.getDefault().getPath(".").toAbsolutePath();
    private final String[] ruta_dividida = ruta_absoluta.toString().split(":");
    private final String RUTA = ruta_dividida[0]+":\\xampp\\inegi_conf\\Archivos\\";
    //private final String RUTA = "..\\..\\inegi_conf\\Archivos\\";

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
        System.out.println("funcion");
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<FileItem> items = upload.parseRequest(request);
        Iterator iter = items.iterator();
        File file;
        String operacion = "";
        String tabla = "";
        while (iter.hasNext()) {
            FileItem item = (FileItem) iter.next();

            if (item.isFormField()) {

                String name = item.getFieldName();//text1
                String value = item.getString();
                if (name.equalsIgnoreCase("tipo_operacion")) {
                    operacion = value;
                }
                if(name.equalsIgnoreCase("tabla")){
                    tabla = value;
                }

            } else {
                String fieldName = item.getFieldName();
                String fileName = item.getName();
                if (fileName.endsWith(".sijpa") == true || fileName.endsWith(".csv") == true) {
                    if (fileName.lastIndexOf("\\") >= 0) {
                        file = new File(RUTA + fileName.substring(fileName.lastIndexOf("\\")));
                    } else {
                        file = new File(RUTA + fileName.substring(fileName.lastIndexOf("\\") + 1));
                    }
                    item.write(file);
                }
                if (fileName.endsWith(".sijpa") == true || fileName.endsWith(".csv") == true) {
                    ArchivoSIJPA mi_archivoSIJPA = new ArchivoSIJPA();
                    if (operacion.equalsIgnoreCase("importar")) {
                        if(fileName.endsWith(".sijpa") == true){
                            try{
                                mi_archivoSIJPA.extraeArchivo(RUTA + fileName, RUTA + "archivo_descifrado.sijpa");
                                File archivo_borrar1 = new File(RUTA+fileName);
                                archivo_borrar1.delete();
                                LeeSIJPA leeSijpa = new LeeSIJPA();
                                leeSijpa.ejecutaScript(RUTA + "archivo_descifrado.sijpa");
                                File archivo_borrar2 = new File(RUTA + "archivo_descifrado.sijpa");
                                archivo_borrar2.delete();
                                System.out.println("acabó");
                                out.write("1");
                            }catch(Exception e){
                                File archivo_borrar1 = new File(RUTA+fileName);
                                archivo_borrar1.delete();
                                Logger.getLogger(manejaCSV.class.getName()).log(Level.SEVERE, null, e);
                                out.write("6");
                            }
                        }else{
                            if(tabla.length() < 1){
                                out.write("4");
                            }
                            else{
                                if(manejaCSV.validaArchivoVacio(RUTA+fileName)){
                                    out.write("6");
                                }else{
                                    manejaCSV lee_csv = new manejaCSV(RUTA+fileName, tabla);
                                    if(lee_csv.encabezadosCorrectos()){
                                        if(lee_csv.importaCSV() == true){
                                            lee_csv.cerrarArchivo();
                                            File archivo_borrar1 = new File(RUTA+fileName);
                                            archivo_borrar1.delete();
                                            out.write("1");
                                        }else{
                                            File archivo_borrar1 = new File(RUTA+fileName);
                                            archivo_borrar1.delete();
                                            out.write("5");
                                        }
                                    }else{
                                        out.write("3");
                                    }
                                }
                            }
                        }
                    } else {
                        mi_archivoSIJPA.extraeArchivo(RUTA + fileName, RUTA + "archivo_descifrado.sijpa");
                        File archivo_borrar1 = new File(RUTA+fileName);
                        archivo_borrar1.delete();
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
