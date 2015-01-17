import graph {
	Edge,
	AdjacencyGraph,
	IncidenceGraph
}
import graph.traversal.propagator {
	EdgePropagator,
	EdgePropagatorFactory,
	Propagator,
	VertexPropagator,
	VertexPropagatorFactory
}
import graph.traversal.visitor {
	VertexVisitor,
	EdgeVisitor
}

by ("ThorstenSeitz")
shared interface GraphTraversal<V,G>
		given V satisfies Object
		given G satisfies AdjacencyGraph<V> {

	shared formal G graph;
	shared formal V? next();
}

"Graph traversal using a [[Propagator]] to abstract from propagating to neighbors via adjacent vertices
 or incident edges."
by ("ThorstenSeitz")
shared interface PropagatorBasedTraversal<V,G,out P,out Adjacency> satisfies GraphTraversal<V,G>
		given V satisfies Object
		given G satisfies AdjacencyGraph<V>
		given P satisfies Propagator<V,Adjacency> {

	shared formal P propagatorFor(V vertex);
}

by ("ThorstenSeitz")
shared abstract class TraversalWrapper<V,G>(GraphTraversal<V,G> traversal)
		satisfies GraphTraversal<V,G>
		given V satisfies Object
		given G satisfies AdjacencyGraph<V> {

	shared actual G graph => traversal.graph;
	shared actual V? next() => traversal.next();
}

by ("ThorstenSeitz")
shared class VertexTraversal<V,G>(GraphTraversal<V,G> traversal, VertexVisitor<V> visitor)
		extends TraversalWrapper<V,G>(traversal)
		satisfies PropagatorBasedTraversal<V,G,VertexPropagator<V,G>,V>
		given V satisfies Object
		given G satisfies AdjacencyGraph<V> {

	VertexPropagatorFactory<V,G> factory => VertexPropagatorFactory(graph, visitor);
	shared actual VertexPropagator<V,G> propagatorFor(V vertex) => factory.propagator(vertex);
}

by ("ThorstenSeitz")
shared class EdgeTraversal<V,E,G>(GraphTraversal<V,G> traversal, EdgeVisitor<V,E> visitor)
		extends TraversalWrapper<V,G>(traversal)
		satisfies PropagatorBasedTraversal<V,G,EdgePropagator<V,E,G>,E>
		given V satisfies Object
		given E satisfies Edge<V,E>
		given G satisfies IncidenceGraph<V,E> {

	EdgePropagatorFactory<V,E,G> factory => EdgePropagatorFactory(graph, visitor);
	shared actual EdgePropagator<V,E,G> propagatorFor(V vertex) => factory.propagator(vertex);
}
