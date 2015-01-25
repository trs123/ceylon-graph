import ceylon.collection {
	HashMap,
	MutableMap
}
by ("ThorstenSeitz")
shared class DistanceMapper<V>() satisfies VertexVisitor<V>
		given V satisfies Object {

	MutableMap<V,Integer> hops = HashMap<V,Integer>();

	"The first examined vertex is the origin of the distance map, i.e. has hops = 0."
	shared actual void examineVertex(V vertex) {
		if (hops.empty) {
			hops.put(vertex, 0);
		}
	}


	shared actual void examineEdge(V source, V target) {
		Integer? sourceHops = hops.get(source);
		assert (exists sourceHops);
		update(target, sourceHops + 1);
	}

	"Answer the distance of a vertex from the origin as least number of edges connecting them."
	shared Integer? getHops(V vertex) => hops.get(vertex);

	// TODO: improve
	void update(V vertex, Integer n) {
		Integer? current = hops.get(vertex);
		if (exists current) {
			if (n < current) {
				hops.put(vertex, n);
			}
		} else {
			hops.put(vertex, n);
		}
	}
}
