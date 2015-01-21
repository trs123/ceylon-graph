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
	GraphPropagator
}
import graph.traversal.visitor {
	VertexVisitor,
	EdgeVisitor,
	GraphVisitor
}

by ("ThorstenSeitz")
shared interface GraphIterator<V,G,Visitor>
		satisfies Iterator<V>
		given V satisfies Object
		given G satisfies AdjacencyGraph<V>
		given Visitor satisfies GraphVisitor<V> {

	shared formal G graph;
	shared formal Visitor visitor;

	shared formal void startWith(V vertex);
}

"Graph iterator using a [[GraphPropagator]] to abstract from propagating to neighbors via adjacent vertices
 or incident edges."
by ("ThorstenSeitz")
shared interface PropagatorBasedIterator<V,G,P,Adjacency,Visitor>
		satisfies GraphIterator<V,G,Visitor>
		given V satisfies Object
		given G satisfies AdjacencyGraph<V>
		given P satisfies GraphPropagator<V,Adjacency>
		given Visitor satisfies GraphVisitor<V> {

	shared alias Propagator => GraphPropagator<V,Adjacency>;
	shared formal P propagatorFor(V vertex);
}

by ("ThorstenSeitz")
shared interface VertexIterator<V,G>
		satisfies PropagatorBasedIterator<V,G,VertexPropagator<V,G>,V,VertexVisitor<V>>
		given V satisfies Object
		given G satisfies AdjacencyGraph<V> {

	shared actual VertexPropagator<V,G> propagatorFor(V vertex) => factory.propagator(vertex);
	VertexPropagatorFactory<V,G> factory => VertexPropagatorFactory(graph, visitor);
}

by ("ThorstenSeitz")
shared interface EdgeIterator<V,E,G>
		satisfies PropagatorBasedIterator<V,G,EdgePropagator<V,E,G>,E,EdgeVisitor<V,E>>
		given V satisfies Object
		given E satisfies Edge<V,E>
		given G satisfies IncidenceGraph<V,E> {

	shared actual EdgePropagator<V,E,G> propagatorFor(V vertex) => factory.propagator(vertex);
	EdgePropagatorFactory<V,E,G> factory => EdgePropagatorFactory(graph, visitor);
}
