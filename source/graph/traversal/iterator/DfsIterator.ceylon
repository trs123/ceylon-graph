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
	GraphPropagator
}
import graph.traversal.visitor {
	GraphVisitor
}

"Generic depth first search traversal."
by ("ThorstenSeitz")
shared abstract class DfsIterator<V,G,Adjacency,P,Visitor>(G graph, Visitor visitor)
		extends StandardGraphIterator<V,G,Adjacency,P,Visitor>(graph, visitor)
		given V satisfies Object
		given G satisfies AdjacencyGraph<V>
		given P satisfies GraphPropagator<V,Adjacency>
		given Visitor satisfies GraphVisitor<V> {

	Stack<V> waiting = ArrayList<V>();

	shared actual void push(V vertex) {
		waiting.push(vertex);
	}

	shared actual V? nextVertex() {
		return waiting.pop();
	}
}
