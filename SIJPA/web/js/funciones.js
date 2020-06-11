/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {

    /*----------------Index------------------------*/
    //Temporizador para que aparesca el logo en primera instancia
    setTimeout(function () {
        $('#splash').slideDown('slow');
    }, 500);

    //Temporizador para que desaparesca logo y aparesca login
    setTimeout(function () {
        $('#splash').animate({
            left: "100%",
            //width: "toggle",
            opacity: "toggle"
        }, {
            duration: 2000, // duration
            queue: false
        });

        $('#login').animate({
            left: "40%",
            //width: "toggle",
            opacity: "toggle"
        }, {
            duration: 2000,
            queue: false
        });
    }, 3000);

    //Acceso al sistema mediante ajax
    $('#formLogin').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        $.ajax({
            type: 'post',
            url: 'accesoSistema',
            data: $('#formLogin').serialize(),
            success: function (response) {
                console.log("Respuesta del servidor", response);
                if (response === 1) {
                    window.location.href = "bienvenida.jsp";
                } else {
                    alertify.alert('Mensaje Importante', 'Usuario no Encontrado\n Intente de nuevo', function(){
                        alertify.error('Verifique las credenciales de acceso'); 
                    });
                    //alert('Usuario no encontrado, favor de revisar usuario o contraseÃƒÂ±a');
                    $('#nomUsu').val('');
                    $('#passUsu').val('');
                }
            },
            error: function (response) {
                console.log("Respuesta del servidor", response);
                alert('Usuario no encontrado, verificar datos');
            }
        });
    });
    /*----------------Fin Index------------------------*/

    /*----------------Sistemas Captura------------------------*/
    $('#btnJc').click(function () {
        window.location.href = "causasPenales.jsp";
    });
    $('#btnJo').click(function(){
        window.location.href = "causasPenalesJO.jsp";
    });
    $('#btnAudi').click(function(){
        window.location.href = "audiencias.jsp";
    });
    $('#btnJuzga').click(function(){
        window.location.href = "juzgados.jsp";
    });
    $('#btnJuez').click(function(){
        window.location.href = "jueces.jsp";
    });
    /*----------------Fin Sistemas Captura------------------------*/

    /*----------------Registro Usuarios------------------------*/
    $('#buttonAdmin').click(function () {
        $('#mensajeAdmin').animate({
            top: "-600"
        },
        1500);
    });

    $('#pass').focusout(function () {
        if ($('#pass').val() === "") {
            $('#confPass').val('');
        }
    });

    $('#correo').focusout(function () {
        var usuario = $('#correo').val();
        $.ajax({
            url: 'obtenUsuario',
            type: 'post',
            data: {usuario: usuario},
            succes: function (data) {
                console.log('Usuario ' + data);
            }
        }).done(function (d) {
            console.log(d);
            if (d === 1) {
                alert('Usuario ya registrado, verificar');
                $('#correo').val('');
            }
        });
    });

    $('#confPass').keyup(function () {
        if ($('#confPass').val() !== '') {
            if ($('#confPass').val() === $('#pass').val()) {
                $('#mesajePass').text('Las contraseñas son correctas');
                $('#mesajePass').css({'color': '#66cc00'});
                $('#guardar').fadeIn('slow');
            } else {
                $('#mesajePass').text('Las contraseñas no coinciden');
                $('#mesajePass').css({'color': '#ff0000'});
                $('#guardar').fadeOut('slow');
            }
        }
    });
    /*----------------Fin Registro Usuarios------------------------*/

    /*----------------Cabecera------------------------*/
    $('#usu img').click(function () {
        $('#usu #enlace').animate({
            right: "0",
            width: "toggle",
            opacity: "toggle"
        }, 800);
    });
    /*----------------Fin de Cabecera------------------------*/

    $('select > option[value=-2]').hide();
    $('#estudiosPro > option[value=7],#estudiosPro > option[value=8]').hide();//oculta el grado de estudios maestria y doctorado en procesados
    $(".load").fadeOut("slow");//proceso de carga para causas penales
    //oculta los divs con clase oculto
    $('.oculto').hide();

    //despliega ventana modal
    $('#tablaDeli, #tablaProcesa, #tablaVictimas, #tablaInicial, #tablaIntermedia, #tablaConclu, #tablaTramite, .agregar,\n\
        #tablaDeliJO, #tablaProcesaJO, #tablaVictimasJO, #tablaJuicioJO, #tablaConcluJO, #tablaTramiteJO').on('focusin', function () {
        $('a.pop').fancybox({
            'type': 'iframe',
            'overlayShow': true,
            'toolbar': false,
            'smallBtn': true,
            'iframe': {
                'css': {
                    'width': '100%',
                    'height': '100%'
                }
            }
        });
    });

    /***************************** FUNCIONES JUZGADOS *******************************/
    //para recuperacion de bd
    if($('#numOrgano').val() !== ''){
        $('#numOrgano, #entidadJ, #municipioJ').prop('disabled', true);
    }
    
    //para recuperacion de bd
    if($('#fDivision').val() !== '1'){
        $('#dRegJudicial').show();
    }else if($('#fDivision').val() !== '2'){
        $('#dDistJudicial').show();
    }else if($('#fDivision').val() !== '3'){
        $('#dPartJudicial').show();
    }
    
    //permite solo numeros en los inputs
    /***
     * 
     * @param {type} ex
     * @returns {undefined}
     */
    $('.soloNum').keypress(function (ex) {
        if (ex.charCode < 48 || ex.charCode > 57)
            return false;
    });

    $('#municipioJ').change(function () {
        var entidad = $('#entidadJ').val();
        var muni = $('#municipioJ').val();
        var num = $('#numOrgano').val();
        var juzgado = entidad + '-' + muni + '-' + num;
        $.ajax({
            url: 'obtenJuzgado',
            type: 'post',
            data: {juzgado: juzgado},
            succes: function (data) {
                console.log('Juzgado ' + data);
            }
        }).done(function (d) {
            console.log('Juzgado Resul ' + d);
            if (d === 1) {
                alert('Juzgado ya registrado, verificar');
                $('#numOrgano').val('');
                $('#entidadJ, #municipioJ').val('');
                openPestana('btn1', 'p1');
            }
        });
    });

    $("#fDivision").change(function () {
        switch ($("#fDivision").val()) {
            case '1':
                $("#dRegJudicial").fadeIn("slow");
                $("#regJudicial").val("").prop("required", true);
                $("#dDistJudicial,#dPartJudicial").hide();
                $("#distJudicial,#partJudicial").val("-2").prop("required", false);
                break;
            case '2':
                $("#dDistJudicial").fadeIn("slow");
                $("#distJudicial").val("").prop("required", true);
                $("#dRegJudicial,#dPartJudicial").hide();
                $("#regJudicial,#partJudicial").val("-2").prop("required", false);
                break;
            case '3':
                $("#dPartJudicial").fadeIn("slow");
                $("#partJudicial").val("").prop("required", true);
                $("#dRegJudicial,#dDistJudicial").hide();
                $("#regJudicial,#distJudicial").val("-2").prop("required", false);
                break;
            default:
                $("#dRegJudicial,#dDistJudicial,#dPartJudicial").fadeOut("slow");
                $("#regJudicial,#distJudicial,#partJudicial").val("-2").prop("required", false);
                break;
        }
    });
    /*---------------------------- FIN FUNCIONES JUZGADOS ----------------------------*/
    
    /***************************** FUNCIONES JUEZ *******************************/
    //Se usa para la recuperacion de datos de DB
    if($('#fGestion').val() === '1899-09-09'){
        $('#fGestion').prop('readonly', true);
        $('#chkFechaInicioG').prop('checked', true);
    }
    /***************************** FIN FUNCIONES JUEZ *******************************/
    
    /************************* Funcion de borrado general *****************************/
    /***
    * @param {type} e
    * @returns {undefined}
    */
    $('.borrar').click(function(e){
        e.preventDefault();
        e.stopImmediatePropagation();
        var pos = $(this).closest('tr').index();//Obtenemos el indice(posicion) del registro a borrar
        var tabla = $(this).parents('table').attr('id');//Obtenemos el nombre de la tabla
        var clave = $(this).parents('table tbody').find('tr').eq(pos).children('td:eq(0)').html();//Obtenemos la clave del registro
        var numReg = $('#' + tabla + ' tbody tr').length - 1;//Obtenemos el numero de registro despues de borrar el registro
        if(tabla !== 'causas'){
            if(numReg === 0){
                var nomTabla = $(this).parents('table').attr('data-nomTabla');
                alert('La tabla "' + nomTabla + '" no se puede quedar con 0 registros\n' +
                    'Se necesita al menos 1 registro para que las Causas Penales funcionen');
                return false;
            }
        }
        var resp = confirm("Realmente deseas eliminar este registro con clave: " + clave + "?");
        if(resp){
            $(this).closest('tr').remove();//Removemos el registro de su tabla
            //alert(pos + ', ' + tabla + ', ' + clave + ', ' + numReg);
            var datoLLeno = $(this).parents('table tbody').find('tr').eq(pos).children('td:eq(2)').html();
            console.log("Se remuve: ", clave, ' de la tabla: ', tabla);
            if(datoLLeno !== ''){//Si la columna 3 de la fial seleccionada esta vacio quiere decir que no existe en BD
                $.ajax({
                    type: 'post',
                    url: 'deleteDatos',
                    data: {
                        clave: clave,
                        tabla: tabla,
                        num: numReg
                    },
                    success: function (response) {
                        console.log("Respuesta del servidor al borrar de BD: ", response);
                        if (response === 'tablaJuzgados') {
                            alert('El Juzgado ' + clave + ' se borro con exito');
                        }else if(response === 'tablaJuez'){
                            alert('El Juez ' + clave + ' se borro con exito');
                        }else if (response === 'causas') {
                            alert('La causa penal ' + clave + ' se borro con exito');
                        } else if (response === 'tablaDeli') {
                            $('#Tdelitos').val(numReg);
                            alert('El Delito ' + clave + ' se borro con exito');
                        } else if (response === 'tablaProcesa') {
                            $('#Tadolescentes').val(numReg);
                            //cuando se borre un procesado de su tabla tambien lo eliminamos de inicial
                            $('#tablaInicial tbody tr').eq(pos).remove();
                            alert('El Procesado ' + clave + ' se borro con exito');
                            buscaYremplaza(clave, 0);
                        } else if (response === 'tablaVictimas') {
                            $('#Tvictimas').val(numReg);
                            alert('La Victima ' + clave + ' se borro con exito');
                        }
                    },
                    error: function (response) {
                        console.log("Respuesta del servidor al borrar: ", response);
                        alert('Error al eliminar, vuelva a intentarlo o cunsulte al administrador');
                    }
                });
            }
        }
    });
    /************************* Fin Funcion de borrado general *****************************/
    
    /************************* Funcion de Actualizado *****************************/
    
    $('.estatus').click(function(){
        var pos = $(this).closest('tr').index();//Obtenemos el indice(posicion) del registro a borrar
        var tabla = $(this).parents('table').attr('id');//Obtenemos el nombre de la tabla
        var clave = $(this).parents('table tbody').find('tr').eq(pos).children('td:eq(0)').html();//Obtenemos la clave del registro
        var valorEs = $(this).parents('table tbody').find('tr').eq(pos).children('td:eq(6)').html();//Obtenemos el estatus
        var resp = confirm('Desea cambiar el estatus del Juzgado: ' + clave + '?');
        if(resp){
            console.log('Cambiamos el estatus al contrario de: ', valorEs);
            if(valorEs === 'Inactivo'){
                $(this).parents('table tbody').find('tr').eq(pos).children('td:eq(6)').html('Activo');//Cambiamos el estatus a 1
                //alert('Estatus a: 1');
            }else{
                $(this).parents('table tbody').find('tr').eq(pos).children('td:eq(6)').html('Inactivo');//Cambiamos el estatus a 0
                //alert('Estatus a: 0');
            }
            $.ajax({
                type: 'post',
                url: 'estatusDatos',
                data: {
                    clave: clave,
                    tabla: tabla,
                    valorEs: valorEs
                },
                success: function (response) {
                    if (response === 'tablaJuzgados') {
                        //alert('El jUZGADO ' + clave + ' se cambio su estatus con exito');
                    }else if(response === 'tablaJuez'){
                        //alert('El Juez ' + clave + ' se cambio su estatus con exito');
                    }
                },
                error: function (response) {
                    console.log("Respuesta del servidor al borrar: ", response);
                    alert('Error al eliminar, vuelva a intentarlo o cunsulte al administrador');
                }
            });
        }
    });
    /************************* Fin Funcion de Actualizado *****************************/
});

