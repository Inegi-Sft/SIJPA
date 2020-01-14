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
 * @author LUISA.CASTILLO
 */
public class catalogos {

    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> lista;
    String sql;
    ResultSet resul;

    /**
     *
     * @return
     */
    public ArrayList findAcuerdoRepara() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_acuerdo_reparatorio ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findAlfabetismo() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_alfabetismo ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findAsentamientoHumano() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_asentamiento_humano ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findAutoVinculacion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_auto_vinculacion ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findCalificacionDelito() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_calificacion_delito ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findCausaSuspencion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_causa_suspencion ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findClasificacion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_clasificacion ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findCodigoNorma() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_codigo_norma where id_codigo <>-2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2), resul.getString(3)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findConcurso() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_concurso ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findCondicionActividad() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_condicion_actividad ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findCondicionEstudiante() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_condicion_estudiante ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findConsumacion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_consumacion ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findContextoSituacional() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_contexto_situacional where CONTEXTO_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findCosaRobada() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_cosa_robada WHERE COSA_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findDelitosNorma(int norma) {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_delitos_norma where id_delito=" + norma + " ORDER BY 1";
        System.out.println(sql);
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(3)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findDominioEspanol() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_dominio_espanol ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findEntidades() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_entidades ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findEstadoCivil() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_estado_civil ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findEstadoPsicofisico() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_estado_psicofisico ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findEstudioProfesional() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_estudio_profesional ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findEtapaInicial() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_etapa_inicial ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findEtapaIntermedia() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_etapa_intermedia ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findEtapaProcesal() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_etapa_procesal ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findExclusionAccionp() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_exclusion_accionp ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findFiguraMprueba() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_figura_mprueba ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findFiguraProceso() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_figura_proceso ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findFormaAccion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_forma_accion ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findFormaComision() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_forma_comision ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findFormaConduccion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_forma_conduccion ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findFormaDivision() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_forma_division ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findFuenteIngresos() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_fuente_ingresos ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findFuero() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_fuero ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findFuncionJuzgado() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_funcion_juzgado ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findGradoEstudios() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_grado_estudios ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findGradoParticipacion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_grado_participacion ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findIncompetencia() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_incompetencia ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findInstrumentoComision() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_instrumento_comision ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findJurisdiccion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_jurisdiccion ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findLinguisticas() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_linguisticas ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findMedidasCautelares() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_medidas_cautelares ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findMedidasMujer() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_medidas_mujer WHERE MUJER_ID <>-2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findMedidasProteccion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_medidas_proteccion WHERE PROTECCION_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findMediosPrueba() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_medios_prueba WHERE PRUEBA_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findModalidad() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_modalidad ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findMulta() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_multa ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findMunicipios(int enti) {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_municipios WHERE ENTIDAD_ID = " + enti + " AND MUNICIPIO_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(2), resul.getString(3)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findNacionalidad() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_nacionalidad ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findNoprivativas() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_noprivativas ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findNumero() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_numero ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findOcupacion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_ocupacion ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findPais() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_pais ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findlazoCierre() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_plazo_cierre ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findPlazoConstitucional() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_plazo_constitucional ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findPrivativas() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_privativas ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findProcAbreviado() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_proc_abreviado ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findPuebloIndigena() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_pueblo_indigena ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findRangoIngresos() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_rango_ingresos ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findReincidencia() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_reincidencia ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findRelacionImputado() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_relacion_imputado WHERE RELACION_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findReparacionDano() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_reparacion_dano ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findRepresentanteLegal() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_representante_legal ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findResolucionMprueba() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_resolucion_mprueba ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findRespuestaSimple() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_respuesta_simple ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findSexo() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_sexo ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findSitioOcurrencia() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_sitio_ocurrencia ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findSobreseimiento() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_sobreseimiento ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findSuspensionCondicional() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_suspension_condicional ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findTiempoInternamiento() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_tiempo_internamiento ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findTipoAudiencias() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_tipo_audiencias ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findTipoConsignacion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_tipo_consignacion ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findTipoDefensor() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_tipo_defensor ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findTipoDetencion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_tipo_detencion ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findTipoImpugnacion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_tipo_impugnacion ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findTipoResolucion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_tipo_resolucion ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findTipoSobreseimiento() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_tipo_sobreseimiento ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findTipoVictima() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_tipo_victima ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findVialidad() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_vialidad ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findVictimaMoral() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_victima_moral ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findVulnerabilidad() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_vulnerabilidad ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

}
