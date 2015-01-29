import graph {
	AdjacencyGraph,
	Edge,
	IncidenceGraph
}
import graph.traversal.iterator {
	GraphIterator
}
import graph.traversal.visitor {
	TraversalVisitor,
	VertexVisitor,
	EdgeVisitor
}

by ("ThorstenSeitz")
shared interface GraphTraversal<V,G,Visitor>
		satisfies Iterable<V>
		given V satisfies Object
		given G satisfies AdjacencyGraph<V>
		given Visitor satisfies TraversalVisitor<V> {

	shared formal G graph;
	shared formal V start;
	shared formal Visitor visitor;
	shared formal GraphIterator<V,G,Visitor> basicGraphIterator(); // TODO: should not be part of interface OR startWith() should be called automatically

	shared actual Iterator<V> iterator() {
		GraphIterator<V,G,Visitor> it = basicGraphIterator();
		it.startWith(start);
		return it;
	}

	"Answer the vertices of the `graph` reached by this traversal starting by `start` in traversal order."
	shared default {V*} vertices => this;

	"Traverse all vertices according to this traversal."
	shared void traverse() {
		Iterator<V> it = iterator();
		while (!is Finished item = it.next()) {}
	}
}

by ("ThorstenSeitz")
shared interface VertexTraversal<V,G>
		satisfies GraphTraversal<V,G,VertexVisitor<V>>
		given V satisfies Object
		given G satisfies AdjacencyGraph<V> {
}

by ("ThorstenSeitz")
shared interface EdgeTraversal<V,E,G>
		satisfies GraphTraversal<V,G,EdgeVisitor<V,E>>
		given V satisfies Object
		given E satisfies Edge<V,E>
		given G satisfies IncidenceGraph<V,E> {
}
