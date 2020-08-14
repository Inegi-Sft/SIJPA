/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    
    //Se usa para la recuperacion de datos de DB
    if($('#expClaveJC').val() === ''){
        $('#TdelitosJO').prop('disabled', true);
        $('#TadolescentesJO').prop('disabled', true);
        $('#TvictimasJO').prop('disabled', true);
    }
    
    //Se usa para la recuperacion de datos de DB
    if($('#expClaveJO').val() !== ''){
        $('#formCausaPenalJO').find('input, textarea, button, select').attr('disabled', true);
        $("#guardarExpJO").prop("hidden", true);
    }
    
    //Se usa para la recuperacion de datos de DB
    if($('#fIngresoJC').val() === '1899-09-09'){
        $('#fIngresoJC').prop('readonly', true);
        $('#chkFechaIngreJC').prop('checked', true);
    }
    
    //Se usa para la recuperacion de datos de DB
    if($('#fIngresoJO').val() === '1899-09-09'){
        $('#fIngresoJO').prop('readonly', true);
        $('#chkFechaIngreJO').prop('checked', true);
    }
    
    //Se usa para la recuperacion de BD
//    if($('#difeOrgano').val() === '1'){
//        $('#divOrgDif').show();
//        $('#cantJuez,#juezJO1,#juezJO2,#juezJO3').val('-2').prop('required', false);
//    }else if($('#difeOrgano').val() === '2'){
//            $('#regCantJuez').show();
//        //Si dice que NO en otro organo entonces le mostramos la cantidad de jueces y jueces
//        if($('#cantJuezHi').val() !== ''){
//            var cantiJuez = $('#cantJuezHi').val();
//            if(cantiJuez === '1'){
//                $('#divJuezJO1').show();
//            }else if(cantiJuez === '2'){
//                $('#divJuezJO1,#divJuezJO2').show();
//            }else{
//                $('#divJuezJO1,#divJuezJO2,#divJuezJO3').show();
//            }
//            $("#cantJuez option[value='" + cantiJuez + "']").prop('selected', true);
//        }
//    }
    
    //Solo entra si la causa penal JC se atendio en otro organo para llenar las causas
    $('#jClaveJC').change(function(){
        //Vaciamos las variables para que no exista confucion
        $('#fIngresoJC').val('');
        $('#chkFechaIngreJC').prop('checked', false);
        $('#TdelitosJO').val('');
        $('#TadolescentesJO').val('');
        $('#TvictimasJO').val('');
        var jClaveJC = $(this).val();//Recuperamos el valor de juzgado clave
        $.ajax({
            type: 'post',
            url: 'obtenCausasJC',
            data:{jClaveJC: jClaveJC},
            success: function (response) {
                console.log("Respuesta del obten Causas JC", response);
                $('#expClaveJC').html(response);
                $('#expClaveJC').prop('disabled', false);
            },
            error: function (response) {
                console.log("Respuesta del obten Causas JC", response);
            }
        });
    });
    
    //Solo entra si la causa penal JC se atendio en otro organo para llenar la fecha y totales ingreso de jc
    $('#expClaveJC').change(function(){
        var expClaveJC = $(this).val();
        var jClaveJC = $('#jClaveJC').val();
        $.ajax({
            type: 'post',
            url: 'obtenCausasJC',
            data:{
                expClaveJC: expClaveJC,
                jClaveJC: jClaveJC
            },
            success: function (response) {
                console.log("Respuesta del obten datos Causas JC", response[0]);
                if(response[0] === '1899-09-09'){
                    $('#chkFechaIngreJC').prop('checked', true);
                }else{
                    $('#chkFechaIngreJC').prop('checked', false);
                }
                $('#fIngresoJC').val(response[0]);
                $('#TdelitosJO').val(response[1]);
                $('#TdelitosJO').attr({'disabled': false, 'min': response[1]});
                $('#TadolescentesJO').val(response[2]);
                $('#TadolescentesJO').attr({'disabled': false, 'min': response[2]});
                $('#TvictimasJO').val(response[3]);
                $('#TvictimasJO').attr({'disabled': false, 'min': response[3]});
            },
            error: function (response) {
                console.log("Respuesta del obten Causas JC", response);
            }
        });
    });
    
