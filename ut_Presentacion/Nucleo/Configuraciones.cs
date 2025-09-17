using Dominio.Nucleo;

namespace PruebasLibreria.Nucleos
{
    public class Configuracion
    {
        private static Dictionary<string, string>? datos = null;

        public static string ObtenerValor(string clave)
        {
            string respuesta = "";
            if (datos == null)
                Cargar();
            respuesta = datos![clave].ToString();
            return respuesta;
        }

        public static void Cargar()
        {
            if (!File.Exists(DatosGenerales.RutaJson))
                return;
            datos = new Dictionary<string, string>();
            StreamReader jsonStream = File.OpenText(DatosGenerales.RutaJson);
            var json = jsonStream.ReadToEnd();
            datos = JsonConversor.ConvertirAObjeto<Dictionary<string, string>>(json)!;
        }
    }
}

/*
if (!File.Exists(DatosGenerales.ruta_json))
    return;
datos = new Dictionary<string, string>();
StreamReader jsonStream = File.OpenText(DatosGenerales.ruta_json);
*/