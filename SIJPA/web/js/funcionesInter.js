/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    /*---------------------------- FUNCIONES INTERMEDIA JC----------------------------*/
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#fechaEscrito').val() === '1899-09-09'){
        $('#fechaEscrito').prop("readonly", true);
        $('#chkEscrito').prop("checked", true);
    }
    
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#contestaEscrito').val() === '1899-09-09'){
        $('#contestaEscrito').prop("readonly", true);
        $('#chkcontestaEscrito').prop("checked", true);
    }
    
    //Se usa para la recuperacion de BD
    if($('#audiInterme').val() === '1'){
        $('#divfechaAudiinter').show();
        $('#dseparaAcusa').show();
        $('#fmediosPrueba').show();
        $('#dacuerdosProba').show();
        $('#daperturaJO').show();
    }
    
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#fechaAudiinter').val() === '1899-09-09'){
        $('#fechaAudiinter').prop("readonly", true);
        $('#chkAudiinter').prop("checked", true);
    }
    
    //Se usa para la recuperacion de BD
    if($('#mediosPrueba').val() === '1'){
        $('#dpruebaMP').show();
        $('#dpruebaAJ').show();
        $('#dpruebaDF').show();
    }
    
    //Se usa para la recuperacion de BD
    if($('#pruebaMP').val() === '1'){
        $('#tblpruebaMP').show();
        $('input[name="chkpruebaMP"]').each(function(){
            var indi = $(this).val();
            if($(this).is(':checked')){
                $('#tipoPruebaMP' + indi).prop({'disabled': false, 'required' : true});
            }
        });
    }
    
    //Se usa para la recuperacion de BD
    if($('#pruebaAJ').val() === '1'){
        $('#tblpruebaAJ').show();
        $('input[name="chkpruebaAJ"]').each(function(){
            var indi = $(this).val();
            if($(this).is(':checked')){
                $('#tipoPruebaAJ' + indi).prop({'disabled': false, 'required' : true});
            }
        });
    }
    
    //Se usa para la recuperacion de BD
    if($('#pruebaDF').val() === '1'){
        $('#tblpruebaDF').show();
        $('input[name="chkpruebaDF"]').each(function(){
            var indi = $(this).val();
            if($(this).is(':checked')){
                $('#tipoPruebaDF' + indi).prop({'disabled': false, 'required' : true});
            }
        });
    }
    
    $("#aperturaJO > option[value=9]").hide();
    
    $('#audiInterme').change(function () {
        if ($(this).val() === '1') {
            $('#divfechaAudiinter,#dseparaAcusa,#fmediosPrueba, #dmediosPrueba,#dacuerdosProba,#daperturaJO').fadeIn('slow');
            $('#chkAudiinter').prop("checked", false);
            $('#fechaAudiinter').val("").prop("disabled", false).prop("required", true);
            $('#separaAcusa,#mediosPrueba,#pruebaMP,#pruebaAJ,#pruebaDF,#acuerdosProba,#aperturaJO').val('').prop("required", true);
            $('#dpruebaMP, #dpruebaAJ, #dpruebaDF,#tblpruebaMP,#tblpruebaAJ,#tblpruebaDF').fadeOut('slow');
            $('#pruebaMP, #pruebaAJ, #pruebaDF').val('-2').prop('required', false);
            $('input[name="chkpruebaMP"],input[name="chkpruebaAJ"],input[name="chkpruebaDF"]').prop("checked", false).prop("disabled", false);

        } else {
            $('#divfechaAudiinter,#dseparaAcusa,#fmediosPrueba, #dmediosPrueba,#dacuerdosProba,#daperturaJO').fadeOut('slow');
            $('#chkAudiinter').prop("checked", false);
            $('#fechaAudiinter').val("1899-09-09").prop("disabled", false).prop("required", false);
            $('#separaAcusa,#mediosPrueba,#pruebaMP,#pruebaAJ,#pruebaDF,#acuerdosProba,#aperturaJO').val('-2').prop("required", true);
            $('input[name="chkpruebaMP"],input[name="chkpruebaAJ"],input[name="chkpruebaDF"]').prop("checked", false).prop("disabled", false);
        }
    });

    $('#mediosPrueba').change(function () {
        if ($(this).val() === '1') {
            $('#dpruebaMP, #dpruebaAJ, #dpruebaDF').fadeIn('slow');
            $('#pruebaMP, #pruebaAJ, #pruebaDF').val('').prop('required', true);
        } else {
            $('#dpruebaMP, #dpruebaAJ, #dpruebaDF,#tblpruebaMP, #tblpruebaAJ, #tblpruebaDF').fadeOut('slow');
            $('#pruebaMP, #pruebaAJ, #pruebaDF').val('-2').prop('required', false);
        }
    });

    $('#pruebaMP').change(function () {
        if ($(this).val() === '1') {
            $('#tblpruebaMP').fadeIn('slow');
            $('input[name="chkpruebaMP"]').prop("checked", false);
        } else {
            $('#tblpruebaMP').fadeOut('slow');
            $('input[name="chkpruebaMP"]').prop("checked", false);
        }
    });
    
    $('input[name="chkpruebaMP"]').change(function(){
        var indi = $(this).val();
        if($(this).is(':checked')){
            $('#tipoPruebaMP' + indi).prop({'disabled': false, 'required': true});
        }else{
            $('#tipoPruebaMP' + indi).val('');
            $('#tipoPruebaMP' + indi).prop({'disabled': true, 'required': false});
        }
    });

    $('#pruebaAJ').change(function () {
        if ($(this).val() === '1') {
            $('#tblpruebaAJ').fadeIn('slow');
            $('input[name="chkpruebaAJ"]').prop("checked", false);
        } else {
            $('#tblpruebaAJ').fadeOut('slow');
            $('input[name="chkpruebaAJ"]').prop("checked", false);
            ;
        }
    });
    
    $('input[name="chkpruebaAJ"]').change(function(){
        var indi = $(this).val();
        if($(this).is(':checked')){
            $('#tipoPruebaAJ' + indi).prop({'disabled': false, 'required': true});
        }else{
            $('#tipoPruebaAJ' + indi).val('');
            $('#tipoPruebaAJ' + indi).prop({'disabled': true, 'required': false});
        }
    });

    $('#pruebaDF').change(function () {
        if ($(this).val() === '1') {
            $('#tblpruebaDF').fadeIn('slow');
            $('input[name="chkpruebaDF"]').prop("checked", false);
        } else {
            $('#tblpruebaDF').fadeOut('slow');
            $('input[name="chkpruebaDF"]').prop("checked", false);
            ;
        }
    });
    
    $('input[name="chkpruebaDF"]').change(function(){
        var indi = $(this).val();
        if($(this).is(':checked')){
            $('#tipoPruebaDF' + indi).prop({'disabled': false, 'required': true});
        }else{
            $('#tipoPruebaDF' + indi).val('');
            $('#tipoPruebaDF' + indi).prop({'disabled': true, 'required': false});
        }
    });

