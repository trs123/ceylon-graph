import common {
	Monoid
}

"[[Weights]] gives a mapping from edges to weights and a zero element to make [[Weight]] a monoid."
by ("ThorstenSeitz")
shared interface Weights<Weight,E>
		satisfies Monoid<Weight,Weights<Weight,E>>
		given Weight satisfies Summable<Weight>
		given E satisfies Edge<Object,E> {

	shared formal Weight weight(E edge);
}

"[[ImplicitEdgeWeights]] gives a mapping from vertex pairs to weights and a zero element
 to make [[Weight]] a monoid."
by ("ThorstenSeitz")
shared interface ImplicitEdgeWeights<Vertex,Weight>
		satisfies Monoid<Weight,ImplicitEdgeWeights<Vertex,Weight>>
		given Weight satisfies Summable<Weight> {

	shared formal Weight weight(Vertex source, Vertex target);
}

"Hops assigns an edge the weight of 1 and can therefore be used to count the number of edges, or 'hops'."
by ("ThorstenSeitz")
shared class Hops<E>() satisfies Weights<Integer,E>
		given E satisfies Edge<Object,E> {

	shared actual Integer weight(E edge) => 1;
	shared actual Integer zero = 0;
}