//    $('#difeOrgano').change(function(){
//        if($(this).val() === '2'){
//            $('#regCantJuez').fadeIn();
//            $('#cantJuez').val('').prop('required', true);
//            
//            $('#divOrgDif').fadeOut();
//            $('#orgDif').val('-2').prop('required', false);
//        }else{
//            $('#divOrgDif').fadeIn();
//            $('#orgDif').val('').prop('required', true);
//            
//            $('#regCantJuez').fadeOut();
//            $('#divJuezJO1,#divJuezJO2,#divJuezJO3').fadeOut();
//            $('#cantJuez,#juezJO1,#juezJO2,#juezJO3').val('-2').prop('required', false);
//        }
//    });
    
    $('#cantJuez').change(function(){
        switch ($('#cantJuez').val()){
            case '1':
                $('#divJuezJO1').fadeIn();
                $('#juezJO1').val('').prop('required', true);
                
                $('#divJuezJO2,#divJuezJO3').fadeOut();
                $('#juezJO2,#juezJO3').val('-2').prop('required', false);
                break;
            case '2':
                $('#divJuezJO1,#divJuezJO2').fadeIn();
                $('#juezJO1,#juezJO2').val('').prop('required', true);
                
                $('#divJuezJO3').fadeOut();
                $('#juezJO3').val('-2').prop('required', false);
                break;
            case '3':
                $('#divJuezJO1, #divJuezJO2, #divJuezJO3').fadeIn();
                $('#juezJO1,#juezJO2,#juezJO3').val('').prop('required', true);
                break;
            default:
                $('#divJuezJO1,#divJuezJO2,#divJuezJO3').fadeOut();
                $('#juezJO1,#juezJO2,#juezJO3').val('-2').prop('required', false);
                break;
        }
    });
    
    $('#juezJO1, #juezJO2, #juezJO3').change(function(){
        if($(this).val() === '100'){
            alert('Favor de capturar el Juez y regresar a capturar el expediente');
            window.location.href = 'capturaJuez.jsp';
            //hacer la funcion en un futuro para capturar desde fancybox
//            $.fancybox.open({
//                src  : 'capturaJuzgado.jsp',
//                type : 'iframe',
//                opts : {
//                    afterShow : function( instance, current ) {
//                            console.info( 'done!' );
//                    }
//                }
//            });
        }
    });
    
    //Guarda Causa Penal
    $('#formCausaPenalJO').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var resp = confirm("Una vez guardada la Causa Penal no podre hacer niingun cambio,\n"
                    + "Esta seguro que los datos son los correctos?");
        if(resp){
            $.ajax({
                type: 'post',
                url: 'insrtCausaPenalJO',
                data: $('#formCausaPenalJO').serialize(),
                success: function (response) {
                    console.log("Respuesta del servidor Causa Penal JO: ", response);
                    alert("Guardado correctamente!!!");
                    $('#formCausaPenalJO').find('input, textarea, button, select').attr('disabled', true);
                    $("#guardarExpJO").prop("hidden", true);
                    var ccJO = $('#expClaveJO').val().toUpperCase();
                    var x = 0;
                    var text = '';
                    if(response[0] === '1'){
                        //Recorremos la tabla de delitos JO
                        for(x = 0; x < $('#tablaDeliJO tbody tr').length; x++){
                            //Obtenemos las claves de las tablas columna 0
                            text = $('#tablaDeliJO tbody tr').eq(x).find('td:eq(0)').html();
                            //le ponemos el nuevo texto con la nueva causaClave JO
                            $('#tablaDeliJO tbody tr').eq(x).find('td:eq(0)').html(ccJO + text.substring(text.indexOf('-')));
                        }
                        //Recorremos la tabla de procesados
                        for(x = 0; x < $('#tablaProcesaJO tbody tr').length; x++){
                            //Obtenemos las claves de las tablas columna 0
                            text = $('#tablaProcesaJO tbody tr').eq(x).find('td:eq(0)').html();
                            //le ponemos el nuevo texto con la nueva causaClave JO
                            $('#tablaProcesaJO tbody tr').eq(x).find('td:eq(0)').html(ccJO + text.substring(text.indexOf('-')));
                        }
                        //Recorremos la tabla de victimas
                        for(x = 0; x < $('#tablaVictimasJO tbody tr').length; x++){
                            //Obtenemos las claves de las tablas columna 0
                            text = $('#tablaVictimasJO tbody tr').eq(x).find('td:eq(0)').html();
                            //le ponemos el nuevo texto con la nueva causaClave JO
                            $('#tablaVictimasJO tbody tr').eq(x).find('td:eq(0)').html(ccJO + text.substring(text.indexOf('-')));
                        }
                        //Recorremos la tabla de etapa oral
                        for(x = 0; x < $('#tablaJuicioJO tbody tr').length; x++){
                            //Obtenemos las claves de las tablas columna 0
                            text = $('#tablaJuicioJO tbody tr').eq(x).find('td:eq(0)').html();
                            //le ponemos el nuevo texto con la nueva causaClave JO
                            $('#tablaJuicioJO tbody tr').eq(x).find('td:eq(0)').html(ccJO + text.substring(text.indexOf('-')));
                        }
                        openPestana('btn2', 'p2');
                    }
                },
                error: function (response) {
                    console.log("Respuesta del servidor Causa Penal: ", response);
                    alert('Error al guardar, vuelva a intentarlo o cunsulte al administrador');
                }
            });
        }
    });
});
