USE Jardineria;

 

select a.codigo_cliente,
		a.nombre_cliente,
        b.id_transaccion
        from CLIENTE a INNER JOIN PAGO b
        on b.codigo_cliente=a.codigo_cliente where a.nombre_cliente='The Magic Garden'
        
select a.codigo_cliente,
		a.nombre_cliente, COUNT(b.codigo_pedido) from CLIENTE a LEFT JOIN PEDIDO b
        ON a.codigo_cliente=b.codigo_cliente
        where b.codigo_cliente is null
        group by a.nombre_cliente
  UNION      
select a.codigo_cliente,
		a.nombre_cliente, COUNT(b.codigo_cliente) from CLIENTE a LEFT JOIN PAGO b
        ON a.codigo_cliente=b.codigo_cliente
        where b.codigo_cliente is null
        group by a.nombre_cliente
        
        


#3. Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han
#realizado ningún pedido.

select a.codigo_cliente,
		a.nombre_cliente, COUNT(b.codigo_pedido) AS pedido_o_pago from CLIENTE a LEFT JOIN PEDIDO b
        ON a.codigo_cliente=b.codigo_cliente
        where b.codigo_cliente is null
        group by a.nombre_cliente
  UNION      
select a.codigo_cliente,
		a.nombre_cliente, COUNT(b.codigo_cliente) as pedido_o_pago from CLIENTE a LEFT JOIN PAGO b
        ON a.codigo_cliente=b.codigo_cliente
        where b.codigo_cliente is null
        group by a.nombre_cliente       


#4. Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.

select a.nombre,
		a.apellido1,
		a.apellido2,
        a.codigo_oficina from EMPLEADO a left join OFICINA b 
        on a.codigo_oficina=b.codigo_oficina
		where a.codigo_oficina is NULL


#5. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.
	
    select a.codigo_empleado,
		a.nombre,
		a.apellido1,
		a.apellido2 from EMPLEADO a LEFT JOIN CLIENTE b
        ON a.codigo_empleado=b.codigo_empleado_rep_ventas where
        b.codigo_empleado_rep_ventas is NULL       

#6. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto
#con los datos de la oficina donde trabajan.

select a.apellido1,a.nombre from OFICINA b INNER JOIN EMPLEADO a
		ON  a.codigo_oficina=b.codigo_oficina  LEFT JOIN CLIENTE c        
        ON a.codigo_empleado=c.codigo_empleado_rep_ventas
        where c.codigo_empleado_rep_ventas is null
        
        #group by a.nombre,a.apellido1
        #order by b.codigo_oficina
        

#7. Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no
#tienen un cliente asociado.


select a.apellido1,a.nombre from OFICINA b LEFT JOIN EMPLEADO a 
		ON a.codigo_oficina=b.codigo_oficina LEFT JOIN CLIENTE c        
        ON a.codigo_empleado=c.codigo_empleado_rep_ventas
        where c.codigo_empleado_rep_ventas is null 
        or  a.codigo_oficina is null

#8. Devuelve un listado de los productos que nunca han aparecido en un pedido.

select a.codigo_producto,a.nombre from PRODUCTO a LEFT JOIN DETALLE_PEDIDO b 
			on a.codigo_producto=b.codigo_producto where b.codigo_producto is null
            order by a.codigo_producto asc


#9. Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe
#mostrar el nombre, la descripción y la imagen del producto.

select a.nombre,a.descripcion,c.imagen from GAMA_PRODUCTO c INNER JOIN PRODUCTO a 
											on c.gama=a.gama
											LEFT JOIN DETALLE_PEDIDO b 
                                            on a.codigo_producto=b.codigo_producto			  
                                            where b.codigo_producto is NULL
               
            

#10. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los
#representantes de ventas de algún cliente que haya realizado la compra de algún producto de la
#gama Frutales.
select DISTINCT(a.codigo_oficina),
		a.ciudad,
		a.codigo_postal from OFICINA as a INNER JOIN EMPLEADO as b 
				on a.codigo_oficina=b.codigo_oficina 
										INNER JOIN CLIENTE as c 
				on c.codigo_empleado_rep_ventas=b.codigo_empleado
                                        INNER JOIN PEDIDO as d 
				on c.codigo_cliente=d.codigo_cliente				
                                        INNER JOIN DETALLE_PEDIDO as e
				on d.codigo_pedido=e.codigo_pedido				
                                        INNER JOIN PRODUCTO as f
				on e.codigo_producto=f.codigo_producto
                                        INNER JOIN GAMA_PRODUCTO as g    
				on f.gama=g.gama
        where f.gama <> 'Frutales'




#11. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún
#pago.

select a.nombre_cliente,b.codigo_pedido from PEDIDO b INNER JOIN CLIENTE a 
		on a.codigo_cliente=b.codigo_cliente LEFT JOIN  PAGO c 
        on c.codigo_cliente=a.codigo_cliente
        where c.codigo_cliente is null       
        
#12. Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre
#de su jefe asociado.

select a.nombre as Empleado,b.nombre as JEFE from EMPLEADO a INNER JOIN EMPLEADO b
							on a.codigo_oficina=b.codigo_oficina and a.codigo_empleado <> b.codigo_empleado
                            LEFT JOIN CLIENTE c
                            on b.codigo_empleado=c.codigo_empleado_rep_ventas
                            where b.codigo_jefe=3 and c.codigo_empleado_rep_ventas is null

Consultas resumen
1. ¿Cuántos empleados hay en la compañía?

select count(codigo_empleado) as cantidad from EMPLEADO

2. ¿Cuántos clientes tiene cada país?

