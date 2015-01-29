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
	GenericEdgeVisitor=EdgeVisitor,
	traversalVisitors
}

"Simple directed graph forming a cycle of `n` vertices."
by ("ThorstenSeitz")
shared class Cycle(Integer n) satisfies SimpleGraph<Integer,Link> & DirectedGraph<Integer,Link> {

	"Directed edge within a [[Cycle]]."
	shared final class Link(shared actual Integer source, shared actual Integer target)
			satisfies DirectedEdge<Integer,Link> {

		shared actual Link reversed => Link(target, source);

		shared actual Boolean equals(Object other) {
			if (is Link other) {
				return other.source == source && other.target == target;
			} else {
				return false;
			}
		}

		shared actual Integer hash => source.hash.xor(target.hash);
	}

	shared actual default Link? edgeConnecting(Integer source, Integer target) => target == (source + 1) % n then Link(source, target) else null;

	shared actual default {Integer*} neighbors(Integer vertex) => { (vertex + 1) % n };

	shared actual default {Integer*} vertices => 0 .. n - 1;

	// Convenient type aliases eliminating generic parameters

	shared interface VertexVisitor => GenericVertexVisitor<Integer>;
	shared interface EdgeVisitor => GenericEdgeVisitor<Integer,Link>;

	shared alias VertexPropagator => GenericVertexPropagator<Integer,Cycle>;
	shared alias EdgePropagator => GenericEdgePropagator<Integer,Link,Cycle>;
	shared abstract class BfsIterator() => GenericBfsIterator<Integer,Cycle,Integer,VertexPropagator,VertexVisitor>();

	shared interface VertexIterator => GenericVertexIterator<Integer,Cycle>;
	shared interface EdgeIterator => GenericEdgeIterator<Integer,Cycle.Link,Cycle>;

	shared interface VertexTraversal => GenericVertexTraversal<Integer,Cycle>;

	shared VertexVisitor nullVertexVisitor = traversalVisitors.nullVertexVisitor<Integer>();
	shared EdgeVisitor nullEdgeVisitor = traversalVisitors.nullEdgeVisitor<Integer,Link>();

	// BFS traversal for Cycle

	"Breadth first traversal of the receiver using a [[VertexPropagator]]."
	shared VertexTraversal bfsTraversal(
		Integer start,
		VertexVisitor visitor = nullVertexVisitor) => BfsTraversal(this, start, visitor);
}
