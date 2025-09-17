using System;
using System.Collections.Generic;

namespace Dominio.Entidades;

public partial class Paises
{
    public int Id { get; set; }

    public string NombrePais { get; set; } = null!;

    public virtual ICollection<Libros> Libro { get; set; } = new List<Libros>();
}