/******************************FUNCIONES ETAPA INTERMEDIA***************************/
//Respuestas simples y fechas con NI
/***
 * @param {type} idSelect
 * @param {type} idLbl
 * @param {type} idDate
 * @param {type} idNI
 * @param {type} idchk
 * @returns {undefined}
 */
function respuestaSimple(idSelect, idLbl, idDate, idNI, idchk) {
    if ($(idSelect).val() !== '1') {
        $(idLbl).fadeOut("slow");
        $(idDate).val("1899-09-09").fadeOut("slow");
        $(idNI).fadeOut("slow");
    }
}

//Respuestas simples a esconder otra variable
function respuestaSelect(idSelect, idDiv, idResp) {
    if ($(idSelect).val() === '1') {
        $(idDiv).fadeIn("slow");
        $(idResp).val('').prop("required", true);
    } else {
        $(idDiv).fadeOut("slow");
        $(idResp).val('-2').prop("required", false);
    }
}

// Fechas No identificadas
function fechaNoIdent(idChk, idTxtDate) {
    if ($(idChk).is(":checked")) {
        $(idTxtDate).val("1899-09-09");
        $(idTxtDate).prop("readonly", true);
    } else {
        $(idTxtDate).val("");
        $(idTxtDate).prop("readonly", false);
    }
}

