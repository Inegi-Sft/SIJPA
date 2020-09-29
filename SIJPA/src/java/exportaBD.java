/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



import java.io.IOException;
import java.io.*;
import clasesAuxiliar.exportaExcel;
import clasesAuxiliar.ArchivoSIJPA;
import java.nio.file.Paths;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
/**
 *
 * @author JONATHAN.AGUIRRE
 */
@WebServlet(urlPatterns = {"/exportaBD"})
public class exportaBD extends HttpServlet {
    private final String RUTA = "..\\..\\inegi_conf\\Archivos\\";
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
        
        //Si da clic en el botón exportaBD
        if(request.getParameter("exportaBD") != null){
            
            String nombre_archivo = "BD_"+request.getParameter("entidad")+"_"+request.getParameter("nombreArchivo").replace(" ","_");
            
            if(request.getParameter("tipoArchivo").equalsIgnoreCase("sijpa")){
                ArchivoSIJPA mi_archivoSIJPA = new ArchivoSIJPA();
                Runtime mi_rt = Runtime.getRuntime();
                String mi_archivo = "respaldo.sijpa";
                Process mi_proceso = mi_rt.exec("..\\..\\mysql\\bin\\mysqldump.exe -u root -pInegiSijpa2020 --ignore-table=sijpa_db.tipo_usuarios --ignore-table=sijpa_db.catalogos_acuerdo_reparatorio --ignore-table=sijpa_db.catalogos_alfabetismo --ignore-table=sijpa_db.catalogos_asentamiento_humano --ignore-table=sijpa_db.catalogos_audiencias_intermedia --ignore-table=sijpa_db.catalogos_audiencias_investigacion --ignore-table=sijpa_db.catalogos_audiencias_juiciooral --ignore-table=sijpa_db.catalogos_auto_vinculacion --ignore-table=sijpa_db.catalogos_calificacion_delito --ignore-table=sijpa_db.catalogos_causa_suspencion --ignore-table=sijpa_db.catalogos_clasificacion --ignore-table=sijpa_db.catalogos_codigo_norma --ignore-table=sijpa_db.catalogos_concurso --ignore-table=sijpa_db.catalogos_condicion_actividad --ignore-table=sijpa_db.catalogos_condicion_estudiante --ignore-table=sijpa_db.catalogos_consumacion --ignore-table=sijpa_db.catalogos_contexto_situacional --ignore-table=sijpa_db.catalogos_cosa_robada --ignore-table=sijpa_db.catalogos_delitos_norma --ignore-table=sijpa_db.catalogos_dominio_espanol --ignore-table=sijpa_db.catalogos_ejercicios --ignore-table=sijpa_db.catalogos_entidades --ignore-table=sijpa_db.catalogos_estado_civil --ignore-table=sijpa_db.catalogos_estado_psicofisico --ignore-table=sijpa_db.catalogos_estatus --ignore-table=sijpa_db.catalogos_estatusjo --ignore-table=sijpa_db.catalogos_estudio_profesional --ignore-table=sijpa_db.catalogos_etapa_inicial --ignore-table=sijpa_db.catalogos_etapa_intermedia --ignore-table=sijpa_db.catalogos_etapa_procesal --ignore-table=sijpa_db.catalogos_etapas --ignore-table=sijpa_db.catalogos_exclusion_accionp --ignore-table=sijpa_db.catalogos_figura_mprueba --ignore-table=sijpa_db.catalogos_figura_proceso --ignore-table=sijpa_db.catalogos_forma_accion --ignore-table=sijpa_db.catalogos_forma_comision --ignore-table=sijpa_db.catalogos_forma_conduccion --ignore-table=sijpa_db.catalogos_forma_division --ignore-table=sijpa_db.catalogos_fuente_ingresos --ignore-table=sijpa_db.catalogos_fuero --ignore-table=sijpa_db.catalogos_funcion_juzgado --ignore-table=sijpa_db.catalogos_grado_estudios --ignore-table=sijpa_db.catalogos_grado_participacion --ignore-table=sijpa_db.catalogos_incompetencia --ignore-table=sijpa_db.catalogos_instrumento_comision --ignore-table=sijpa_db.catalogos_integra_causa --ignore-table=sijpa_db.catalogos_jurisdiccion --ignore-table=sijpa_db.catalogos_linguisticas --ignore-table=sijpa_db.catalogos_medidas_cautelares --ignore-table=sijpa_db.catalogos_medidas_disciplinarias --ignore-table=sijpa_db.catalogos_medidas_duracion --ignore-table=sijpa_db.catalogos_medidas_mujer --ignore-table=sijpa_db.catalogos_medidas_proteccion --ignore-table=sijpa_db.catalogos_medidas_solicita --ignore-table=sijpa_db.catalogos_medios_prueba --ignore-table=sijpa_db.catalogos_modalidad --ignore-table=sijpa_db.catalogos_multa --ignore-table=sijpa_db.catalogos_municipios --ignore-table=sijpa_db.catalogos_nacionalidad --ignore-table=sijpa_db.catalogos_noprivativas --ignore-table=sijpa_db.catalogos_ocupacion --ignore-table=sijpa_db.catalogos_pais --ignore-table=sijpa_db.catalogos_plazo_cierre --ignore-table=sijpa_db.catalogos_plazo_constitucional --ignore-table=sijpa_db.catalogos_privativas --ignore-table=sijpa_db.catalogos_proc_abreviado --ignore-table=sijpa_db.catalogos_promueve_incidente --ignore-table=sijpa_db.catalogos_pueblo_indigena --ignore-table=sijpa_db.catalogos_rango_ingresos --ignore-table=sijpa_db.catalogos_reincidencia --ignore-table=sijpa_db.catalogos_relacion_imputado --ignore-table=sijpa_db.catalogos_reparacion_dano --ignore-table=sijpa_db.catalogos_representante_legal --ignore-table=sijpa_db.catalogos_resolucion_mprueba --ignore-table=sijpa_db.catalogos_respuesta_simple --ignore-table=sijpa_db.catalogos_sentido_fallo --ignore-table=sijpa_db.catalogos_sexo --ignore-table=sijpa_db.catalogos_sitio_ocurrencia --ignore-table=sijpa_db.catalogos_sobreseimiento --ignore-table=sijpa_db.catalogos_suspension_condicional --ignore-table=sijpa_db.catalogos_tiempo_internamiento --ignore-table=sijpa_db.catalogos_tipo_consignacion --ignore-table=sijpa_db.catalogos_tipo_defensor --ignore-table=sijpa_db.catalogos_tipo_detencion --ignore-table=sijpa_db.catalogos_tipo_impugnacion --ignore-table=sijpa_db.catalogos_tipo_resolucion --ignore-table=sijpa_db.catalogos_tipo_resolucionjo --ignore-table=sijpa_db.catalogos_tipo_sobreseimiento --ignore-table=sijpa_db.catalogos_tipo_victima --ignore-table=sijpa_db.catalogos_vialidad --ignore-table=sijpa_db.catalogos_victima_moral --ignore-table=sijpa_db.catalogos_vulnerabilidad --ignore-table=sijpa_db.usuarios --ignore-table=sijpa_db.usuarios_control --no-create-db --no-create-info sijpa_db");
                //Process mi_proceso = mi_rt.exec("C:\\xampp\\mysql\\bin\\mysqldump.exe -u root --ignore-table=sijpa_db.tipo_usuarios --ignore-table=sijpa_db.catalogos_acuerdo_reparatorio --ignore-table=sijpa_db.catalogos_alfabetismo --ignore-table=sijpa_db.catalogos_asentamiento_humano --ignore-table=sijpa_db.catalogos_audiencias_intermedia --ignore-table=sijpa_db.catalogos_audiencias_investigacion --ignore-table=sijpa_db.catalogos_audiencias_juiciooral --ignore-table=sijpa_db.catalogos_auto_vinculacion --ignore-table=sijpa_db.catalogos_calificacion_delito --ignore-table=sijpa_db.catalogos_causa_suspencion --ignore-table=sijpa_db.catalogos_clasificacion --ignore-table=sijpa_db.catalogos_codigo_norma --ignore-table=sijpa_db.catalogos_concurso --ignore-table=sijpa_db.catalogos_condicion_actividad --ignore-table=sijpa_db.catalogos_condicion_estudiante --ignore-table=sijpa_db.catalogos_consumacion --ignore-table=sijpa_db.catalogos_contexto_situacional --ignore-table=sijpa_db.catalogos_cosa_robada --ignore-table=sijpa_db.catalogos_delitos_norma --ignore-table=sijpa_db.catalogos_dominio_espanol --ignore-table=sijpa_db.catalogos_ejercicios --ignore-table=sijpa_db.catalogos_entidades --ignore-table=sijpa_db.catalogos_estado_civil --ignore-table=sijpa_db.catalogos_estado_psicofisico --ignore-table=sijpa_db.catalogos_estatus --ignore-table=sijpa_db.catalogos_estatusjo --ignore-table=sijpa_db.catalogos_estudio_profesional --ignore-table=sijpa_db.catalogos_etapa_inicial --ignore-table=sijpa_db.catalogos_etapa_intermedia --ignore-table=sijpa_db.catalogos_etapa_procesal --ignore-table=sijpa_db.catalogos_etapas --ignore-table=sijpa_db.catalogos_exclusion_accionp --ignore-table=sijpa_db.catalogos_figura_mprueba --ignore-table=sijpa_db.catalogos_figura_proceso --ignore-table=sijpa_db.catalogos_forma_accion --ignore-table=sijpa_db.catalogos_forma_comision --ignore-table=sijpa_db.catalogos_forma_conduccion --ignore-table=sijpa_db.catalogos_forma_division --ignore-table=sijpa_db.catalogos_fuente_ingresos --ignore-table=sijpa_db.catalogos_fuero --ignore-table=sijpa_db.catalogos_funcion_juzgado --ignore-table=sijpa_db.catalogos_grado_estudios --ignore-table=sijpa_db.catalogos_grado_participacion --ignore-table=sijpa_db.catalogos_incompetencia --ignore-table=sijpa_db.catalogos_instrumento_comision --ignore-table=sijpa_db.catalogos_integra_causa --ignore-table=sijpa_db.catalogos_jurisdiccion --ignore-table=sijpa_db.catalogos_linguisticas --ignore-table=sijpa_db.catalogos_medidas_cautelares --ignore-table=sijpa_db.catalogos_medidas_disciplinarias --ignore-table=sijpa_db.catalogos_medidas_duracion --ignore-table=sijpa_db.catalogos_medidas_mujer --ignore-table=sijpa_db.catalogos_medidas_proteccion --ignore-table=sijpa_db.catalogos_medidas_solicita --ignore-table=sijpa_db.catalogos_medios_prueba --ignore-table=sijpa_db.catalogos_modalidad --ignore-table=sijpa_db.catalogos_multa --ignore-table=sijpa_db.catalogos_municipios --ignore-table=sijpa_db.catalogos_nacionalidad --ignore-table=sijpa_db.catalogos_noprivativas --ignore-table=sijpa_db.catalogos_ocupacion --ignore-table=sijpa_db.catalogos_pais --ignore-table=sijpa_db.catalogos_plazo_cierre --ignore-table=sijpa_db.catalogos_plazo_constitucional --ignore-table=sijpa_db.catalogos_privativas --ignore-table=sijpa_db.catalogos_proc_abreviado --ignore-table=sijpa_db.catalogos_promueve_incidente --ignore-table=sijpa_db.catalogos_pueblo_indigena --ignore-table=sijpa_db.catalogos_rango_ingresos --ignore-table=sijpa_db.catalogos_reincidencia --ignore-table=sijpa_db.catalogos_relacion_imputado --ignore-table=sijpa_db.catalogos_reparacion_dano --ignore-table=sijpa_db.catalogos_representante_legal --ignore-table=sijpa_db.catalogos_resolucion_mprueba --ignore-table=sijpa_db.catalogos_respuesta_simple --ignore-table=sijpa_db.catalogos_sentido_fallo --ignore-table=sijpa_db.catalogos_sexo --ignore-table=sijpa_db.catalogos_sitio_ocurrencia --ignore-table=sijpa_db.catalogos_sobreseimiento --ignore-table=sijpa_db.catalogos_suspension_condicional --ignore-table=sijpa_db.catalogos_tiempo_internamiento --ignore-table=sijpa_db.catalogos_tipo_consignacion --ignore-table=sijpa_db.catalogos_tipo_defensor --ignore-table=sijpa_db.catalogos_tipo_detencion --ignore-table=sijpa_db.catalogos_tipo_impugnacion --ignore-table=sijpa_db.catalogos_tipo_resolucion --ignore-table=sijpa_db.catalogos_tipo_resolucionjo --ignore-table=sijpa_db.catalogos_tipo_sobreseimiento --ignore-table=sijpa_db.catalogos_tipo_victima --ignore-table=sijpa_db.catalogos_vialidad --ignore-table=sijpa_db.catalogos_victima_moral --ignore-table=sijpa_db.catalogos_vulnerabilidad --ignore-table=sijpa_db.usuarios --ignore-table=sijpa_db.usuarios_control --no-create-db --no-create-info sijpa_db");
                InputStream mi_entrada = mi_proceso.getInputStream();
                System.out.println(mi_entrada.read());
                FileOutputStream mi_salida = new FileOutputStream(RUTA+mi_archivo);
                int mi_caracter;
                while((mi_caracter=mi_entrada.read())!=-1){
                    mi_salida.write(mi_caracter);
                }
                mi_salida.close();
                mi_entrada.close();
                mi_archivoSIJPA.generaArchivoCifrado(RUTA+mi_archivo, RUTA+nombre_archivo+".sijpa");
                response.setContentType("application/txt");
                response.setHeader("Content-Disposition","attachment;filename=\"" +nombre_archivo+".sijpa" + "\"");
                File f = new File(RUTA+nombre_archivo+".sijpa");
                byte[] arBytes = new byte[(int)f.length()];
                FileInputStream is = new FileInputStream(f);
                is.read(arBytes);
                ServletOutputStream op = response.getOutputStream();
                op.write(arBytes);
                op.flush();
                op.close();
                is.close();
            
                Paths.get(RUTA+mi_archivo).toFile().delete();
                File mi_archivo_borrar_1 = new File(RUTA + nombre_archivo+".sijpa");
                mi_archivo_borrar_1.delete(); 
            }
            if(request.getParameter("tipoArchivo").equalsIgnoreCase("excel")){
                
                SXSSFWorkbook mi_libro = new SXSSFWorkbook();
                exportaExcel exportarExcel = new exportaExcel(mi_libro);
                
                exportarExcel.exportaTablaAudienciasJC();
                exportarExcel.exportaTablaAudienciasJO();
                exportarExcel.exportaTablaCausasPenalesJC();
                exportarExcel.exportaTablaCausasPenalesJO();
                exportarExcel.exportaTablaConclusionesJC();
                exportarExcel.exportaTablaConclusionesJO();
                exportarExcel.exportaTablaSuspensionJC();
                exportarExcel.exportaTablaDconclusionesJC();
                exportarExcel.exportaTablaDconclusionesJO();
                exportarExcel.exportaTablaDelitosJC();
                exportarExcel.exportaTablaDelitosJO();
                exportarExcel.exportaTablaDhomicidioJC();
                exportarExcel.exportaTablaDhomicidioJO();
                exportarExcel.exportaTablaDroboJC();
                exportarExcel.exportaTablaDroboJO();
                exportarExcel.exportaTablaEtapaInicialJC();
                exportarExcel.exportaTablaEtapaIntermediaJC();
                exportarExcel.exportaTablaEtapaOralJO();
                exportarExcel.exportaTablaInformeJC();
                exportarExcel.exportaTablaInformeJO();
                exportarExcel.exportaTablaJuecesJC();
                exportarExcel.exportaTablaJuzgadosJC();
                exportarExcel.exportaTablaPdelitosJC();
                exportarExcel.exportaTablaPdelitosJO();
                exportarExcel.exportaTablaPfuenteIngresosJC();
                exportarExcel.exportaTablaPfuenteIngresosJO();
                exportarExcel.exportaTablaPmedidasJC();
                exportarExcel.exportaTablaPresentaMPJC();
                exportarExcel.exportaTablaProcesadosJC();
                exportarExcel.exportaTablaProcesadosJO();
                exportarExcel.exportaTablaTramitesJC();
                exportarExcel.exportaTablaTramitesJO();
                exportarExcel.exportaTablaVdelitosJC();
                exportarExcel.exportaTablaVdelitosJO();
                exportarExcel.exportaTablaVfuenteIngresosJC();
                exportarExcel.exportaTablaVfuenteIngresosJO();
                exportarExcel.exportaTablaVictimasJC();
                exportarExcel.exportaTablaVictimasJO();
                exportarExcel.exportaTablaVmedidasJC();
                exportarExcel.exportaTablaVmedidasDmujJC();
                exportarExcel.exportaTablaVprocesadosJC();
                exportarExcel.exportaTablaVprocesadosJO();
                
                
                File mi_archivo;
                mi_archivo = new File(RUTA+nombre_archivo+".xlsx");
                try(FileOutputStream mi_archivo_salida = new FileOutputStream(mi_archivo)){
                    if(mi_archivo.exists()){
                        mi_archivo.delete();
                    }
                    mi_libro.write(mi_archivo_salida);
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
            Logger.getLogger(exportaBD.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(exportaBD.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(exportaBD.class.getName()).log(Level.SEVERE, null, ex);
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
