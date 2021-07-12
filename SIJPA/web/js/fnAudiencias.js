$(document).ready(function () {
    
    //abre la pestaña 2 cuando se inserta de intermedia
    if($("#banderaInter").val()==='inter'){
        openPestana('btn2', 'p2');
    }
    
    //deshabilita jueces si no se selecciona el juzgado
    if($('#juzgado').val()===''){
        $('#juez').prop("disabled", true);
    }else{
        $('#juez').prop("disabled", false);
    }
    
    //auto acompletado para las causas penales
    var auto=$(".autoComp").selectize({
        onBlur: function () {
            options: [{value: 1, text: 'ferchito'}],
            this.clearCache();
        }
    });
    
    //Guarda Audiencias Investigacion
    $('#formAudienciasInves').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        
        if($('#tblActosPro input[name="actosP"]:checked').length === 0 && $('#audiInves').val() === '11'){
            alertify.alert('Actos Procesales sin seleccionar',
            'Favor de seleccionar por lo menos un Acto Procesal o bien selecciona otro Tipo de Audiencia de Investigacion',
            function(){
                openModalIniciales();
            });
            return false;
        }
        
        if($('#causa').val() === '' && $('#audiInves').val() === '11'){
            alertify.alert('La audiencias Iniciales deben de relacionarse con una Causa Penal,\n\
                            Favor de seleccionar una');
            return false;
        }

        $.ajax({
            type: 'post',
            url: 'insrtAudiencias',
            data: $('#formAudienciasInves').serialize(),
            success: function (response) {
                console.log("Respuesta del servidor Audiencias guardar: ", response);
                alert("Guardado correctamente!!!");
                window.location='audiencias.jsp';
            },
            error: function (response) {
                console.log("Respuesta del servidor Audiencias error: ", response);
                alert('Error al guardar, posible audiencia duplicada');
            }
        });
    });
    
    //Guarda Audiencias Intermedia
    $('#formAudienciasInter').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();

        $.ajax({
            type: 'post',
            url: 'insrtAudiencias',
            data: $('#formAudienciasInter').serialize(),
            success: function (response) {
                console.log("Respuesta del servidor Audiencias guardar: ", response);
                alert("Guardado correctamente!!!");
                window.location='audiencias.jsp?banderaInter=inter';
            },
            error: function (response) {
                console.log("Respuesta del servidor Audiencias error: ", response);
                alert('Error al guardar, posible audiencia duplicada');
            }
        });
    });
    
    //manda a capturar un nuevo juez
    $('.captuJuez').change(function(){
        if($(this).val() === '100'){
            alert('Favor de capturar el Juez y regresar a capturar la audiencia');
            window.location.href = 'capturaJuez.jsp';
        }
    });
    
    //validacion para desplegar fancy de actos procesales
    $('#audiInves').change(function(){
        $('#juez, #hrs, #min, #tblActosPro select').val('');
        $('#tblActosPro select').prop('required', false).addClass('inactivo');
        $('#fCelebracion').val('').prop('readonly',false);
        $('#hrs, #min').removeClass('inactivo');
        $('input[name="chkDNIAP"]').prop("disabled",true);
        $('#tblAudiInves input[type=checkbox]').prop("checked",false);
        $('#causa')[0].selectize.clear();
        
        if($(this).val() === '11'){
                // add first option to selectize input and select it
//                $('#causa')[0].selectize.addOption({value:"-2",text:'fer'});
//                $('#causa')[0].selectize.addItem("-2");

            $('#causa')[0].selectize.destroy(); 
            $('#causa [value="-2"]').prop('disabled',true);
            $('#causa').selectize();
            $('#causa')[0].selectize.clear();
            
            openModalIniciales();
            $('#ver').show();
            $('#hrs, #min').addClass("inactivo").val('');
            $('#chkDNI').prop({'disabled':true,'checked':false});
        }else{
            $('#causa')[0].selectize.destroy(); 
            $('#causa [value="-2"]').prop('disabled',false);
            $('#causa').selectize();
            $('#causa')[0].selectize.clear();
            
            $('#ver').fadeOut('slow');
            $('#hrs, #min').removeClass("inactivo");
            $('#chkDNI').prop("disabled", false);
        }
    });
    
    //bloque para data tables
    $('#tblAudiInves, #tblAudiInter').DataTable({
        "lengthMenu": [[20, 50, 100, -1], [20, 50, 100, "Todo"]],
        "language": {
            "decimal": "",
            "emptyTable": "No hay registros",
            "info": "Mostrando _START_ a _END_ de _TOTAL_ registros",
            "infoEmpty": "Mostrando 0 to 0 of 0 registros",
            "infoFiltered": "(Filtrado de _MAX_ total entradas)",
            "infoPostFix": "",
            "thousands": ",",
            "lengthMenu": "Mostrar _MENU_ registros",
            "loadingRecords": "Cargando...",
            "processing": "Procesando...",
            "search": "Buscar:",
            "zeroRecords": "Sin resultados encontrados",
            "paginate": {
                "first": "Primero",
                "last": "Ultimo",
                "next": "Siguiente",
                "previous": "Anterior"
            }
        }
    });
});