// Duracion No identificada
function DuraNoIdent(idChk, idTxtDura) {
    if ($(idChk).is(":checked")) {
        $(idTxtDura).val("00:00");
        $(idTxtDura).prop("readonly", true);
    } else {
        $(idTxtDura).val("");
        $(idTxtDura).prop("readonly", false);
    }
}
/*****************************FIN DE FUNCIONES ETAPA INTERMEDIA*****************/

/**************************FUNCION ETAPA INICIAL *******************************/
/**
 * 
 * @param {type} idChkNi
 * @param {type} idChkEP
 * @param {type} idTxtDate
 * @returns {undefined}
 */
function fechaEnProceso(idChkNi, idChkEP, idTxtDate) {
    if ($(idChkNi).is(":checked")) {
        $(idTxtDate).val("1899-09-09");
        $(idTxtDate).prop("readonly", true);
        $(idChkEP).prop("disabled", true);
    } else {
        $(idTxtDate).val("");
        $(idTxtDate).prop("readonly", false);
        $(idChkEP).prop("disabled", false);
    }

    if ($(idChkEP).is(":checked")) {
        $(idTxtDate).val("1699-09-09");
        $(idTxtDate).prop("readonly", true);
        $(idChkNi).prop("disabled", true);

        alert("Fin. Esta Causa Penal pasa a Tramite");
        $('#consePlazo').fadeOut('slow');
        $('#consePlazo select').val('-2').prop('required', false);
        $('#fechaReapertura').val('1799-09-09').prop('required', false);
        $('#chkFechaReapertura').prop("checked", false);
    } else {
        $('#consePlazo').fadeIn('slow');
        $('#fSuspencion,#dReapertura,#dAcusacion').hide();
        $('#consePlazo select,#fechaReapertura').val('').prop('required', true);
        $('#chkFechaReapertura').prop("checked", false);
        $(idChkNi).prop("disabled", false);
    }
}
;
/*****************************FIN DE FUNCIONES ETAPA INICIAL***************************/

