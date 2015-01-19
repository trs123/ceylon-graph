import graph {
	AdjacencyGraph
}
import graph.traversal.iterator {
	GraphIterator
}

by ("ThorstenSeitz")
shared interface GraphTraversal<V,G>
		satisfies Iterable<V>
		given V satisfies Object
		given G satisfies AdjacencyGraph<V> {

	shared formal G graph;
	shared formal V start;
	shared formal GraphIterator<V,G> graphIterator(G graph, V start);

	shared actual Iterator<V> iterator() => graphIterator(graph, start);

	"Answer the vertices of the `graph` reached by this traversal starting by `start` in traversal order."
	shared default {V*} vertices => this;
}
