const std = @import("std");

// IMPORTANT:

// La mayoría de los programas que escribas utilizarán tres "áreas" de memoria. La primera es el espacio global, que es donde se almacenan las constantes del programa, incluidas las cadenas literales. Todos los datos globales están integrados en el binario, se conocen completamente en tiempo de compilación (y, por lo tanto, en tiempo de ejecución) y son inmutables. Estos datos existen durante toda la vida útil del programa y nunca necesitan más o menos memoria. Aparte del impacto que tiene en el tamaño de nuestro binario, esto no es algo de lo que debamos preocuparnos en absoluto.

// La segunda área de la memoria es la pila de llamadas, que es el tema de esta parte. La tercera área es el montón, que es el tema de la siguiente parte.

// Obtuve:
// User 2 has power of 20
// User 9114745905793990681 has power of 0

// Puede obtener resultados diferentes, pero según mi salida, user1 ha heredado los valores de user2y user2los valores no tienen sentido. El problema clave con este código es que User.initdevuelve la dirección del usuario local, &user. Esto se denomina puntero colgante, un puntero que hace referencia a una memoria no válida. Es la fuente de muchos errores de segmentación.

// Cuando se extrae un marco de pila de la pila de llamadas, todas las referencias que tengamos a esa memoria no son válidas. El resultado de intentar acceder a esa memoria no está definido. Probablemente obtengas datos sin sentido o un error de segmentación. Podríamos intentar darle algún sentido a mi salida, pero no es un comportamiento en el que querríamos, o incluso podríamos, confiar.

// Un desafío con este tipo de error es que, en lenguajes con recolectores de basura, el código anterior funciona perfectamente. Go, por ejemplo, detectaría que el local usersobrevive a su alcance, la initfunción, y garantizaría su validez durante el tiempo que sea necesario (cómo Go hace esto es un detalle de implementación, pero tiene algunas opciones, incluido mover los datos al montón, que es de lo que trata la siguiente parte).

// El otro problema, lamento decirlo, es que puede ser un error difícil de detectar. En nuestro ejemplo anterior, claramente estamos devolviendo la dirección de un local. Pero ese comportamiento puede ocultarse dentro de una función anidada y tipos de datos complejos.

pub fn main() void {
    const user1 = User.init(1, 10);
    const user2 = User.init(2, 20);

    std.debug.print("User {d} has power of {d}\n", .{ user1.id, user1.power });
    std.debug.print("User {d} has power of {d}\n", .{ user2.id, user2.power });
}

pub const User = struct {
    id: u64,
    power: i32,

    fn init(id: u64, power: i32) *User {
        var user = User{
            .id = id,
            .power = power,
        };
        return &user;
    }
};
