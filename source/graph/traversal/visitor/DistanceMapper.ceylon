import ceylon.collection {
	HashMap,
	MutableMap
}

import common {
	Monoid
}

import graph {
	Weights,
	Edge,
	IncidenceGraph,
	AdjacencyGraph
}
import graph.traversal {
	BfsEdgeTraversal,
	BfsTraversal
}

"Distance map giving the distance of vertices measured from a given origin according to some measure."
by ("ThorstenSeitz")
shared interface DistanceMap<Vertex,Distance> satisfies Map<Vertex,Distance>
		given Vertex satisfies Object {
	"The origin vertex from which the distances are measured."
	shared formal Vertex origin;
}

"A `DistanceMapper` memorizes the distance of each visited vertex from the vertex which has been visited first
 (called the origin). The distance of a vertex is the least number of edges connecting the origin with that vertex
 as encountered during the traversal."
by ("ThorstenSeitz")
shared abstract class DistanceMapper<Vertex,Distance,DistanceMonoid>(
	Vertex origin,
	DistanceMonoid monoid)
		satisfies GraphVisitor<Vertex>
		given Vertex satisfies Object
		given Distance satisfies Summable<Distance> & Comparable<Distance>
		given DistanceMonoid satisfies Monoid<Distance,DistanceMonoid> {

	MutableMap<Vertex,Distance> distances = HashMap<Vertex,Distance>();
	distances.put(origin, monoid.zero);

	"Update distance of target based on distance of source."
	shared void updateDistanceBetween(Vertex source, Vertex target, Distance delta) {
		Distance? sourceDistance = getDistance(source);
		assert (exists sourceDistance);
		updateDistance(target, sourceDistance + delta);
	}

	"Answer the distance of a vertex from the origin, i.e. the least number of edges connecting them."
	Distance? getDistance(Vertex vertex) => distances.get(vertex);

	"Update distance of vertex with d if less than current value (or if no value is present yet)."
	void updateDistance(Vertex vertex, Distance d) {
		if (getDistance(vertex)?.largerThan(d) else true) {
			distances.put(vertex, d);
		}
	}

	"Answer a clone of the current [[distance map|DistanceMap]]. This may not be complete or correct yet, if
	 the traversal which uses the distance mapper as visitor has not been completed."
	shared DistanceMap<Vertex,Distance> distanceMap {
		object distanceMap extends HashMap<Vertex,Distance>() satisfies DistanceMap<Vertex,Distance> {
			shared actual Vertex origin => outer.origin;
		}
		distanceMap.putAll(distances);
		return distanceMap;
	}
}

"An edge-visiting [[distance mapper|DistanceMapper]]."
by ("ThorstenSeitz")
shared class EdgeDistanceMapper<Vertex,E,Distance>(
	Vertex origin,
	Weights<Distance,E> weights)
		extends DistanceMapper<Vertex,Distance,Weights<Distance,E>>(origin, weights)
		satisfies EdgeVisitor<Vertex,E>
		given Vertex satisfies Object
		given E satisfies Edge<Vertex,E>
		given Distance satisfies Summable<Distance> & Comparable<Distance> {

	"Update distance for target of edge based on distance of source of edge."
	shared actual void examineEdge(E edge) {
		updateDistanceBetween(edge.source, edge.target, weights.weight(edge));
	}
}

"Map distances of all vertices of the given graph measured from given origin according to `weights`.
 Implementation note: uses a [[breadth first search edge traversal|BfsEdgeTraversal]]."
by ("ThorstenSeitz")
shared DistanceMap<Vertex,Weight> mapDistances<Vertex,E,Graph,Weight>(
	Graph graph,
	Vertex origin,
	Weights<Weight,E> weights)
		given Vertex satisfies Object
		given E satisfies Edge<Vertex,E>
		given Graph satisfies IncidenceGraph<Vertex,E>
		given Weight satisfies Summable<Weight> & Comparable<Weight> {

	EdgeDistanceMapper<Vertex,E,Weight> distanceMapper = EdgeDistanceMapper(origin, weights);
	BfsEdgeTraversal<Vertex,E,Graph>(graph, origin, distanceMapper).traverse();
	return distanceMapper.distanceMap;
}

"A distance map for hops."
by ("ThorstenSeitz")
shared interface HopDistanceMap<Vertex>
		given Vertex satisfies Object => DistanceMap<Vertex,Integer>;

"A monoid for counting hops."
by ("ThorstenSeitz")
shared class Hops() satisfies Monoid<Integer,Hops> {
	shared actual Integer zero => 0;
}

"A vertex-visiting [[distance mapper|DistanceMapper]] which measures distance in hops, i.e. number of edges."
by ("ThorstenSeitz")
shared class HopDistanceMapper<Vertex>(
	Vertex origin)
		extends DistanceMapper<Vertex,Integer,Hops>(origin, Hops())
		satisfies VertexVisitor<Vertex>
		given Vertex satisfies Object {

	"Update distance for target of implicit edge based on distance of source of edge."
	shared actual void examineEdge(Vertex source, Vertex target) {
		updateDistanceBetween(source, target, 1);
	}
}

"Map hop distance of all vertices of the given graph measured from given origin.
 Implementation note: uses a [[breadth first search traversal|BfsTraversal]]."
by ("ThorstenSeitz")
shared HopDistanceMap<Vertex> mapHops<Vertex,Graph>(Graph graph, Vertex origin)
		given Vertex satisfies Object
		given Graph satisfies AdjacencyGraph<Vertex> {

	HopDistanceMapper<Vertex> distanceMapper = HopDistanceMapper(origin);
	BfsTraversal<Vertex,Graph>(graph, origin, distanceMapper).traverse();
	return distanceMapper.distanceMap;
}