/*****************************FUNCIONES LLENAR MUNICIPIOS***************************/
/***
 * @param {type} idEnt
 * @param {type} idMun
 * @returns {undefined}
 */
function llenaMun(idEnt, idMun) {
    var enti = $(idEnt).val();
    if (enti !== '') {
        $.ajax({
            url: "obtenMunicipios",
            dataType: 'html',
            type: "post",
            data: {
                enti: enti
            },
            success: function (response) {
                console.log("Respuesta del servidor: ", response);
            }
        }).done(function (data) {
            $(idMun).html(data);
        });
    } else {
        $(idMun).empty().append("<option value='0'>--Seleccione--</option>");
    }
}
/***************************** FIN DE FUNCIONES LLENAR MUNICIPIOS***************/

/****************************** FUNCIONES PROCESADOS ******************************/
//para respuesta simple, oculta el select contenido en un div
/***
 * 
 * @param {type} idSelSimple
 * @param {type} idDiv
 * @param {type} idSelOculta
 * @returns {undefined}
 */
function respuestaSimpleSelect(idSelSimple, idDiv, idSelOculta) {
    if ($(idSelSimple).val() === '1') {
        $(idDiv).fadeIn("slow");
        $(idSelOculta).prop("required", true);
        $(idSelOculta).val("");
    } else {
        $(idDiv).fadeOut("slow");
        $(idSelOculta).val("-2");
        $(idSelOculta).prop("required", false);
    }
}

