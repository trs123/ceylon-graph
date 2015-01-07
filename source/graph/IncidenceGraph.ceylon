"A graph with explicit edges.

 The number of vertices and edges may be infinite in which case the user has to take care not to call methods which
 will not return (this is similar to an [[ceylon.language::Iterable]] which may contain an infinite number of elements).

 The same applies for the neighbors or adjacent edges of a vertex."
by("ThorstenSeitz")
shared interface IncidenceGraph<V,E> satisfies AdjacencyGraph<V>
		given V satisfies Object
		given E satisfies Edge<V, E> {

	"All edges of the graph."
	shared formal {E*} edges;

	"The adjacent edges of the given vertex. A directed edge is adjacent if it is outgoing.
	 The edges are answered such that the following conditions hold:
	     edge.source == vertex
	     neighbors(vertex).contains(edge.target)"
	shared default {E*} adjacentEdges(V vertex) {
		return edges.filter((E edge) => edge.isIncident(vertex)).map((E edge) => edge.source == vertex then edge else edge);
	}

	"Apply action(E) for each adjacent edge of the given vertex."
	shared void forEachAdjacentEdge(V vertex, void action(E edge)) {
		for (E edge in adjacentEdges(vertex)) {
			action(edge);
		}
	}

	// Implementation note: The default implementation is based on [[adjacentEdges]].
	shared actual default {V*} neighbors(V vertex) {
		return adjacentEdges(vertex).map(Edge<V, E>.target);
	}

	// Implementation note: The default implementation is based on [[adjacentEdges]].
	shared actual default Boolean hasNeighbors(V vertex) {
		return !adjacentEdges(vertex).empty;
	}

	// Implementation note: The default implementation is based on [[adjacentEdges]].
	shared actual default Boolean containsEdge(V source, V target) {
		return adjacentEdges(source).any((E edge) => edge.target == target);
	}
}
