import graph {
	AdjacencyGraph,
	Edge,
	IncidenceGraph
}
import graph.traversal.propagator {
	VertexPropagatorFactory,
	VertexPropagator,
	EdgePropagatorFactory,
	EdgePropagator,
	Propagator
}
import graph.traversal.visitor {
	VertexVisitor,
	EdgeVisitor
}

by ("ThorstenSeitz")
shared interface GraphIterator<V,G,I> of I
		satisfies Iterator<V>
		given V satisfies Object
		given G satisfies AdjacencyGraph<V> {

	shared formal G graph;
	shared formal V start;
}

"Graph iterator using a [[Propagator]] to abstract from propagating to neighbors via adjacent vertices
 or incident edges."
by ("ThorstenSeitz")
shared interface PropagatorBasedIterator<V,G,P,Adjacency,I> of I
		satisfies GraphIterator<V,G,I>
		given V satisfies Object
		given G satisfies AdjacencyGraph<V>
		given P satisfies Propagator<V,Adjacency> {

	shared formal P propagatorFor(V vertex);
}

by ("ThorstenSeitz")
shared interface VertexIterator<V,G,Traversal> of Traversal
		satisfies PropagatorBasedIterator<V,G,VertexPropagator<V,G>,V,Traversal>
		given V satisfies Object
		given G satisfies AdjacencyGraph<V> {

	shared default VertexVisitor<V> visitor {
		object vertexVisitor satisfies VertexVisitor<V> {}
		return vertexVisitor;
	}
	shared actual VertexPropagator<V,G> propagatorFor(V vertex) => factory.propagator(vertex);
	VertexPropagatorFactory<V,G> factory => VertexPropagatorFactory(graph, visitor);
}

by ("ThorstenSeitz")
shared interface EdgeIterator<V,E,G,Traversal> of Traversal
		satisfies PropagatorBasedIterator<V,G,EdgePropagator<V,E,G>,E,Traversal>
		given V satisfies Object
		given E satisfies Edge<V,E>
		given G satisfies IncidenceGraph<V,E> {

	shared default EdgeVisitor<V,E> visitor {
		object edgeVisitor satisfies EdgeVisitor<V,E> {}
		return edgeVisitor;
	}
	shared actual EdgePropagator<V,E,G> propagatorFor(V vertex) => factory.propagator(vertex);
	EdgePropagatorFactory<V,E,G> factory => EdgePropagatorFactory(graph, visitor);
}
