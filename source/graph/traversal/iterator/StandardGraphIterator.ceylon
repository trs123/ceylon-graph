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

	ColorMap<V> colorMap = ColorMap<V>();

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
			colorMap.setColor(source, black);
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
		colorMap.setColor(vertex, gray);
		push(vertex);
	}

	Boolean shouldFollowVertex(V vertex) {
		switch (colorMap.getColor(vertex))
		case (white) { return true; }
		else { return false; }
	}

	Boolean isBackEdge(V vertex) {
		switch (colorMap.getColor(vertex))
		case (gray) { return true; }
		else { return false; }
	}
}
