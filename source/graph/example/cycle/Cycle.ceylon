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
	VertexIterator,
	EdgeIterator,
	GraphIterator
}
import graph.traversal.propagator {
	VertexPropagator,
	EdgePropagator
}

"Simple directed graph forming a cycle of `n` vertices."
by ("ThorstenSeitz")
shared final class Cycle(Integer n) satisfies SimpleGraph<Integer,Link> & DirectedGraph<Integer,Link> {

	shared final class Link(shared actual Integer source, shared actual Integer target)
			satisfies DirectedEdge<Integer,Link> {

		shared actual Link reversed => Link(target, source);
	}

	shared actual Link? edgeConnecting(Integer source, Integer target) => target == source + 1 % n then Link(source, target) else null;

	shared actual {Integer*} neighbors(Integer vertex) => { vertex + 1 % n };

	shared actual {Integer*} vertices => { 0, n - 1 };

	shared BfsTraversal bfsTraversal(Integer start) => BfsTraversal(this, start);
}

"Breadth first traversal for a [[Cycle]] using a [[VertexPropagator]]."
shared class BfsTraversal(
	shared actual Cycle graph,
	shared actual Integer start)
		satisfies GraphTraversal<Integer,Cycle> {

	class BFS(Cycle graph, Integer start)
			extends BfsIterator<Integer,Cycle,Integer,VertexPropagator<Integer,Cycle>>(graph, start)
			satisfies VertexIterator<Integer,Cycle> {}

	shared actual GraphIterator<Integer,Cycle> graphIterator(Cycle graph, Integer start) => BFS(graph, start);
}

"Breadth first traversal for a [[Cycle]] using an [[EdgePropagator]]."
class BfsEdgeTraversal(
	shared actual Cycle graph,
	shared actual Integer start)
		satisfies GraphTraversal<Integer,Cycle> {

	class BFS(Cycle graph, Integer start)
			extends BfsIterator<Integer,Cycle,Cycle.Link,EdgePropagator<Integer,Cycle.Link,Cycle>>(graph, start)
			satisfies EdgeIterator<Integer,Cycle.Link,Cycle> {}

	shared actual GraphIterator<Integer,Cycle> graphIterator(Cycle graph, Integer start) => BFS(graph, start);
}

"Example: Create cycle with 10 vertices, then get vertices from example traversals."
void example() {
	Cycle graph = Cycle(10);

	{Integer*} bfs  = graph.bfsTraversal(0).vertices;
	print("bfs = ``bfs``");

	{Integer*} bfs1 = BfsTraversal(graph, 0).vertices;
	{Integer*} bfs2 = BfsEdgeTraversal(graph, 0).vertices;
	print("bfs1 = ``bfs1``");
	print("bfs2 = ``bfs2``");
}