//    $('#chkpruebaAJ9').change(function () {
//        if ($(this).is(":checked")) {
//            for (var i = 1; i < 6; i++) {
//                $('#chkpruebaAJ' + i).prop("checked", false).prop("disabled", true);
//            }
//        } else {
//            for (var i = 1; i < 6; i++) {
//                $('#chkpruebaAJ' + i).prop("checked", false).prop("disabled", false);
//            }
//        }
//    });
//    $('#chkpruebaMP9').change(function () {
//        if ($(this).is(":checked")) {
//            for (var i = 1; i < 6; i++) {
//                $('#chkpruebaMP' + i).prop("checked", false).prop("disabled", true);
//            }
//        } else {
//            for (var i = 1; i < 6; i++) {
//                $('#chkpruebaMP' + i).prop("checked", false).prop("disabled", false);
//            }
//        }
//    });
//    $('#chkpruebaDF9').change(function () {
//        if ($(this).is(":checked")) {
//            for (var i = 1; i < 6; i++) {
//                $('#chkpruebaDF' + i).prop("checked", false).prop("disabled", true);
//            }
//        } else {
//            for (var i = 1; i < 6; i++) {
//                $('#chkpruebaDF' + i).prop("checked", false).prop("disabled", false);
//            }
//        }
//    });

    $('#aperturaJO').change(function () {
        if ($(this).val() === '1') {
            alert("Causa Penal Concluida. Registre la informaci\u00F3n complementaria en el apartado de resoluciones");
        }else{
            alert("Esta Causa Penal debe ser registrada en Resoluciones o Tramite segun corresponda");
        }
    });
    
    //Guarda Intermedia
    $('#formuMedia').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        if ($('#pruebaMP').val() === '1') {
            if ($('input[name="chkpruebaMP"]:checked').length === 0) {
                alert('Selecciona al menos una opcion de prueba presentadas por el ministerio público');
                $('#pruebaMP').focus();
                return false;
            }
        }
        if ($('#pruebaAJ').val() === '1') {
            if ($('input[name="chkpruebaAJ"]:checked').length === 0) {
                alert('Selecciona al menos una opcion de prueba presentadas por el asesor jur\u00EDdico');
                $('#pruebaAJ').focus();
                return false;
            }
        }
        if ($('#pruebaDF').val() === '1') {
            if ($('input[name="chkpruebaDF"]:checked').length === 0) {
                alert('Selecciona al menos una opcion de prueba presentadas por la defensa');
                $('#pruebaDF').focus();
                return false;
            }
        }

        if($('#mediosPrueba').val() === '1' && ($('#pruebaMP').val() !== '1' && $('#pruebaAJ').val() !== '1' && $('#pruebaDF').val() !== '1')) {
            alert('Revisar los medios de prueba');
            $('#mediosPrueba').focus();
            return false;
        }
        
        if($('#opera').val() !== ''){
            var actual = confirm("Al actualizar datos en Etapa Intermedia, se perderan los datos que se tengan guardados \n\
                        en posteriores etapas.\n seguro que desea continuar?");    
        }
        if(actual){
            $.ajax({
                type: 'post',
                url: 'insrtIntermedia',
                data: $('#formuMedia').serialize(),
                success: function (response) {
                    console.log("Respuesta del servidor Intermedia: ", response);
                    alert("Guardado correctamente!!!");
                    var numProce = parseInt(parent.$('#tablaIntermedia tbody tr').length);//Tomamos el total de la tabla de Intermedia
                    if (response !== null && $.isArray(response)) {
                        for (var i = 2; i <= 5; i++) {
                            parent.$('#tablaIntermedia tbody').find('tr').eq(response[0]).children('td').eq(i-1).html(response[i]);
                        }
                        //editamos enlance para que pueda ser actualizado ya estando lleno
                        var enlace = parent.$('#tablaIntermedia tbody tr').eq(response[0]).find('a').attr('href') + '&edita=Si';
                        parent.$('#tablaIntermedia tbody tr').eq(response[0]).find('a').attr('href',enlace);
                        //Control de banderas para saber a que etapa se manda el procesado
                        //Funcion para determinar si esta en otra tabla
                        buscaYremplaza(response[1], response[6]);//mandamos el nombre de procesado y la bandera nueva
                        if(response[6] === 6){//Condicion para mandar al procesado a su etapa correspondiente
                            parent.$('#tablaConclu tbody').append('<tr><td>' + response[1] + '</td><td>' + response[2] + '</td><td></td><td></td>\n\
                            <td><a class="pop" href="conclusiones.jsp?proceClave=' + response[1] + '&posicion=' + parent.$('#tablaConclu tbody tr').length + '">\n\
                            <img src="img/editar.png" title="Modificar"/></a></td></tr>');
                            parent.$('#btn7').addClass(' activar');
                        }else if(response[6] === 7){
                            parent.$('#tablaTramite tbody').append('<tr><td>' + response[1] + '</td><td>' + response[2] + '</td><td></td><td></td>\n\
                            <td><a class="pop" href="tramite.jsp?proceClave=' + response[1] + '&posicion=' + parent.$('#tablaTramite tbody tr').length + '">\n\
                            <img src="img/editar.png" title="Modificar"/></a></td></tr>');
                            parent.$('#btn8').addClass(' activar');
                        }else if(response[6] === 8){//Condicion para mandar al procesado a etapa volando
                            parent.$('#tablaVolando tbody').append('<tr><td>' + response[1] + '</td><td>' + response[2] + '</td>\n\
                            <td><a class="pop" href=""><img src="img/editar.png" title="Modificar"/></a></td></tr>');
                            //Solo agregaremos en el texto los procesados que se necesitan capturar
                            parent.$('.indicador2').css('color', '#D60320');//Cambiamos el color a rojo para que se note
                            parent.$('.agregar').show();//Mosramos el boton de agregar
                            var totProceVola = parseInt(parent.$('#indicaVolando').text()) + 1;//Obtenemos el valor de procesados volando
                            parent.$('.indicador2 span').text(totProceVola);//Lo mostramos con la cantidad actualizada
                            //alert('procesado volando con: ' + totProceVola);
                            parent.$('#btn7').addClass(' activar');
                            parent.$('#btn8').addClass(' activar');
                        }
                        if (response[7] === numProce) {
                            for(var x = 7; x <= 8; x++){
                                //Validamos que pestañas activamos
                                if(parent.$('#btn' + x).hasClass('activar')){
                                    parent.openPestana('btn' + x, 'p' + x);
                                    parent.$('#btn' + x).removeClass('activar');
                                }
                            }
                        } else {
                            alert('Falta por capturar ' + (numProce - response[7]) + ' procesados');
                        }
                    }
                    parent.$.fancybox.close();
                },
                error: function (response) {
                    console.log("Respuesta del servidor Intermedia: ", response);
                    alert('Error al guardar, cunsulte al administrador!');
                }
            });
        }
    });
    /*---------------------------- FIN FUNCIONES INTERMEDIA JC----------------------------*/
});
