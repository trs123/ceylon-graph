import graph {
	Edge
}

by ("ThorstenSeitz")
shared interface UndirectedEdge<Vertex,E> of E satisfies Edge<Vertex,E>
		given Vertex satisfies Object
		given E satisfies Edge<Vertex,E> { // should be UndirectedEdge<Vertex,E> but clashes with definition of Edge

	shared actual Boolean isDirected => false;

	shared actual Boolean isIncident(Vertex vertex) => source == vertex || target == vertex;

	shared default E asOutgoing(Object vertex) {
		if (source == vertex) {
			return self;
		} else {
			assert (target == vertex);
			return reversed;
		}
	}
}
