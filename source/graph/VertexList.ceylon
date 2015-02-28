"A Graph with efficient access to all vertices.

 ## Complexity

 - [[vertices]] is required to be constant time; iterating over the iterable is required to be linear in the number of vertices
"
by ("ThorstenSeitz")
shared interface VertexList<V>
		satisfies AdjacencyGraph<V>
		given V satisfies Object {

	"Answer whether the graph contains a given vertex."
	shared default Boolean containsVertex(V vertex) => vertices.contains(vertex);

	"Answer whether the graph is empty, i.e. contains no vertices."
	shared actual default Boolean empty => vertices.empty;

	"All vertices of the graph."
	shared formal {V*} vertices;
}
