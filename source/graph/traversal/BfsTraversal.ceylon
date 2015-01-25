import graph {
	AdjacencyGraph
}
import graph.traversal.iterator {
	VertexIterator,
	BfsIterator
}
import graph.traversal.propagator {
	VertexPropagator
}
import graph.traversal.visitor {
	VertexVisitor
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