function lugarNacimiento(idSelect, idDivE, idDivM, idSelEnti, idSelMuni) {
    if ($(idSelect).val() === '1') {
        $(idDivE).fadeIn("slow");
        $(idDivM).fadeIn("slow");
        $(idSelEnti).prop("required", true);
        $(idSelMuni).prop("required", true);
        $(idSelEnti).val("");
        $(idSelMuni).empty().append("<option value='0'>--Seleccione--</option>");
    } else {
        $(idDivE).fadeOut("slow");
        $(idDivM).fadeOut("slow");
        $(idSelEnti).prop("required", false);
        $(idSelMuni).prop("required", false);
        $(idSelEnti).val("-2");
        $(idSelMuni).val("-2");
    }
}

function lugarResidencia(idSelect, idDivE, idDivM, idSelEnti, idSelMuni) {
    if ($(idSelect).val() === '1') {
        $(idDivE).fadeIn("slow");
        $(idDivM).fadeIn("slow");
        $(idSelEnti).prop("required", true);
        $(idSelMuni).prop("required", true);
        $(idSelEnti).val("");
        $(idSelMuni).empty().append("<option value='0'>--Seleccione--</option>");
    } else {
        $(idDivE).fadeOut("slow");
        $(idDivM).fadeOut("slow");
        $(idSelEnti).prop("required", false);
        $(idSelMuni).prop("required", false);
        $(idSelEnti).val("-2");
        $(idSelMuni).val("-2");
    }
}

//numeral 10 indica no ejercia ninguna ocupacion
function ocupacionAdo(idSelect, idDiv, idSelOculta) {
    if ($(idSelect).val() === '10') {
        $(idDiv).fadeIn("slow");
        $(idSelOculta).val("").prop("required", true);
    } else {
        $(idDiv).fadeOut("slow");
        $(idSelOculta).val("-2").prop("required", false);
        ;
    }
}
/*---------------------------- FIN FUNCIONES PROCESADOS --------------------------*/

/***************************** FUNCIONES DELITOS *******************************/
/***
 * 
 * @param {type} idSelSimple
 * @param {type} idDiv
 * @param {type} idDateOculta
 * @param {type} idChk
 * @returns {undefined}
 */
function respuestaSimpleFecha(idSelSimple, idDiv, idDateOculta, idChk) {
    if ($(idSelSimple).val() === '1') {
        $(idDiv).fadeIn("slow");
        $(idChk).prop("checked", false);
        $(idDateOculta).val("").prop({"disabled": false, "required": true, "readonly": false});
    } else {
        $(idDiv).fadeOut("slow");
        $(idDateOculta).prop("required", false);
        $(idDateOculta).val("1899-09-09");
        $(idChk).prop("checked", false);
    }
}


/*---------------------------- FIN FUNCIONES DELITOS --------------------------*/

//Funcion para Causas Penales: comprueba que primero se haya seleccionado un juzgado clave antes de agregar una causa penal
function validaAddCausa() {
    if ($("#juzgado").val() !== "") {
        window.location.href = "elementosPrincipales.jsp";
    } else {
        $(".msjAviso").fadeIn("slow");
    }
}

//Funcion para Jueces: comprueba que primero se haya seleccionado un juzgado clave antes de agregar una un juez
function validaAddJuez() {
    if ($("#juzgado").val() !== "") {
        window.location.href = "capturaJuez.jsp";
    } else {
        $(".msjAviso").fadeIn("slow");
    }
}

