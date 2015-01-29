import graph {
	Edge
}

"A `TraversalVisitor` is called during a [[graph.traversal::GraphTraversal]] when encountering vertices."
by ("ThorstenSeitz")
shared interface TraversalVisitor<V> {

	shared default void examineVertex(V vertex) {}
	shared default void discoverVertex(V vertex) {}
	shared default void finishVertex(V vertex) {}
}

// TODO: rename to AdjacencyVisitor?
"A `VertexVisitor` is a [[TraversalVisitor]] with additional callbacks when encountering neighbors."
by ("ThorstenSeitz")
shared interface VertexVisitor<V> satisfies TraversalVisitor<V>
		given V satisfies Object {

	shared default void examineEdge(V source, V target) {}
	shared default void treeEdge(V source, V target) {}
	shared default void nonTreeEdge(V source, V target) {}
	shared default void backEdge(V source, V target) {}
	shared default void forwardEdge(V source, V target) {}
}

// TODO: rename to IncidenceVisitor?
"An `EdgeVisitor` is a [[TraversalVisitor]] with additional callbacks when encountering out-edges."
by ("ThorstenSeitz")
shared interface EdgeVisitor<V,E> satisfies TraversalVisitor<V>
		given V satisfies Object
		given E satisfies Edge<V,E> {

	shared default void examineEdge(E edge) {}
	shared default void treeEdge(E edge) {}
	shared default void nonTreeEdge(E edge) {}
	shared default void backEdge(E edge) {}
	shared default void forwardEdge(E edge) {}
}

"This object contains some useful visitors. Note that wrapping them into a parent object is only necessary
 to avoid a compiler backend type inference error."
by ("ThorstenSeitz")
shared object traversalVisitors {

	"Empty vertex visitor doing nothing."
	by ("ThorstenSeitz")
	shared VertexVisitor<V> nullVertexVisitor<V>()
			given V satisfies Object {
		object nullVisitor satisfies VertexVisitor<V> {}
		return nullVisitor;
	}

	"Empty edge visitor doing nothing."
	by ("ThorstenSeitz")
	shared EdgeVisitor<V,E> nullEdgeVisitor<V,E>()
			given V satisfies Object
			given E satisfies Edge<V,E> {
		object nullVisitor satisfies EdgeVisitor<V,E> {}
		return nullVisitor;
	}
}
