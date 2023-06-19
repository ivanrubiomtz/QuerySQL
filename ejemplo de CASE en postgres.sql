SELECT 
Extract(year from cajas_comprobacion.date_send) AS Ejercicio,
--Extract(week from cajas_comprobacion.date_send) AS Semana,
'' as SemanaExcel,
date (cajas_comprobacion.date_send) AS Fecha,
CASE main_empresa.id
WHEN 1 THEN 'ING'
WHEN 2 THEN 'HOM'
WHEN 3 THEN 'GEO' 
WHEN 4 THEN 'PGI'
WHEN 5 THEN 'GLO'
WHEN 6 THEN 'TOR'
WHEN 7 THEN 'BR'
END AS Empresa,
proyectos_proyecto.clave  AS NumeroProyecto,
cajas_comprobacion.id AS Referencia,
'COMPROBACIÓN ERP TGC' AS Tipo,
cajas_comprobacion.user_add AS Usuario,
cfdi_proveedor.rfc AS RFC,
cfdi_proveedor.razon_social AS Beneficiario,
'' AS Descripción,
'FACTURA ERP TGC' as División,
cajas_detallefactura.subtotal AS SubTotal,
cajas_detallefactura.iva AS IVA,
'' as Comisión, 
'' as FactorSalarial,
'' as Total
--CASE cajas_comprobacion.pay 
--WHEN 't' THEN 'PAGADO'
--WHEN 'f' THEN 'NO PAGADO' 
--END AS Estatus
--cajas_comprobacion.date_send AS Fecha
--Extract(month from cajas_comprobacion.date_send) AS Mes,
--Extract(day from cajas_comprobacion.date_send) AS Dia
--cajas_comprobacion.pay,
--cajas_comprobacion.date_pay,
--cajas_comprobacion.autorizada  
FROM cajas_comprobacionfactura
LEFT OUTER JOIN cajas_comprobacion ON cajas_comprobacion.id = cajas_comprobacionfactura.comprobacion_ptr_id
LEFT OUTER JOIN cajas_detallefactura ON cajas_Detallefactura.comprobacion_id = cajas_comprobacion.id
LEFT OUTER JOIN main_empresa ON main_empresa.id = cajas_detallefactura.receptor_id 
LEFT OUTER JOIN cajas_caja ON cajas_caja.id = cajas_comprobacion.caja_id
LEFT OUTER JOIN proyectos_proyecto ON proyectos_proyecto.id = cajas_caja.proyecto_id
LEFT OUTER JOIN cfdi_proveedor ON cfdi_proveedor.id = cajas_detallefactura.emisor_id
/*AÑO-MES-DIA*/
WHERE cajas_comprobacion.date_send BETWEEN '2016-08-01' AND '2016-08-22'
ORDER BY cajas_comprobacionfactura.comprobacion_ptr_id  ASC 

