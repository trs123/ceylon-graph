import graph {
	Edge,
	IncidenceGraph
}
import graph.traversal.visitor {
	EdgeVisitor
}

by ("ThorstenSeitz")
shared class EdgePropagator<V,E,G>(G graph, EdgeVisitor<V,E> visitor, V source) extends GraphPropagator<V,E>(visitor, source)
		given V satisfies Object
		given E satisfies Edge<V,E>
		given G satisfies IncidenceGraph<V,E> {

	shared actual {E*} adjacencies => graph.adjacentEdges(source);

	shared actual V target(E edge) => edge.target;

	shared actual void backEdge(E edge) => visitor.backEdge(edge);

	shared actual void examineEdge(E edge) => visitor.examineEdge(edge);

	shared actual void forwardEdge(E edge) => visitor.forwardEdge(edge);

	shared actual void nonTreeEdge(E edge) => visitor.nonTreeEdge(edge);

	shared actual void treeEdge(E edge) => visitor.treeEdge(edge);
}

shared class EdgePropagatorFactory<V,E,G>(G graph, EdgeVisitor<V,E> visitor) extends PropagatorFactory<V,E,EdgePropagator<V,E,G>>(visitor)
		given V satisfies Object
		given E satisfies Edge<V,E>
		given G satisfies IncidenceGraph<V,E> {

	shared actual EdgePropagator<V,E,G> propagator(V source) => EdgePropagator(graph, visitor, source);
}
