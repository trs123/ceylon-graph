import graph {
	Edge,
	IncidenceGraph
}

by("ThorstenSeitz")
shared interface Multigraph<V,E> satisfies IncidenceGraph<V,E>
		given V satisfies Object
		given E satisfies Edge<V, E> {

	shared formal {E*} edgesConnecting(V source, V target);

	shared default Integer occurrencesOfEdge(V source, V target) {
		return edgesConnecting(source, target).size;
	}
}
