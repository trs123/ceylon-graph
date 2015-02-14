import graph.implicit {
	ImplicitAdjacencyGraph
}

"Simple directed graph forming a cycle of `n` vertices numbered from 0 to n-1."
by ("ThorstenSeitz")
shared class Cycle(Integer n) extends ImplicitAdjacencyGraph<Integer>(
	0,
	(Integer vertex) => { (vertex + 1) % n }
) {
	shared actual default {Integer*} vertices => 0 .. n - 1;
}
