CREATE DATABASE CE;
USE CE;

-- CREACION DE TABLAS
CREATE TABLE empleados (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  puesto VARCHAR(50),
  salario DECIMAL(10, 2),
  fecha_contratacion DATE
);

CREATE TABLE departamentos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);

CREATE TABLE empleado_departamento (
  empleados_id INT,
  departamentos_id INT,
  PRIMARY KEY (empleados_id, departamentos_id),
  FOREIGN KEY (empleados_id) REFERENCES empleados(id),
  FOREIGN KEY (departamentos_id) REFERENCES departamentos(id)
);

CREATE TABLE proyectos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  fecha_inicio DATE,
  fecha_fin DATE
);

CREATE TABLE empleado_proyecto (
  empleados_id INT,
  proyectos_id INT,
  PRIMARY KEY (empleados_id, proyectos_id),
  FOREIGN KEY (empleados_id) REFERENCES empleados(id),
  FOREIGN KEY (proyectos_id) REFERENCES proyectos(id)
);

CREATE TABLE clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  email VARCHAR(100),
  telefono VARCHAR(20),
  fecha_registro DATE
);

CREATE TABLE productos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  precio DECIMAL(10, 2) NOT NULL,
  stock INT NOT NULL
);

CREATE TABLE pedidos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT,
  fecha_pedido DATE,
  total DECIMAL(10, 2),
  estado VARCHAR(20),
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE pedido_producto (
  pedido_id INT,
  producto_id INT,
  cantidad INT,
  precio_unitario DECIMAL(10, 2),
  PRIMARY KEY (pedido_id, producto_id),
  FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
  FOREIGN KEY (producto_id) REFERENCES productos(id)
);
-- insertamos datos en la tabla Clientes

INSERT INTO clientes (nombre, email, telefono, fecha_registro) VALUES
('María Rodríguez', 'maria@email.com', '1234567890', '2023-01-15'),
('Juan Pérez', 'juan@email.com', '0987654321', '2023-02-20'),
('Ana López', 'ana@email.com', '1122334455', '2023-03-10'),
('Carlos Gómez', 'carlos@email.com', '5566778899', '2023-04-05'),
('Laura Martínez', 'laura@email.com', '9988776655', '2023-05-01');

-- Insertamos datos en la tabla Productos

INSERT INTO productos (nombre, descripcion, precio, stock) VALUES
('Laptop', 'Laptop de última generación', 1200000.00, 50),
('Smartphone', 'Teléfono inteligente de gama alta', 800000.00, 100),
('Tablet', 'Tablet con pantalla de alta resolución', 500000.00, 75),
('Auriculares Bluetooth', 'Auriculares inalámbricos con cancelación de ruido', 150000.00, 200),
('Monitor', 'Monitor de 27 pulgadas 4K', 600000.00, 30);

-- Insertamos datos en la tabla Pedidos

INSERT INTO pedidos (cliente_id, fecha_pedido, total, estado) VALUES
(1, '2023-06-01', 1350000.00, 'Entregado'),
(2, '2023-06-15', 800000.00, 'En proceso'),
(3, '2023-07-01', 650000.00, 'Enviado'),
(4, '2023-07-15', 1800000.00, 'En proceso'),
(5, '2023-08-01', 500000.00, 'Pendiente');

-- Insertamos datos en la tabla pedido_producto

INSERT INTO pedido_producto (pedido_id, producto_id, cantidad, precio_unitario) VALUES
(1, 1, 1, 1200000.00),
(1, 4, 1, 150000.00),
(2, 2, 1, 800000.00),
(3, 3, 1, 500000.00),
(3, 4, 1, 150000.00),
(4, 1, 1, 1200000.00),
(4, 5, 1, 600000.00),
(5, 3, 1, 500000.00);

INSERT INTO departamentos (nombre) VALUES ('Recursos Humanos');
INSERT INTO departamentos (nombre) VALUES ('Finanzas');
INSERT INTO departamentos (nombre) VALUES ('IT');
INSERT INTO departamentos (nombre) VALUES ('Marketing');
INSERT INTO departamentos (nombre) VALUES ('Ventas');
INSERT INTO departamentos (nombre) VALUES ('Producción');

