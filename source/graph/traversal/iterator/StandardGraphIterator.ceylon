import ceylon.collection {
	MutableMap,
	HashMap
}

import graph {
	AdjacencyGraph
}
import graph.traversal.iterator {
	PropagatorBasedIterator
}
import graph.traversal.propagator {
	GraphPropagator
}
import graph.traversal.visitor {
	GraphVisitor
}

by ("ThorstenSeitz")
abstract class VertexColor() of white | gray | black {}
object white extends VertexColor() {}
object gray extends VertexColor() {}
object black extends VertexColor() {}

"Generic traversal by using white/gray/black vertex colors and a collection of vertices waiting to be visited.
 Base for BFS (using a queue) and DFS (using a stack)."
by ("ThorstenSeitz")
shared abstract class StandardGraphIterator<V,G,Adjacency,P,Visitor>(
	shared actual G graph, // TODO: not needed here
	shared actual Visitor visitor) // TODO: not needed here
		satisfies PropagatorBasedIterator<V,G,P,Adjacency,Visitor>
		given V satisfies Object
		given G satisfies AdjacencyGraph<V>
		given P satisfies GraphPropagator<V,Adjacency>
		given Visitor satisfies GraphVisitor<V> {

	MutableMap<V,VertexColor> colorMap = HashMap<V,VertexColor>();

	shared actual V|Finished next() {
		V? source = nextVertex();
		switch (source)
		case (null) {
			return finished;
		}
		case (is V) {
			P propagator = propagatorFor(source);
			propagator.examineVertex();
			for (Adjacency adjacency in propagator.adjacencies) {
				V target = propagator.target(adjacency);
				propagator.examineEdge(adjacency);
				if (shouldFollowVertex(target)) {
					propagator.treeEdge(adjacency);
					discoverVertex(target);
				} else {
					propagator.nonTreeEdge(adjacency);
					if (isBackEdge(target)) {
						propagator.backEdge(adjacency);
					} else {
						propagator.forwardEdge(adjacency);
					}
				}
			}
			setBlack(source);
			propagator.finishVertex();
			return source;
		}
	}

	// TODO: unschön!?
	shared actual void startWith(V vertex) {
		colorMap.clear();
		discoverVertex(vertex);
	}

	shared formal void push(V vertex);

	shared formal V? nextVertex();

	void discoverVertex(V vertex) {
		colorMap.put(vertex, gray);
		push(vertex);
	}

	void setBlack(V vertex) {
		colorMap.put(vertex, black);
	}

	Boolean shouldFollowVertex(V vertex) {
		switch (colorMap.get(vertex))
		case (white) { return true; }
		else { return false; }
	}

	Boolean isBackEdge(V vertex) {
		switch (colorMap.get(vertex))
		case (gray) { return true; }
		else { return false; }
	}
}
