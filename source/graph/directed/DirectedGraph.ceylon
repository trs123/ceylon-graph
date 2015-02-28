import graph {
	IncidenceGraph
}

by("ThorstenSeitz")
shared interface DirectedGraph<V,E> satisfies IncidenceGraph<V,E>
		given V satisfies Object
		given E satisfies DirectedEdge<V, E> {

	shared default {E*} outgoingEdgesOf(V vertex) {
		return adjacentEdges(vertex).filter((E edge) => edge.source == vertex);
	}

	shared default {E*} incomingEdgesOf(V vertex) {
		return adjacentEdges(vertex).filter((E edge) => edge.target == vertex);
	}
}
