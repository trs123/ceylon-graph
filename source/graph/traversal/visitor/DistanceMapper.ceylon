import ceylon.collection {
	HashMap,
	MutableMap
}

import graph {
	AdjacencyGraph
}
import graph.traversal {
	BfsTraversal
}

shared interface DistanceMap<V>
		given V satisfies Object => Map<V,Integer>;

"A `DistanceMapper` memorizes the distance of each visited vertex from the vertex which has been visited first
 (called the origin). The distance of a vertex is the least number of edges connecting the origin with that vertex
 as encountered during the traversal."
by ("ThorstenSeitz")
shared class DistanceMapper<V>() satisfies VertexVisitor<V>
		given V satisfies Object {

	MutableMap<V,Integer> hops = HashMap<V,Integer>();

	"The first examined vertex becomes the origin of the distance map, i.e. has hops = 0."
	shared actual void examineVertex(V vertex) {
		if (hops.empty) {
			hops.put(vertex, 0);
		}
	}

	"Update hops for target of edge based on hops of source of edge."
	shared actual void examineEdge(V source, V target) {
		Integer? sourceHops = getHops(source);
		assert (exists sourceHops);
		updateHops(target, sourceHops + 1);
	}

	"Answer the distance of a vertex from the origin, i.e. the least number of edges connecting them."
	Integer? getHops(V vertex) => hops.get(vertex);

	"Update hops for vertex with n if less than current value (or if no value is present yet)."
	void updateHops(V vertex, Integer n) {
		if (getHops(vertex)?.largerThan(n) else true) {
			hops.put(vertex, n);
		}
	}

	"Answer a clone of the current [[distance map|DistanceMap]]. This may not be complete or correct yet, if
	    the traversal has not been completed."
	shared DistanceMap<V> distanceMap => hops.clone();
}

"Map distances of all vertices of the given graph measured from given origin.
 Implementation note: uses a [[breadth first search traversal|BfsTraversal]]."
by ("ThorstenSeitz")
shared DistanceMap<V> mapDistances<V,G>(G graph, V origin)
		given V satisfies Object
		given G satisfies AdjacencyGraph<V> {

	DistanceMapper<V> distanceMapper = DistanceMapper<V>();
	BfsTraversal<V,G>(graph, origin, distanceMapper).traverse();
	return distanceMapper.distanceMap;
}
