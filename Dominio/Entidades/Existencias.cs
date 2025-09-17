using System;
using System.Collections.Generic;

namespace Dominio.Entidades;

public partial class Existencias
{
    public int Id { get; set; }

    public int? Libro { get; set; }

    public string CodigoEjemplar { get; set; } = null!;

    public virtual ICollection<EstadosExistencias> EstadoExistencia { get; set; } = new List<EstadosExistencias>();

    public virtual Libros? LibroNavigation { get; set; }

    public virtual ICollection<Prestamos> Prestamo { get; set; } = new List<Prestamos>();
}
