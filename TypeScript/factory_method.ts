// 1. Situación
// Imagina que tu aplicación necesita enviar notificaciones, pero no sabes si será por email, SMS o push.
// Aquí es donde el Factory Method brilla.

interface INotification {
  send(message: string): void;
}

class EmailNotification implements INotification {
  send(message: string): void {
    console.log("Send from email.", message);
  }
}

class SMSNotification implements INotification {
  send(message: string): void {
    console.log("Send fron SMS.", message);
  }
}

// ===============================================
//         AQUÍ COMIENZA LA MAGIA DEL PATRÓN
// ===============================================

// El core del patron esta en esta clase NotificationCreator. Ya que es la clase que define la interfaz de creación de notificaciones.
// Ella define el método `sendNotification()`  correcto lo crea. Pero en ningún momento le estamos diciendo si es email o SMS.
// Aqui es donde se cumple el siguiente concepto: "creacional que proporciona una interfaz para crear objetos en una superclase"
abstract class NotificationCreator {
  abstract createNotification(): INotification;

  sendNotification(message: string) {
    const notification = this.createNotification();

    notification.send(message);
  }
}

class EmailCreator extends NotificationCreator {
  createNotification(): INotification {
    return new EmailNotification();
  }
}

class SMSCreator extends NotificationCreator {
  createNotification(): INotification {
    return new SMSNotification();
  }
}

// ===============================================
//         CÓDIGO CLIENTE
// ===============================================

function clientCode(creator: NotificationCreator, message: string) {
  // Esta función es el cliente del Factory Method. No sabe que tipo de notificación se va a crear.
  // Solo sabe que se va a crear una notificación y que se va a enviar un mensaje.
  creator.sendNotification(message);
}

// ----- En algún lugar de tu app -----
console.log("App: Configurada para usar notificaciones por Email.");
clientCode(new EmailCreator(), "¡Tu pedido ha sido enviado!");

console.log("App: Configurada para usar notificaciones por SMS.");
clientCode(new SMSCreator(), "¡Tu pedido ha sido enviado!");

// 2. Situación
// Imagina que estás construyendo un módulo de reportes para una aplicación de e-commerce. El sistema debe ser capaz de generar un reporte de ventas (que contiene datos como ID de producto, cantidad vendida y total) y luego exportarlo a diferentes formatos.

// Inicialmente, los formatos requeridos son CSV y JSON. Sin embargo, en el futuro se planea añadir más, como PDF y XML.

interface IExportFormat {
  download(data: string): void;
}

type ExporterConstructor = new () => IExportFormat;

class CSVExporter implements IExportFormat {
  download(data: string): void {
    console.log(`Descargando archivo CSV...`);
    console.log(data);
  }
}

class JSONExporter implements IExportFormat {
  download(data: string): void {
    console.log(`Descargando archivo JSON...`);
    console.log(data);
  }
}

class ExporterFactory<T extends Record<string, ExporterConstructor>> {
  constructor(private registeredExporters: T) {}

  createExporter<K extends keyof T>(type: K): IExportFormat {
    const ExporterClass = this.registeredExporters[type];

    if (!ExporterClass) {
      // Este error es ahora casi imposible de alcanzar gracias al tipado.
      throw new Error(`Formato no soportado: ${String(type)}`);
    }

    return new ExporterClass();
  }
}

// ===============================================
//         CÓDIGO CLIENTE
// ===============================================
//

const exporterConfig = {
  csv: CSVExporter,
  json: JSONExporter,
};

const exporter = new ExporterFactory(exporterConfig);

const csvExporter = exporter.createExporter("csv");
