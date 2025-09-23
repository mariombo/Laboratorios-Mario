USE ZaraBusiness;

-- 1
SELECT * FROM Clientes;

-- 2
SELECT * FROM Empleados;

-- 3
SELECT * FROM Tiendas;

-- 4
SELECT * FROM Prendas;

-- 5
SELECT * FROM Clientes
WHERE nombre_cliente LIKE 'L%';

-- 6
SELECT COUNT(*) AS total_clientes FROM Clientes;

-- 7
SELECT * FROM Compras
WHERE fecha_compra > '2023-05-01';

-- 8
UPDATE Clientes
SET email_cliente = 'nuevo.correo@email.com'
WHERE id_cliente = 1;

-- 9
DELETE FROM Compras
WHERE id_cliente = 1;

DELETE FROM Clientes
WHERE id_cliente = 1;


-- 10
SELECT * FROM Prendas
WHERE color = 'Negro';

-- 11
SELECT * FROM Tiendas
WHERE ciudad = 'Madrid';

-- 12
SELECT COUNT(*) AS prendas_caras
FROM Prendas
WHERE precio > 50;

-- 13
SELECT * FROM Empleados
WHERE tienda_id = 1;

-- 14
SELECT * FROM Clientes
WHERE nombre_cliente LIKE '%Andrés%';

-- 15
SELECT * FROM Compras
WHERE id_cliente = 2;

-- 16
DELETE c
FROM Compras c
JOIN (SELECT id_compra FROM Compras WHERE monto_total < 30) x
  ON x.id_compra = c.id_compra;

-- 17
SELECT * FROM Prendas
WHERE precio BETWEEN 20 AND 40;

-- 18
SELECT * FROM Empleados
WHERE nombre_empleado LIKE '%a%';

-- 19
SELECT * FROM Prendas
ORDER BY precio DESC
LIMIT 5;

-- 20
SELECT * FROM Compras
WHERE id_cliente = 1 AND monto_total > 75;

-- 21
SELECT * FROM Prendas
WHERE talla = 'M';

-- 22
UPDATE Prendas
SET talla = 'L'
WHERE id_prenda = 1;

-- 23
SELECT * FROM Empleados
WHERE fecha_contratacion > '2022-01-01';

-- 24
SELECT * FROM Tiendas
WHERE ciudad = 'Barcelona';

-- 25
DELETE FROM Empleados
WHERE id_empleado = 1;

-- 26
SELECT * FROM Compras
WHERE fecha_compra < '2023-07-01';

-- 27
SELECT * FROM Prendas
WHERE tipo_prenda LIKE '%eta';

-- 28
SELECT * FROM Clientes
WHERE email_cliente NOT LIKE '%hotmail%';

-- 29
SELECT COUNT(*) AS compras_septiembre
FROM Compras
WHERE MONTH(fecha_compra) = 9 AND YEAR(fecha_compra) = 2023;

-- 30
UPDATE Tiendas
SET direccion = 'Nueva dirección'
WHERE id_tienda = 1;

-- 31
SELECT * FROM Prendas
WHERE tipo_prenda = 'Camiseta';

-- 32
DELETE FROM Prendas
WHERE precio < 20;

-- 33
SELECT * FROM Tiendas
ORDER BY ciudad;

-- 34
SELECT * FROM Empleados
WHERE puesto = 'Vendedor';

-- 35
SELECT COUNT(*) AS prendas_blancas
FROM Prendas
WHERE color = 'Blanco';

-- 36
SELECT * FROM Clientes
WHERE CHAR_LENGTH(nombre_cliente) > 10;

-- 37
SELECT * FROM Compras
WHERE monto_total BETWEEN 50 AND 100;

-- 38
SELECT * FROM Compras
ORDER BY fecha_compra DESC
LIMIT 3;

-- 39
-- ?


-- 40
SELECT color, COUNT(*) AS total
FROM Prendas
GROUP BY color;

-- 41
INSERT INTO Tiendas (nombre_tienda, direccion, ciudad, pais)
VALUES 
('Zara Príncipe Pío', 'Calle Princesa, 10', 'Madrid', 'España'),
('Zara La Vaguada', 'Avenida Monforte de Lemos, 36', 'Madrid', 'España');

-- 42
UPDATE Clientes
SET nombre_cliente = 'Micaela Torres',
    email_cliente = 'micaela.torres@email.com'
WHERE id_cliente = 5;

