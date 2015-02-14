import common {
	Monoid
}

"[[Weights]] gives a mapping from edges to weights and a zero element to make [[Weight]] a monoid."
by ("ThorstenSeitz")
shared interface Weights<Weight,Vertex,E>
		satisfies Monoid<Weight,Weights<Weight,Vertex,E>>
		given Weight satisfies Summable<Weight>
		given Vertex satisfies Object
		given E satisfies Edge<Vertex,E> {

	shared formal Weight weight(E edge);
}

"[[ImplicitEdgeWeights]] gives a mapping from vertex pairs to weights and a zero element
 to make [[Weight]] a monoid."
by ("ThorstenSeitz")
shared interface ImplicitEdgeWeights<Weight,Vertex>
		satisfies Monoid<Weight,ImplicitEdgeWeights<Weight,Vertex>>
		given Weight satisfies Summable<Weight> {

	shared formal Weight weight(Vertex source, Vertex target);
}

"Hops assigns an edge the weight of 1 and can therefore be used to count the number of edges, or 'hops'
 between two vertices."
by ("ThorstenSeitz")
shared class Hops<V,E>() satisfies Weights<Integer,V,E>
		given V satisfies Object
		given E satisfies Edge<V,E> {

	shared actual Integer weight(E edge) => 1;
	shared actual Integer zero = 0;
}
