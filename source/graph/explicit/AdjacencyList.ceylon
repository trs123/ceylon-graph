import graph {
	AdjacencyGraph,
	VertexList
}
import graph.filter {
	FilterableAdjacencyGraph
}

"Alias for adjacency map."
by ("ThorstenSeitz")
shared alias Adjacencies<V>
		given V satisfies Object => Map<V,{V*}>;

"An `AdjacencyList` is an [[AdjacencyGraph]] defined by a Map from vertices to their neighbors."
by ("ThorstenSeitz")
shared abstract class AbstractAdjacencyList<V,G>(Adjacencies<V> adjacencies) of G
		satisfies AdjacencyGraph<V> & FilterableAdjacencyGraph<V,G> & VertexList<V>
		given V satisfies Object
		given G satisfies AbstractAdjacencyList<V,G> {

	shared actual {V*} neighbors(V vertex) => adjacencies.get(vertex) else [];

	shared actual {V*} vertices => adjacencies.keys;

	shared actual default Boolean containsVertex(V vertex) => vertices.contains(vertex);

	shared actual Boolean empty => vertices.empty;

	shared actual G filterVertices(Boolean predicate(V vertex))
			=> create(adjacencies.filterKeys(predicate).mapItems((v, ns) => ns.filter(predicate)));

	"Create new [[AbstractAdjacencyList]] from adjacencies."
	shared formal G create(Adjacencies<V> adjacencies);
}

"A concrete [[AbstractAdjacencyList]]."
by ("ThorstenSeitz")
shared class AdjacencyList<V>(Adjacencies<V> adjacencies)
		extends AbstractAdjacencyList<V,AdjacencyList<V>>(adjacencies)
		given V satisfies Object {

	shared actual AdjacencyList<V> create(Adjacencies<V> adjacencies) => AdjacencyList<V>(adjacencies);
}
