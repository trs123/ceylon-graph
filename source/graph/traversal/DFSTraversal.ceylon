import ceylon.collection {
	ArrayList,
	Stack
}

import graph {
	AdjacencyGraph
}
import graph.traversal.propagator {
	Propagator
}

"Generic depth first search traversal."
by ("ThorstenSeitz")
shared abstract class DFSTraversal<V,G,Adjacency,P>(G graph) extends StandardTraversal<V,G,Adjacency,P>(graph)
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
