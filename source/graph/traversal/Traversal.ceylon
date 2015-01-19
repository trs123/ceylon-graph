import graph {
	AdjacencyGraph
}
import graph.traversal.iterator {
	GraphIterator
}

by ("ThorstenSeitz")
shared interface GraphTraversal<V,G,I>
		satisfies Iterable<V>
		given V satisfies Object
		given G satisfies AdjacencyGraph<V>
		given I satisfies GraphIterator<V,G,I> {

	shared formal G graph;
	shared formal V start;
	shared formal I graphIterator(G graph, V start);

	shared actual Iterator<V> iterator() => graphIterator(graph, start);

	shared default {V*} vertices => this;
}
