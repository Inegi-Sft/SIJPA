/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package clasesAuxiliar;

import ConexionDB.Conexion_Mysql;
import java.io.FileReader;
import com.opencsv.*;
import com.opencsv.exceptions.CsvException;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.lingala.zip4j.core.ZipFile;
import net.lingala.zip4j.exception.ZipException;
import java.util.UUID;
import javafx.util.Pair;
import net.lingala.zip4j.model.FileHeader;

/**
 *
 * @author JONATHAN.AGUIRRE
 */
public class manejaCSVComprimido {
    Boolean resultado;
    String resultado_leer_zip,directorio,resultado_contienetablas,ruta,resultado_cambianombrearchivos, resultado_validaColumnas, resultado_importaCSVs;
    ZipFile archivo_zip;
    CSVReader leerCsv;
    List filas;
    ArrayList<String> tablas_faltantes = new ArrayList<String>();
    ArrayList<Pair<String, String>> columnas_faltantes = new ArrayList<Pair<String, String>>();
    ArrayList<Pair<String, String>> tablas_error_importacion = new ArrayList<Pair<String, String>>();
    String[] encabezado;
    
    public manejaCSVComprimido(String archivo, String ruta) throws ZipException{
        this.archivo_zip = new ZipFile(archivo);
        this.ruta = ruta;
    }
    
    public ArrayList<String> obtenerTablasFaltantes(){
        return this.tablas_faltantes;
    }
    
    public ArrayList<Pair<String, String>> obtenerColumnasFaltantes(){
        return this.columnas_faltantes; 
    }
    
    public ArrayList<Pair<String, String>> obtenerTablasConErrorEnImportacion(){
        return this.tablas_error_importacion;
    }
    public String obtenerDirectorio(){
        return this.directorio;
    }
    
    private ArrayList<String> columnasSobrantes(String tabla) throws SQLException{
        ArrayList<String> columnas_tabla;
        ArrayList<String> columnas_sobran = new ArrayList<String>();
        Conexion_Mysql conn =  new Conexion_Mysql();
        columnas_tabla = conn.obtenerColumnasDeTabla(tabla);
        for (int i = 0; i < this.encabezado.length; i++) {
            if(columnas_tabla.contains(this.encabezado[i]) == false){
                if(this.encabezado[i].length() > 0){
                    columnas_sobran.add(this.encabezado[i].toUpperCase());
                }
            }
        }
        conn.close();
        return columnas_sobran;
    }
    
    public String validaColumnasCSVs(ArrayList<String> tablasFaltantes) throws IOException, CsvException, SQLException{
        resultado_validaColumnas = "Todo correcto";
        Pair<String, String> tabla_columnas;
        usuario mi_usuario = new usuario();
        ArrayList<String[]> lista_tablas = mi_usuario.getTables();
        for(int i=0;i<lista_tablas.size();i++){
            if(!tablasFaltantes.contains(lista_tablas.get(i)[0])){
                if(!this.validaArchivoVacio(this.ruta+this.directorio+lista_tablas.get(i)[0]+".csv")){
                    this.leeArchivoCSV(this.ruta+this.directorio+lista_tablas.get(i)[0]+".csv");
                    String resultado_encabezados = this.encabezadosCorrectos(lista_tablas.get(i)[0]);
                    if(!resultado_encabezados.equalsIgnoreCase("Si")){
                        tabla_columnas = new Pair(lista_tablas.get(i)[0],resultado_encabezados.replace(" ",","));
                        this.columnas_faltantes.add(tabla_columnas);
                        resultado_validaColumnas = "Faltan";
                    }
                    this.leerCsv.close();
                }
            }
        }
        return resultado_validaColumnas;
    }
    
    public String cambiaNombreArchivosMayusculas(){
        resultado_cambianombrearchivos = "Cambio nombre";
        File carpeta = new File(this.ruta+this.directorio);
        String[] listado = carpeta.list();
        if (listado == null || listado.length == 0) {
            resultado_cambianombrearchivos = "No hay archivos";
        }else {
            for (int i=0; i< listado.length; i++) {
                 File parent = new File(this.ruta+this.directorio+listado[i]).getParentFile();
                 String filename = new File(this.ruta+this.directorio+listado[i]).getName().toUpperCase();
                 new File(this.ruta+this.directorio+listado[i]).renameTo(new File(parent, filename));
            }
        }
        return resultado_cambianombrearchivos;
    }
    