/********************* FUNCIONES BUSCA Y REMPLAZA PROCESADOS  *********************/
/**
 * 
 * @param {type} proceClave
 * @param {type} etapaProce
 * @returns {undefined}
 */
function buscaYremplaza(proceClave, etapaProce){
    var encontrado = false;
    var eliminaBD = false;
    var nomTabla = "";
    var dato = "";
    console.log('etapa: ' + etapaProce);
    if(parent.$('#tablaIntermedia tbody tr').length > 0){//Si la tabla tiene mas de 1 registro
        parent.$('#tablaIntermedia tbody tr').find('td:eq(0)').each(function(){//Funcion para buscar el dato  
            dato = $(this).html();
            console.log('dato intermedia: ' + dato + ' proceClave: ' + proceClave);
            if(proceClave === dato){
                if(etapaProce !== 1){//Quiere decir que cambio de etapa en la actualizacion
                    if($(this).parent().find('td:eq(2)').html() !== ''){
                        //Si tiene dato quiere decir que ya esta insertado y lo tendremos que borrar de la BD
                        console.log('Esta insertado en BD');
                        eliminaBD = true;
                        nomTabla = "inter";
                    }
                    encontrado = true;
                    $(this).parent().remove();
                    if(parent.$('#tablaIntermedia tbody tr').length === 0){
                        parent.$('#btn6').prop('disabled', true);
                    }
                }
            }
        });
    }
    if(!encontrado){
        if(parent.$('#tablaConclu tbody tr').length > 0){
            parent.$('#tablaConclu tbody tr').find('td:eq(0)').each(function(){
                dato = $(this).html();
                console.log('dato conclusion: ' + dato + ' proceClave: ' + proceClave);
                if(proceClave === dato){
                    if(etapaProce !== 2 || etapaProce !== 6){//Quiere decir que cambio de etapa en la actualizacion
                        if($(this).parent().find('td:eq(2)').html() !== ''){
                            //Si tiene dato quiere decir que ya esta insertado y lo tendremos que borrar de la BD
                            console.log('Esta insertado en BD');
                            eliminaBD = true;
                            nomTabla = "conclu";
                        }
                        encontrado = true;
                        $(this).parent().remove();
                        if(parent.$('#tablaConclu tbody tr').length === 0){
                            if(parent.$('#tablaVolando tbody tr').length === 0){
                                parent.$('#btn7').prop('disabled', true);
                            }
                        }
                    }
                }
            });
        }
    }
    if(!encontrado){
        if(parent.$('#tablaTramite tbody tr').length > 0){
            parent.$('#tablaTramite tbody tr').find('td:eq(0)').each(function(){
                dato = $(this).html();
                console.log('dato tramite: ' + dato + ' proceClave: ' + proceClave);
                if(proceClave === dato){
                    if(etapaProce !== 3 || etapaProce !== 7){//Quiere decir que cambio de etapa en la actualizacion
                        if($(this).parent().find('td:eq(2)').html() !== ''){
                            //Si tiene dato quiere decir que ya esta insertado y lo tendremos que borrar de la BD
                            console.log('Esta insertado en BD');
                            eliminaBD = true;
                            nomTabla = "tramite";
                        }
                        encontrado = true;
                        $(this).parent().remove();
                        if(parent.$('#tablaTramite tbody tr').length === 0){
                            if(parent.$('#tablaVolando tbody tr').length === 0){
                                parent.$('#btn8').prop('disabled', true);
                            }
                        }
                    }
                }
            });
        }
    }
    if(!encontrado){
        if(parent.$('#tablaVolando tbody tr').length > 0){
            parent.$('#tablaVolando tbody tr').find('td:eq(0)').each(function(){
                dato = $(this).html();
                console.log('dato volando: ' + dato + ' proceClave: ' + proceClave);
                if(proceClave === dato){
                    if(etapaProce !== 5){//Quiere decir que cambio de etapa en la actualizacion
                        $(this).parent().remove();
                        var numReg = parent.$('#tablaVolando tbody tr').length;
                        if (numReg === 0) {
                            parent.$('.indicador2').css('color', '#00BD25');//Cambiamos el color a verde
                            parent.$('.agregar').hide();//Escondemos el boton de agregar
                            parent.$('.indicador2 span').text(numReg);//Lo mostramos con la cantidad actualizada
                        } else {
                            parent.$('.indicador2 span').text(numReg);//Lo mostramos con la cantidad actualizada
                        }
                    }
                }
            });
        }
    }
    
    if(eliminaBD){//Si encuentra algun caso donde se tenga qu eliminar de la BD entonces lo hacemos
        $.ajax({
            url: 'borraProce',
            type: 'post',
            data: {
                proceClave: proceClave,
                nomTabla: nomTabla
            },
            succes: function (data) {
                console.log('Usuario ' + data);
            }
        }).done(function (d) {
            console.log('Con exito: ' + d);
            alert(d);
        });
    }
}
/*************************** JO **************************/
/**
 * 
 * @param {type} proceClaveJO
 * @param {type} etapaProce
 * @returns {undefined}
 */
