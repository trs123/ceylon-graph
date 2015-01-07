import graph {
	Edge
}

by("ThorstenSeitz")
shared interface UndirectedEdge<Vertex, E> of E satisfies Edge<Vertex, E>
		given Vertex satisfies Object {

	shared actual Boolean isDirected => false;

	shared actual Boolean isIncident(Object vertex) => source == vertex || target == vertex;
}
