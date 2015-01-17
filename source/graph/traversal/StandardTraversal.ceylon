import ceylon.collection {
	MutableMap,
	HashMap
}

import graph {
	AdjacencyGraph
}
import graph.traversal.propagator {
	Propagator
}

"Generic breadth first search traversal."
by ("ThorstenSeitz")
shared abstract class StandardTraversal<V,G,Adjacency,P>(G graph)
		satisfies PropagatorBasedTraversal<V,G,P,Adjacency>
		given V satisfies Object
		given G satisfies AdjacencyGraph<V>
		given P satisfies Propagator<V,Adjacency> {

	MutableMap<V,VertexColor> colorMap = HashMap<V,VertexColor>();

	shared actual V? next() {
		V? source = nextVertex();
		if (is V source) {
			P propagator = propagatorFor(source);
			propagator.visitor.examineVertex(source);
			for (Adjacency adjacency in propagator.adjacencies) {
				V target = propagator.target(adjacency);
				propagator.examineEdge(adjacency);
				if (shouldFollowVertex(target)) {
					propagator.treeEdge(adjacency);
					setGray(target);
					push(target);
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
			propagator.visitor.finishVertex(source);
		}
		return source;
	}

	shared formal void push(V vertex);

	shared formal V? nextVertex();

	void setGray(V vertex) {
		colorMap.put(vertex, gray);
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
