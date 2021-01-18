$(document).ready(function () {
    
    //abre la pestaña 2 cuando se inserta de intermedia
    if($("#banderaInter").val()==='inter'){
        openPestana('btn2', 'p2');
    }
    
    //auto acompletado para las causas penales
    $(".autoComp").selectize({
        onBlur: function () {
            this.clearCache();
        }
    });
    
    //Guarda Audiencias Investigacion
    $('#formAudienciasInves').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();

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

// Fechas No identificadas
function fechaNIJC(obj, idTxtDate) {
    if (obj.checked) {
        $(idTxtDate).prop("readonly", true).val("1899-09-09");
    } else {
        $(idTxtDate).prop("readonly", false).val("");
    }
}

//Elimina Audiencias
function deleteAudiencias(causa, idAudi, bandera) {
    var resp = confirm("Realmente deseas eliminar este resgistro?");
    if (resp) {
        $.ajax({
            type: 'post',
            url: 'insrtAudiencias',
            data: {
                causa: causa, 
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

//valida la duracion de la audiencia
function duracion(fchIni, fchFin){
    var inicio = $(fchIni).val();
    var fin = $(fchFin).val();
    if(inicio!=='' && inicio!=='1899-09-09' && fin!=='' && fin!=='1899-09-09'){
        if(inicio > fin){
            alert("La fecha en que inicia esta audiencia, no puede ser mayor a la fecha en que finaliza");
            $(fchIni).val('');
            $(fchFin).val('');
            $(fchIni).focus();
        }
    }
}

function validaJuzAdd() {
    if ($("#juzgado").val() === "") {
        alertify.alert('Juzgado Clave sin seleccionar','Favor de seleccionar un Juzgado Clave para poder continuar con la captura');
        return false;
    } else {
        return true;
    }
}
