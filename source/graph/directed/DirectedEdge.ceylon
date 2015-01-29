import graph {
	Edge
}

by ("ThorstenSeitz")
shared interface DirectedEdge<Vertex,E> of E
		satisfies Edge<Vertex,E>
		given Vertex satisfies Object
		given E satisfies Edge<Vertex,E> { // should be DirectedEdge<Vertex,E> but clashes with definition of Edge

	shared actual Boolean isDirected => true;

	shared actual Boolean isIncident(Vertex vertex) => source == vertex;
}