INSERT INTO empleados (nombre, puesto, salario, fecha_contratacion) VALUES ('Juan Perez', 'Recursos Humanos', 2000000.00, '2023-03-03');
INSERT INTO empleados (nombre, puesto, salario, fecha_contratacion) VALUES ('Ana García', 'IT', 1500000.00, '2022-04-02');
INSERT INTO empleados (nombre, puesto, salario, fecha_contratacion) VALUES ('Luis García', 'Finanzas', 2500000.00, '2021-05-08');
INSERT INTO empleados (nombre, puesto, salario, fecha_contratacion) VALUES ('María López', 'Gerente de Marketing', 3000000.00, '2020-06-15');
INSERT INTO empleados (nombre, puesto, salario, fecha_contratacion) VALUES ('Carlos Rodríguez', 'Analista de Ventas', 1800000.00, '2022-01-10');
INSERT INTO empleados (nombre, puesto, salario, fecha_contratacion) VALUES ('Laura Martínez', 'Ingeniero de Producción', 2200000.00, '2019-11-20');
INSERT INTO empleados (nombre, puesto, salario, fecha_contratacion) VALUES 
('Pedro Sánchez', 'Analista de RRHH', 2200000.00, '2022-07-15'),
('Sofia Ruiz', 'Desarrollador Senior', 2800000.00, '2021-09-01'),
('Diego Fernández', 'Contador', 2300000.00, '2022-03-10'),
('Elena Torres', 'Diseñador Gráfico', 1900000.00, '2023-01-20'),
('Roberto Álvarez', 'Gerente de Ventas', 3200000.00, '2020-11-05');

INSERT INTO empleado_departamento (empleados_id, departamentos_id) VALUES 
(7, 1), -- Pedro Sánchez en Recursos Humanos
(8, 3), -- Sofia Ruiz en IT
(9, 2), -- Diego Fernández en Finanzas
(10, 4), -- Elena Torres en Marketing
(11, 5); -- Roberto Álvarez en Ventas
INSERT INTO empleado_departamento (empleados_id, departamentos_id) VALUES (1, 1); -- Juan Perez en Recursos Humanos
INSERT INTO empleado_departamento (empleados_id, departamentos_id) VALUES (2, 3); -- Ana García en IT
INSERT INTO empleado_departamento (empleados_id, departamentos_id) VALUES (3, 2); -- Luis García en Finanzas
INSERT INTO empleado_departamento (empleados_id, departamentos_id) VALUES (4, 4); -- María López en Marketing
INSERT INTO empleado_departamento (empleados_id, departamentos_id) VALUES (5, 5); -- Carlos Rodríguez en Ventas
INSERT INTO empleado_departamento (empleados_id, departamentos_id) VALUES (6, 6); -- Laura Martínez en Producción

INSERT INTO proyectos (nombre, descripcion, fecha_inicio, fecha_fin) VALUES ('Proyecto 1', 'Desarrollo de un nuevo software', '2022-01-01', '2022-12-31');
INSERT INTO proyectos (nombre, descripcion, fecha_inicio, fecha_fin) VALUES ('Proyecto 2', 'Análisis de mercado', '2022-06-01', '2022-12-31');
INSERT INTO proyectos (nombre, descripcion, fecha_inicio, fecha_fin) VALUES ('Proyecto 3', 'Implementación de un nuevo sistema de gestión', '2023-01-01', '2023-12-31');
INSERT INTO proyectos (nombre, descripcion, fecha_inicio, fecha_fin) VALUES ('Proyecto 4', 'Desarrollo de una nueva aplicación móvil', '2023-03-01', '2023-09-30');
INSERT INTO proyectos (nombre, descripcion, fecha_inicio, fecha_fin) VALUES ('Proyecto 5', 'Optimización de procesos de producción', '2022-09-01', '2023-03-31');
INSERT INTO proyectos (nombre, descripcion, fecha_inicio, fecha_fin) VALUES ('Proyecto 6', 'Implementación de un sistema de inteligencia artificial', '2023-05-01', '2024-01-31');

INSERT INTO empleado_proyecto (empleados_id, proyectos_id) VALUES (1, 1); -- Juan Perez en Proyecto 1
INSERT INTO empleado_proyecto (empleados_id, proyectos_id) VALUES (2, 2); -- Ana García en Proyecto 2
INSERT INTO empleado_proyecto (empleados_id, proyectos_id) VALUES (3, 3); -- Luis García en Proyecto 3
INSERT INTO empleado_proyecto (empleados_id, proyectos_id) VALUES (4, 1); -- María López en Proyecto 1
INSERT INTO empleado_proyecto (empleados_id, proyectos_id) VALUES (5, 2); -- Carlos Rodríguez en Proyecto 2
INSERT INTO empleado_proyecto (empleados_id, proyectos_id) VALUES (6, 3); -- Laura Martínez en Proyecto 3

SELECT * FROM empleados;
SELECT * FROM departamentos;
SELECT * FROM proyectos;


SELECT e.nombre AS empleados, d.nombre AS departamentos 
FROM empleados e 
JOIN empleado_departamento ed ON e.id = ed.empleados_id
JOIN departamentos d ON ed.departamentos_id = d.id;

