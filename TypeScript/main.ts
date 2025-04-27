/*************************************************************** ThisType<T> **************************************************************/
/**
 * Ejemplo de uso de `ThisType<T>` en TypeScript para definir el tipo de `this` en métodos de un objeto.
 * 
 * `ThisType<T>` es una utilidad de TypeScript que permite especificar explícitamente el tipo del contexto `this`
 * dentro de los métodos de un objeto. Es útil en objetos literales, mixins, o frameworks como Vue.js, donde
 * los métodos necesitan acceder a otras propiedades o métodos del mismo objeto.
 * 
 * **Requisitos**:
 * - La opción `--noImplicitThis` debe estar habilitada en `tsconfig.json` para evitar que `this` sea inferido como `any`.
 */
interface Counter {
  /** El valor actual del contador */
  amount: number;
  /** Incrementa el valor del contador en 1 */
  inc: () => void;
  /** Decrementa el valor del contador en 1 */
  dec: () => void;
}

/**
 * Tipo que combina la interfaz `Counter` con `ThisType<Counter>` para tipar el contexto `this`.
 */
type CounterWithThis = Counter & ThisType<Counter>;

/**
 * Implementación del objeto contador.
 * Los métodos `inc` y `dec` usan `this` para modificar la propiedad `amount`.
 * Gracias a `ThisType<Counter>`, TypeScript valida correctamente el acceso a `amount`.
 */
const counter: CounterWithThis = {
  amount: 0,
  inc() {
    this.amount++;
  },
  dec() {
    this.amount--;
  },
};

counter.inc();
counter.dec();
console.log(counter.amount);
/***************************************************************** End ThisType<T> **************************************************************/

function main() {
  /** Here we will write new things learned from TypeScript with basic examples */
}

main();
