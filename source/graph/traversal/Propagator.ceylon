"A [[Propagator]] defines how a graph traversal propagates to adjacent vertices of a given vertex.
 It abstracts from whether the adjacent vertices are reached as [[neighbors|graph::AdjacencyGraph.neighbors]]
 of an [[graph::AdjacencyGraph]] or as targets of [[adjacent edges|graph::IncidenceGraph.adjacentEdges]]
 of an [[graph::IncidenceGraph]]."
by ("ThorstenSeitz")
shared interface Propagator<V,Item>
		given V satisfies Object {

	"Answer the items allowing access to the neighboring vertices."
	shared formal {Item*} adjacentItems(V vertex);

	"Answer the target vertex reached by an item."
	shared formal V target(Item item);
}
