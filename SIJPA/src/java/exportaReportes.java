/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import clasesAuxiliar.catalogos;
import clasesAuxiliar.showReportes;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author CARLOS.SANCHEZG
 */
@WebServlet(urlPatterns = {"/exportaReportes"})
public class exportaReportes extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    ArrayList<String[]> listas, desReporte;
    String nomHoja, nomArchivo;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("variables " + request.getParameter("juzReporClave") + " , " + request.getParameter("sisRepor"));
        catalogos cat = new catalogos();
        showReportes sRepor = new showReportes();
        if(request.getParameter("juzReporClave").equals("")){//Si juzgado viene vacio entonces hacemos consulta general por sistema
            listas = sRepor.findReportesGral(request.getParameter("sisRepor"));
            nomHoja = "REPORTES_GENERAL";
            nomArchivo = "REPORTES_SIJPA";
        }else{//Si juzgado viene lleno entonces hacemos consulta por sistema y por juzgado
            listas = sRepor.findReportesJuz(request.getParameter("sisRepor"), request.getParameter("juzReporClave"));
            nomHoja = "REPORTES_" + request.getParameter("juzReporClave");
            nomArchivo = "REPORTES_SIJPA_" + request.getParameter("juzReporClave");
        }
        //Traemos las descripciones de los catalogos para los reportes
        desReporte = cat.findReportes();
        try(XSSFWorkbook workbook = new XSSFWorkbook()) {
            //workbook.setCompressTempFiles(true);
            XSSFSheet hoja = workbook.createSheet(nomHoja);
            CellRangeAddress regionTitulo = CellRangeAddress.valueOf("A1:C1");
            hoja.addMergedRegion(regionTitulo);//Unimos las celdas del titulo

            XSSFFont fuente = workbook.createFont();
            fuente.setColor(IndexedColors.WHITE.getIndex());
            fuente.setBold(true);
            fuente.setFontHeight(14);
            XSSFCellStyle stiloTitulo = workbook.createCellStyle();
            stiloTitulo.setFillForegroundColor(IndexedColors.BLUE.getIndex());
            stiloTitulo.setFillPattern(FillPatternType.SOLID_FOREGROUND);
            stiloTitulo.setFont(fuente);
            stiloTitulo.setAlignment(HorizontalAlignment.CENTER);
            XSSFRow fila = hoja.createRow(0);
            XSSFCell celda0 = fila.createCell(0);
            celda0.setCellValue("Reportes de datos SIJPA");
            celda0.setCellStyle(stiloTitulo);
            
            XSSFCellStyle stilo1 = workbook.createCellStyle();
            stilo1.setAlignment(HorizontalAlignment.CENTER);
            stilo1.setVerticalAlignment(VerticalAlignment.CENTER);
            stilo1.setBorderBottom(BorderStyle.MEDIUM);
            stilo1.setBorderLeft(BorderStyle.MEDIUM);
            stilo1.setBorderRight(BorderStyle.MEDIUM);
            stilo1.setBorderTop(BorderStyle.MEDIUM);
            
            XSSFCellStyle stilo2 = workbook.createCellStyle();
            stilo2.setVerticalAlignment(VerticalAlignment.CENTER);
            stilo2.setBorderBottom(BorderStyle.MEDIUM);
            stilo2.setBorderLeft(BorderStyle.MEDIUM);
            stilo2.setBorderRight(BorderStyle.MEDIUM);
            stilo2.setBorderTop(BorderStyle.MEDIUM);
            
            for(int x = 0; x < desReporte.size(); x++){
                fila = hoja.createRow(x+1);
                fila.setHeight((short)500);
                XSSFCell celda;
                //Celda 1
                celda = fila.createCell(0);
                celda.setCellValue(desReporte.get(x)[0]);//Numeracion de los catalogos
                celda.setCellStyle(stilo1);
                //Celda 2
                celda = fila.createCell(1);
                celda.setCellValue(desReporte.get(x)[1]);//Descripcion de los catalogos
                celda.setCellStyle(stilo2);
                //Celda 3
                celda = fila.createCell(2);
                celda.setCellValue(listas.get(0)[x]);//Cantidades de Reportes
                celda.setCellStyle(stilo1);
                //Columna de descripcion 1 se autoajuste
                hoja.autoSizeColumn(1);
            }
            
            response.setContentType("application/vnd.ms-excel");
            response.addHeader("Content-Disposition","attachment;filename=" + nomArchivo + ".xlsx");
            workbook.write(response.getOutputStream());
            workbook.close();
            //workbook.dispose();
        }catch(IOException ex){
            System.err.println("Error al crear archivo reportes excel " + ex);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
