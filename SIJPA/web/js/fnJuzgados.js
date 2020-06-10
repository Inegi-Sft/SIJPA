
function valida(){
    if ($('#nomOrgano').val() === '') {
        alert('Seccion Datos Principales: \n\n Llena el campo Nombre Organo Jurisdiccional');
    }else if ($('#numOrgano').val() ==='') {
        alert('Seccion Datos Principales: \n\n Llena el campo Numero Organo Jurisdiccional');
    }else if ($('#jurisdiccion').val() ==='') {
        alert('Seccion Datos Principales: \n\n Llena el campo Jurisdiccion');
    }else if ($('#funcionJuz').val() ==='') {
        alert('Seccion Datos Principales: \n\n Llena el campo Funcion del organo Jurisdiccional');
    }else if ($('#entidadJ').val() ==='') {
        alert('Seccion Ubicacion: \n\n Llena el campo Entidad Federativa');
    }else if ($('#municipioJ').val() ==='') {
        alert('Seccion Ubicacion: \n\n Llena el campo Municipio o Demarcacion Territorial de la CDMX');
    }else if ($('#fDivision').val() ==='') {
        alert('Seccion Ubicacion: \n\n Llena el campo Forma de División');
    }else if ($('#vialidad').val() ==='') {
        alert('Seccion Domicilio: \n\n Llena el campo Vialidad');
    }else if ($('#nomVialidad').val() ==='') {
        alert('Seccion Domicilio: \n\n Llena el campo Nombre de la Vialidad');
    }else if ($('#asentamiento').val() ==='') {
        alert('Seccion Domicilio: \n\n Asentamiento Humano');
    }else if ($('#nomAsentamiento').val() ==='') {
        alert('Seccion Domicilio: \n\n Llena el campo Nombre del Asentamiento Humano');
    }else if ($('#nombreCap').val() ==='') {
        alert('Seccion Datos del Capturador: \n\n Llena el campo Nombre(s)');
    }else if ($('#apaternoCap').val() ==='') {
        alert('Seccion Datos del Capturador: \n\n Llena el campo Apellido Paterno');
    }else if ($('#amaternoCap').val() ==='') {
        alert('Seccion Datos del Capturador: \n\n Llena el campo Apellido Materno');
    }else if ($('#cargo').val() ==='') {
        alert('Seccion Datos del Capturador: \n\n Llena el campo Cargo');
    }else if ($('#ejercicio').val() ==='') {
        alert('Seccion Informacion General: \n\n Llena el campo Ejercicio');
    }
}
