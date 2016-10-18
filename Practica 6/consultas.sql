use sams;
delimiter #
show tables#
create procedure proc_uno()
begin
	select count(idGerente) as TOTAL_EN_GERENTE from gerente;
	select club.nombre,socio.nombre,estado.nombre from club,socioclub,socio, estado where club.idClub = socioclub.idClub and socio.idSocio = socioclub.idSocio and club.idEdo = estado.idEdo and estado.nombre like 'M%';
	select club.nombre from club,servicioclub,servicio where club.idClub = servicioclub.idClub and servicioclub.idServicio = servicio.idServicio and servicio.nombre = 'APPLE SHOP';
end#
call proc_uno()#
delimiter #
create procedure proc_dos(in nombreSer varchar(20))
begin
	select count(idGerente) as TOTAL_EN_GERENTE from gerente;
	select club.nombre,socio.nombre,estado.nombre from club,socioclub,socio, estado where club.idClub = socioclub.idClub and socio.idSocio = socioclub.idSocio and club.idEdo = estado.idEdo and estado.nombre like 'M%';
	select club.nombre from club,servicioclub,servicio where club.idClub = servicioclub.idClub and servicioclub.idServicio = servicio.idServicio and servicio.nombre like nombreSer;
end#
call proc_dos('APPLE SHOP')#
delimiter #
create procedure proc_3()
begin 
	select gerente.nombre from gerente inner join servicioclub on gerente.idClub = sevicioclub.idClub inner join club on club.idClub = servicioclub.idClub where club = 'TOLUCA';
    select servicio.nombre from servicio inner join servicioclub on servicio.idServicio = servicioclub.idServicio inner join club on club.idClub = servicioclub.idClub where club.nombre = 'TOLUCA';
    select proveedor.nombre from proveedor inner join proveedorsams on proveedor.idProveedor = proveedorsams.idProveedor inner join proveedorsams.idClub = club.idClub where club.nombre = 'TOLUCA';
end#_
call proc_3()#
delimiter #
create procedure proc_4()
begin 
	select nombre from socio where nombre like '%GONZALEZ%';
	select count(idSocio) from socio;
	select producto.nombre,producto.precioUnitario from producto inner join proveedor on producto.idProveedor = proveedor.idProveedor where proveedor.nombre = 'SABRITAS';
	select club.nombre,gerente.nombre,proveedor.nombre from proveedor,club,estado,gerente,proveedorsams where proveedor.idProveedor = proveedorsams.idProveedor and proveedorsams.idClub = club.idClub and gerente.idClub = club.idClub and estado.idEdo = club.idEdo and estado.nombre = 'Chiapas';   
end#    
call proc_4()#    
delimiter #
create procedure proc_5()
begin
	select club.nombre,count(idSocio) from club,socioclub,club group by club.idClub = socioclub.idClub and socioclub.idSocio = socio.idSocio;
end#
call proc_5()#