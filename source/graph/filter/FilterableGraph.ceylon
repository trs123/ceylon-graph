import ceylon.collection {
	HashSet,
	MutableSet
}

import graph {
	AdjacencyGraph,
	IncidenceGraph,
	Edge
}

"An [[AdjacencyGraph]] which can be filtered."
by ("ThorstenSeitz")
shared interface FilterableAdjacencyGraph<V,G> of G
		satisfies AdjacencyGraph<V>
		given V satisfies Object
		given G satisfies AdjacencyGraph<V> {

	"Answer filtered subgraph containing only the vertices for which the predicate answers true."
	shared formal G filterVertices(Boolean predicate(V vertex));
}

"An [[IncidenceGraph]] which can be filtered."
by ("ThorstenSeitz")
shared interface FilterableIncidenceGraph<V,E,G> of G
		satisfies IncidenceGraph<V,E>
		given V satisfies Object
		given E satisfies Edge<V,E>
		given G satisfies AdjacencyGraph<V> {

	"Answer filtered subgraph containing only the vertices for which the predicate answers true."
	shared formal G filterVertices(Boolean predicate(V vertex));

	"Answer filtered subgraph containing only the edges for which the predicate answers true."
	shared formal G filterEdges(Boolean predicate(E edge));

	"Answer subgraph without vertices that have no edges (neither out- nor ingoing)."
	shared G dropUnconnectedVertices() {
		MutableSet<V> connectedVertices = HashSet<V>();
		for (E edge in edges) {
			connectedVertices.add(edge.source);
			connectedVertices.add(edge.target);
		}
		return filterVertices((V vertex) => vertex in connectedVertices);
	}
}
