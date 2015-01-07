import graph {
	IncidenceGraph
}

by("ThorstenSeitz")
shared interface UndirectedGraph<V,E> satisfies IncidenceGraph<V,E>
		given V satisfies Object
		given E satisfies UndirectedEdge<V, E> {

	shared default {E*} outgoingEdgesOf(V vertex) {
		return adjacentEdges(vertex).filter((E edge) => edge.source == vertex);
	}

	shared default {E*} incomingEdgesOf(V vertex) {
		return adjacentEdges(vertex).filter((E edge) => edge.target == vertex);
	}

	shared actual default {E*} edges => vertices.flatMap(outgoingEdgesOf);
}
