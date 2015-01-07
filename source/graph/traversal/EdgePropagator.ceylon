import graph {
	Edge,
	IncidenceGraph
}

by ("ThorstenSeitz")
shared class EdgePropagator<V,E,G>(G graph) satisfies Propagator<V,E>
		given V satisfies Object
		given E satisfies Edge<V, E>
		given G satisfies IncidenceGraph<V,E> {

	shared actual {E*} adjacentItems(V vertex) => graph.adjacentEdges(vertex);

	shared actual V target(E edge) => edge.target;
}
