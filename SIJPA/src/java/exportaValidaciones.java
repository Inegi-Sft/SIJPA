/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import clasesAuxiliar.catalogos;
import clasesAuxiliar.showReportes;
import clasesAuxiliar.showValidaciones;
import java.awt.Color;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.util.RegionUtil;
import org.apache.poi.xssf.streaming.SXSSFCell;
import org.apache.poi.xssf.streaming.SXSSFRow;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;


/**
 *
 * @author FERMIN.GOMEZ
 */
@WebServlet(urlPatterns = {"/exportaValidaciones"})
public class exportaValidaciones extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    catalogos cat = new catalogos();
    showValidaciones sV=new showValidaciones();
    showReportes sRepor = new showReportes();
    ArrayList<String[]> lista,desReporte;
    int i=0;
    
    Font fuenteHead, fuenteBody, fuenteIndicador;
    CellStyle estiloHead, estiloBody,estiloBodyBordes, estiloBodyBordesI, estiloError, estiloIndicador;
    
    SXSSFWorkbook libro;
    SXSSFRow fila = null;
    SXSSFCell col = null;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String sistema = request.getParameter("sistema");
        String archivo="Validacion"+sistema; 
        try{
            libro = new SXSSFWorkbook();
            SXSSFSheet hojaDescripcion = libro.createSheet("Descripcion");
            SXSSFSheet hojaResumen = libro.createSheet("Resumen_General");
            SXSSFSheet hojaImp_Faltan = libro.createSheet("Imputados_Faltantes");
            SXSSFSheet hojaDel_Faltan = libro.createSheet("Delitos_Faltantes");
            SXSSFSheet hojaVic_Faltan = libro.createSheet("Victimas_Faltantes");
            SXSSFSheet hojaImp_C_T = libro.createSheet("Imputados_Faltan_C_o_T");
            SXSSFSheet hojaVic_Del = libro.createSheet("Victima_Delitos");
            SXSSFSheet hojaImp_Del = libro.createSheet("Imputado_Delitos");
            SXSSFSheet hojaF_Ingreso = libro.createSheet("Fecha_Ingreso");
            SXSSFSheet hojaF_Ocurrencia = libro.createSheet("Fecha_Ocurrencia");
            SXSSFSheet hojaF_Conclusion = libro.createSheet("Fecha_Conclusion");
            SXSSFSheet hojaF_Tramite = libro.createSheet("Fecha_Tramite");
            SXSSFSheet hojaF_Impugnacion = libro.createSheet("Fecha_Impugnacion");
            
            //FUENTE Y ESTILO PARA ENCABEZADOS
            fuenteHead = creaFuente(IndexedColors.WHITE.index, true);
            estiloHead = creaEstilo(fuenteHead, "#003057", false);//background azul marino
            
            //FUENTE Y ESTILO PARA EL CUERPO DE LA TABLA
            fuenteBody = creaFuente(IndexedColors.BLACK.index, false);
            estiloBody = creaEstilo(fuenteBody, "#FFFFFF", false);//sin background
            estiloBodyBordes = creaEstilo(fuenteBody, "#FFFFFF", true);//sin background
            estiloBodyBordesI = creaEstilo(fuenteBody, "#EEEEEE", true);//sin background
            
            //ESTILO PARA BACKGROUND DEL DATO A REVISAR
            estiloError = creaEstilo(fuenteBody, "#FFFF99", false);//background amarillo
            
            //ESTILO PARA BACKGROUND DEL DATO A REVISAR
            fuenteIndicador = creaFuente(IndexedColors.BLACK.index, true);
            estiloIndicador = creaEstilo(fuenteHead, "#0077CB", true);//backgroun azul claro (fuenteHead y #0077CB)
            
            //llamada a los metodos de creacion
            creaHoja_Descripcion(sistema, hojaDescripcion);
            creaHoja_ReporteResumen(sistema, hojaResumen);
            creaHoja_Imputados_Faltantes(sistema, hojaImp_Faltan, hojaDescripcion);
            creaHoja_Delitos_Faltantes(sistema, hojaDel_Faltan, hojaDescripcion);
            creaHoja_Victimas_Faltantes(sistema, hojaVic_Faltan, hojaDescripcion);
            creaHoja_Imputados_Faltan_C_o_T(sistema, hojaImp_C_T, hojaDescripcion);
            creaHoja_Victima_Delitos(sistema, hojaVic_Del, hojaDescripcion);
            creaHoja_Imputado_Delitos(sistema, hojaImp_Del, hojaDescripcion);
            creaHoja_Fecha_Ingreso(sistema, hojaF_Ingreso, hojaDescripcion);
            creaHoja_Fecha_Ocurrencia(sistema, hojaF_Ocurrencia, hojaDescripcion);
            creaHoja_Fecha_Conclusion(sistema, hojaF_Conclusion, hojaDescripcion);
            creaHoja_Fecha_Tramite(sistema, hojaF_Tramite, hojaDescripcion);
            creaHoja_Fecha_Impugnacion(sistema, hojaF_Impugnacion, hojaDescripcion);
            
            response.setContentType("application/vnd.ms-excel");
            response.addHeader("Content-Disposition","attachment;filename=" + archivo + ".xlsx");
            libro.write(response.getOutputStream());
            libro.close();
        }catch(IOException ex){
            System.err.println("Error al crear archivo validaciones excel " + ex);
        }
    }
    
    public void creaHoja_Descripcion(String sistema, SXSSFSheet hojaDescripcion){
        
        fila = hojaDescripcion.createRow(0);
        fila.setHeight((short) 700);
        
        col=fila.createCell(0);
        col.setCellValue("SECCION");
        hojaDescripcion.setColumnWidth(0, 6000);
        hojaDescripcion.setColumnWidth(1, 6000);
        col.setCellStyle(estiloHead);
        //first row, last row, first column, last column 
        hojaDescripcion.addMergedRegion(new CellRangeAddress(0, 0, 0, 1));
        
        col=fila.createCell(2);
        col.setCellValue("DESCRIPCION");
        hojaDescripcion.setColumnWidth(2, 7500);
        hojaDescripcion.setColumnWidth(3, 7500);
        hojaDescripcion.setColumnWidth(4, 7500);
        hojaDescripcion.setColumnWidth(5, 7500);
        col.setCellStyle(estiloHead);
        hojaDescripcion.addMergedRegion(new CellRangeAddress(0, 0, 2, 5));
        
        String [] seccion = new String[]{
                "Imputados_Faltantes","Delitos_Faltantes","Victimas_Faltantes","Imputados_Faltan_C_o_T","Victima_Delitos",
                "Imputado_Delitos","Fecha_Ingreso","Fecha_Ocurrencia","Fecha_Conclusion","Fecha_Tramite","Fecha_Impugnacion"
            };
        String [] descripcion = new String[]{
            "Se muestran los expedientes en los cuales el Total de imputados indicado en el expediente no coincide con el número de imputados desagregados. Se requiere registrar los imputados faltantes o bien verificar el total de imputados registrado por expediente.",
            "Se muestran los expedientes en los cuales el Total de delitos indicado en el expediente no coincide con el número de delitos desagregados. Se requiere registrar los delitos faltantes o bien verificar el total de delitos registrado por expediente.",
            "Se muestran los expedientes en los cuales el Total de víctimas indicado en el expediente no coincide con el número de víctimas desagregadas. Se requiere registrar las víctimas faltantes o bien verificar el total de víctimas registrado por expediente.",
            "Se muestran los imputados que no fueron registrados en Conclusiones o Trámite. Se requiere registrar en Conclusiones o Trámite a cada imputado.",
            "Se muestran las víctimas que no tienen delitos asignados, es decir;indica que no se les cometió ningun delito. Se requiere verificar y en su caso asignar el delito que le fue cometido a la víctima.",
            "Se muestran los imputados a los cuales no se les asigno ningun delito,es decir;indica que el imputado no cometio ningun delito. Se requiere verificar y en su caso asignar el delito que fue cometido por el imputado.",
            "La fecha de ingreso no debe de ser mayor a la fecha actual",
            "La fecha de Ocurrencia no debe de ser mayor a la fecha_ingreso",
            "La fecha de conclusión debe de ser mayor a la fecha de ingreso",
            "La fecha de tramite debe de ser mayor a la fecha de ingreso",
            "La fecha de Impuganación debe de ser mayor o igual a la fecha de conclusión"
        };
            
        for(i=1;i<=seccion.length;i++){
            fila = hojaDescripcion.createRow(i);
            fila.setHeight((short) 1100);
            for(int j=0;j<2;j++){
                if(j==0){
                    col=fila.createCell(j);
                    col.setCellValue(seccion[i-1]);
                    col.setCellStyle(estiloBody);
                    hojaDescripcion.addMergedRegion( new CellRangeAddress(i, i, 0, 1));
                    RegionUtil.setBorderBottom(BorderStyle.THIN, new CellRangeAddress(i, i, 0, 1), hojaDescripcion);
                }
                else {
                    col=fila.createCell(j+1);
                    col.setCellValue(descripcion[i-1]);
                    col.setCellStyle(estiloBody);
                    hojaDescripcion.addMergedRegion(new CellRangeAddress(i, i, 2, 5));
                    RegionUtil.setBorderBottom(BorderStyle.THIN, new CellRangeAddress(i, i, 2, 5), hojaDescripcion);
                }
            }
        }
    }
    
    public void creaHoja_ReporteResumen(String sistema, SXSSFSheet hojaResumen){
        if(sistema.equals("JC"))
            sistema="1";
        else
            sistema="2";
       
        lista = sRepor.findReportesGral(sistema); //Traemos los totales del reporte
        desReporte = cat.findReportes();//Traemos las descripciones de los catalogos para los reportes
           
        fila = hojaResumen.createRow(0);
        fila.setHeight((short)500);
        
        col = fila.createCell(0);
        col.setCellValue("RESUMEN GENERAL DE DATOS SIJPA");
        col.setCellStyle(estiloHead);
        CellRangeAddress regionTitulo = CellRangeAddress.valueOf("A1:C1");
        hojaResumen.addMergedRegion(regionTitulo);//Unimos las celdas del titulo
            
        for(int x = 0; x < desReporte.size(); x++){
            fila = hojaResumen.createRow(x+1);
            fila.setHeight((short)500);
            hojaResumen.setColumnWidth(1, 20000);
            
            //Celda 1
            col = fila.createCell(0);
            col.setCellValue(desReporte.get(x)[0]);//Numeracion de los catalogos
            col.setCellStyle(estiloBodyBordes);
            //Celda 2
            col = fila.createCell(1);
            col.setCellValue(desReporte.get(x)[1]);//Descripcion de los catalogos
            col.setCellStyle(estiloBodyBordes);
            //Celda 3
            col = fila.createCell(2);
            col.setCellValue(lista.get(0)[x]);//Cantidades de Reportes
            col.setCellStyle(estiloBodyBordesI);
            
        }
    }
    
    public void creaHoja_Imputados_Faltantes(String sistema, SXSSFSheet hojaImp_Faltan, SXSSFSheet hojaDescripcion){
        
        lista=sV.Imputados_Faltantes(sistema);
        
        if(!lista.isEmpty()){
            fila = hojaImp_Faltan.createRow(0);
            fila.setHeight((short) 500);

            String[] head = {"JUZGADO CLAVE","CAUSA CLAVE","TOTAL IMPUTADOS","FALTAN POR CAPTURAR"};
            for(int h=0; h<head.length; h++){
                hojaImp_Faltan.setColumnWidth(h, 8000);
                col=fila.createCell(h);
                col.setCellStyle(estiloHead);
                col.setCellValue(head[h]);
            }
            i=1;
            for (String[] ls : lista) {
                fila = hojaImp_Faltan.createRow(i);
                for(int j=0; j<head.length; j++){
                    col=fila.createCell(j);
                    col.setCellStyle(estiloBody);
                    col.setCellValue(ls[j]);
                    if(j==3)
                        col.setCellStyle(estiloError);
                }
                i++;
            }
            
            fila = hojaDescripcion.getRow(1);
            col = fila.getCell(0);
            col.setCellStyle(estiloIndicador);
        }
    }
    
    public void creaHoja_Delitos_Faltantes(String sistema, SXSSFSheet hojaDel_Faltan, SXSSFSheet hojaDescripcion){
        
        lista=sV.Delitos_Faltantes(sistema);
        
        if(!lista.isEmpty()){
            fila = hojaDel_Faltan.createRow(0);
            fila.setHeight((short) 500);

            String[] head = {"JUZGADO CLAVE","CAUSA CLAVE","TOTAL DELITOS","FALTAN POR CAPTURAR"};
            for(int h=0; h<head.length; h++){
                hojaDel_Faltan.setColumnWidth(h, 8000);
                col=fila.createCell(h);
                col.setCellStyle(estiloHead);
                col.setCellValue(head[h]);
            }
            i=1;
            for (String[] ls : lista) {
                fila = hojaDel_Faltan.createRow(i);
                for(int j=0; j<head.length; j++){
                    col=fila.createCell(j);
                    col.setCellStyle(estiloBody);
                    col.setCellValue(ls[j]);
                    if(j==3)
                        col.setCellStyle(estiloError);
                }
                i++;
            }
            
            fila = hojaDescripcion.getRow(2);
            col = fila.getCell(0);
            col.setCellStyle(estiloIndicador);
        }
    }
    
    public void creaHoja_Victimas_Faltantes(String sistema, SXSSFSheet hojaVic_Faltan, SXSSFSheet hojaDescripcion){
      
        lista=sV.Victimas_Faltantes(sistema);
        
        if(!lista.isEmpty()){
            fila = hojaVic_Faltan.createRow(0);
            fila.setHeight((short) 500);

            String[] head = {"JUZGADO CLAVE","CAUSA CLAVE","TOTAL VICITMAS","FALTAN POR CAPTURAR"};
            for(int h=0; h<head.length; h++){
                hojaVic_Faltan.setColumnWidth(h, 8000);
                col=fila.createCell(h);
                col.setCellStyle(estiloHead);
                col.setCellValue(head[h]);
            }
            i=1;
            for (String[] ls : lista) {
                fila = hojaVic_Faltan.createRow(i);
                for(int j=0; j<head.length; j++){
                    col=fila.createCell(j);
                    col.setCellStyle(estiloBody);
                    col.setCellValue(ls[j]);
                    if(j==3)
                        col.setCellStyle(estiloError);
                }
                i++;
            }
            
            fila = hojaDescripcion.getRow(3);
            col = fila.getCell(0);
            col.setCellStyle(estiloIndicador);
        }
    }
    
    public void creaHoja_Imputados_Faltan_C_o_T(String sistema, SXSSFSheet hojaImp_C_T, SXSSFSheet hojaDescripcion){
        
        lista=sV.Imputados_Faltan_C_o_T(sistema);
        
        if(!lista.isEmpty()){
            fila = hojaImp_C_T.createRow(0);
            fila.setHeight((short) 500);

            String[] head = {"JUZGADO CLAVE","CAUSA CLAVE","IMPUTADO CLAVE"};
            for(int h=0; h<head.length; h++){
                hojaImp_C_T.setColumnWidth(h, 8000);
                col=fila.createCell(h);
                col.setCellStyle(estiloHead);
                col.setCellValue(head[h]);
            }
            i=1;
            for (String[] ls : lista) {
                fila = hojaImp_C_T.createRow(i);
                for(int j=0; j<head.length; j++){
                    col=fila.createCell(j);
                    col.setCellStyle(estiloBody);
                    col.setCellValue(ls[j]);
                    if(j==2)
                        col.setCellStyle(estiloError);
                }
                i++;
            }
            
            fila = hojaDescripcion.getRow(4);
            col = fila.getCell(0);
            col.setCellStyle(estiloIndicador);
        }
    }
    
    public void creaHoja_Victima_Delitos(String sistema, SXSSFSheet hojaVic_Del, SXSSFSheet hojaDescripcion){
        
        lista=sV.Victima_Delito(sistema);
        
        if(!lista.isEmpty()){
            fila = hojaVic_Del.createRow(0);
            fila.setHeight((short) 500);

            String[] head = {"JUZGADO CLAVE","CAUSA CLAVE","VICTIMA CLAVE"};
            for(int h=0; h<head.length; h++){
                hojaVic_Del.setColumnWidth(h, 8000);
                col=fila.createCell(h);
                col.setCellStyle(estiloHead);
                col.setCellValue(head[h]);
            }
            i=1;
            for (String[] ls : lista) {
                fila = hojaVic_Del.createRow(i);
                for(int j=0; j<head.length; j++){
                    col=fila.createCell(j);
                    col.setCellStyle(estiloBody);
                    col.setCellValue(ls[j]);
                    if(j==2)
                        col.setCellStyle(estiloError);
                }
                i++;
            }
            
            fila = hojaDescripcion.getRow(5);
            col = fila.getCell(0);
            col.setCellStyle(estiloIndicador);
        }
    }
    
    public void creaHoja_Imputado_Delitos(String sistema, SXSSFSheet hojaImp_Del, SXSSFSheet hojaDescripcion){
        
        lista=sV.Imputado_Delito(sistema);
        
        if(!lista.isEmpty()){
            fila = hojaImp_Del.createRow(0);
            fila.setHeight((short) 500);

            String[] head = {"JUZGADO CLAVE","CAUSA CLAVE","IMPUTADO CLAVE"};
            for(int h=0; h<head.length; h++){
                hojaImp_Del.setColumnWidth(h, 8000);
                col=fila.createCell(h);
                col.setCellStyle(estiloHead);
                col.setCellValue(head[h]);
            }
            i=1;
            for (String[] ls : lista) {
                fila = hojaImp_Del.createRow(i);
                for(int j=0; j<head.length; j++){
                    col=fila.createCell(j);
                    col.setCellStyle(estiloBody);
                    col.setCellValue(ls[j]);
                    if(j==2)
                        col.setCellStyle(estiloError);
                }
                i++;
            }
            
            fila = hojaDescripcion.getRow(6);
            col = fila.getCell(0);
            col.setCellStyle(estiloIndicador);
        }
    }
    
    public void creaHoja_Fecha_Ingreso(String sistema, SXSSFSheet hojaF_Ingreso, SXSSFSheet hojaDescripcion){
        
        lista=sV.Fecha_Ingreso(sistema);
        
        if(!lista.isEmpty()){
            fila = hojaF_Ingreso.createRow(0);
            fila.setHeight((short) 500);

            String[] head = {"JUZGADO CLAVE","CAUSA CLAVE","FECHA INGRESO"};
            for(int h=0; h<head.length; h++){
                hojaF_Ingreso.setColumnWidth(h, 8000);
                col=fila.createCell(h);
                col.setCellStyle(estiloHead);
                col.setCellValue(head[h]);
            }
            i=1;
            for (String[] ls : lista) {
                fila = hojaF_Ingreso.createRow(i);
                for(int j=0; j<head.length; j++){
                    col=fila.createCell(j);
                    col.setCellStyle(estiloBody);
                    col.setCellValue(ls[j]);
                    if(j==2)
                        col.setCellStyle(estiloError);
                }
                i++;
            }
            
            fila = hojaDescripcion.getRow(7);
            col = fila.getCell(0);
            col.setCellStyle(estiloIndicador);
        }
    }
    
    public void creaHoja_Fecha_Ocurrencia(String sistema, SXSSFSheet hojaF_Ocurrencia, SXSSFSheet hojaDescripcion){
        
        lista=sV.Fecha_Ocurrencia(sistema);
        
        if(!lista.isEmpty()){
            fila = hojaF_Ocurrencia.createRow(0);
            fila.setHeight((short) 500);

            String[] head = {"JUZGADO CLAVE","CAUSA CLAVE","FECHA OCURRENCIA","FECHA INGRESO"};
            for(int h=0; h<head.length; h++){
                hojaF_Ocurrencia.setColumnWidth(h, 8000);
                col=fila.createCell(h);
                col.setCellStyle(estiloHead);
                col.setCellValue(head[h]);
            }
            i=1;
            for (String[] ls : lista) {
                fila = hojaF_Ocurrencia.createRow(i);
                for(int j=0; j<head.length; j++){
                    col=fila.createCell(j);
                    col.setCellStyle(estiloBody);
                    col.setCellValue(ls[j]);
                    if(j==2)
                        col.setCellStyle(estiloError);
                }
                i++;
            }
            
            fila = hojaDescripcion.getRow(8);
            col = fila.getCell(0);
            col.setCellStyle(estiloIndicador);
        }
    }
    
    public void creaHoja_Fecha_Conclusion(String sistema, SXSSFSheet hojaF_Conclusion, SXSSFSheet hojaDescripcion){
        
        lista=sV.Fecha_Conclusion(sistema);
        
        if(!lista.isEmpty()){
            fila = hojaF_Conclusion.createRow(0);
            fila.setHeight((short) 500);

            String[] head = {"JUZGADO CLAVE","CAUSA CLAVE","FECHA CONCLUSION","FECHA INGRESO"};
            for(int h=0; h<head.length; h++){
                hojaF_Conclusion.setColumnWidth(h, 8000);
                col=fila.createCell(h);
                col.setCellStyle(estiloHead);
                col.setCellValue(head[h]);
            }
            i=1;
            for (String[] ls : lista) {
                fila = hojaF_Conclusion.createRow(i);
                for(int j=0; j<head.length; j++){
                    col=fila.createCell(j);
                    col.setCellStyle(estiloBody);
                    col.setCellValue(ls[j]);
                    if(j==2)
                        col.setCellStyle(estiloError);
                }
                i++;
            }
            
            fila = hojaDescripcion.getRow(9);
            col = fila.getCell(0);
            col.setCellStyle(estiloIndicador);
        }
    }
    
    public void creaHoja_Fecha_Tramite(String sistema, SXSSFSheet hojaF_Tramite, SXSSFSheet hojaDescripcion){
        
        lista=sV.Fecha_Tramite(sistema);
        
        if(!lista.isEmpty()){
            fila = hojaF_Tramite.createRow(0);
            fila.setHeight((short) 500);

            String[] head = {"JUZGADO CLAVE","CAUSA CLAVE","FECHA TRAMITE","FECHA INGRESO"};
            for(int h=0; h<head.length; h++){
                hojaF_Tramite.setColumnWidth(h, 8000);
                col=fila.createCell(h);
                col.setCellStyle(estiloHead);
                col.setCellValue(head[h]);
            }
            i=1;
            for (String[] ls : lista) {
                fila = hojaF_Tramite.createRow(i);
                for(int j=0; j<head.length; j++){
                    col=fila.createCell(j);
                    col.setCellStyle(estiloBody);
                    col.setCellValue(ls[j]);
                    if(j==2)
                        col.setCellStyle(estiloError);
                }
                i++;
            }
            
            fila = hojaDescripcion.getRow(10);
            col = fila.getCell(0);
            col.setCellStyle(estiloIndicador);
        }
    }
    
    public void creaHoja_Fecha_Impugnacion(String sistema, SXSSFSheet hojaF_Impugnacion, SXSSFSheet hojaDescripcion){
        
        lista=sV.Fecha_Impugnacion(sistema);
        
        if(!lista.isEmpty()){
            fila = hojaF_Impugnacion.createRow(0);
            fila.setHeight((short) 500);

            String[] head = {"JUZGADO CLAVE","CAUSA CLAVE","FECHA IMPUGNACION","FECHA CONCLUSION"};
            for(int h=0; h<head.length; h++){
                hojaF_Impugnacion.setColumnWidth(h, 8000);
                col=fila.createCell(h);
                col.setCellStyle(estiloHead);
                col.setCellValue(head[h]);
            }
            i=1;
            for (String[] ls : lista) {
                fila = hojaF_Impugnacion.createRow(i);
                for(int j=0; j<head.length; j++){
                    col=fila.createCell(j);
                    col.setCellStyle(estiloBody);
                    col.setCellValue(ls[j]);
                    if(j==2)
                        col.setCellStyle(estiloError);
                }
                i++;
            }
            
            fila = hojaDescripcion.getRow(11);
            col = fila.getCell(0);
            col.setCellStyle(estiloIndicador);
        }
    }

    public Font creaFuente(short color, boolean negrita){
        Font fuente = libro.createFont();
        fuente.setFontHeightInPoints((short) 12);
        fuente.setFontName("Arial");
        fuente.setBold(negrita);
        fuente.setColor(color);
        
        return fuente;
    }
    
    public CellStyle creaEstilo(Font fuente, String color, boolean bordes){
        CellStyle  estilo = libro.createCellStyle();
        estilo.setFont(fuente);
        estilo.setAlignment(HorizontalAlignment.CENTER);
        estilo.setVerticalAlignment(VerticalAlignment.CENTER);
        estilo.setWrapText(true);

        if (!color.equals("#FFFFFF")) {
            estilo.setFillPattern(FillPatternType.SOLID_FOREGROUND);
            ((XSSFCellStyle) estilo).setFillForegroundColor(new XSSFColor(Color.decode(color)));//Se sobre carga setfill para poder utilizar valores hexadecimales
            //estiloHead.setFillForegroundColor(IndexedColors.GREEN.getIndex());
        }
        
        if (bordes) {
            estilo.setBorderBottom(BorderStyle.THIN);
        }

        return estilo;
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
