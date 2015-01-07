"A generic edge between two vertices of type Vertex."
by("ThorstenSeitz")
shared interface Edge<out Vertex, E> of E
		given Vertex satisfies Object {

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

	shared formal E reversed;

	shared formal Boolean isIncident(Object vertex);
}
