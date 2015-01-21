import graph {
	SimpleGraph
}
import graph.directed {
	DirectedEdge,
	DirectedGraph
}
import graph.traversal {
	VertexTraversal,
	EdgeTraversal
}
import graph.traversal.iterator {
	BfsIterator,
	VertexIterator,
	EdgeIterator
}
import graph.traversal.propagator {
	VertexPropagator,
	EdgePropagator
}
import graph.traversal.visitor {
	VertexVisitor,
	nullVertexVisitor,
	EdgeVisitor,
	nullEdgeVisitor
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

	shared BfsTraversal bfsTraversal(
		Integer start,
		VertexVisitor<Integer> visitor = nullVertexVisitor<Integer>()) => BfsTraversal(this, start, visitor);
}


"Breadth first traversal for a [[Cycle]] using a [[VertexPropagator]]."
shared class BfsTraversal(
	shared actual Cycle graph,
	shared actual Integer start,
	shared actual VertexVisitor<Integer> visitor)
		satisfies VertexTraversal<Integer,Cycle> {

	class BFS(Cycle graph, Integer start, TraversalVisitor visitor)
			extends BfsIterator<Integer,Cycle,Integer,VertexPropagator<Integer,Cycle>,TraversalVisitor>(graph, visitor)
			satisfies VertexIterator<Integer,Cycle> {}

	shared actual TraversalIterator graphIterator(
		Cycle graph,
		Integer start,
		TraversalVisitor visitor) => BFS(graph, start, visitor);
}

"Breadth first traversal for a [[Cycle]] using an [[EdgePropagator]]."
class BfsEdgeTraversal(
	shared actual Cycle graph,
	shared actual Integer start,
	shared actual EdgeVisitor<Integer,Cycle.Link> visitor)
		satisfies EdgeTraversal<Integer,Cycle.Link,Cycle> {

	class BFS(Cycle graph, Integer start, TraversalVisitor visitor)
			extends BfsIterator<Integer,Cycle,Cycle.Link,EdgePropagator<Integer,Cycle.Link,Cycle>,TraversalVisitor>(graph, visitor)
			satisfies EdgeIterator<Integer,Cycle.Link,Cycle> {}

	shared actual TraversalIterator graphIterator(
		Cycle graph,
		Integer start,
		TraversalVisitor visitor) => BFS(graph, start, visitor);
}

"Example: Create cycle with 10 vertices, then get vertices from example traversals."
shared void example() {
	Cycle graph = Cycle(10);

	{Integer*} bfs = graph.bfsTraversal(0).vertices;
	print("bfs = ``bfs``");

	{Integer*} bfs1 = BfsTraversal(graph, 0, nullVertexVisitor<Integer>()).vertices;
	{Integer*} bfs2 = BfsEdgeTraversal(graph, 0, nullEdgeVisitor<Integer, Cycle.Link>()).vertices;
	print("bfs1 = ``bfs1``");
	print("bfs2 = ``bfs2``");
}
