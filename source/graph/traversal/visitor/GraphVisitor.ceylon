import graph {
	Edge
}

by ("ThorstenSeitz")
shared interface GraphVisitor<V> {

	shared default void examineVertex(V vertex) {}
	shared default void discoverVertex(V vertex) {}
	shared default void finishVertex(V vertex) {}
}

by ("ThorstenSeitz")
shared interface VertexVisitor<V> satisfies GraphVisitor<V>
		given V satisfies Object {

	shared default void examineEdge(V source, V target) {}
	shared default void treeEdge(V source, V target) {}
	shared default void nonTreeEdge(V source, V target) {}
	shared default void backEdge(V source, V target) {}
	shared default void forwardEdge(V source, V target) {}
}

by ("ThorstenSeitz")
shared interface EdgeVisitor<V,E> satisfies GraphVisitor<V>
		given V satisfies Object
		given E satisfies Edge<V,E> {

	shared default void examineEdge(E edge) {}
	shared default void treeEdge(E edge) {}
	shared default void nonTreeEdge(E edge) {}
	shared default void backEdge(E edge) {}
	shared default void forwardEdge(E edge) {}
}
