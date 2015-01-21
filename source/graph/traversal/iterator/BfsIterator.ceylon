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
	GraphPropagator
}
import graph.traversal.visitor {
	GraphVisitor
}

"Generic breadth first search traversal."
by ("ThorstenSeitz")
shared abstract class BfsIterator<V,G,Adjacency,P,Visitor>(G graph, Visitor visitor)
		extends StandardGraphIterator<V,G,Adjacency,P,Visitor>(graph, visitor)
		given V satisfies Object
		given G satisfies AdjacencyGraph<V>
		given P satisfies GraphPropagator<V,Adjacency>
		given Visitor satisfies GraphVisitor<V> {

	Queue<V> waiting = ArrayList<V>();

	shared actual void push(V vertex) {
		waiting.offer(vertex);
	}

	shared actual V? nextVertex() {
		return waiting.accept();
	}
}
