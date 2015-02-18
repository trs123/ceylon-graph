import graph {
	Edge,
	IncidenceGraph
}
import graph.filter {
	FilterableIncidenceGraph
}

"An `AbstractIncidenceList` is an [[IncidenceGraph]] defined by a list of vertices and a list of edges."
by ("ThorstenSeitz")
shared abstract class AbstractIncidenceList<V,E,G>(
	shared actual {V*} vertices,
	shared actual {E*} edges)
		of G
		satisfies IncidenceGraph<V,E> & FilterableIncidenceGraph<V,E,G>
		given V satisfies Object
		given E satisfies Edge<V,E>
		given G satisfies AbstractIncidenceList<V,E,G> {

	shared actual G filterEdges(Boolean predicate(E edge)) => create(
		vertices,
		edges.filter(predicate));

	shared actual G filterVertices(Boolean predicate(V vertex)) => create(
		vertices.filter(predicate),
		edges.filter((E edge) => predicate(edge.source) && predicate(edge.target)));

	"Create new [[AbstractAdjacencyList]] from adjacencies."
	shared formal G create({V*} vertices, {E*} edges);
}

"A concrete [[AbstractIncidenceList]]."
by ("ThorstenSeitz")
shared class IncidenceList<V,E>({V*} vertices, {E*} edges)
		extends AbstractIncidenceList<V,E,IncidenceList<V,E>>(vertices, edges)
		given V satisfies Object
		given E satisfies Edge<V,E> {

	shared actual IncidenceList<V,E> create({V*} vertices, {E*} edges) => IncidenceList<V,E>(vertices, edges);
}
