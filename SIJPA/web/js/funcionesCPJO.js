/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    
    if($('#expClaveJO').val() !== ''){
        $('#formCausaPenalJO').find('input, textarea, button, select').attr('disabled', true);
        $("#guardarExpJO").prop("hidden", true);
    }
    
    //Se usa para la recuperacion de datos de DB
    if($('#fIngresoJO').val() === '1899-09-09'){
        $('#fIngresoJO').prop('readonly', true);
        $('#chkFechaIngreJO').prop('checked', true);
    }
    
    //Se usa para la recuperacion de BD
    if($('#difeOrgano').val() === '1'){
        $('#divOrgDif').show();
        $('#cantJuez,#juezJO1,#juezJO2,#juezJO3').val('-2').prop('required', false);
    }else if($('#difeOrgano').val() === '2'){
            $('#regCantJuez').show();
        //Si dice que NO en otro organo entonces le mostramos la cantidad de jueces y jueces
        if($('#cantJuezHi').val() !== ''){
            var cantiJuez = $('#cantJuezHi').val();
            if(cantiJuez === '1'){
                $('#divJuezJO1').show();
            }else if(cantiJuez === '2'){
                $('#divJuezJO1,#divJuezJO2').show();
            }else{
                $('#divJuezJO1,#divJuezJO2,#divJuezJO3').show();
            }
            $("#cantJuez option[value='" + cantiJuez + "']").prop('selected', true);
        }
    }
    
    $('#difeOrgano').change(function(){
        if($(this).val() === '2'){
            $('#regCantJuez').fadeIn();
            $('#cantJuez').val('').prop('required', true);
            
            $('#divOrgDif').fadeOut();
            $('#orgDif').val('-2').prop('required', false);
        }else{
            $('#divOrgDif').fadeIn();
            $('#orgDif').val('').prop('required', true);
            
            $('#regCantJuez').fadeOut();
            $('#divJuezJO1,#divJuezJO2,#divJuezJO3').fadeOut();
            $('#cantJuez,#juezJO1,#juezJO2,#juezJO3').val('-2').prop('required', false);
        }
    });
    
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
    
    $('#orgDif').change(function(){
        if($(this).val() === '100'){
            alert('Favor de capturar el Juez y regresar a capturar el expediente');
            window.location.href = 'capturaJuzgado.jsp';
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
                    alert("Guardado con exito!!!");
                    $('#formCausaPenalJO').find('input, textarea, button, select').attr('disabled', true);
                    $("#guardarExpJO").prop("hidden", true);
                    var ccJO = $('#expClaveJO').val();
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
    // \w Coincide con cualquier car�cter alfanum�rico, incluyendo el gui�n bajo. Equivalente a [A-Za-z0-9_]. No permite caracteres raros
    // \/ La diagonal invertida escapa a la diagonal simple indicando que debe de llevar /
    // [0-9] Solo debe haber numeros enteros. {4} De esos numeros deben de haber exclusivamente 4 
    var CarpInvestiga = $(InputCarpInves).val();
    if (CarpInvestiga !== '') {
        var mascara= /^\w{1,10}\/[0-9]{4}$/;
        console.log(mascara.test(CarpInvestiga));
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