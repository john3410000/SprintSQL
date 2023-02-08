select idcapacitacion as Capacitacion, asistnombrecompleto as NombreCompleto, asistedad as Edad, asistcorreo as Email
from asistentes join capacitacion on capacitacion_idcapacitacion = idcapacitacion
where cliente_rutcliente = 111111111
order by idcapacitacion;

select idvisita as IdVisita, nom_chequeo as Chequeos, estado_chequeo as SituacionChequeo
from visita join registro_chequeo on check_idvisita = idvisita join chequeos on id_check = check_idchequeo
where vislugar = 'valparaiso'
order by idvisita;

select acciorigen as Accidente, acciconsecuencias as Consecuencia, clinombres as Nombre, cliapellidos as Apellidos, rutcliente as RUT, clitelefono as Telefono
from accidente join cliente on cliente_idcliente = rutcliente
order by rutcliente;

