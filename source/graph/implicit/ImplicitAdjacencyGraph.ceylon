import graph {
	AdjacencyGraph
}
import graph.traversal {
	GenericVertexTraversal=VertexTraversal,
	BfsTraversal
}
import graph.traversal.visitor {
	GenericVertexVisitor=VertexVisitor,
	traversalVisitors
}

"Implementation of an implicit adjacency graph defined by a root vertex and a neighbors function."
by ("ThorstenSeitz)")
shared class ImplicitAdjacencyGraph<V>(
	V root,
	shared actual default {V*} neighbors(V vertex))
		satisfies AdjacencyGraph<V>
		given V satisfies Object {

	// Aliases without type parameters
	shared interface VertexTraversal => GenericVertexTraversal<V,ImplicitAdjacencyGraph<V>>;
	shared interface VertexVisitor => GenericVertexVisitor<V>;
	shared VertexVisitor nullVertexVisitor => traversalVisitors.nullVertexVisitor<V>();

	"Breadth first traversal of the receiver."
	shared VertexTraversal bfsTraversal(
		V start,
		VertexVisitor visitor = nullVertexVisitor) => BfsTraversal(this, start, visitor);

	// Default implementation for accessing all vertices by using a breadth first traversal starting
	// from the root vertex.
	shared actual default {V*} vertices => bfsTraversal(root);
}
