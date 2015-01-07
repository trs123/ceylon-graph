import graph {
	SimpleGraph
}
import graph.directed {
	DirectedEdge,
	DirectedGraph
}

by("ThorstenSeitz")
shared final class Cycle(Integer n) satisfies SimpleGraph<Integer,Link> & DirectedGraph<Integer,Link> {

	shared final class Link(shared actual Integer source, shared actual Integer target)
			satisfies DirectedEdge<Integer, Link> {

		shared actual Link reversed => Link(target, source);
	}

	shared actual Link? edgeConnecting(Integer source, Integer target) => target == source + 1 % n then Link(source, target) else null;

	shared actual {Integer*} neighbors(Integer vertex) => { vertex + 1 % n };

	// TODO: Eigentlich die schönere Variante als neighbors() ?
	//shared actual {Link*} outgoingEdgesOf(Integer vertex) => { Link(vertex, vertex + 1 % n) };

	shared actual {Integer*} vertices => { 0, n - 1 };
}