    public String importaCSVs() throws SQLException, IOException{
        resultado_importaCSVs = "Importo correctamente";
        usuario mi_usuario = new usuario();
        Pair<String, String> tabla_error;
        ArrayList<String[]> lista_tablas = mi_usuario.getTables();
        Conexion_Mysql conn =  new Conexion_Mysql();
        conn.Conectar();
        conn.getConexion().setAutoCommit(false);
        for(int i=0;i<lista_tablas.size();i++){
            Boolean resultado_validaArchivoVacio = this.validaArchivoVacio(this.ruta+this.directorio+lista_tablas.get(i)[0]+".csv");
            if(!resultado_validaArchivoVacio){
                this.leeArchivoCSV(ruta+this.directorio+lista_tablas.get(i)[0]+".csv");
                String resultado_importacion = this.importaCSV(lista_tablas.get(i)[0], this.ruta+this.directorio+lista_tablas.get(i)[0]+".csv", conn);
                if(!resultado_importacion.equalsIgnoreCase("No hay")){
                    tabla_error = new Pair(lista_tablas.get(i)[0],resultado_importacion);
                    this.tablas_error_importacion.add(tabla_error);
                    resultado_importaCSVs = "Error";
                }
                this.leerCsv.close();
            }
        }
        if(resultado_importaCSVs.equalsIgnoreCase("Error")){
            System.out.println("Se hizo rollback porque hubo error");
            conn.getConexion().rollback();
            conn.close();
        }else{
            System.out.println("Se hizo commit porque no hubo error");
            conn.getConexion().commit();
            conn.close();
        }
        return resultado_importaCSVs; 
    }
    
