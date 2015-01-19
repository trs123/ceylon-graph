import graph {
	SimpleGraph
}
import graph.directed {
	DirectedEdge,
	DirectedGraph
}
import graph.traversal {
	GraphTraversal
}
import graph.traversal.iterator {
	BfsIterator,
	VertexIterator
}
import graph.traversal.propagator {
	VertexPropagator
}

by ("ThorstenSeitz")
shared final class Cycle(Integer n) satisfies SimpleGraph<Integer,Link> & DirectedGraph<Integer,Link> {

	shared final class Link(shared actual Integer source, shared actual Integer target)
			satisfies DirectedEdge<Integer,Link> {

		shared actual Link reversed => Link(target, source);
	}

	shared actual Link? edgeConnecting(Integer source, Integer target) => target == source + 1 % n then Link(source, target) else null;

	shared actual {Integer*} neighbors(Integer vertex) => { vertex + 1 % n };

	shared actual {Integer*} vertices => { 0, n - 1 };
}

class BfsTraversal(
	shared actual Cycle graph,
	shared actual Integer start)
		satisfies GraphTraversal<Integer,Cycle,BFS> {

	shared class BFS(Cycle graph, Integer start)
			extends BfsIterator<Integer,Cycle,Integer,VertexPropagator<Integer,Cycle>,BFS>(graph, start)
			satisfies VertexIterator<Integer,Cycle,BFS> {}

	shared actual BFS graphIterator(Cycle graph, Integer start) => BFS(graph, start);
}

Cycle graph = Cycle(10);
{Integer*} bfs = BfsTraversal(graph, 0).vertices;
