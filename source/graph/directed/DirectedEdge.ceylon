import graph {
	Edge
}

by ("ThorstenSeitz")
shared interface DirectedEdge<Vertex,E> of E satisfies Edge<Vertex,E>
		given Vertex satisfies Object
		given E satisfies DirectedEdge<Vertex,E> {

	shared actual Boolean isDirected => true;

	shared actual Boolean isIncident(Object vertex) => source == vertex;
}
