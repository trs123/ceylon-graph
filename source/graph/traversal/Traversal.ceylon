import graph {
	AdjacencyGraph,
	Edge,
	IncidenceGraph
}
import graph.traversal.iterator {
	GraphIterator
}
import graph.traversal.visitor {
	GraphVisitor,
	VertexVisitor,
	EdgeVisitor
}

by ("ThorstenSeitz")
shared interface GraphTraversal<V,G,Visitor>
		satisfies Iterable<V>
		given V satisfies Object
		given G satisfies AdjacencyGraph<V>
		given Visitor satisfies GraphVisitor<V> {

	shared formal G graph;
	shared formal V start;
	shared formal Visitor visitor;
	shared formal GraphIterator<V,G,Visitor> graphIterator();

	shared actual Iterator<V> iterator() {
		GraphIterator<V,G,Visitor> it = graphIterator();
		it.startWith(start);
		return it;
	}

	"Answer the vertices of the `graph` reached by this traversal starting by `start` in traversal order."
	shared default {V*} vertices => this;
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
