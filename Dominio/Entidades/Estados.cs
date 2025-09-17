using System;
using System.Collections.Generic;

namespace Dominio.Entidades;

public partial class Estados
{
    public int Id { get; set; }

    public string NombreEstado { get; set; } = null!;

    public virtual ICollection<EstadosExistencias> EstadoExistencia { get; set; } = new List<EstadosExistencias>();
}
