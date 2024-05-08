use jardineria;

-- Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

select codigo_oficina, ciudad from oficina;

-- Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

select ciudad, telefono from oficina
where pais = "España";

-- Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.

select nombre, apellido1, apellido2, email from empleado
where codigo_jefe = 7;

-- Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

select puesto, nombre, apellido1, apellido2, email from empleado
where puesto = "Director General";

-- Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.

select nombre, apellido1, apellido2, puesto from empleado
where puesto != "representante ventas";

-- Devuelve un listado con el nombre de los todos los clientes españoles.

select nombre_cliente from cliente
where pais = "Spain";

-- Devuelve un listado con los distintos estados por los que puede pasar un pedido.

select distinct estado from pedido,

-- Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
-- Utilizando la función YEAR de MySQL.
-- Utilizando la función DATE_FORMAT de MySQL.
-- Sin utilizar ninguna de las funciones anteriores.

select distinct codigo_cliente from pago
where YEAR(fecha_pago) = 2008;

select distinct codigo_cliente from pago
where DATE_FORMAT(fecha_pago, '%Y') = 2008;

select distinct codigo_cliente from pago
where fecha_pago > '2008-01-01' and fecha_pago < '2009-01-01';

-- Devuelve un listado con el código de pedido, código de cliente, 
-- fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.

select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido
where fecha_esperada < fecha_entrega;

-- Devuelve un listado con el código de pedido, código de cliente,
-- fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha 
-- sido al menos dos días antes de la fecha esperada.
-- Utilizando la función ADDDATE de MySQL.
-- Utilizando la función DATEDIFF de MySQL.
-- ¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?

select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido
where fecha_entrega <= fecha_esperada - interval 2 DAY;

select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido
where fecha_entrega <= Adddate(fecha_esperada, -2);

select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido
where DATEDIFF(fecha_entrega, fecha_esperada) <= -2;

-- Devuelve un listado de todos los pedidos que fueron en 2009.

select codigo_pedido from pedido
where YEAR(fecha_pedido)  = 2009;

-- Devuelve un listado de todos los pedidos que han sido  en el mes de enero de cualquier año

select codigo_pedido, fecha_pedido from pedido
where DATE_FORMAT(fecha_pedido, '%m') = '01';

select codigo_pedido, fecha_pedido from pedido
where month(fecha_pedido) = 01;

-- Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. 
-- Ordene el resultado de mayor a menor.

select * from pago
where year(fecha_pago) = 2008 and forma_pago = 'Paypal';

-- Devuelve un listado con todas las formas de pago que aparecen en la tabla pago.
-- Tenga en cuenta que no deben aparecer formas de pago repetidas.

select distinct forma_pago from pago;

-- Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales
-- y que tienen más de 100 unidades en stock. 
-- El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.

select * from producto
where gama = "Ornamentales" and cantidad_en_stock > 100
order by precio_venta desc;

-- Devuelve un listado con todos los clientes que sean de la ciudad de Madrid
-- y cuyo representante de ventas tenga el código de empleado 11 o 30.

select * from cliente
where ciudad = "Madrid" and  (codigo_empleado_rep_ventas = 11 or codigo_empleado_rep_ventas = 30);

-- CONSULTAS MULTITABLA

-- Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.

Select cl.nombre_cliente, em.nombre from cliente as cl
inner join empleado as em on cl.codigo_empleado_rep_ventas = em.codigo_empleado ;

-- Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.

select distinct cl.nombre_cliente, em.nombre from cliente as cl
inner join pago as pa on cl.codigo_cliente = pa.codigo_cliente
inner join empleado as em on cl.codigo_empleado_rep_ventas = em.codigo_empleado;


-- Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes 
-- junto con la ciudad de la oficina a la que pertenece el representante.

select distinct cl.nombre_cliente, em.nombre as nombre_empleado, ofi.ciudad from cliente as cl
inner join pago as pa on cl.codigo_cliente = pa.codigo_cliente
inner join empleado as em on cl.codigo_cliente = em.codigo_empleado
inner join oficina as ofi on em.codigo_oficina = ofi.codigo_oficina


-- Devuelve el nombre de los clientes que  hayan hecho pagos y el nombre de sus representantes 
-- junto con la ciudad de la oficina a la que pertenece el representante.Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

select cl.nombre_cliente, em.nombre as nombre_representante, ofi.ciudad,  ofi.linea_direccion1 from cliente as cl
inner join pago as pa on cl.codigo_cliente  = pa.codigo_cliente 
inner join empleado as em on cl.codigo_empleado_rep_ventas = em.codigo_empleado 
inner join oficina as ofi on em.codigo_oficina = ofi.codigo_oficina
where cl.ciudad = "Fuenlabrada"


-- Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

select cl.nombre_cliente, em.nombre as nombre_empleado, ofi.ciudad from cliente as cl
inner join empleado as em on cl.codigo_empleado_rep_ventas = em.codigo_empleado 
inner join oficina as ofi on em.codigo_oficina = ofi.codigo_oficina;


-- Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.

select em.nombre, je.nombre as nombre_jefe from empleado as em
inner join empleado as je  on je.codigo_empleado = em.codigo_jefe


-- Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.

select em.nombre, je.nombre as nombre_jefe , jj.nombre as jefejefe from empleado as em
-- en este inner de la misma tabla estamos verificando que si el codigo del empleado (je) coincide con el codigo del jefe del empleado(em) significa que es su jefe inmediato
inner join empleado as je on je.codigo_empleado  = em.codigo_jefe
-- y aquì hacemos lo mismo pero con el jefe del jefe
inner join empleado as jj on jj.codigo_empleado  = je.codigo_jefe


--  Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

select cl.nombre_cliente, pe.fecha_esperada, pe.fecha_entrega from cliente as cl
inner join pedido as pe on cl.codigo_cliente = pe.codigo_cliente
where pe.fecha_esperada < pe.fecha_entrega


-- Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

select distinct cl.nombre_cliente , gp.gama from cliente as cl
inner join pedido as pe on cl.codigo_cliente = pe.codigo_cliente
inner join detalle_pedido as dp on pe.codigo_pedido = dp.codigo_pedido 
inner join producto as pr on dp.codigo_producto = pr.codigo_producto 
inner join gama_producto as gp on pr.gama = gp.gama 



