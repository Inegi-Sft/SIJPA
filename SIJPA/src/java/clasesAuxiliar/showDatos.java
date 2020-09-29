/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clasesAuxiliar;

import ConexionDB.Conexion_Mysql;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JONATHAN.AGUIRRE
 */
public class showDatos {
    
    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> causasJC;
    ArrayList<String[]> audienciasJC;
    ArrayList<String[]> audienciasJO;
    ArrayList<String[]> causasJO;
    ArrayList<String[]> conclusionesJC;
    ArrayList<String[]> conclusionesJO;
    ArrayList<String[]> suspensionJC;
    ArrayList<String[]> dconclusionesJC;
    ArrayList<String[]> dconclusionesJO;
    ArrayList<String[]> delitosJC;
    ArrayList<String[]> delitosJO;
    ArrayList<String[]> dhomicidioJC;
    ArrayList<String[]> dhomicidioJO;
    ArrayList<String[]> droboJC;
    ArrayList<String[]> droboJO;
    ArrayList<String[]> etapaInicialJC;
    ArrayList<String[]> etapaIntermediaJC;
    ArrayList<String[]> etapaOralJO;
    ArrayList<String[]> datosInformeJC;
    ArrayList<String[]> datosInformeJO;
    ArrayList<String[]> datosJuecesJC;
    ArrayList<String[]> datosJuzgadosJC;
    ArrayList<String[]> datosPdelitosJC;
    ArrayList<String[]> datosPdelitosJO;
    ArrayList<String[]> datosPfuenteIngresosJC;
    ArrayList<String[]> datosPfuenteIngresosJO;
    ArrayList<String[]> datosPmedidasJC;
    ArrayList<String[]> datosPresentaMPJC;
    ArrayList<String[]> datosProcesadosJC;
    ArrayList<String[]> datosProcesadosJO;
    ArrayList<String[]> datosTramitesJC;
    ArrayList<String[]> datosTramitesJO;
    ArrayList<String[]> datosVdelitosJC;
    ArrayList<String[]> datosVdelitosJO;
    ArrayList<String[]> datosVfuenteIngresosJC;
    ArrayList<String[]> datosVfuenteIngresosJO;
    ArrayList<String[]> datosVictimasJC;
    ArrayList<String[]> datosVictimasJO;
    ArrayList<String[]> datosVmedidasJC;
    ArrayList<String[]> datosVmedidasDmujJC;
    ArrayList<String[]> datosVprocesadosJC;
    ArrayList<String[]> datosVprocesadosJO;
    
