import graph {
	AdjacencyGraph
}
import graph.traversal.visitor {
	VertexVisitor
}

by ("ThorstenSeitz")
shared class VertexPropagator<V,G>(G graph, VertexVisitor<V> visitor, V source) extends GraphPropagator<V,V>(visitor, source)
		given V satisfies Object
		given G satisfies AdjacencyGraph<V> {

	shared actual {V*} adjacencies => graph.neighbors(source);

	shared actual V target(V vertex) => vertex;

	shared actual void backEdge(V target) => visitor.backEdge(source, target);

	shared actual void examineEdge(V target) => visitor.examineEdge(source, target);

	shared actual void forwardEdge(V target) => visitor.forwardEdge(source, target);

	shared actual void nonTreeEdge(V target) => visitor.nonTreeEdge(source, target);

	shared actual void treeEdge(V target) => visitor.treeEdge(source, target);
}

shared class VertexPropagatorFactory<V,G>(G graph, VertexVisitor<V> visitor) extends PropagatorFactory<V,V,VertexPropagator<V,G>>(visitor)
		given V satisfies Object
		given G satisfies AdjacencyGraph<V> {

	shared actual VertexPropagator<V,G> propagator(V source) => VertexPropagator(graph, visitor, source);
}