select pais, count(codigo_cliente) as cantidad_clientes from CLIENTE
	GROUP BY pais

3. ¿Cuál fue el pago medio en 2009?

select AVG(total) from PAGO WHERE Year(fecha_pago) = 2009

4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número
de pedidos.

	select estado,count(codigo_pedido) as cantidad_pedido from PEDIDO
    GROUP BY estado 
    ORDER BY cantidad_pedido DESC

5. Calcula el precio de venta del producto más caro y más barato en una misma consulta.

	select MAX(precio_venta) AS CARO,MIN(precio_venta) as BARATO from PRODUCTO


6. Calcula el número de clientes que tiene la empresa.
	
	select COUNT(codigo_cliente) AS Cantidad_Cliente from CLIENTE
    
7. ¿Cuántos clientes tiene la ciudad de Madrid?

	select count(codigo_cliente) from CLIENTE where ciudad='Madrid'    

8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?

	select count(codigo_cliente) as cantidad_cliente from CLIENTE where ciudad LIKE 'M%' or 'm%'   
   

#9. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada
#uno.

	select a.nombre AS REPRESENTANTE,COUNT(b.codigo_cliente) from EMPLEADO a INNER JOIN CLIENTE b 
    on a.codigo_empleado = b.codigo_empleado_rep_ventas
    group by a.nombre
       
#10. Calcula el número de clientes que no tiene asignado representante de ventas.

	select count(codigo_cliente) from CLIENTE where codigo_empleado_rep_ventas is null
    
#11. Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá
#mostrar el nombre y los apellidos de cada cliente.

	select a.nombre_cliente, 
			MAX(b.fecha_pago),
			MIN(b.fecha_pago) FROM CLIENTE a INNER JOIN PAGO b
				ON a.codigo_cliente=b.codigo_cliente
                group by a.nombre_cliente
                
     
12. Calcula el número de productos diferentes que hay en cada uno de los pedidos.

	select a.codigo_pedido,COUNT(DISTINCT(b.codigo_producto)) as CANTIDAD
				 from DETALLE_PEDIDO b INNER JOIN PEDIDO a
					on b.codigo_pedido=a.codigo_pedido
                    group by a.codigo_pedido                
                    
						
13. Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los
pedidos.

	select a.codigo_pedido,
			sum(b.cantidad)as cantidad_total from PEDIDO a INNER JOIN DETALLE_PEDIDO b
						on a.codigo_pedido = b.codigo_pedido
                        group by a.codigo_pedido                   
                      
#14. Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han
#vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.

select  a.nombre,
			count(b.cantidad)as cantidad_total from PRODUCTO a INNER JOIN DETALLE_PEDIDO b
				on a.codigo_producto=b.codigo_producto                               
                group by a.nombre
                order by cantidad_total desc 
                LIMIT 20           
                
15. La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el
total facturado. La base imponible se calcula sumando el coste del producto por el número de
unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la
suma de los dos campos anteriores.
use Jardineria

select a.codigo_pedido,
		SUM(b.cantidad*b.precio_unidad) as base_imponible,      
        SUM(b.cantidad*b.precio_unidad*0.21) as IVA,		#EN ESTA PARTE hacia falta analizar, simplemente modificamos dentro de la cantidad de cada producto con su respectivo precio y añadimos el impuesto de IVA
        (SUM(b.cantidad*b.precio_unidad)+SUM(b.cantidad*b.precio_unidad*0.21)) AS TOTAL
					from PEDIDO a INNER JOIN DETALLE_PEDIDO b 
				on a.codigo_pedido= b.codigo_pedido
                group by a.codigo_pedido


16. La misma información que en la pregunta anterior, pero agrupada por código de producto.


	select b.codigo_producto,
		SUM(b.cantidad*b.precio_unidad) as base_imponible,      
        SUM(b.cantidad*b.precio_unidad*0.21) as IVA,		#EN ESTA PARTE hacia falta analizar, simplemente modificamos dentro de la cantidad de cada producto con su respectivo precio y añadimos el impuesto de IVA
        (SUM(b.cantidad*b.precio_unidad)+SUM(b.cantidad*b.precio_unidad*0.21)) AS TOTAL
					from PEDIDO a INNER JOIN DETALLE_PEDIDO b 
				on a.codigo_pedido= b.codigo_pedido
                group by b.codigo_producto

17. La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada
por los códigos que empiecen por OR.

	select b.codigo_producto,
		SUM(b.cantidad*b.precio_unidad) as base_imponible,      
        SUM(b.cantidad*b.precio_unidad*0.21) as IVA,		#EN ESTA PARTE hacia falta analizar, simplemente modificamos dentro de la cantidad de cada producto con su respectivo precio y añadimos el impuesto de IVA
        (SUM(b.cantidad*b.precio_unidad)+SUM(b.cantidad*b.precio_unidad*0.21)) AS TOTAL
					from PEDIDO a INNER JOIN DETALLE_PEDIDO b 
				on a.codigo_pedido= b.codigo_pedido
                group by b.codigo_producto having b.codigo_producto LIKE 'OR%'

18. Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el
nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA).

select a.codigo_producto,a.nombre,
		SUM(b.cantidad) AS Cantidad_unidades,
        SUM(b.cantidad*b.precio_unidad) as Total_Facturado,
         (SUM(b.cantidad*b.precio_unidad)+SUM(b.cantidad*b.precio_unidad*0.21)) AS Total_Facturado_con_impuestos
         from PRODUCTO a INNER JOIN DETALLE_PEDIDO b
         on a.codigo_producto=b.codigo_producto
         group by a.nombre having Total_Facturado_con_impuestos*0.85>3000
