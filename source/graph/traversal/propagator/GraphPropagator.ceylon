import graph.traversal.visitor {
	TraversalVisitor
}

"A [[GraphPropagator]] defines how a graph traversal propagates to adjacent vertices of a given vertex.
 It abstracts from whether the adjacent vertices are reached as [[neighbors|graph::AdjacencyGraph.neighbors]]
 of an [[graph::AdjacencyGraph]] or as targets of [[adjacent edges|graph::IncidenceGraph.adjacentEdges]]
 of an [[graph::IncidenceGraph]]."
by ("ThorstenSeitz")
shared abstract class GraphPropagator<Vertex,Adjacency>(TraversalVisitor<Vertex> visitor, Vertex source)
		given Vertex satisfies Object {

	"Answer the adjacencies allowing access to the neighboring vertices."
	shared formal {Adjacency*} adjacencies;

	"Answer the target vertex reached by an adjacency."
	shared formal Vertex target(Adjacency adjacency);

	"Calls visitor.examineVertex(source)."
	shared default void examineVertex() => visitor.examineVertex(source);

	"Calls visitor.discoverVertex(source)."
	shared default void discoverVertex() => visitor.discoverVertex(source);

	"Calls visitor.finishVertex(source)."
	shared default void finishVertex() => visitor.finishVertex(source);

	"Calls visitor.examineEdge according to the approprate signature of the visitor's method."
	shared formal void examineEdge(Adjacency adjacency);

	"Calls visitor.treeEdge according to the approprate signature of the visitor's method."
	shared formal void treeEdge(Adjacency adjacency);

	"Calls visitor.nonTreeEdge according to the approprate signature of the visitor's method."
	shared formal void nonTreeEdge(Adjacency adjacency);

	"Calls visitor.backEdge according to the approprate signature of the visitor's method."
	shared formal void backEdge(Adjacency adjacency);

	"Calls visitor.forwardEdge according to the approprate signature of the visitor's method."
	shared formal void forwardEdge(Adjacency adjacency);
}

shared abstract class PropagatorFactory<Vertex,Adjacency,P>(TraversalVisitor<Vertex> visitor)
		given Vertex satisfies Object
		given P satisfies GraphPropagator<Vertex,Adjacency> {

	shared formal P propagator(Vertex source);
}
