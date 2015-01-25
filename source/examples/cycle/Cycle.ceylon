import graph {
	SimpleGraph
}
import graph.directed {
	DirectedEdge,
	DirectedGraph
}
import graph.traversal {
	GenericVertexTraversal=VertexTraversal,
	BfsTraversal
}
import graph.traversal.iterator {
	GenericBfsIterator=BfsIterator,
	GenericVertexIterator=VertexIterator,
	GenericEdgeIterator=EdgeIterator
}
import graph.traversal.propagator {
	GenericVertexPropagator=VertexPropagator,
	GenericEdgePropagator=EdgePropagator
}
import graph.traversal.visitor {
	GenericVertexVisitor=VertexVisitor,
	genericNullVertexVisitor=nullVertexVisitor,
	GenericEdgeVisitor=EdgeVisitor,
	genericNullEdgeVisitor=nullEdgeVisitor
}

"Simple directed graph forming a cycle of `n` vertices."
by ("ThorstenSeitz")
shared final class Cycle(Integer n) satisfies SimpleGraph<Integer,Link> & DirectedGraph<Integer,Link> {

	"Directed edge within a [[Cycle]]."
	shared final class Link(shared actual Integer source, shared actual Integer target)
			satisfies DirectedEdge<Integer,Link> {

		shared actual Link reversed => Link(target, source);
	}

	shared actual Link? edgeConnecting(Integer source, Integer target) => target == (source + 1) % n then Link(source, target) else null;

	shared actual {Integer*} neighbors(Integer vertex) => { (vertex + 1) % n };

	shared actual {Integer*} vertices => 0 .. n - 1;

	// Convenient type aliases eliminating generic parameters

	shared interface VertexVisitor => GenericVertexVisitor<Integer>;
	shared interface EdgeVisitor => GenericEdgeVisitor<Integer,Link>;

	shared alias VertexPropagator => GenericVertexPropagator<Integer,Cycle>;
	shared alias EdgePropagator => GenericEdgePropagator<Integer,Link,Cycle>;
	shared abstract class BfsIterator() => GenericBfsIterator<Integer,Cycle,Integer,VertexPropagator,VertexVisitor>();

	shared interface VertexIterator => GenericVertexIterator<Integer,Cycle>;
	shared interface EdgeIterator => GenericEdgeIterator<Integer,Cycle.Link,Cycle>;

	shared interface VertexTraversal => GenericVertexTraversal<Integer,Cycle>;

	shared VertexVisitor nullVertexVisitor = genericNullVertexVisitor<Integer>();
	shared EdgeVisitor nullEdgeVisitor = genericNullEdgeVisitor<Integer,Link>();

	// BFS traversal for Cycle

	"Breadth first traversal of the receiver using a [[VertexPropagator]]."
	shared VertexTraversal bfsTraversal(
		Integer start,
		VertexVisitor visitor = nullVertexVisitor) => BfsTraversal(this, start, visitor);
}