function buscaYremplazaJO(proceClaveJO, etapaProce){
    var encontrado = false;
    var eliminaBD = false;
    var nomTabla = "";
    var dato = "";
    console.log('etapa: ' + etapaProce);
    if(parent.$('#tablaConcluJO tbody tr').length > 0){//Si la tabla tiene mas de 1 registro
        parent.$('#tablaConcluJO tbody tr').find('td:eq(0)').each(function(){//Funcion para buscar el dato  
            dato = $(this).html();
            console.log('dato conclusion JO: ' + dato + ' proceClave: ' + proceClaveJO);
            if(proceClaveJO === dato){
                if(etapaProce !== 2){//Quiere decir que cambio de etapa en la actualizacion
                    if($(this).parent().find('td:eq(2)').html() !== ''){
                        //Si tiene dato quiere decir que ya esta insertado y lo tendremos que borrar de la BD
                        console.log('Esta insertado en BD');
                        eliminaBD = true;
                        nomTabla = "concluJO";
                    }
                    encontrado = true;
                    $(this).parent().remove();
                    if(parent.$('#tablaConcluJO tbody tr').length === 0){
                        parent.$('#btn6').prop('disabled', true);
                    }
                }
            }
        });
    }
    if(!encontrado){
        if(parent.$('#tablaTramiteJO tbody tr').length > 0){
            parent.$('#tablaTramiteJO tbody tr').find('td:eq(0)').each(function(){
                dato = $(this).html();
                console.log('dato tramite JO: ' + dato + ' proceClave: ' + proceClaveJO);
                if(proceClaveJO === dato){
                    if(etapaProce !== 3 || etapaProce !== 7){//Quiere decir que cambio de etapa en la actualizacion
                        if($(this).parent().find('td:eq(2)').html() !== ''){
                            //Si tiene dato quiere decir que ya esta insertado y lo tendremos que borrar de la BD
                            console.log('Esta insertado en BD');
                            eliminaBD = true;
                            nomTabla = "tramiteJO";
                        }
                        encontrado = true;
                        $(this).parent().remove();
                        if(parent.$('#tablaTramiteJO tbody tr').length === 0){
                            parent.$('#btn7').prop('disabled', true);
                        }
                    }
                }
            });
        }
    }
    
    if(eliminaBD){//Si encuentra algun caso donde se tenga qu eliminar de la BD entonces lo hacemos
        $.ajax({
            url: 'borraProce',
            type: 'post',
            data: {
                proceClave: proceClaveJO,
                nomTabla: nomTabla
            },
            succes: function (data) {
                console.log('Usuario ' + data);
            }
        }).done(function (d) {
            console.log(d);
            alert(d);
        });
    }
}
/********************* FIN BUSCA Y REMPLAZA PROCESADOS ****************************/

/***
 * 
 * @param {type} Ocurr
 * @returns {undefined}
 */
function VFechaOcurrencia(Ocurr) {
    var fechaOcurren = $(Ocurr).val();
    if (fechaOcurren !== '') {
        $.ajax({
            type: 'post',
            url: 'obtenFechaOcurr',
            data: {
                fechaOcurren: fechaOcurren
            },
            success: function (response) {
                console.log("Respuesta del servidor", response);
                if (response === '1') {
                    alert('La Fecha De Ocurrencia No Debe Ser mayor A La Fecha de Ingreso');
                    $(Ocurr).val("");
                    $(Ocurr).focus();
                }
            },
            error: function (response) {
                console.log("Respuesta del servidor", response);
            }
        });
    }
}

