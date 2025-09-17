using Dominio.Entidades;

namespace PruebasLibreria.Nucleos
{
    public class EntidadesNucleo
    {
        public static Auditorias Auditoria()
        {
            var entidad = new Auditorias();
            entidad.Tabla = "Libros";
            entidad.Operacion = "INSERT";
            entidad.DatosAntiguos = "{}";
            entidad.DatosNuevos = "{Titulo:'Libro de prueba'}";
            entidad.UsuarioBd = "usuario_test";
            entidad.Fecha = DateTime.Now;
            return entidad;
        }

        public static Autores Autor()
        {
            var entidad = new Autores();
            entidad.Nombre = "Autor de Prueba";
            entidad.Nacionalidad = "Colombiana";
            return entidad;
        }

        public static Editoriales Editorial()
        {
            var entidad = new Editoriales();
            entidad.NombreEditorial = "Editorial Prueba";
            return entidad;
        }

        public static Estados Estado()
        {
            var entidad = new Estados();
            entidad.NombreEstado = "Disponible";
            return entidad;
        }

        public static EstadosExistencias EstadoExistencia()
        {
            var entidad = new EstadosExistencias();
            entidad.Estado = 1;   // id de Estado
            entidad.Existencia = 1; // id de Ejemplar
            entidad.FechaCambio = DateTime.Now;
            return entidad;
        }

        public static Existencias Existencia()
        {
            var entidad = new Existencias();
            entidad.CodigoEjemplar = "EJ-" + DateTime.Now.ToString("yyyyMMddhhmmss");
            entidad.Libro = 1; // id libro de prueba
            return entidad;
        }

        public static Libros Libro()
        {
            var entidad = new Libros();
            entidad.Titulo = "Libro de Prueba";
            entidad.Isbn = "ISBN-" + DateTime.Now.ToString("yyyyMMddhhmmss");
            entidad.Edicion = "Primera";
            entidad.FechaLanzamiento = DateOnly.FromDateTime(DateTime.Now);
            entidad.Editorial = 1;
            entidad.Pais = 1;
            entidad.Tipo = 1;
            return entidad;
        }

        public static LibrosAutores LibroAutor()
        {
            var entidad = new LibrosAutores();
            entidad.Libro = 1;
            entidad.Autor = 1;
            return entidad;
        }

        public static LibrosTemas LibroTema()
        {
            var entidad = new LibrosTemas();
            entidad.Libro = 1;
            entidad.Tema = 1;
            return entidad;
        }

        public static Paises Pais()
        {
            var entidad = new Paises();
            entidad.NombrePais = "Colombia";
            return entidad;
        }

        public static Prestamos Prestamo()
        {
            var entidad = new Prestamos();
            entidad.Usuario = 1;
            entidad.Existencia = 1;
            entidad.TipoPrestamo = 1;
            entidad.FechaPrestamo = DateOnly.FromDateTime(DateTime.Now);
            entidad.FechaDevolucion = DateOnly.FromDateTime(DateTime.Now.AddDays(7));
            return entidad;
        }

        public static Sanciones Sancion()
        {
            var entidad = new Sanciones();
            entidad.Usuario = 1;
            entidad.FechaInicio = DateOnly.FromDateTime(DateTime.Now);
            entidad.FechaFin = DateOnly.FromDateTime(DateTime.Now.AddDays(10));
            return entidad;
        }

        public static Temas Tema()
        {
            var entidad = new Temas();
            entidad.NombreTema = "Literatura";
            return entidad;
        }

        public static Tipos Tipo()
        {
            var entidad = new Tipos();
            entidad.NombreTipo = "Novela";
            return entidad;
        }

        public static TiposPrestamos TipoPrestamo()
        {
            var entidad = new TiposPrestamos();
            entidad.Descripcion = "Normal";
            return entidad;
        }

        public static Usuarios Usuario()
        {
            var entidad = new Usuarios();
            entidad.Nombre = "Usuario Prueba";
            entidad.Correo = "usuario" + DateTime.Now.Ticks + "@prueba.com";
            entidad.Documento = "DOC-" + DateTime.Now.Ticks;
            entidad.Contraseña = "123456";
            entidad.Direccion = "Calle Falsa 123";
            entidad.Telefono = "3001234567";
            entidad.Fecha_Nacimiento = new DateOnly(1990, 1, 1);
            return entidad;
        }
    }
}