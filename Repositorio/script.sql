-- CREAR BASE DE DATOS SOLO SI NO EXISTE
IF DB_ID('BibliotecaDB') IS NULL
BEGIN
    CREATE DATABASE BibliotecaDB;
END
GO

USE BibliotecaDB;
GO

-- TABLAS PRINCIPALES
CREATE TABLE Autores (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Nacionalidad NVARCHAR(100)
);

CREATE TABLE Temas (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre_Tema NVARCHAR(100) NOT NULL,
    Area_Conocimiento NVARCHAR(100)
);

CREATE TABLE Editoriales (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre_Editorial NVARCHAR(100) NOT NULL,
    Sitio_Web NVARCHAR(200)
);

CREATE TABLE Paises (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre_Pais NVARCHAR(100) NOT NULL,
    Region NVARCHAR(100)
);

CREATE TABLE Tipos (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre_Tipo NVARCHAR(100) NOT NULL
);

CREATE TABLE Libros (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Editorial INT FOREIGN KEY REFERENCES Editoriales(Id),
    Pais INT FOREIGN KEY REFERENCES Paises(Id),
    Tipo INT FOREIGN KEY REFERENCES Tipos(Id),
    Isbn NVARCHAR(20) UNIQUE,
    Titulo NVARCHAR(200) NOT NULL,
    Edicion NVARCHAR(50),
    Fecha_Lanzamiento DATE
);

CREATE TABLE Libros_Autores (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Libro INT FOREIGN KEY REFERENCES Libros(Id),
    Autor INT FOREIGN KEY REFERENCES Autores(Id)
);

CREATE TABLE Libros_Temas (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Libro INT FOREIGN KEY REFERENCES Libros(Id),
    Tema INT FOREIGN KEY REFERENCES Temas(Id)
);

CREATE TABLE Existencias (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Libro INT FOREIGN KEY REFERENCES Libros(Id),
    Ejemplares INT NOT NULL
);

CREATE TABLE Estados (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre_Estado NVARCHAR(100) NOT NULL
);

CREATE TABLE Estados_Existencias (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Existencia INT FOREIGN KEY REFERENCES Existencias(Id),
    Estado INT FOREIGN KEY REFERENCES Estados(Id),
    Fecha_Cambio DATETIME DEFAULT GETDATE()
);

CREATE TABLE Usuarios (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Documento NVARCHAR(50) UNIQUE,
    Direccion NVARCHAR(200),
    Telefono NVARCHAR(20),
    Correo NVARCHAR(150) UNIQUE,
    Contraseña NVARCHAR(255) NOT NULL, -- HASH de la clave
    Fecha_Nacimiento DATE
);

CREATE TABLE Tipos_Prestamos (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion NVARCHAR(100)
);

CREATE TABLE Prestamos (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Usuario INT FOREIGN KEY REFERENCES Usuarios(Id),
    Tipo_Prestamo INT FOREIGN KEY REFERENCES Tipos_Prestamos(Id),
    Existencia INT FOREIGN KEY REFERENCES Existencias(Id),
    Fecha_Prestamo DATE NOT NULL,
    Fecha_Devolucion DATE,
    Fecha_Entrega_Real DATE
);

CREATE TABLE Sanciones (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Usuario INT FOREIGN KEY REFERENCES Usuarios(Id),
    Descripcion NVARCHAR(MAX),
    Fecha_Inicio DATE,
    Fecha_Fin DATE
);

-- AUTORES
INSERT INTO Autores (Nombre, Nacionalidad) VALUES
('Gabriel García Márquez', 'Colombiana'),
('Isabel Allende', 'Chilena'),
('Mario Vargas Llosa', 'Peruana'),
('Julio Cortázar', 'Argentina'),
('J. K. Rowling', 'Británica');

-- TEMAS
INSERT INTO Temas (Nombre_Tema, Area_Conocimiento) VALUES
('Realismo Mágico', 'Literatura Latinoamericana'),
('Fantasía', 'Literatura Universal'),
('Historia', 'Ciencias Sociales'),
('Ciencia Ficción', 'Ciencias Exactas'),
('Literatura Infantil', 'Educación');

-- EDITORIALES
INSERT INTO Editoriales (Nombre_Editorial, Sitio_Web) VALUES
('Editorial Sudamericana', 'http://sudamericana.com'),
('Alfaguara', 'http://alfaguara.com'),
('Planeta', 'http://planeta.com'),
('Penguin Random House', 'http://penguinrandomhouse.com'),
('Seix Barral', 'http://seixbarral.com');