    private void leeArchivoCSV(String archivo){
        try{
            leerCsv = new CSVReader(new FileReader(archivo));
            this.filas = leerCsv.readAll();
            this.encabezado = (String[]) this.filas.get(0);
        } catch (IOException | CsvException ex) {
            Logger.getLogger(manejaCSVComprimido.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private Boolean contieneColumna(String[] columnas,String columna){
        Boolean resultadocontiene = false;
        for (int i = 0; i < columnas.length; i++) {
            if(columnas[i].equalsIgnoreCase(columna)){
                resultadocontiene = true;
                break;
            }
        }
        return resultadocontiene;
    }
    
    private String encabezadosCorrectos(String tabla) throws IOException, CsvException, SQLException{
        ArrayList<String> columnas_tabla;
        resultado = true;
        String resultado_encabezado = "";
        String columnas_faltantes = "";
        Conexion_Mysql conn =  new Conexion_Mysql();
        columnas_tabla = conn.obtenerColumnasDeTabla(tabla);
        for(int i=0;i<columnas_tabla.size();i++){
            if(contieneColumna(this.encabezado,columnas_tabla.get(i))){
                continue;
            }else{
                columnas_faltantes += columnas_tabla.get(i) + " ";
                resultado = false;
            }
        }
        if(resultado == true){
            resultado_encabezado = "Si";
        }else{
            resultado_encabezado = columnas_faltantes;
        }
        conn.close();
        return resultado_encabezado;
    }
    
    private String convertirArregloACadena(String[] array) { 
        String result = ""; 
        if (array.length > 0) { 
            StringBuilder sb = new StringBuilder(); 
            for (String s : array) {
                sb.append(s).append(","); 
            } 
            result = sb.deleteCharAt(sb.length() - 1).toString(); 
        } 
        return result; 
    }
    
    private String convertirColeccionACadena(ArrayList<String> array) { 
        String result = ""; 
        if (array.size() > 0) { 
            StringBuilder sb = new StringBuilder(); 
            for (String s : array) {
                sb.append(s).append(","); 
            } 
            result = sb.deleteCharAt(sb.length() - 1).toString(); 
        } 
        return result; 
    }
    private String convertirColeccionArregloACadena(ArrayList<String[]> array) { 
        String result = ""; 
        if (array.size() > 0) { 
            StringBuilder sb = new StringBuilder(); 
            for (int i=0;i<array.size();i++) {
                sb.append(array.get(i)[0]).append(","); 
            } 
            result = sb.deleteCharAt(sb.length() - 1).toString(); 
        } 
        return result; 
    }
    
    private String importaCSV(String tabla, String archivo, Conexion_Mysql conn){
        String excepcion = "No hay";
        try {
            String encabezado_mayusculas = String.join(" , ", this.encabezado).toUpperCase();
            ArrayList<String> columnas_sobrantes;
            columnas_sobrantes = this.columnasSobrantes(tabla);
            if(columnas_sobrantes.size() > 0){
                for(int i=0;i<columnas_sobrantes.size();i++){
                    encabezado_mayusculas = encabezado_mayusculas.replace(columnas_sobrantes.get(i).replace(" ", ""),"@dummy");   
                }
            }
            if(encabezado_mayusculas.endsWith(", ")){
                    encabezado_mayusculas = encabezado_mayusculas.substring(0, encabezado_mayusculas.length()-3);
            }
            char comillas = '"';
            Statement sentencia = conn.getConexion().createStatement();
            System.out.println("Se deshabilita llave para la tabla "+tabla);
            sentencia.execute("SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0");
            sentencia.execute("SET NAMES utf8");
            sentencia.execute("SET CHARACTER SET utf8");
            sentencia.execute("LOCK TABLES "+tabla+" WRITE");
            sentencia.execute("ALTER TABLE "+tabla+" DISABLE KEYS");
            sentencia.execute("LOAD DATA LOCAL INFILE '"+archivo.replace("\\", "/")+"' REPLACE INTO TABLE "
            +tabla+" CHARACTER SET UTF8 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"+comillas+"'"
                    + " LINES TERMINATED BY '\n' IGNORE 1 LINES ("+encabezado_mayusculas+")");
            String sql_actualiza = this.concatenaLlaves(tabla);
            if(!sql_actualiza.equalsIgnoreCase("No hay que concatenar llaves")){
                System.out.println("Se concatenan llaves para tabla "+tabla);
                sentencia.execute(this.concatenaLlaves(tabla));
            }
            sentencia.execute("ALTER TABLE "+tabla+" ENABLE KEYS");
            sentencia.execute("UNLOCK TABLES");
            sentencia.execute("SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS");
            System.out.println("Se habilitan de nuevo llaves al importar tabla "+tabla);
        } catch (SQLException ex) {
            excepcion = ex.toString();
        }
        return excepcion;
    }
    
    private String concatenaLlaves(String tabla){
        String sql ="";
        switch(tabla){
            case "DATOS_AUDIENCIAS_ADOJC":
                sql="UPDATE DATOS_AUDIENCIAS_ADOJC SET "
                        + "JUZGADO_CLAVE= CASE WHEN JUZGADO_CLAVE NOT LIKE '%-%' THEN "
                        + "CONCAT(JUZGADO_ENTIDAD_ID,'-',JUZGADO_MUNICIPIO_ID,'-',JUZGADO_NUMERO_ID) "
                        + "WHEN JUZGADO_CLAVE LIKE '%-%' THEN JUZGADO_CLAVE END"
                        + ",CAUSA_CLAVE="
                        + "CONCAT(CAUSA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_AUDIENCIAS_ADOJO":
                sql="UPDATE DATOS_AUDIENCIAS_ADOJO SET "
                        + "JUZGADO_CLAVE= CASE WHEN JUZGADO_CLAVE NOT LIKE '%-%' THEN "
                        + "CONCAT(JUZGADO_ENTIDAD_ID,'-',JUZGADO_MUNICIPIO_ID,'-',JUZGADO_NUMERO_ID) "
                        + "WHEN JUZGADO_CLAVE LIKE '%-%' THEN JUZGADO_CLAVE END"
                        + ",CAUSA_CLAVEJO="
                        + "CONCAT(CAUSA_CLAVEJO,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
            
            break;
            case "DATOS_CAUSAS_PENALES_ADOJC":
                sql="UPDATE DATOS_CAUSAS_PENALES_ADOJC SET CAUSA_CLAVE="
                        + "CONCAT(CAUSA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
           case "DATOS_CAUSAS_PENALES_ADOJO":
                sql="UPDATE DATOS_CAUSAS_PENALES_ADOJO SET CAUSA_CLAVEJC="
                        + "CONCAT(CAUSA_CLAVEJC,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",CAUSA_CLAVEJO="
                        + "CONCAT(CAUSA_CLAVEJO,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
            
                break;
            case "DATOS_CONCLUSIONES_ADOJC":
                sql="UPDATE DATOS_CONCLUSIONES_ADOJC SET CAUSA_CLAVE="
                        + "CONCAT(CAUSA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",PROCESADO_CLAVE="
                        + "CONCAT(PROCESADO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_CONCLUSIONES_ADOJO":
                sql="UPDATE DATOS_CONCLUSIONES_ADOJO SET CAUSA_CLAVEJO="
                        + "CONCAT(CAUSA_CLAVEJO,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",PROCESADO_CLAVE="
                        + "CONCAT(PROCESADO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_CSUSPENSION_ADOJC":
                sql="UPDATE DATOS_CSUSPENSION_ADOJC SET CAUSA_CLAVE="
                        + "CONCAT(CAUSA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",PROCESADO_CLAVE="
                        + "CONCAT(PROCESADO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_DCONCLUSIONES_ADOJC":    
                sql="UPDATE DATOS_DCONCLUSIONES_ADOJC SET CAUSA_CLAVE="
                        + "CONCAT(CAUSA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",PROCESADO_CLAVE="
                        + "CONCAT(PROCESADO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",DELITO_CLAVE="
                        + "CONCAT(DELITO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_DCONCLUSIONES_ADOJO":
                sql="UPDATE DATOS_DCONCLUSIONES_ADOJO SET CAUSA_CLAVEJO="
                        + "CONCAT(CAUSA_CLAVEJO,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",PROCESADO_CLAVE="
                        + "CONCAT(PROCESADO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",DELITO_CLAVE="
                        + "CONCAT(DELITO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_DELITOS_ADOJC":
                sql="UPDATE DATOS_DELITOS_ADOJC SET CAUSA_CLAVE="
                        + "CONCAT(CAUSA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",DELITO_CLAVE="
                        + "CONCAT(DELITO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_DELITOS_ADOJO":
                sql="UPDATE DATOS_DELITOS_ADOJO SET CAUSA_CLAVEJO="
                        + "CONCAT(CAUSA_CLAVEJO,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",CAUSA_CLAVEJC="
                        + "CONCAT(CAUSA_CLAVEJC,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",DELITO_CLAVEJC="
                        + "CONCAT(DELITO_CLAVEJC,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",DELITO_CLAVEJO="
                        + "CONCAT(DELITO_CLAVEJO,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_DHOMICIDIO_ADOJC":
                sql="UPDATE DATOS_DHOMICIDIO_ADOJC SET CAUSA_CLAVE="
                        + "CONCAT(CAUSA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",DELITO_CLAVE="
                        + "CONCAT(DELITO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_DHOMICIDIO_ADOJO":
                sql="UPDATE DATOS_DHOMICIDIO_ADOJO SET CAUSA_CLAVEJO="
                        + "CONCAT(CAUSA_CLAVEJO,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",DELITO_CLAVE="
                        + "CONCAT(DELITO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_DROBO_ADOJC":
                sql="UPDATE DATOS_DROBO_ADOJC SET CAUSA_CLAVE="
                        + "CONCAT(CAUSA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",DELITO_CLAVE="
                        + "CONCAT(DELITO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_DROBO_ADOJO":
                sql="UPDATE DATOS_DROBO_ADOJO SET CAUSA_CLAVEJO="
                        + "CONCAT(CAUSA_CLAVEJO,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",DELITO_CLAVE="
                        + "CONCAT(DELITO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_ETAPA_INICIAL_ADOJC":
                sql="UPDATE DATOS_ETAPA_INICIAL_ADOJC SET CAUSA_CLAVE="
                        + "CONCAT(CAUSA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",PROCESADO_CLAVE="
                        + "CONCAT(PROCESADO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_ETAPA_INTERMEDIA_ADOJC":
                sql="UPDATE DATOS_ETAPA_INTERMEDIA_ADOJC SET CAUSA_CLAVE="
                        + "CONCAT(CAUSA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",PROCESADO_CLAVE="
                        + "CONCAT(PROCESADO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_ETAPA_ORAL_ADOJO":
                sql="UPDATE DATOS_ETAPA_ORAL_ADOJO SET CAUSA_CLAVEJO="
                        + "CONCAT(CAUSA_CLAVEJO,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",PROCESADO_CLAVE="
                        + "CONCAT(PROCESADO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_PDELITOS_ADOJC":
                sql="UPDATE DATOS_PDELITOS_ADOJC SET CAUSA_CLAVE="
                        + "CONCAT(CAUSA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",PROCESADO_CLAVE="
                        + "CONCAT(PROCESADO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",DELITO_CLAVE="
                        + "CONCAT(DELITO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_PDELITOS_ADOJO":
                sql="UPDATE DATOS_PDELITOS_ADOJO SET CAUSA_CLAVEJO="
                        + "CONCAT(CAUSA_CLAVEJO,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",PROCESADO_CLAVE="
                        + "CONCAT(PROCESADO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",DELITO_CLAVE="
                        + "CONCAT(DELITO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_PFUENTE_INGRESOS_ADOJC":
                sql="UPDATE DATOS_PFUENTE_INGRESOS_ADOJC SET CAUSA_CLAVE="
                        + "CONCAT(CAUSA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",PROCESADO_CLAVE="
                        + "CONCAT(PROCESADO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_PFUENTE_INGRESOS_ADOJO":
                sql="UPDATE DATOS_PFUENTE_INGRESOS_ADOJO SET CAUSA_CLAVEJO="
                        + "CONCAT(CAUSA_CLAVEJO,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",PROCESADO_CLAVE="
                        + "CONCAT(PROCESADO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_PMEDIDAS_ADOJC":
                sql="UPDATE DATOS_PMEDIDAS_ADOJC SET CAUSA_CLAVE="
                        + "CONCAT(CAUSA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",PROCESADO_CLAVE="
                        + "CONCAT(PROCESADO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_PRESENTA_MP_ADOJC":
                sql="UPDATE DATOS_PRESENTA_MP_ADOJC SET CAUSA_CLAVE="
                        + "CONCAT(CAUSA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",PROCESADO_CLAVE="
                        + "CONCAT(PROCESADO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_PROCESADOS_ADOJC":
                sql="UPDATE DATOS_PROCESADOS_ADOJC SET CAUSA_CLAVE="
                        + "CONCAT(CAUSA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",PROCESADO_CLAVE="
                        + "CONCAT(PROCESADO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_PROCESADOS_ADOJO":
                sql="UPDATE DATOS_PROCESADOS_ADOJO SET CAUSA_CLAVEJO="
                        + "CONCAT(CAUSA_CLAVEJO,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",PROCESADO_CLAVEJO="
                        + "CONCAT(PROCESADO_CLAVEJO,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",CAUSA_CLAVEJC="
                        + "CONCAT(CAUSA_CLAVEJC,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",PROCESADO_CLAVEJC="
                        + "CONCAT(PROCESADO_CLAVEJC,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_TRAMITES_ADOJC":
                sql="UPDATE DATOS_TRAMITES_ADOJC SET CAUSA_CLAVE="
                        + "CONCAT(CAUSA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",PROCESADO_CLAVE="
                        + "CONCAT(PROCESADO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_TRAMITES_ADOJO":
                sql="UPDATE DATOS_TRAMITES_ADOJO SET CAUSA_CLAVEJO="
                        + "CONCAT(CAUSA_CLAVEJO,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",PROCESADO_CLAVE="
                        + "CONCAT(PROCESADO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_VDELITOS_ADOJC":
                sql="UPDATE DATOS_VDELITOS_ADOJC SET CAUSA_CLAVE="
                        + "CONCAT(CAUSA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",PROCESADO_CLAVE="
                        + "CONCAT(PROCESADO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",VICTIMA_CLAVE="
                        + "CONCAT(VICTIMA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",DELITO_CLAVE="
                        + "CONCAT(DELITO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_VDELITOS_ADOJO":  
                sql="UPDATE DATOS_VDELITOS_ADOJO SET CAUSA_CLAVEJO="
                        + "CONCAT(CAUSA_CLAVEJO,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",PROCESADO_CLAVE="
                        + "CONCAT(PROCESADO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",VICTIMA_CLAVE="
                        + "CONCAT(VICTIMA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",DELITO_CLAVE="
                        + "CONCAT(DELITO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_VFUENTE_INGRESOS_ADOJC":
                sql="UPDATE DATOS_VFUENTE_INGRESOS_ADOJC SET CAUSA_CLAVE="
                        + "CONCAT(CAUSA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",VICTIMA_CLAVE="
                        + "CONCAT(VICTIMA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_VFUENTE_INGRESOS_ADOJO":
                sql="UPDATE DATOS_VFUENTE_INGRESOS_ADOJO SET CAUSA_CLAVEJO="
                        + "CONCAT(CAUSA_CLAVEJO,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",VICTIMA_CLAVE="
                        + "CONCAT(VICTIMA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_VICTIMAS_ADOJC":
                sql="UPDATE DATOS_VICTIMAS_ADOJC SET CAUSA_CLAVE="
                        + "CONCAT(CAUSA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",VICTIMA_CLAVE="
                        + "CONCAT(VICTIMA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_VICTIMAS_ADOJO":
                sql="UPDATE DATOS_VICTIMAS_ADOJO SET CAUSA_CLAVEJO="
                        + "CONCAT(CAUSA_CLAVEJO,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",VICTIMA_CLAVEJC="
                        + "CONCAT(VICTIMA_CLAVEJC,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",CAUSA_CLAVEJC="
                        + "CONCAT(CAUSA_CLAVEJC,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",VICTIMA_CLAVEJO="
                        + "CONCAT(VICTIMA_CLAVEJO,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_VMEDIDAS_ADOJC":
                sql="UPDATE DATOS_VMEDIDAS_ADOJC SET CAUSA_CLAVE="
                        + "CONCAT(CAUSA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",VICTIMA_CLAVE="
                        + "CONCAT(VICTIMA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_VMEDIDAS_DMUJ_ADOJC":
                sql="UPDATE DATOS_VMEDIDAS_DMUJ_ADOJC SET CAUSA_CLAVE="
                        + "CONCAT(CAUSA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",VICTIMA_CLAVE="
                        + "CONCAT(VICTIMA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_VPROCESADOS_ADOJC":
                sql="UPDATE DATOS_VPROCESADOS_ADOJC SET CAUSA_CLAVE="
                        + "CONCAT(CAUSA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",VICTIMA_CLAVE="
                        + "CONCAT(VICTIMA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",PROCESADO_CLAVE="
                        + "CONCAT(PROCESADO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            case "DATOS_VPROCESADOS_ADOJO":
                sql="UPDATE DATOS_VPROCESADOS_ADOJO SET CAUSA_CLAVEJO="
                        + "CONCAT(CAUSA_CLAVEJO,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",VICTIMA_CLAVE="
                        + "CONCAT(VICTIMA_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)"
                        + ",PROCESADO_CLAVE="
                        + "CONCAT(PROCESADO_CLAVE,JUZGADO_ENTIDAD_ID,JUZGADO_MUNICIPIO_ID,JUZGADO_NUMERO_ID)";
                break;
            default: 
                sql = "No hay que concatenar llaves";
                break;
            
        }
        return sql;
    }
    
    private Boolean validaArchivoVacio(String rutaArchivo){
        Boolean archivo_vacio = true;
        File archivo = new File (rutaArchivo);
        try {
            FileReader fr = new FileReader (archivo);
            BufferedReader br = new BufferedReader(fr);
            int lineas = 0;
            while (br.readLine() != null) lineas++;
            br.close();
            if(lineas > 1){
                archivo_vacio = false;
            }
        } catch (FileNotFoundException ex) {
            Logger.getLogger(manejaCSVComprimido.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(manejaCSVComprimido.class.getName()).log(Level.SEVERE, null, ex);
        }
        return archivo_vacio;
    }
    public String contieneTodaLasTablas(){
        resultado_contienetablas = "Todo correcto";
        usuario mi_usuario = new usuario();
        ArrayList<String[]> lista_tablas = mi_usuario.getTables();
        for(int i=0;i<lista_tablas.size();i++){
            if(contieneTablaElArchivoZip(lista_tablas.get(i)[0]+".csv").equalsIgnoreCase("No esta")){
                this.tablas_faltantes.add(lista_tablas.get(i)[0]);
                resultado_contienetablas = "Faltan";
            }else if(contieneTablaElArchivoZip(lista_tablas.get(i)[0]+".csv").equalsIgnoreCase("No se puede leer")){
                resultado_contienetablas = "No se puede leer";
                break;
            }else{
                continue;
            }
        }
        return resultado_contienetablas;
    }
    
    private String contieneTablaElArchivoZip(String tabla_csv){
        resultado_leer_zip = "No esta";
        try{
            List encabezados_archivo = this.archivo_zip.getFileHeaders();
            for (int i = 0; i < encabezados_archivo.size(); i++) {
                FileHeader encabezado_archivo = (FileHeader)encabezados_archivo.get(i);
                if(tabla_csv.equalsIgnoreCase(encabezado_archivo.getFileName())){
                    resultado_leer_zip = "Si esta";
                    break;
                }
            }
        } catch (ZipException ex) {
            resultado_leer_zip = "No se puede leer";
            Logger.getLogger(manejaCSVComprimido.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resultado_leer_zip;
    }
    
    public void ExtraeComprimido(){
        this.directorio = "Desempaquetado_"+UUID.randomUUID()+"\\";
        File directorio_crear = new File(this.ruta+this.directorio);
        Boolean creo_directorio = directorio_crear.mkdirs();
        try {
            this.archivo_zip.extractAll(directorio_crear.getPath());
        } catch (ZipException ex) {
            Logger.getLogger(manejaCSVComprimido.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
