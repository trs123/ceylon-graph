"## Concept

 An [[AdjacencyGraph]] is a graph which is concerned only with the vertices and not with the edges. There are
 no explicit edge objects, adjacent vertices are simply accessed as [[neighbors]].
 For many use cases this is sufficient.

 ## Complexity

 - [[vertices]] is required to be constant time; iterating over the iterable is required to be linear in the number of vertices
 - [[neighbors]] is required to be constant time; iterating over the iterable is required to be linear in the number of neighbors
 - [[degreeOf]] is required to be at most linear in the number of neighbors
 - [[containsEdge]] is required to be at most linear in the number of neighbors

 ## Infinite Graphs

 The number of vertices may be infinite in which case the user has to take care not to call methods which
 will not return (this is similar to an [[ceylon.language::Iterable]] which may contain an infinite number of elements).

 The same applies for the number of neighbors of a vertex.

 ## Design Notes

 Think about making Vertex (and, in subclasses, Edge) member classes! cf. Graph example [here](http://in.relation.to/Bloggers/SelfTypesAndTypeFamiliesInCeylon)"
by ("ThorstenSeitz")
shared interface AdjacencyGraph<V>
		given V satisfies Object {

	"All vertices of the graph."
	shared formal {V*} vertices;

	"All neighbor vertices of the given vertex. A neighbor is the target of an outgoing directed edge
	 or the other endpoint of an undirected edge."
	shared formal {V*} neighbors(V vertex);

	"Apply action for each neighbor of the given vertex.
	 This method will (obviously) not return if the vertex has an inifinite number of neighbors."
	shared void forEachNeighbor(V vertex, void action(V neighbor)) {
		for (V neighbor in neighbors(vertex)) {
			action(neighbor);
		}
	}

	"Answer the degree of the given vertex, i.e. the number of neighbors.
	 This method will (obviously) not return if the vertex has inifinite neighbors."
	shared Integer degreeOf(V vertex) {
		return neighbors(vertex).size;
	}

	"Answer whether the given vertex has at least one neighbor."
	shared default Boolean hasNeighbors(V vertex) {
		return !neighbors(vertex).empty;
	}

	"Answer whether the graph contains an edge from source to target."
	shared default Boolean containsEdge(V source, V target) {
		return neighbors(source).any((V neighbor) => neighbor == target);
	}

	"Answer whether the graph is empty, i.e. contains no vertices."
	shared Boolean empty {
		return vertices.empty;
	}

	"Answer whether the graph is not empty, i.e. contains at least one vertex."
	shared Boolean notEmpty {
		return !empty;
	}
}
