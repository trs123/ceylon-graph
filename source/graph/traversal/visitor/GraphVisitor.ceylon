import graph {
	Edge,
	AdjacencyGraph,
	IncidenceGraph
}
import graph.traversal {
	VertexTraversal,
	GraphTraversal,
	EdgeTraversal
}

by ("ThorstenSeitz")
shared interface GraphVisitor<V> {

	shared formal void initializeVertex(V vertex);
	shared formal void examineVertex(V vertex);
	shared formal void discoverVertex(V vertex);
	shared formal void finishVertex(V vertex);
}

by ("ThorstenSeitz")
shared interface VertexVisitor<V> satisfies GraphVisitor<V>
		given V satisfies Object {

	shared VertexTraversal<V,G> vertexTraversal<G>(GraphTraversal<V,G> traversal)
			given G satisfies AdjacencyGraph<V> {
		return VertexTraversal(traversal, this);
	}

	shared formal void examineEdge(V source, V target);
	shared formal void treeEdge(V source, V target);
	shared formal void nonTreeEdge(V source, V target);
	shared formal void backEdge(V source, V target);
	shared formal void forwardEdge(V source, V target);
}

by ("ThorstenSeitz")
shared interface EdgeVisitor<V,E> satisfies GraphVisitor<V>
		given V satisfies Object
		given E satisfies Edge<V,E> {

	shared EdgeTraversal<V,E,G> edgeTraversal<G>(GraphTraversal<V,G> traversal)
			given G satisfies IncidenceGraph<V,E> {
		return EdgeTraversal<V,E,G>(traversal, this);
	}

	shared formal void examineEdge(E edge);
	shared formal void treeEdge(E edge);
	shared formal void nonTreeEdge(E edge);
	shared formal void backEdge(E edge);
	shared formal void forwardEdge(E edge);
}
