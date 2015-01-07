"A Walk is a possibly empty sequence of edges connecting two vertices."
by("ThorstenSeitz")
shared interface Walk<V,E> satisfies Comparable<Walk<V,E>>
		given V satisfies Object
		given E satisfies Edge<V, E> {

	"The edges comprising the walk."
	shared formal {E*} edges;

	"The vertices touched by the walk."
	shared {V*} vertices {
		if (exists startpoint = edges.first?.source) {
			return edges.map(Edge<V, E>.target).follow(startpoint);
		} else {
			return {};
		}
	}

	"The vertex where the walk starts or none if the walk is empty."
	shared default V? startpoint => edges.first?.source;

	"The vertex where the walk end or none if the walk is empty."
	shared default V? endpoint => edges.last?.target;

	"The length of the walk, i.e. the number of edges."
	shared Integer length {
		return edges.size;
	}

	"The distance of a walk with recpect to the given [[Weights]]."
	shared Weight distance<Weight>(Weights<Weight, E> weights) given Weight satisfies Summable<Weight> {
		return edges.map(weights.weight).fold(weights.zero)(plus<Weight>);
	}

	"Answer whether the walk is empty."
	shared Boolean empty {
		return edges.empty;
	}

	"Answer whether the walk is not empty."
	shared Boolean notEmpty {
		return !empty;
	}

	"Compare walks by length."
	shared actual default Comparison compare(Walk<V,E> other) {
		return length.compare(other.length);
	}
}
