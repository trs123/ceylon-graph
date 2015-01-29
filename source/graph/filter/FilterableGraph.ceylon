import graph {
	AdjacencyGraph
}

"An [[AdjacencyGraph]] which can be filtered."
by ("ThorstenSeitz")
shared interface FilterableAdjacencyGraph<V,G> of G
		satisfies AdjacencyGraph<V>
		given V satisfies Object
		given G satisfies AdjacencyGraph<V> {

	"Filtered subgraph containing only the vertices for which the predicate answers true."
	shared formal G filterVertices(Boolean predicate(V vertex));
}
