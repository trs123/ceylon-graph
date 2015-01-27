import graph {
	AdjacencyGraph,
	Edge,
	IncidenceGraph
}
import graph.traversal.iterator {
	VertexIterator,
	BfsIterator,
	EdgeIterator
}
import graph.traversal.propagator {
	VertexPropagator,
	EdgePropagator
}
import graph.traversal.visitor {
	VertexVisitor,
	EdgeVisitor
}

"Breadth first traversal of an [[AdjacencyGraph]] using a [[VertexPropagator]]."
by ("ThorstenSeitz")
shared class BfsTraversal<V,G>(
	shared actual G graph,
	shared actual V start,
	shared actual VertexVisitor<V> visitor) satisfies VertexTraversal<V,G>
		given V satisfies Object
		given G satisfies AdjacencyGraph<V> {

	shared actual VertexIterator<V,G> basicGraphIterator() {
		object bfs
				extends BfsIterator<V,G,V,VertexPropagator<V,G>,VertexVisitor<V>>()
				satisfies VertexIterator<V,G> {
			shared actual G graph => outer.graph;
			shared actual VertexVisitor<V> visitor => outer.visitor;
		}
		return bfs;
	}
}

"Breadth first traversal of an [[IncidenceGraph]] using an [[EdgePropagator]]."
by ("ThorstenSeitz")
shared class BfsEdgeTraversal<V,E,G>(
	shared actual G graph,
	shared actual V start,
	shared actual EdgeVisitor<V,E> visitor) satisfies EdgeTraversal<V,E,G>
		given V satisfies Object
		given E satisfies Edge<V,E>
		given G satisfies IncidenceGraph<V,E> {

	shared actual EdgeIterator<V,E,G> basicGraphIterator() {
		object bfs
				extends BfsIterator<V,G,E,EdgePropagator<V,E,G>,EdgeVisitor<V,E>>()
				satisfies EdgeIterator<V,E,G> {
			shared actual G graph => outer.graph;
			shared actual EdgeVisitor<V,E> visitor => outer.visitor;
		}
		return bfs;
	}
}
