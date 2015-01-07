import graph {
	Edge
}

"[[Weights]] gives a mapping from [[Edge]]s to weights and a zero element to make [[Weight]] a monoid."
by ("ThorstenSeitz")
shared interface Weights<Weight, E>
		given Weight satisfies Summable<Weight>
		given E satisfies Edge<Object, E> {

	shared formal Weight weight(E edge);
	shared formal Weight zero;

}