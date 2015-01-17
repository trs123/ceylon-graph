import graph.traversal.visitor {
	GraphVisitor
}

"A [[Propagator]] defines how a graph traversal propagates to adjacent vertices of a given vertex.
 It abstracts from whether the adjacent vertices are reached as [[neighbors|graph::AdjacencyGraph.neighbors]]
 of an [[graph::AdjacencyGraph]] or as targets of [[adjacent edges|graph::IncidenceGraph.adjacentEdges]]
 of an [[graph::IncidenceGraph]]."
by ("ThorstenSeitz")
shared abstract class Propagator<Vertex,Adjacency>(shared GraphVisitor<Vertex> visitor, Vertex source)
		given Vertex satisfies Object {

	"Answer the adjacencies allowing access to the neighboring vertices."
	shared formal {Adjacency*} adjacencies;

	"Answer the target vertex reached by an adjacency."
	shared formal Vertex target(Adjacency adjacency);

	shared formal void examineEdge(Adjacency adjacency);
	shared formal void treeEdge(Adjacency adjacency);
	shared formal void nonTreeEdge(Adjacency adjacency);
	shared formal void backEdge(Adjacency adjacency);
	shared formal void forwardEdge(Adjacency adjacency);
}

shared abstract class PropagatorFactory<Vertex,Adjacency,P>(GraphVisitor<Vertex> visitor)
		given Vertex satisfies Object
		given P satisfies Propagator<Vertex,Adjacency> {

	shared formal P propagator(Vertex source);
}
