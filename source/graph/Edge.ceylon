import graph.directed {
	DirectedEdge
}
import graph.undirected {
	UndirectedEdge
}

// TODO: should Edge or its subclasses UndirectedEdge and DirectedEdge implement equals?
// TODO: should Edge be restricted to the subclasses UndirectedEdge and DirectedEdge?
"A generic edge between two vertices of type Vertex."
by ("ThorstenSeitz")
shared interface Edge<Vertex,E> of DirectedEdge<Vertex,E> | UndirectedEdge<Vertex,E>
		given Vertex satisfies Object
		given E satisfies Edge<Vertex,E> {

	"The source vertex of the edge."
	shared formal Vertex source;

	"The target vertex of the edge."
	shared formal Vertex target;

	"Whether the edge is directed."
	shared formal Boolean isDirected;

	"Answer whether the edge is a loop, i.e. source == target."
	shared Boolean isLoop { return source == target; }

	"Answer whether the edge is a link between two different vertices."
	shared Boolean isLink { return !isLoop; }

	"Given one endpoint of the edge answer its other endpoint."
	shared Vertex otherEnd(Object endpoint) {
		assert (endpoint == source || endpoint == target);
		return endpoint == source then target else source;
	}

	shared E self => this of E;

	shared formal E reversed;

	shared formal Boolean isIncident(Vertex vertex);

	shared Boolean isEndpoint(Vertex vertex) => source == vertex || target == vertex;
}