//Elimina Audiencias
function deleteAudiencias(causa, anio, idAudi, bandera) {
    var resp = confirm("Realmente deseas eliminar este registro?");
    if (resp) {
        $.ajax({
            type: 'post',
            url: 'insrtAudiencias',
            data: {
                anio: anio, 
                idAudiencia: idAudi, 
                operacion: 'eliminar'
            },
            success: function (response) {
                console.log("Respuesta del servidor al borrar: ", response);
                if (response === "AudienciasDeleted") {
                    alert("Audiencia Id: "+idAudi+" de la Causa Penal: " + causa + " Eliminada!!!");
                    if(bandera==='inter')
                        window.location='audiencias.jsp?banderaInter=inter';
                    else
                        window.location='audiencias.jsp';
                }
            },
            error: function (response) {
                console.log("Respuesta del servidor error al borrar: ", response);
                alert('Error al eliminar, vuelva a intentarlo o cunsulte al administrador');
            }
        });
    }   
}

// Fechas No identificadas
function fechaNIJC(obj, idTxtDate) {
    if (obj.checked) {
        $(idTxtDate).prop("readonly", true).val("1899-09-09");
    } else {
        $(idTxtDate).prop("readonly", false).val("");
    }
}

// Duracion No identificada
function duracionNI(obj, hrs, min) {
    if (obj.checked) {
        $(hrs).addClass("inactivo").val("99");
        $(min).addClass("inactivo").val("99");
        $(hrs +' [value="99"]').prop("hidden",false);
        $(min +' [value="99"]').prop("hidden",false);
    } else {
        $(hrs).removeClass("inactivo").val("");
        $(min).removeClass("inactivo").val("");
        $(hrs +' [value="99"]').prop("hidden",true);
        $(min +' [value="99"]').prop("hidden",true);
    }
}

// Validad que las hrs y min de la duracion no sean ceros
function duracionCero(hrs, min){
     
    if($(hrs).val()==="0" && $(min).val()==="00"){
        alert("La duracion (horas y minutos) de la audiencia no pueden ser cero");
        $(hrs).val('');
        $(min).val('');
    }
}

// Suma los valores a la duracion para mostrarlos en la columna principal
function sumaDuracion(){
    
    var sumHrs = parseInt(0), sumMin = parseInt(0);
    var auxHrs = parseInt(0), auxMin = parseInt(0);
    var totalHrs = parseInt(0), totalMin, i=1, ni=0;
    
    $('[name="minAP"]').each(function(){
        
        var m = $(this).val();
        if (m !== "" && m!=="99"){        
            sumMin += parseInt(m);
            auxMin = sumMin % 60;
            auxHrs = Math.trunc(sumMin/60);
            
            var h = $('#hrsAP'+i).val();
            sumHrs += parseInt(h);
        }else if(m === "99"){
            ni++;
        }
        totalHrs = sumHrs + auxHrs;
        i++;
    });
    
    if(auxMin<10){//si es menor que 10 le concatena un cero para que se muestre en el select
        totalMin = '0' + auxMin;
    }else{
        totalMin = auxMin;
    }
    
    if(ni !== 5){//muestra el valor total de las horas y minutos
        $('#hrs').val(totalHrs);
        $('#min').val(totalMin);
        $('#chkDNI').prop('checked',false);
    }else{//si todos los campos son NI pone el valor NI
        $('#hrs').val("99");
        $('#min').val("99");
        $('#chkDNI').prop('checked',true);
    }
}

function validaJuzAdd() {
    if ($("#juzgado").val() === "") {
        alertify.alert('Juzgado Clave sin seleccionar','Favor de seleccionar un Juzgado Clave para poder continuar con la captura');
        return false;
    }else{
        return true;
    }
}
function validallenadoAP(){
    var llenos = true;
    $('#tblActosPro select[required]').each(function(){
        if ($(this).val()===""){        
            alert("Antes de cerrar: llena el campo requerido o deselecciona el acto procesal");
            $(this).focus();
            llenos=false;
            return false;
        }
    });
    
    if(llenos){
        $.fancybox.close();
    }
}

function openModalIniciales() {
    $.fancybox.open({
        'src'  : "#data",
        'modal': true,
        beforeClose: function () {
            sumaDuracion();
        }
    });
}

function openRecuperaActosP(anio, idAudi) {
    //llenamos la tabla con los atos procesales
    $.ajax({
        url: "obtenActosProcesales",
        dataType: 'html',
        type: "post",
        data: {
            anio: anio, idAudi:idAudi
        },
        success: function (response) {
            console.log("Respuesta del servidor Actos Procesales: ", response);
        }
    }).done(function (data) { 
        $('#tblRecuperaActosPro tbody').html(data);
    });
    
    //abre la ventana modal
    $.fancybox.open({
        'src'  : "#recuperaAP",
        'modal': true,
        afterShow : function() {
            $('.fancybox-content').append('<button data-fancybox-close class="fancybox-button fancybox-close-small" title="Cerrar">\n\
            <svg version="1" viewBox="0 0 24 24"><path d="M13 12l5-5-1-1-5 5-5-5-1 1 5 5-5 5 1 1 5-5 5 5 1-1z"></path></svg></button>');
        }
    });
}

function habilita(obj, hrs, min, chk) {
    if (obj.checked) {
        $(hrs).prop("required", true).removeClass("inactivo");
        $(min).prop("required", true).removeClass("inactivo");
        $(chk).prop("disabled", false);
    } else {
        $(hrs).prop("required", false).addClass("inactivo").val("");
        $(min).prop("required", false).addClass("inactivo").val("");
        $(chk).prop({"disabled": true, "checked": false});
    }
}