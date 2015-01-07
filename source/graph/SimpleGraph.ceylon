"A [[SimpleGraph]] contains at most one undirected or two directed (but opposite) edges between any two vertices."
by("ThorstenSeitz")
shared interface SimpleGraph<V,E> satisfies IncidenceGraph<V,E>
		given V satisfies Object
		given E satisfies Edge<V, E> {

	"Answer the edge between the given vertices if it exists. If an edge is answered then the following conditions hold:
	 	edge.source == source
	 	edge.target == target"
	shared formal E? edgeConnecting(V source, V target);

	shared actual default {E*} adjacentEdges(V vertex) {
		return neighbors(vertex).map((V neighbor) => edgeConnecting(vertex, neighbor)).coalesced;
	}
}
