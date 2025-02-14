
// Muchas veces habran asignaciones internas y manualmente tendremos que liberar una por una.
// fn parse(allocator: Allocator, input: []const u8) !Something {
// 	const state = State{
// 		.buf = try allocator.alloc(u8, 512),
// 		.nesting = try allocator.alloc(NestType, 10),
// 	};
// 	defer allocator.free(state.buf);
// 	defer allocator.free(state.nesting);

// 	return parseInternal(allocator, state, input);
// }


// With Arena Allocator

// fn parse(allocator: Allocator, input: []const u8) !Something {
// 	// create an ArenaAllocator from the supplied allocator
// 	var arena = std.heap.ArenaAllocator.init(allocator);

// 	// this will free anything created from this arena
// 	defer arena.deinit();

// 	// create an std.mem.Allocator from the arena, this will be
// 	// the allocator we'll use internally
// 	const aa = arena.allocator();

// 	const state = State{
// 		// we're using aa here!
// 		.buf = try aa.alloc(u8, 512),

// 		// we're using aa here!
// 		.nesting = try aa.alloc(NestType, 10),
// 	};

// 	// we're passing aa here, so we're guaranteed that
// 	// any other allocation will be in our arena
// 	return parseInternal(aa, state, input);
// }

// El ArenaAllocatortoma un asignador secundario, en este caso el asignador que se pasó a init, y crea un nuevo std.mem.Allocator. Cuando este nuevo asignador se utiliza para asignar o crear memoria, no necesitamos llamar a freeo destroy. Todo se liberará cuando llamemos deinita arena. De hecho, el freey destroyde un ArenaAllocator no hace nada.

// El ArenaAllocatordebe usarse con cuidado. Dado que no hay forma de liberar asignaciones individuales, debe asegurarse de que deinitse llamará a la arena dentro de un crecimiento de memoria razonable. Curiosamente, ese conocimiento puede ser interno o externo. Por ejemplo, en nuestro esqueleto anterior, aprovechar un ArenaAllocator tiene sentido desde dentro del analizador, ya que los detalles de la vida útil del estado son un asunto interno.

// Los asignadores como ArenaAllocator que tienen un mecanismo para liberar todas las asignaciones anteriores pueden romper la regla de que cada allocdebe tener un free. Sin embargo, si recibe un , std.mem.Allocatorno debe hacer suposiciones sobre la implementación subyacente.