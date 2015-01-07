import graph {
	AdjacencyGraph
}

by ("ThorstenSeitz")
shared class VertexPropagator<V,G>(G graph) satisfies Propagator<V,V>
		given V satisfies Object
		given G satisfies AdjacencyGraph<V> {

	shared actual {V*} adjacentItems(V vertex) => graph.neighbors(vertex);

	shared actual V target(V vertex) => vertex;
}