-- PAISES
INSERT INTO Paises (Nombre_Pais, Region) VALUES
('Colombia', 'América del Sur'),
('Chile', 'América del Sur'),
('Perú', 'América del Sur'),
('Argentina', 'América del Sur'),
('Reino Unido', 'Europa');

-- TIPOS
INSERT INTO Tipos (Nombre_Tipo) VALUES
('Novela'),
('Cuento'),
('Ensayo'),
('Poesía'),
('Biografía');

-- LIBROS
INSERT INTO Libros (Editorial, Pais, Tipo, Isbn, Titulo, Edicion, Fecha_Lanzamiento) VALUES
(1, 1, 1, '9780307474728', 'Cien Años de Soledad', '1ra', '1967-05-30'),
(2, 2, 1, '9789505116024', 'La Casa de los Espíritus', '2da', '1982-01-01'),
(3, 3, 1, '9788432227764', 'La Ciudad y los Perros', '3ra', '1963-01-01'),
(4, 4, 2, '9788497592208', 'Bestiario', '1ra', '1951-01-01'),
(5, 5, 2, '9780747532743', 'Harry Potter y la Piedra Filosofal', '1ra', '1997-06-26');

-- LIBROS_AUTORES
INSERT INTO Libros_Autores (Libro, Autor) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- LIBROS_TEMAS
INSERT INTO Libros_Temas (Libro, Tema) VALUES
(1, 1),
(2, 1),
(3, 3),
(4, 4),
(5, 2);

-- EXISTENCIAS
INSERT INTO Existencias (Libro, Ejemplares) VALUES
(1, 10),
(2, 7),
(3, 5),
(4, 8),
(5, 12);

-- ESTADOS
INSERT INTO Estados (Nombre_Estado) VALUES
('Disponible'),
('Prestado'),
('En reparación'),
('Perdido'),
('Reservado');

-- ESTADOS_EXISTENCIAS
INSERT INTO Estados_Existencias (Existencia, Estado) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 3),
(5, 1);

-- USUARIOS
INSERT INTO Usuarios (Nombre, Documento, Direccion, Telefono, Correo, Contraseña, Fecha_Nacimiento) VALUES
('Juan Pérez', '100200300', 'Calle Falsa 123', '3001234567', 'juan.perez@mail.com', 'hash1', '1990-05-20'),
('María Gómez', '200300400', 'Carrera 45 #12', '3019876543', 'maria.gomez@mail.com', 'hash2', '1985-11-10'),
('Carlos Ramírez', '300400500', 'Av. 7 #89', '3024567890', 'carlos.ramirez@mail.com', 'hash3', '1992-02-15'),
('Ana Torres', '400500600', 'Calle 9 #32', '3036549871', 'ana.torres@mail.com', 'hash4', '2000-09-25'),
('Luis Fernández', '500600700', 'Transv. 21 #14', '3047412589', 'luis.fernandez@mail.com', 'hash5', '1995-03-30');

-- TIPOS_PRESTAMOS
INSERT INTO Tipos_Prestamos (Descripcion) VALUES
('Consulta en sala'),
('Préstamo a domicilio'),
('Préstamo interbibliotecario'),
('Reserva especial'),
('Consulta restringida');

-- PRESTAMOS
INSERT INTO Prestamos (Usuario, Tipo_Prestamo, Existencia, Fecha_Prestamo, Fecha_Devolucion, Fecha_Entrega_Real) VALUES
(1, 2, 1, '2025-09-01', '2025-09-15', NULL),
(2, 1, 2, '2025-09-05', '2025-09-05', '2025-09-05'),
(3, 2, 3, '2025-08-20', '2025-09-03', '2025-09-02'),
(4, 3, 4, '2025-09-10', '2025-09-24', NULL),
(5, 4, 5, '2025-09-12', '2025-09-26', NULL);

-- SANCIONES
INSERT INTO Sanciones (Usuario, Descripcion, Fecha_Inicio, Fecha_Fin) VALUES
(1, 'Retraso en la devolución de "Cien Años de Soledad"', '2025-09-16', '2025-09-23'),
(2, 'Mal estado del ejemplar "La Casa de los Espíritus"', '2025-09-07', '2025-09-14'),
(3, 'Devolución tardía de "Harry Potter y la Piedra Filosofal"', '2025-09-04', '2025-09-11'),
(4, 'Pérdida del ejemplar "Bestiario"', '2025-09-01', '2025-09-30'),
(5, 'Incumplimiento de reglas de consulta en sala', '2025-08-25', '2025-09-05');