SELECT e.nombre AS empleados, p.nombre AS proyectos 
FROM empleados e 
JOIN empleado_proyecto ep ON e.id = ep.empleados_id
JOIN proyectos p ON ep.proyectos_id = p.id;

update empleados 
set salario = '3600'
where id = 1;

update departamentos
set nombre = 'Contaduria'
where id = 1;

update proyectos 
set descripcion = ' Contabilidad de Proyectos'
where id = 1;

SELECT e.nombre, e.salario, d.nombre AS departamento,
       (SELECT AVG(e2.salario)
        FROM empleados e2
        JOIN empleado_departamento ed2 ON e2.id = ed2.empleados_id
        WHERE ed2.departamentos_id = d.id) AS salario_promedio_dept
FROM empleados e
JOIN empleado_departamento ed ON e.id = ed.empleados_id
JOIN departamentos d ON ed.departamentos_id = d.id
WHERE e.salario > (SELECT AVG(e3.salario)
                   FROM empleados e3
                   JOIN empleado_departamento ed3 ON e3.id = ed3.empleados_id
                   WHERE ed3.departamentos_id = d.id);
                   
-- Selecciona el nombre del empleado, su salario y el nombre del departamento.
-- Utiliza una subconsulta en el SELECT para calcular el salario promedio de cada departamento.
-- en la cláusula WHERE, utiliza otra subconsulta para comparar el salario del empleado con el promedio de su departamento.
-- Muestra solo los empleados cuyo salario es mayor que el promedio de su departamento.

SELECT DISTINCT d.nombre AS departamento
FROM departamentos d
WHERE d.id IN (
    SELECT ed.departamentos_id
    FROM empleados e
    JOIN empleado_departamento ed ON e.id = ed.empleados_id
    WHERE e.salario > 1900000.00
);
-- Selecciona los nombres únicos de los departamentos.
-- Utiliza una subconsulta en la cláusula WHERE con IN.
-- La subconsulta encuentra los IDs de los departamentos que tienen empleados con salarios superiores a $1900000.00
-- Si el ID del departamento está en el conjunto de resultados de la subconsulta, se incluye en el resultado final.

SELECT 
    c.nombre AS nombre_cliente,
    p.nombre AS nombre_producto,
    pp.cantidad
FROM 
    clientes c
JOIN 
    pedidos ped ON c.id = ped.cliente_id
JOIN 
    pedido_producto pp ON ped.id = pp.pedido_id
JOIN 
    productos p ON pp.producto_id = p.id
ORDER BY 
    c.nombre, p.nombre;
-- Selecciona el nombre del cliente de la tabla clientes.
-- Selecciona el nombre del producto de la tabla productos.
-- Selecciona la cantidad de cada producto en el pedido de la tabla pedido_producto.
-- Utiliza JOINs múltiples para conectar todas las tablas relevantes:
-- Une clientes con pedidos usando el cliente_id.
-- Une pedidos con pedido_producto usando el pedido_id.
-- Une pedido_producto con productos usando el producto_id.
-- Ordena los resultados por nombre del cliente y nombre del producto para una mejor legibilidad.

SELECT DISTINCT
    c.id AS cliente_id,
    c.nombre AS nombre_cliente,
    c.email,
    p.nombre AS nombre_producto,
    ped.fecha_pedido,
    ped.total AS total_pedido
FROM 
    clientes c
JOIN 
    pedidos ped ON c.id = ped.cliente_id
JOIN 
    pedido_producto pp ON ped.id = pp.pedido_id
JOIN 
    productos p ON pp.producto_id = p.id
WHERE 
    p.nombre LIKE '%laptop%'
ORDER BY 
    ped.fecha_pedido DESC, c.nombre;
-- Selecciona información relevante del cliente, el producto y el pedido.
-- Utiliza JOINs múltiples para conectar todas las tablas necesarias.
-- Añade una condición en la cláusula WHERE para filtrar solo los productos cuyo nombre contiene "laptop" (sin distinguir entre mayúsculas y minúsculas).
-- Usa DISTINCT para evitar duplicados en caso de que un cliente haya pedido múltiples laptops en diferentes pedidos.
-- Ordena los resultados por fecha de pedido (más reciente primero) y nombre del cliente.
    
DELIMITER //

CREATE PROCEDURE EmpleadosSalarioAlto(IN dept_id INT)
BEGIN
    SELECT e.nombre, e.salario
    FROM empleados e
    JOIN empleado_departamento ed ON e.id = ed.empleados_id
    WHERE ed.departamentos_id = dept_id AND e.salario > 1900000.00;
END //

DELIMITER ;
DROP PROCEDURE IF EXISTS EmpleadosSalarioAlto;
CALL EmpleadosSalarioAlto(2);