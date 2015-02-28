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
by ("ThorstenSeitz")
shared class ImplicitAdjacencyGraph<V>(
	V root,
	shared actual default {V*} neighbors(V vertex))
		satisfies AdjacencyGraph<V>
		given V satisfies Object {

	// Aliases without type parameters
	shared interface VertexTraversal => GenericVertexTraversal<V,ImplicitAdjacencyGraph<V>>;
	shared interface VertexVisitor => GenericVertexVisitor<V>;

	shared actual default Boolean empty => false;

	"Breadth first traversal of the receiver."
	shared VertexTraversal bfsTraversal(
		V start,
		VertexVisitor visitor = traversalVisitors.nullVertexVisitor<V>()) => BfsTraversal(this, start, visitor);

}