    public ArrayList findCausasPenalesJC(){
        try{
            conn.Conectar();
            causasJC = new ArrayList();
            String sql = "SELECT * FROM DATOS_CAUSAS_PENALES_ADOJC";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                causasJC.add(new String[]{
                    rs.getString("ANIO"), rs.getString("CARPETA_INVESTIGA"), rs.getString("CAUSA_CLAVE"),
                    rs.getString("COMENTARIOS"), rs.getString("COMPETENCIA"), rs.getString("DERIVA_ACCION_PENAL"),
                    rs.getString("EXPEDIENTE_ACUMULADO"), rs.getString("EXPEDIENTE_REFERENCIA"), rs.getString("FECHA_INGRESO"),
                    rs.getString("INTEGRACION_CAUSA"), rs.getString("JUEZ_CLAVE"), rs.getString("JUZGADO_CLAVE"),
                    rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"),
                    rs.getString("TIPO_INCOMPETENCIA"), rs.getString("TOTAL_DELITOS"), rs.getString("TOTAL_PROCESADOS"),
                    rs.getString("TOTAL_VICTIMAS")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return causasJC;
    
    }
    public ArrayList findAudienciasJC(){
        try{
            conn.Conectar();
            audienciasJC = new ArrayList();
            String sql = "SELECT * FROM DATOS_AUDIENCIAS_ADOJC";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                audienciasJC.add(new String[]{
                    rs.getString("ANIO"), rs.getString("AUDIENCIA_INTERMEDIA"), rs.getString("AUDIENCIA_INVESTIGACION"),
                    rs.getString("CAUSA_CLAVE"), rs.getString("FECHA_CELEBRACION"), rs.getString("HORAS"),
                    rs.getString("JUEZ_CLAVE1"), rs.getString("JUEZ_CLAVE2"), rs.getString("JUEZ_CLAVE3"),
                    rs.getString("JUZGADO_CLAVE"), rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"),
                    rs.getString("JUZGADO_NUMERO"), rs.getString("MINUTOS")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return audienciasJC;
    
    }
    public ArrayList findAudienciasJO(){
        try{
            conn.Conectar();
            audienciasJO = new ArrayList();
            String sql = "SELECT * FROM DATOS_AUDIENCIAS_ADOJO";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                audienciasJO.add(new String[]{
                    rs.getString("ANIO"), rs.getString("AUDIENCIA_JUICIOORAL"), rs.getString("CAUSA_CLAVEJO"),
                    rs.getString("FECHA_CELEBRACION"), rs.getString("HORAS"), rs.getString("JUEZ_CLAVE1"),
                    rs.getString("JUEZ_CLAVE2"), rs.getString("JUEZ_CLAVE3"), rs.getString("JUZGADO_CLAVE"),
                    rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO"),
                    rs.getString("MINUTOS")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return audienciasJO;
    
    }
    public ArrayList findCausasPenalesJO(){
        try{
            conn.Conectar();
            causasJO = new ArrayList();
            String sql = "SELECT * FROM DATOS_CAUSAS_PENALES_ADOJO";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                causasJO.add(new String[]{
                    rs.getString("ANIO"), rs.getString("CANTIDAD_JUECES"), rs.getString("CAUSA_CLAVEJC"),
                    rs.getString("CAUSA_CLAVEJO"), rs.getString("COMENTARIOS"), rs.getString("FECHA_INGRESOJC"),
                    rs.getString("FECHA_INGRESOJO"), rs.getString("JUEZ_CLAVE_1"), rs.getString("JUEZ_CLAVE_2"),
                    rs.getString("JUEZ_CLAVE_3"), rs.getString("JUZGADO_CLAVEJC"), rs.getString("JUZGADO_CLAVEJO"),
                    rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"),
                    rs.getString("TOTAL_DELITOS"), rs.getString("TOTAL_PROCESADOS"), rs.getString("TOTAL_VICTIMAS")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return causasJO;
    
    }
    public ArrayList findConclusionesJC(){
        try{
            conn.Conectar();
            conclusionesJC = new ArrayList();
            String sql = "SELECT * FROM DATOS_CONCLUSIONES_ADOJC";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                conclusionesJC.add(new String[]{
                    rs.getString("ANIO"), rs.getString("CAUSA_CLAVE"), rs.getString("COMENTARIOS"),
                    rs.getString("EXCLUSION_ACCIONP"), rs.getString("FECHA_ACUERDO"), rs.getString("FECHA_CONCLUSION"),
                    rs.getString("FECHA_IMPUGNACION"), rs.getString("FECHA_SUSPENCION"), rs.getString("IMPUGNACION"),
                    rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"),
                    rs.getString("MECANISMO_ACUERDO"), rs.getString("MEDIDA_NOPRIVATIVA"), rs.getString("MEDIDA_PRIVATIVA"),
                    rs.getString("MONTO_REPARA"), rs.getString("PERSONA_IMPUGNA"), rs.getString("PROCEDENCIA_SOBRESEIMIENTO"),
                    rs.getString("PROCESADO_CLAVE"), rs.getString("REPARACION_DANIO"), rs.getString("TIEMPO_INTERNAMIENTO"),
                    rs.getString("TIPO_CONCLUSION_PA"), rs.getString("TIPO_IMPUGNACION"), rs.getString("TIPO_REPARACION_DANIO"),
                    rs.getString("TIPO_RESOLUCION"), rs.getString("TIPO_SOBRESEIMIENTO")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return conclusionesJC;
    
    }
    public ArrayList findConclusionesJO(){
        try{
            conn.Conectar();
            conclusionesJO = new ArrayList();
            String sql = "SELECT * FROM DATOS_CONCLUSIONES_ADOJO";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                conclusionesJO.add(new String[]{
                    rs.getString("ANIO"), rs.getString("CAUSA_CLAVEJO"), rs.getString("COMENTARIOS"),
                    rs.getString("EXCLUSION_ACCIONP"), rs.getString("FECHA_CONCLUSION"), rs.getString("FECHA_IMPUGNACION"),
                    rs.getString("FECHA_SENTENCIA"), rs.getString("IMPUGNACION"), rs.getString("JUZGADO_ENTIDAD_ID"),
                    rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"), rs.getString("MEDIDA_NOPRIVATIVA"),
                    rs.getString("MEDIDA_PRIVATIVA"), rs.getString("MONTO_REPARA"), rs.getString("PERSONA_IMPUGNA"),
                    rs.getString("PROCEDENCIA_SOBRESEIMIENTO"), rs.getString("PROCESADO_CLAVE"), rs.getString("REPARACION_DANIO"),
                    rs.getString("TIEMPO_INTERNAMIENTO"), rs.getString("TIPO_IMPUGNACION"), rs.getString("TIPO_REPARACION_DANIO"),
                    rs.getString("TIPO_RESOLUCION"), rs.getString("TIPO_SENTENCIA"), rs.getString("TIPO_SOBRESEIMIENTO")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return conclusionesJO;
    
    }
    public ArrayList findSuspensionJC(){
        try{
            conn.Conectar();
            suspensionJC = new ArrayList();
            String sql = "SELECT * FROM DATOS_CSUSPENSION_ADOJC";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                suspensionJC.add(new String[]{ 
                    rs.getString("CAUSA_CLAVE"), rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"),
                    rs.getString("JUZGADO_NUMERO_ID"), rs.getString("PROCESADO_CLAVE"), rs.getString("SUSPENSION")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return suspensionJC;
    
    }
    public ArrayList findDconclusionesJC(){
        try{
            conn.Conectar();
            dconclusionesJC = new ArrayList();
            String sql = "SELECT * FROM DATOS_DCONCLUSIONES_ADOJC";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                dconclusionesJC.add(new String[]{
                    rs.getString("ANIO"), rs.getString("CAUSA_CLAVE"), rs.getString("DELITO_CLAVE"),
                    rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"),
                    rs.getString("PROCESADO_CLAVE"), rs.getString("TIPO_CONCLUSION_PA"), rs.getString("TIPO_RESOLUCION")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return dconclusionesJC;
    
    }
    public ArrayList findDconclusionesJO(){
        try{
            conn.Conectar();
            dconclusionesJO = new ArrayList();
            String sql = "SELECT * FROM DATOS_DCONCLUSIONES_ADOJO";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                dconclusionesJO.add(new String[]{
                    rs.getString("ANIO"), rs.getString("CAUSA_CLAVEJO"), rs.getString("DELITO_CLAVE"),
                    rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"),
                    rs.getString("PROCESADO_CLAVE"), rs.getString("TIPO_CONCLUSION"), rs.getString("TIPO_SENTENCIA")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return dconclusionesJO;
    
    }
    public ArrayList findDelitosJC(){
        try{
            conn.Conectar();
            delitosJC = new ArrayList();
            String sql = "SELECT * FROM DATOS_DELITOS_ADOJC";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                delitosJC.add(new String[]{
                    rs.getString("ANIO"), rs.getString("ART_CODIGO_PENAL"), rs.getString("CALIFICACION"),
                    rs.getString("CAUSA_CLAVE"), rs.getString("CLASIFICACION"), rs.getString("COMENTARIOS"),
                    rs.getString("CONCURSO"), rs.getString("DELITO_CLAVE"), rs.getString("DELITO_CODIGO_PENAL"),
                    rs.getString("DELITO_NORMA_TECNICA"), rs.getString("DELITO_RECLASIFICADO"), rs.getString("ESPECIFIQUE_SITIO"),
                    rs.getString("FECHA_OCURRENCIA"), rs.getString("FECHA_RECLASIFICACION"), rs.getString("FORMA_ACCION"),
                    rs.getString("FORMA_COMISION"), rs.getString("GRADO_CONSUMACION"), rs.getString("INSTRUMENTO_COMISION"),
                    rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"),
                    rs.getString("MODALIDAD"), rs.getString("NUMERO_PROCESADOS"), rs.getString("NUMERO_VICTIMAS"),
                    rs.getString("OCURRIO_ENTIDAD"), rs.getString("OCURRIO_MUNICIPIO"), rs.getString("SITIO_OCURRENCIA"),
                    rs.getString("TIPO_FUERO")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return delitosJC;
    
    }
    public ArrayList findDelitosJO(){
        try{
            conn.Conectar();
            delitosJO = new ArrayList();
            String sql = "SELECT * FROM DATOS_DELITOS_ADOJO";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                delitosJO.add(new String[]{
                    rs.getString("ANIO"), rs.getString("ART_CODIGO_PENAL"), rs.getString("CALIFICACION"),
                    rs.getString("CAUSA_CLAVEJC"), rs.getString("CAUSA_CLAVEJO"), rs.getString("CLASIFICACION"),
                    rs.getString("COMENTARIOS"), rs.getString("CONCURSO"), rs.getString("DELITO_CLAVEJC"),
                    rs.getString("DELITO_CLAVEJO"), rs.getString("DELITO_CODIGO_PENAL"), rs.getString("DELITO_NORMA_TECNICA"),
                    rs.getString("DELITO_RECLASIFICADO"), rs.getString("ESPECIFIQUE_SITIO"), rs.getString("FECHA_OCURRENCIA"),
                    rs.getString("FECHA_RECLASIFICACION"), rs.getString("FORMA_ACCION"), rs.getString("FORMA_COMISION"),
                    rs.getString("GRADO_CONSUMACION"), rs.getString("INSTRUMENTO_COMISION"), rs.getString("JUZGADO_ENTIDAD_ID"),
                    rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"), rs.getString("MODALIDAD"),
                    rs.getString("NUMERO_PROCESADOS"), rs.getString("NUMERO_VICTIMAS"), rs.getString("OCURRIO_ENTIDAD"),
                    rs.getString("OCURRIO_MUNICIPIO"), rs.getString("SITIO_OCURRENCIA"), rs.getString("TIPO_FUERO")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return delitosJO;
    
    }
    public ArrayList findDhomicidioJC(){
        try{
            conn.Conectar();
            dhomicidioJC = new ArrayList();
            String sql = "SELECT * FROM DATOS_DHOMICIDIO_ADOJC";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                dhomicidioJC.add(new String[]{
                    rs.getString("ANIO"), rs.getString("CAUSA_CLAVE"), rs.getString("CONTEXTO_SITUACIONAL"),
                    rs.getString("DELITO_CLAVE"), rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"),
                    rs.getString("JUZGADO_NUMERO_ID")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return dhomicidioJC;
    
    }
    public ArrayList findDhomicidioJO(){
        try{
            conn.Conectar();
            dhomicidioJO = new ArrayList();
            String sql = "SELECT * FROM DATOS_DHOMICIDIO_ADOJO";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                dhomicidioJO.add(new String[]{
                    rs.getString("ANIO"), rs.getString("CAUSA_CLAVEJO"), rs.getString("CONTEXTO_SITUACIONAL"),
                    rs.getString("DELITO_CLAVE"), rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"),
                    rs.getString("JUZGADO_NUMERO_ID")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return dhomicidioJO;
    
    }
    public ArrayList findDroboJC(){
        try{
            conn.Conectar();
            droboJC = new ArrayList();
            String sql = "SELECT * FROM DATOS_DROBO_ADOJC";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                droboJC.add(new String[]{
                    rs.getString("ANIO"), rs.getString("CAUSA_CLAVE"), rs.getString("DELITO_CLAVE"),
                    rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"),
                    rs.getString("TIPO_COSA_ROBADA")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return droboJC;
    
    }
    public ArrayList findDroboJO(){
        try{
            conn.Conectar();
            droboJO = new ArrayList();
            String sql = "SELECT * FROM DATOS_DROBO_ADOJO";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                droboJO.add(new String[]{
                    rs.getString("ANIO"), rs.getString("CAUSA_CLAVEJO"), rs.getString("DELITO_CLAVE"),
                    rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"),
                    rs.getString("TIPO_COSA_ROBADA")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return droboJO;
    
    }
    public ArrayList findEtapaInicialJC(){
        try{
            conn.Conectar();
            etapaInicialJC = new ArrayList();
            String sql = "SELECT * FROM DATOS_ETAPA_INICIAL_ADOJC";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                etapaInicialJC.add(new String[]{
                    rs.getString("ANIO"), rs.getString("AUDIENCIA_INICIAL"), rs.getString("AUTO_VINCULACION"),
                    rs.getString("CAUSA_CLAVE"), rs.getString("CAUSA_SUSPENSION_PROCESO"), rs.getString("COMENTARIOS"),
                    rs.getString("CTRL_DETENCION"), rs.getString("DETENCION_LEGAL"), rs.getString("ETAPA"),
                    rs.getString("FECHA_CIERRE_INVESTIGACION"), rs.getString("FECHA_DECLARACION"), rs.getString("FECHA_IMPUTACION"),
                    rs.getString("FECHA_LIBERTAD"), rs.getString("FECHA_PLAZO_INVESTIGACION"), rs.getString("FECHA_REAPERTURA_PROCESO"),
                    rs.getString("FECHA_VINCULACION"), rs.getString("FORMULACION_IMPUTACION"), rs.getString("FORMULO_ACUSACION"),
                    rs.getString("IMPUSO_MCAUTELARES"), rs.getString("IMPUTADO_DECLARO"), rs.getString("INVESTIGACION_COMPLEMENTARIA"),
                    rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"),
                    rs.getString("PLAZO_CIERRE_INVESTIGACION"), rs.getString("PLAZO_CONSTITUCIONAL"), rs.getString("PROCESADO_CLAVE"),
                    rs.getString("PRORROGA_PLAZO_CIERRE"), rs.getString("REAPERTURA_PROCESO"), rs.getString("SOBRESEIMIENTO_CAUSAP"),
                    rs.getString("SOLICITO_REAPERTURA"), rs.getString("SUSPENSION_PROCESO"), rs.getString("TIEMPO_PLAZO")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return etapaInicialJC;
    
    }
    public ArrayList findEtapaIntermediaJC(){
        try{
            conn.Conectar();
            etapaIntermediaJC = new ArrayList();
            String sql = "SELECT * FROM DATOS_ETAPA_INTERMEDIA_ADOJC";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                etapaIntermediaJC.add(new String[]{
                    rs.getString("ACUERDOS_PROBATORIOS"), rs.getString("ANIO"), rs.getString("APERTURA_JUICIO_ORAL"),
                    rs.getString("AUDIENCIA_INTERMEDIA"), rs.getString("CAUSA_CLAVE"), rs.getString("COMENTARIOS"),
                    rs.getString("DESCUBRIMIENTO_PROBATORIO"), rs.getString("FECHA_AUDIENCIA_INTERMEDIA"), rs.getString("FECHA_CONTESTACION"),
                    rs.getString("FECHA_ESCRITO_ACUSACION"), rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"),
                    rs.getString("JUZGADO_NUMERO_ID"), rs.getString("PRESENTACION_MPRUEBA"), rs.getString("PRESENTA_MP_ASESOR"),
                    rs.getString("PRESENTA_MP_DEFENSA"), rs.getString("PRESENTA_MP_MINISTERIO"), rs.getString("PROCESADO_CLAVE"),
                    rs.getString("SEPARACION_ACUSACION")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return etapaIntermediaJC;
    
    }
    public ArrayList findEtapaOralJO(){
        try{
            conn.Conectar();
            etapaOralJO = new ArrayList();
            String sql = "SELECT * FROM DATOS_ETAPA_ORAL_ADOJO";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                etapaOralJO.add(new String[]{
                    rs.getString("ANIO"), rs.getString("CAUSA_CLAVEJO"), rs.getString("COMENTARIOS"),
                    rs.getString("DELIBERACION"), rs.getString("ETAPA"), rs.getString("FECHA_APERTURA_JUICIOORAL"),
                    rs.getString("FECHA_AUDIENCIA_JUICIO"), rs.getString("FECHA_DELIBERACION"), rs.getString("FECHA_REANUDACION"),
                    rs.getString("FECHA_RESOLUCION_INCIDENTE"), rs.getString("FECHA_SUSPENCION"), rs.getString("INCIDENTES_AUDIENCIA"),
                    rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"),
                    rs.getString("MEDIDAS_DISCIPLINARIAS"), rs.getString("PD_DECLARACION_ACUSADO"), rs.getString("PD_DOCUMENTAL_MATERIAL"),
                    rs.getString("PD_OTRA_PRUEBA"), rs.getString("PD_PERICIAL"), rs.getString("PD_TESTIMONIAL"),
                    rs.getString("PROCESADO_CLAVE"), rs.getString("PROMUEVE_INCIDENTE"), rs.getString("SENTIDO_FALLO"),
                    rs.getString("SUSPENCION_AUDIENCIA"), rs.getString("TIPO_DISCIPLINARIA")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return etapaOralJO;
    
    }
    public ArrayList findInformeJC(){
        try{
            conn.Conectar();
            datosInformeJC = new ArrayList();
            String sql = "SELECT * FROM DATOS_INFORME_ADOJC";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                datosInformeJC.add(new String[]{
                    rs.getString("ACTOS_INVESTIGA"), rs.getString("ANIO"), rs.getString("CAUSAS_BAJAS"),
                    rs.getString("CAUSAS_PENALES_INGRESADAS"), rs.getString("CAUSAS_TRAMITE"), rs.getString("IMPUGNACION_MP"),
                    rs.getString("JUZGADO_CLAVE"), rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"),
                    rs.getString("JUZGADO_NUMERO_ID"), rs.getString("MEDIDAS_PROTECCION_ASIG"), rs.getString("ORDENES_JUDICIALES"),
                    rs.getString("OTROS"), rs.getString("PROVIDENCIAS_PRECAUTORIAS"), rs.getString("PRUEBA_ANTICIPADA")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return datosInformeJC;
    
    }
    public ArrayList findInformeJO(){
        try{
            conn.Conectar();
            datosInformeJO = new ArrayList();
            String sql = "SELECT * FROM DATOS_INFORME_ADOJO";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                datosInformeJO.add(new String[]{
                    rs.getString("ACTOS_INVESTIGA"), rs.getString("ANIO"), rs.getString("CAUSAS_BAJAS"),
                    rs.getString("CAUSAS_PENALES_INGRESADAS"), rs.getString("CAUSAS_TRAMITE"), rs.getString("IMPUGNACION_MP"),
                    rs.getString("JUZGADO_CLAVE"), rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"),
                    rs.getString("JUZGADO_NUMERO_ID"), rs.getString("MEDIDAS_PROTECCION_ASIG"), rs.getString("ORDENES_JUDICIALES"),
                    rs.getString("OTROS"), rs.getString("PROVIDENCIAS_PRECAUTORIAS"), rs.getString("PRUEBA_ANTICIPADA")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return datosInformeJO;
    
    }
    public ArrayList findJuecesJC(){
        try{
            conn.Conectar();
            datosJuecesJC = new ArrayList();
            String sql = "SELECT * FROM DATOS_JUECES_ADOJC";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                datosJuecesJC.add(new String[]{
                    rs.getString("ANIO"), rs.getString("APELLIDOM_JUEZ"), rs.getString("APELLIDOP_JUEZ"),
                    rs.getString("EDAD"), rs.getString("ESTATUS"), rs.getString("FECHA_GESTION"),
                    rs.getString("FUNCION_DESEMPENA"), rs.getString("GRADO_ESTUDIOS"), rs.getString("JUEZ_CLAVE"),
                    rs.getString("JUZGADO_CLAVE"), rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"),
                    rs.getString("JUZGADO_NUMERO_ID"), rs.getString("NOMBRE_JUEZ"), rs.getString("SEXO")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return datosJuecesJC;
    
    }
    public ArrayList findJuzgadosJC(){
        try{
            conn.Conectar();
            datosJuzgadosJC = new ArrayList();
            String sql = "SELECT * FROM DATOS_JUZGADOS_ADOJC";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                datosJuzgadosJC.add(new String[]{
                    rs.getString("ANIO"), rs.getString("APELLIDOM_CAP"), rs.getString("APELLIDOP_CAP"),
                    rs.getString("ASENTAMIENTO_HUMANO"), rs.getString("CARGO_CAP"), rs.getString("CODIGO_POSTAL"),
                    rs.getString("CORREO"), rs.getString("DISTRITO_JUDICIAL"), rs.getString("ENTIDAD"),
                    rs.getString("ESTATUS"), rs.getString("FORMA_DIVISION"), rs.getString("JUZGADO_CLAVE"),
                    rs.getString("JUZGADO_FUNCION"), rs.getString("JUZGADO_JURISDICCION"), rs.getString("JUZGADO_NOMBRE"),
                    rs.getString("JUZGADO_NUMERO"), rs.getString("LADATEL"), rs.getString("MUNICIPIO"),
                    rs.getString("NOMBRE_ASENTAMIENTO"), rs.getString("NOMBRE_CAP"), rs.getString("NOMBRE_VIALIDAD"),
                    rs.getString("NUMERO_EXT"), rs.getString("NUMERO_INT"), rs.getString("PARTIDO_JUDICIAL"),
                    rs.getString("REGION_JUDICIAL"), rs.getString("TIPO_VIALIDAD")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return datosJuzgadosJC;
    
    }
    public ArrayList findPdelitosJC(){
        try{
            conn.Conectar();
            datosPdelitosJC = new ArrayList();
            String sql = "SELECT * FROM DATOS_PDELITOS_ADOJC";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                datosPdelitosJC.add(new String[]{
                    rs.getString("ANIO"), rs.getString("CAUSA_CLAVE"), rs.getString("DELITO_CLAVE"),
                    rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"),
                    rs.getString("NUMERO_VICTIMAS"), rs.getString("PROCESADO_CLAVE")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return datosPdelitosJC;
    
    }
    public ArrayList findPdelitosJO(){
        try{
            conn.Conectar();
            datosPdelitosJO = new ArrayList();
            String sql = "SELECT * FROM DATOS_PDELITOS_ADOJO";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                datosPdelitosJO.add(new String[]{
                    rs.getString("ANIO"), rs.getString("CAUSA_CLAVEJO"), rs.getString("DELITO_CLAVE"),
                    rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"),
                    rs.getString("NUMERO_VICTIMAS"), rs.getString("PROCESADO_CLAVE")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return datosPdelitosJO;
    
    }
    public ArrayList findPfuenteIngresoJC(){
        try{
            conn.Conectar();
            datosPfuenteIngresosJC = new ArrayList();
            String sql = "SELECT * FROM DATOS_PFUENTE_INGRESOS_ADOJC";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                datosPfuenteIngresosJC.add(new String[]{
                    rs.getString("ANIO"), rs.getString("CAUSA_CLAVE"), rs.getString("INGRESO"),
                    rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"),
                    rs.getString("PROCESADO_CLAVE")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return datosPfuenteIngresosJC;
    
    }
    public ArrayList findPfuenteIngresoJO(){
        try{
            conn.Conectar();
            datosPfuenteIngresosJO = new ArrayList();
            String sql = "SELECT * FROM DATOS_PFUENTE_INGRESOS_ADOJO";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                datosPfuenteIngresosJO.add(new String[]{
                    rs.getString("ANIO"), rs.getString("CAUSA_CLAVEJO"), rs.getString("INGRESO"),
                    rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"),
                    rs.getString("PROCESADO_CLAVE")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return datosPfuenteIngresosJO;
    
    }
    public ArrayList findPmedidasJC(){
        try{
            conn.Conectar();
            datosPmedidasJC = new ArrayList();
            String sql = "SELECT * FROM DATOS_PMEDIDAS_ADOJC";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                datosPmedidasJC.add(new String[]{
                    rs.getString("ANIO"), rs.getString("CAUSA_CLAVE"), rs.getString("CAUTELARES"),
                    rs.getString("DURACION_MEDIDA"), rs.getString("ESPECIFIQUE"), rs.getString("JUZGADO_ENTIDAD_ID"),
                    rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"), rs.getString("PROCESADO_CLAVE"),
                    rs.getString("SOLICITA_MEDIDA")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return datosPmedidasJC;
    
    }
    public ArrayList findPresentaMPJC(){
        try{
            conn.Conectar();
            datosPresentaMPJC = new ArrayList();
            String sql = "SELECT * FROM DATOS_PRESENTA_MP_ADOJC";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                datosPresentaMPJC.add(new String[]{
                    rs.getString("ANIO"), rs.getString("CAUSA_CLAVE"), rs.getString("FIGURA_MPRUEBA"),
                    rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"),
                    rs.getString("MEDIO_PRUEBA"), rs.getString("PROCESADO_CLAVE"), rs.getString("RESOLUCION_PRUEBA")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return datosPresentaMPJC;
    
    }
    public ArrayList findProcesadosJC(){
        try{
            conn.Conectar();
            datosProcesadosJC = new ArrayList();
            String sql = "SELECT * FROM DATOS_PROCESADOS_ADOJC";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                datosProcesadosJC.add(new String[]{
                    rs.getString("ALIAS"), rs.getString("ANIO"), rs.getString("A_MATERNO"),
                    rs.getString("A_PATERNO"), rs.getString("CAUSA_CLAVE"), rs.getString("COMENTARIOS"),
                    rs.getString("CONDICION_ACTIVIDAD"), rs.getString("CONDICION_ALFABETISMO"), rs.getString("CONDICION_ESTUDIANTE"),
                    rs.getString("CURP"), rs.getString("DELICTIVO"), rs.getString("DISCAPACIDAD"),
                    rs.getString("EDAD_DELITO"), rs.getString("EDAD_INGRESO"), rs.getString("ESTADO_CIVIL"),
                    rs.getString("ESTADO_PSICOFISICO"), rs.getString("FAMILIA_LINGUISTICA"), rs.getString("FECHA_NACIMIENTO"),
                    rs.getString("FORMA_CONDUCCION"), rs.getString("GRADO_PARTICIPACION"), rs.getString("GRUPO_DELICTIVO"),
                    rs.getString("HABLA_ESPANOL"), rs.getString("HABLA_INDIGENA"), rs.getString("INGRESOS"),
                    rs.getString("INICIO_IMPUTADO"), rs.getString("INTERPRETE"), rs.getString("JUZGADO_ENTIDAD_ID"),
                    rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"), rs.getString("LENGUA_EXTRANJERA"),
                    rs.getString("NACIMIENTO_ENTIDAD"), rs.getString("NACIMIENTO_MUNICIPIO"), rs.getString("NACIMIENTO_PAIS"),
                    rs.getString("NACIONALIDAD"), rs.getString("NOMBRE"), rs.getString("OCUPACION"),
                    rs.getString("PERSONA_RESPONSABLE"), rs.getString("POBLACION_INDIGENA"), rs.getString("PROCESADO_CLAVE"),
                    rs.getString("RANGO_INGRESOS"), rs.getString("REINCIDENCIA"), rs.getString("RESIDENCIA_ENTIDAD"),
                    rs.getString("RESIDENCIA_MUNICIPIO"), rs.getString("RESIDENCIA_PAIS"), rs.getString("SEXO"),
                    rs.getString("TIPO_DEFENSOR"), rs.getString("TIPO_DETENCION"), rs.getString("TIPO_PUEBLO_INDIGENA"),
                    rs.getString("ULTIMO_GRADO_ESTUDIOS")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return datosProcesadosJC;
    
    }
    public ArrayList findProcesadosJO(){
        try{
            conn.Conectar();
            datosProcesadosJO = new ArrayList();
            String sql = "SELECT * FROM DATOS_PROCESADOS_ADOJO";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                datosProcesadosJO.add(new String[]{
                    rs.getString("ALIAS"), rs.getString("ANIO"), rs.getString("A_MATERNO"),
                    rs.getString("A_PATERNO"), rs.getString("CAUSA_CLAVEJC"), rs.getString("CAUSA_CLAVEJO"),
                    rs.getString("COMENTARIOS"), rs.getString("CONDICION_ACTIVIDAD"), rs.getString("CONDICION_ALFABETISMO"),
                    rs.getString("CONDICION_ESTUDIANTE"), rs.getString("CURP"), rs.getString("DELICTIVO"),
                    rs.getString("DISCAPACIDAD"), rs.getString("EDAD_DELITO"), rs.getString("EDAD_INGRESO"),
                    rs.getString("ESTADO_CIVIL"), rs.getString("ESTADO_PSICOFISICO"), rs.getString("FAMILIA_LINGUISTICA"),
                    rs.getString("FECHA_NACIMIENTO"), rs.getString("GRADO_PARTICIPACION"), rs.getString("GRUPO_DELICTIVO"),
                    rs.getString("HABLA_ESPANOL"), rs.getString("HABLA_INDIGENA"), rs.getString("INGRESOS"),
                    rs.getString("INTERPRETE"), rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"),
                    rs.getString("JUZGADO_NUMERO_ID"), rs.getString("LENGUA_EXTRANJERA"), rs.getString("NACIMIENTO_ENTIDAD"),
                    rs.getString("NACIMIENTO_MUNICIPIO"), rs.getString("NACIMIENTO_PAIS"), rs.getString("NACIONALIDAD"),
                    rs.getString("NOMBRE"), rs.getString("OCUPACION"), rs.getString("PERSONA_RESPONSABLE"),
                    rs.getString("POBLACION_INDIGENA"), rs.getString("PROCESADO_CLAVEJC"), rs.getString("PROCESADO_CLAVEJO"),
                    rs.getString("RANGO_INGRESOS"), rs.getString("REINCIDENCIA"), rs.getString("RESIDENCIA_ENTIDAD"),
                    rs.getString("RESIDENCIA_MUNICIPIO"), rs.getString("RESIDENCIA_PAIS"), rs.getString("SEXO"),
                    rs.getString("TIPO_DEFENSOR"), rs.getString("TIPO_PUEBLO_INDIGENA"), rs.getString("ULTIMO_GRADO_ESTUDIOS")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return datosProcesadosJO;
    
    }
    public ArrayList findTramitesJC(){
        try{
            conn.Conectar();
            datosTramitesJC = new ArrayList();
            String sql = "SELECT * FROM DATOS_TRAMITES_ADOJC";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                datosTramitesJC.add(new String[]{
                    rs.getString("ANIO"), rs.getString("CAUSA_CLAVE"), rs.getString("ESPECIFIQUE"),
                    rs.getString("ESTATUS_INTERMEDIA"), rs.getString("ESTATUS_INVESTIGACION"), rs.getString("ETAPA_PROCESAL"),
                    rs.getString("FECHA_ACTO_PROCESAL"), rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"),
                    rs.getString("JUZGADO_NUMERO_ID"), rs.getString("PROCESADO_CLAVE")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return datosTramitesJC;
    
    }
    public ArrayList findTramitesJO(){
        try{
            conn.Conectar();
            datosTramitesJO = new ArrayList();
            String sql = "SELECT * FROM DATOS_TRAMITES_ADOJO";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                datosTramitesJO.add(new String[]{
                    rs.getString("ANIO"), rs.getString("CAUSA_CLAVEJO"), rs.getString("ESPECIFIQUE"),
                    rs.getString("ESTATUS"), rs.getString("FECHA_ACTO_PROCESAL"), rs.getString("JUZGADO_ENTIDAD_ID"),
                    rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"), rs.getString("PROCESADO_CLAVE")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return datosTramitesJO;
    
    }
    public ArrayList findVdelitosJC(){
        try{
            conn.Conectar();
            datosVdelitosJC = new ArrayList();
            String sql = "SELECT * FROM DATOS_VDELITOS_ADOJC";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                datosVdelitosJC.add(new String[]{
                    rs.getString("ANIO"), rs.getString("CAUSA_CLAVE"), rs.getString("DELITO_CLAVE"),
                    rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"),
                    rs.getString("PROCESADO_CLAVE"), rs.getString("VICTIMA_CLAVE")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return datosVdelitosJC;
    
    }
    public ArrayList findVdelitosJO(){
        try{
            conn.Conectar();
            datosVdelitosJO = new ArrayList();
            String sql = "SELECT * FROM DATOS_VDELITOS_ADOJO";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                datosVdelitosJO.add(new String[]{
                    rs.getString("ANIO"), rs.getString("CAUSA_CLAVEJO"), rs.getString("DELITO_CLAVE"),
                    rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"),
                    rs.getString("PROCESADO_CLAVE"), rs.getString("VICTIMA_CLAVE")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return datosVdelitosJO;
    
    }
    public ArrayList findVictimasJC(){
        try{
            conn.Conectar();
            datosVictimasJC = new ArrayList();
            String sql = "SELECT * FROM DATOS_VICTIMAS_ADOJC";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                datosVictimasJC.add(new String[]{
                    rs.getString("ANIO"), rs.getString("ASESOR"), rs.getString("CAUSA_CLAVE"),
                    rs.getString("COMENTARIOS"), rs.getString("CONDICION_ALFABETISMO"), rs.getString("CONTO_ASESOR"),
                    rs.getString("EDAD"), rs.getString("ESTADO_CIVIL"), rs.getString("FECHA_NACIMIENTO"),
                    rs.getString("GRADO_ESTUDIOS"), rs.getString("HABLA_ESPANOL"), rs.getString("HABLA_INDIGENA"),
                    rs.getString("INGRESOS"), rs.getString("INTERPRETE"), rs.getString("JUSTIFICA_DELITOS"),
                    rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"),
                    rs.getString("LENGUA_EXTRANJERA"), rs.getString("LENGUA_INDIGENA"), rs.getString("MEDIDAS_MUJER"),
                    rs.getString("MEDIDAS_PROTECCION"), rs.getString("NACIMIENTO_ENTIDAD"), rs.getString("NACIMIENTO_MUNICIPIO"),
                    rs.getString("NACIMIENTO_PAIS"), rs.getString("NACIONALIDAD"), rs.getString("OCUPACION"),
                    rs.getString("RANGO_INGRESOS"), rs.getString("RESIDENCIA_ENTIDAD"), rs.getString("RESIDENCIA_MUNICIPIO"),
                    rs.getString("RESIDENCIA_PAIS"), rs.getString("SEXO"), rs.getString("TIPO_VICTIMA"),
                    rs.getString("TIPO_VICTIMA_MORAL"), rs.getString("VICTIMA_CLAVE"), rs.getString("VULNERABILIDAD")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return datosVictimasJC;
    
    }
    
    public ArrayList findVfuentesIngresoJC(){
        try{
            conn.Conectar();
            datosVfuenteIngresosJC = new ArrayList();
            String sql = "SELECT * FROM DATOS_VFUENTE_INGRESOS_ADOJC";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                datosVfuenteIngresosJC.add(new String[]{
                    rs.getString("ANIO"), rs.getString("CAUSA_CLAVE"), rs.getString("INGRESO"),
                    rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"),
                    rs.getString("VICTIMA_CLAVE")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return datosVfuenteIngresosJC;
    
    }
    
    public ArrayList findVFuentesIngresoJO(){
        try{
            conn.Conectar();
            datosVfuenteIngresosJO = new ArrayList();
            String sql = "SELECT * FROM DATOS_VFUENTE_INGRESOS_ADOJO";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                datosVfuenteIngresosJO.add(new String[]{
                    rs.getString("ANIO"), rs.getString("CAUSA_CLAVEJO"), rs.getString("INGRESO"),
                    rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"),
                    rs.getString("VICTIMA_CLAVE")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return datosVfuenteIngresosJO;
    
    }
    public ArrayList findVictimasJO(){
        try{
            conn.Conectar();
            datosVictimasJO = new ArrayList();
            String sql = "SELECT * FROM DATOS_VICTIMAS_ADOJO";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                datosVictimasJO.add(new String[]{
                    rs.getString("ANIO"), rs.getString("ASESOR"), rs.getString("CAUSA_CLAVEJC"),
                    rs.getString("CAUSA_CLAVEJO"), rs.getString("COMENTARIOS"), rs.getString("CONDICION_ALFABETISMO"),
                    rs.getString("CONTO_ASESOR"), rs.getString("EDAD"), rs.getString("ESTADO_CIVIL"),
                    rs.getString("FECHA_NACIMIENTO"), rs.getString("GRADO_ESTUDIOS"), rs.getString("HABLA_ESPANOL"),
                    rs.getString("HABLA_INDIGENA"), rs.getString("INGRESOS"), rs.getString("INTERPRETE"),
                    rs.getString("JUSTIFICA_DELITOS"), rs.getString("JUZGADO_ENTIDAD_ID"), rs.getString("JUZGADO_MUNICIPIO_ID"),
                    rs.getString("JUZGADO_NUMERO_ID"), rs.getString("LENGUA_EXTRANJERA"), rs.getString("LENGUA_INDIGENA"),
                    rs.getString("NACIMIENTO_ENTIDAD"), rs.getString("NACIMIENTO_MUNICIPIO"), rs.getString("NACIMIENTO_PAIS"),
                    rs.getString("NACIONALIDAD"), rs.getString("OCUPACION"), rs.getString("RANGO_INGRESOS"),
                    rs.getString("RESIDENCIA_ENTIDAD"), rs.getString("RESIDENCIA_MUNICIPIO"), rs.getString("RESIDENCIA_PAIS"),
                    rs.getString("SEXO"), rs.getString("TIPO_VICTIMA"), rs.getString("TIPO_VICTIMA_MORAL"),
                    rs.getString("VICTIMA_CLAVEJC"), rs.getString("VICTIMA_CLAVEJO"), rs.getString("VULNERABILIDAD")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return datosVictimasJO;
    
    }
    public ArrayList findVmedidasJC(){
        try{
            conn.Conectar();
            datosVmedidasJC = new ArrayList();
            String sql = "SELECT * FROM DATOS_VMEDIDAS_ADOJC";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                datosVmedidasJC.add(new String[]{
                    rs.getString("ANIO"), rs.getString("CAUSA_CLAVE"), rs.getString("JUZGADO_ENTIDAD_ID"),
                    rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"), rs.getString("TIPO_MEDIDA_PROT"),
                    rs.getString("VICTIMA_CLAVE")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return datosVmedidasJC;
    
    }
    public ArrayList findVmedidasDmujeresJC(){
        try{
            conn.Conectar();
            datosVmedidasDmujJC = new ArrayList();
            String sql = "SELECT * FROM DATOS_VMEDIDAS_DMUJ_ADOJC";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                datosVmedidasDmujJC.add(new String[]{
                    rs.getString("ANIO"), rs.getString("CAUSA_CLAVE"), rs.getString("JUZGADO_ENTIDAD_ID"),
                    rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"), rs.getString("TIPO_MEDIDA_MUJER"),
                    rs.getString("VICTIMA_CLAVE")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return datosVmedidasDmujJC;
    
    }
    public ArrayList findVprocesadosJC(){
        try{
            conn.Conectar();
            datosVprocesadosJC = new ArrayList();
            String sql = "SELECT * FROM DATOS_VPROCESADOS_ADOJC";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                datosVprocesadosJC.add(new String[]{
                    rs.getString("ANIO"), rs.getString("CAUSA_CLAVE"), rs.getString("JUZGADO_ENTIDAD_ID"),
                    rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"), rs.getString("PROCESADO_CLAVE"),
                    rs.getString("RELACION"), rs.getString("VICTIMA_CLAVE")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return datosVprocesadosJC;
    
    }
    public ArrayList findVprocesadosJO(){
        try{
            conn.Conectar();
            datosVprocesadosJO = new ArrayList();
            String sql = "SELECT * FROM DATOS_VPROCESADOS_ADOJO";
            ResultSet rs = conn.consultar(sql);
            while (rs.next()) {
                datosVprocesadosJO.add(new String[]{
                    rs.getString("ANIO"), rs.getString("CAUSA_CLAVEJO"), rs.getString("JUZGADO_ENTIDAD_ID"),
                    rs.getString("JUZGADO_MUNICIPIO_ID"), rs.getString("JUZGADO_NUMERO_ID"), rs.getString("PROCESADO_CLAVE"),
                    rs.getString("RELACION"), rs.getString("VICTIMA_CLAVE")
                });
            }
            conn.close();
             } catch (SQLException ex) {
            Logger.getLogger(showDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
            return datosVprocesadosJO;
    
    }
}
