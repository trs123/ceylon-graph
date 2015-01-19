import ceylon.collection {
	Queue,
	ArrayList
}

import graph {
	AdjacencyGraph
}
import graph.traversal.iterator {
	StandardGraphIterator
}
import graph.traversal.propagator {
	Propagator
}

"Generic breadth first search traversal."
by ("ThorstenSeitz")
shared abstract class BfsIterator<V,G,Adjacency,P>(G graph, V start)
		extends StandardGraphIterator<V,G,Adjacency,P>(graph, start)
		given V satisfies Object
		given G satisfies AdjacencyGraph<V>
		given P satisfies Propagator<V,Adjacency> {

	Queue<V> waiting = ArrayList<V>();

	shared actual void push(V vertex) {
		waiting.offer(vertex);
	}

	shared actual V? nextVertex() {
		return waiting.accept();
	}
}
