import ceylon.collection {
	Queue,
	ArrayList
}

import graph {
	AdjacencyGraph
}
import graph.traversal.propagator {
	Propagator
}

"Generic breadth first search traversal."
by ("ThorstenSeitz")
shared abstract class BFSTraversal<V,G,Adjacency,P>(G graph) extends StandardTraversal<V,G,Adjacency,P>(graph)
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
