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
 * @author CARLOS.SANCHEZG
 */
public class showDelitosJO {
    
    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> deli;
    ArrayList<String> deliAdi;
    String sql;
    ResultSet resul;
    int conteoDel;
    
    public ArrayList findDeliCausasJC(String causaClaveJC) {
        conn.Conectar();
        deli = new ArrayList();
        sql = "SELECT DISTINCT DE.DELITO_CLAVE, CCN.CODIGO, DE.DELITO_NORMA_TECNICA, DE.FECHA_OCURRENCIA, DE.GRADO_CONSUMACION, DE.FORMA_COMISION "
                + "FROM DATOS_DELITOS_ADOJC DE, DATOS_PDELITOS_ADOJC PD, DATOS_CONCLUSIONES_ADOJC CO, CATALOGOS_CODIGO_NORMA CCN "
                + "WHERE DE.CAUSA_CLAVE = CO.CAUSA_CLAVE "
                + "AND PD.CAUSA_CLAVE = CO.CAUSA_CLAVE "
                + "AND DE.DELITO_CLAVE = PD.DELITO_CLAVE "
                + "AND PD.PROCESADO_CLAVE = CO.PROCESADO_CLAVE "
                + "AND DE.DELITO_CODIGO_PENAL = CCN.ID_CODIGO "
                + "AND CO.TIPO_RESOLUCION = 5 "
                + "AND DE.CAUSA_CLAVE = '" + causaClaveJC + "' "
                + "ORDER BY 1;";
        System.out.println(sql);
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                deli.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3),
                    resul.getString(4), resul.getString(5), resul.getString(6)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showDelitosJO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return deli;
    }
    
    public ArrayList findDeliCausasJO(String causaClaveJC, String delitoClave) {
        conn.Conectar();
        deli = new ArrayList();
        sql = "SELECT DE.DELITO_CLAVEJO, CCN.CODIGO, CDN.DELITO, DE.FECHA_OCURRENCIA, CC.DESCRIPCION, CFC.DESCRIPCION "
                + "FROM DATOS_DELITOS_ADOJO DE, CATALOGOS_CODIGO_NORMA CCN, CATALOGOS_DELITOS_NORMA CDN, CATALOGOS_CONSUMACION CC, CATALOGOS_FORMA_COMISION CFC "
                + "WHERE DE.DELITO_CODIGO_PENAL = CCN.ID_CODIGO "
                + "AND DE.DELITO_NORMA_TECNICA = CDN.ID_DELITO "
                + "AND DE.GRADO_CONSUMACION = CC.CONSUMACION_ID "
                + "AND DE.FORMA_COMISION = CFC.COMISION_ID "
                + "AND DE.CAUSA_CLAVEJC = '" + causaClaveJC + "' "
                + "AND DE.DELITO_CLAVEJC = '" + delitoClave + "' "
                + "ORDER BY 1;";
        System.out.println(sql);
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                deli.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3),
                    resul.getString(4), resul.getString(5), resul.getString(6)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showDelitosJO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return deli;
    }
    
    public ArrayList findDelitosJC(String causaClaveJC, String delitoClave){
        conn.Conectar();
        deli = new ArrayList();
        sql = "SELECT D.*, CD.DELITO "
                + "FROM DATOS_DELITOS_ADOJC D, CATALOGOS_DELITOS_NORMA CD "
                + "WHERE D.DELITO_NORMA_TECNICA = CD.ID_DELITO "
                + "AND CAUSA_CLAVE = '" + causaClaveJC + "' "
                + "AND DELITO_CLAVE = '" + delitoClave + "' "
                + "ORDER BY 1;";
        System.out.println(sql);
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                deli.add(new String[]{
                    resul.getString("D.DELITO_CODIGO_PENAL"), resul.getString("D.TIPO_FUERO"), resul.getString("D.ART_CODIGO_PENAL"),
                    resul.getString("D.DELITO_RECLASIFICADO"), resul.getString("D.FECHA_RECLASIFICACION"), resul.getString("D.DELITO_NORMA_TECNICA"),
                    resul.getString("CD.DELITO"), resul.getString("D.FECHA_OCURRENCIA"), resul.getString("D.SITIO_OCURRENCIA"),
                    resul.getString("D.GRADO_CONSUMACION"), resul.getString("D.CALIFICACION"), resul.getString("D.CLASIFICACION"),
                    resul.getString("D.CONCURSO"), resul.getString("D.FORMA_COMISION"), resul.getString("D.FORMA_ACCION"), resul.getString("D.MODALIDAD"),
                    resul.getString("D.INSTRUMENTO_COMISION"), resul.getString("D.OCURRIO_ENTIDAD"), resul.getString("D.OCURRIO_MUNICIPIO"),
                    resul.getString("D.COMENTARIOS")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showDelitosJO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return deli;
    }
    
    public ArrayList findDelitosJO(String causaClaveJO, String delitoClave){
        conn.Conectar();
        deli = new ArrayList();
        sql = "SELECT D.*, CD.DELITO "
                + "FROM DATOS_DELITOS_ADOJO D, CATALOGOS_DELITOS_NORMA CD "
                + "WHERE D.DELITO_NORMA_TECNICA = CD.ID_DELITO "
                + "AND D.CAUSA_CLAVEJO = '" + causaClaveJO + "' "
                + "AND D.DELITO_CLAVEJO = '" + delitoClave + "' "
                + "ORDER BY 1;";
        System.out.println("findelitosJO:"+sql);
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                deli.add(new String[]{
                    resul.getString("D.DELITO_CODIGO_PENAL"), resul.getString("D.TIPO_FUERO"), resul.getString("D.ART_CODIGO_PENAL"),
                    resul.getString("D.DELITO_RECLASIFICADO"), resul.getString("D.FECHA_RECLASIFICACION"), resul.getString("D.DELITO_NORMA_TECNICA"),
                    resul.getString("CD.DELITO"), resul.getString("D.FECHA_OCURRENCIA"), resul.getString("D.SITIO_OCURRENCIA"),
                    resul.getString("D.GRADO_CONSUMACION"), resul.getString("D.CALIFICACION"), resul.getString("D.CLASIFICACION"),
                    resul.getString("D.CONCURSO"), resul.getString("D.FORMA_COMISION"), resul.getString("D.FORMA_ACCION"), resul.getString("D.MODALIDAD"),
                    resul.getString("D.INSTRUMENTO_COMISION"), resul.getString("D.OCURRIO_ENTIDAD"), resul.getString("D.OCURRIO_MUNICIPIO"),
                    resul.getString("D.COMENTARIOS")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showDelitosJO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return deli;
    }
    
    public ArrayList findDelitosVictiJC(String causaClaveJC){
        conn.Conectar();
        deli = new ArrayList();
        sql = "SELECT DISTINCT DE.DELITO_CLAVE, CN.CODIGO "
                + "FROM DATOS_DELITOS_ADOJC DE, DATOS_PDELITOS_ADOJC PD, DATOS_CONCLUSIONES_ADOJC CO, CATALOGOS_CODIGO_NORMA CN "
                + "WHERE DE.CAUSA_CLAVE = CO.CAUSA_CLAVE "
                + "AND PD.CAUSA_CLAVE = CO.CAUSA_CLAVE "
                + "AND DE.DELITO_CLAVE = PD.DELITO_CLAVE "
                + "AND PD.PROCESADO_CLAVE = CO.PROCESADO_CLAVE "
                + "AND DE.DELITO_CODIGO_PENAL = CN.ID_CODIGO "
                + "AND CO.TIPO_RESOLUCION = 5 "
                + "AND DE.CAUSA_CLAVE = '" + causaClaveJC + "' "
                + "ORDER BY 1;";
        System.out.println("findelitosJO:"+sql);
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                deli.add(new String[]{
                    resul.getString(1), resul.getString(2)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showDelitosJO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return deli;
    }
    
    public ArrayList findDelitosVictiJO(String causaClaveJO){
        conn.Conectar();
        deli = new ArrayList();
        sql = "SELECT D.DELITO_CLAVEJO, CN.CODIGO "
                + "FROM DATOS_DELITOS_ADOJO D, CATALOGOS_CODIGO_NORMA CN "
                + "WHERE D.DELITO_NORMA_TECNICA = CN.ID_CODIGO "
                + "AND D.CAUSA_CLAVEJO = '" + causaClaveJO + "' "
                + "ORDER BY 1;";
        System.out.println("findelitosJO:"+sql);
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                deli.add(new String[]{
                    resul.getString(1), resul.getString(2)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showDelitosJO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return deli;
    }
    
    public ArrayList findDRoboJC(String causaClaveJC, String delitoCLave, String cosaRoba) {
        try {
            conn.Conectar();
            deliAdi = new ArrayList();
            sql = "SELECT TIPO_COSA_ROBADA FROM DATOS_DROBO_ADOJC "
                    + "WHERE CAUSA_CLAVE = '" + causaClaveJC + "' "
                    + "AND DELITO_CLAVE = '" + delitoCLave + "' "
                    + "AND TIPO_COSA_ROBADA = " + cosaRoba + " "
                    + "ORDER BY 1;";
            resul = conn.consultar(sql);
            while (resul.next()) {
                deliAdi.add(resul.getString("TIPO_COSA_ROBADA"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showDelitos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return deliAdi;
    }
    
    public ArrayList findDRoboJO(String causaClaveJO, String delitoCLave, String cosaRoba) {
        try {
            conn.Conectar();
            deliAdi = new ArrayList();
            sql = "SELECT TIPO_COSA_ROBADA FROM DATOS_DROBO_ADOJO "
                    + "WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "' "
                    + "AND DELITO_CLAVE = '" + delitoCLave + "' "
                    + "AND TIPO_COSA_ROBADA = " + cosaRoba + " "
                    + "ORDER BY 1;";
            System.out.println(sql);
            resul = conn.consultar(sql);
            while (resul.next()) {
                deliAdi.add(resul.getString("TIPO_COSA_ROBADA"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showDelitos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return deliAdi;
    }
    
    public ArrayList findDHomicidiosJC(String causaClaveJC, String delitoCLave, String situacion) {
        try {
            conn.Conectar();
            deliAdi = new ArrayList();
            sql = "SELECT CONTEXTO_SITUACIONAL FROM DATOS_DHOMICIDIO_ADOJC "
                    + "WHERE CAUSA_CLAVE = '" + causaClaveJC + "' "
                    + "AND DELITO_CLAVE = '" + delitoCLave + "' "
                    + "AND CONTEXTO_SITUACIONAL = " + situacion + ";";
            resul = conn.consultar(sql);
            while (resul.next()) {
                deliAdi.add(resul.getString("CONTEXTO_SITUACIONAL"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showDelitos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return deliAdi;
    }
    
    public ArrayList findDHomicidiosJO(String causaClaveJO, String delitoCLave, String situacion) {
        try {
            conn.Conectar();
            deliAdi = new ArrayList();
            sql = "SELECT CONTEXTO_SITUACIONAL FROM DATOS_DHOMICIDIO_ADOJO "
                    + "WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "' "
                    + "AND DELITO_CLAVE = '" + delitoCLave + "' "
                    + " AND CONTEXTO_SITUACIONAL = " + situacion + ";";
            resul = conn.consultar(sql);
            while (resul.next()) {
                deliAdi.add(resul.getString("CONTEXTO_SITUACIONAL"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showDelitos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return deliAdi;
    }
    
    public int countDelitosInsertadosJO(String causaClaveJO) {
        try {
            conn.Conectar();
            conteoDel = 0;
            sql = "SELECT COUNT(*) AS TOTAL FROM DATOS_DELITOS_ADOJO WHERE CAUSA_CLAVEJO = '" + causaClaveJO + "' "
                    + "AND DELITO_CODIGO_PENAL <> -2;";
            resul = conn.consultar(sql);
            while (resul.next()) {
                conteoDel = resul.getInt("TOTAL");
                System.out.println("cpnteo delitosjo: "+conteoDel);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showDelitos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conteoDel;
    }
    
     public ArrayList findDeliTablaJO(String delitoClaveJO) {
        conn.Conectar();
        deli = new ArrayList();
        sql = "SELECT D.DELITO_CLAVEJO, CCN.CODIGO, CDN.DELITO, D.FECHA_OCURRENCIA, CC.DESCRIPCION, CFC.DESCRIPCION "
                + "FROM DATOS_DELITOS_ADOJO D,CATALOGOS_CODIGO_NORMA CCN, CATALOGOS_DELITOS_NORMA CDN, CATALOGOS_CONSUMACION CC, CATALOGOS_FORMA_COMISION CFC "
                + "WHERE D.DELITO_CODIGO_PENAL = CCN.ID_CODIGO "
                + "AND D.DELITO_NORMA_TECNICA = CDN.ID_DELITO "
                + "AND D.GRADO_CONSUMACION = CC.CONSUMACION_ID "
                + "AND D.FORMA_COMISION = CFC.COMISION_ID "
                + "AND D.DELITO_CLAVEJO = '" + delitoClaveJO + "' "
                + "ORDER BY 1;";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                deli.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3),
                    resul.getString(4), resul.getString(5), resul.getString(6)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showDelitos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return deli;
    }
}