function ValFechaNacPRO(FechaNac, Edad) {
    var Fnac = $(FechaNac).val();
    if (Fnac !== '') {
        $.ajax({
            type: 'post',
            url: 'obtenFechaNacPro',
            data: {
                Fnac: Fnac
            },
            success: function (response) {
                var edadc = parseInt(response);
                // console.log("Respuesta del servidor", response);
                if (response !== '0') {
                    if ((edadc > 11) && (edadc < 18)) {
                        var resp = confirm("Desea agregar la edad. Edad=" + response);
                        if (resp) {
                            $(Edad).val(edadc);
                        }
                    } else {
                        if (edadc>0){
                         alert('Favor de Verificar la fecha de nacimiento. Edad=' + edadc);
                        $(FechaNac).val("");
                        $(Edad).val("");   
                        }else{
                         alert('LA FECHA DE NACIMIENTO NO DEBE SER MAYOR A LA FECHA DE INGRESO');
                        $(FechaNac).val("");
                        $(Edad).val("");  
                        }
                        
                    }
                }
            },
            error: function (response) {
                console.log("Respuesta del servidor", response);
            }
        });
    }
}

  function ValFechaNacVic(dFechaNac,SEdad){
    var FechaNac = $(dFechaNac).val();
    if (FechaNac !== '') {
        $.ajax({
            type: 'post',
            url: 'obtenFechaNacVic',
            data: {
                FechaNac: FechaNac
            },
            success: function (response) {
                var edadVic = parseInt(response);
               alert('Respuesta servidores'+response);
                if (response !== '0'){
                if (edadVic >= 0){  
                    var resp = confirm("Desea agregar la edad. Edad=" + response);
                    if (resp) {
                        $(SEdad).val(edadVic);
                    }
            }
        }
                if (edadVic < 0)
                {
                    alert('LA FECHA DE NACIMIENTO NO DEBE SER MAYOR A LA FECHA DE INGRESO');
                    $(SEdad).val("");
                    $(dFechaNac).val("");
                }

            },
            error: function (response) {
                console.log("Respuesta del servidor", response);
            }
        });
    }
}

function validaMascara(e) {
    var key = e.keyCode || e.which,
    tecla = String.fromCharCode(key).toLowerCase(),
    letras = "abcdefghijklmnopqrstuvwxyz1234567890",
    especiales = [47,95], //   47= / 95= _
    tecla_especial = false;

    for (var i in especiales) {
        if (key === especiales[i]) {
            tecla_especial = true;
        break;
        }
    }

    if (letras.indexOf(tecla) === -1 && !tecla_especial) {
        return false;
    }
}

function ValidaCarpeInvest(InputCarpInves) {
    // ^ No debe de haber nada antes
    // \w Coincide con cualquier carácter alfanumérico, incluyendo el guión bajo. Equivalente a [A-Za-z0-9_]. No permite caracteres raros
    // \/ La diagonal invertida escapa a la diagonal simple indicando que debe de llevar /
    // [0-9] Solo debe haber numeros enteros. {4} De esos numeros deben de haber exclusivamente 4 
    var CarpInvestiga = $(InputCarpInves).val();
    if (CarpInvestiga !== '') {
        var mascara= /^\w{1,10}\/[0-9]{4}$/;
        if(mascara.test(CarpInvestiga)){
            $.ajax({
                type: 'post',
                url: 'obtenCarpeInves',
                data: {
                    CarpInvestiga: CarpInvestiga
                },
                success: function (response) {
                    console.log("Respuesta del servidor", response);
                    // alert("respuesta del servidor= "+response);
                    if (response === '1') {
                        alert('La Causa Penal Ya Existe');
                        $(InputCarpInves).val("");
                        $(InputCarpInves).focus();
                    }
                },
                error: function (response) {
                    console.log("Respuesta del servidor", response);
                }
            });
        }else {
            alert("El numero de asunto debe contener de 1 a 10 caracteres seguido de una diagonal ( / ) y del a\361o de ingreso \n\nEjemplo:  00001/2020,     REF_001/2020");
            $(InputCarpInves).val('').focus();
        } 
    }
}