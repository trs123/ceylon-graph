import ceylon.collection {
	ArrayList,
	Stack
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

"Generic depth first search traversal."
by ("ThorstenSeitz")
shared abstract class DfsIterator<V,G,Adjacency,P,Traversal>(G graph, V start) of Traversal
		extends StandardGraphIterator<V,G,Adjacency,P,Traversal>(graph, start)
		given V satisfies Object
		given G satisfies AdjacencyGraph<V>
		given P satisfies Propagator<V,Adjacency> {

	Stack<V> waiting = ArrayList<V>();

	shared actual void push(V vertex) {
		waiting.push(vertex);
	}

	shared actual V? nextVertex() {
		return waiting.pop();
	}
}
