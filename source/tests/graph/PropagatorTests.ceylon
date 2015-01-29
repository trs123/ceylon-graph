import ceylon.test {
	test,
	assertEquals,
	assertTrue
}

import examples.cycle {
	Cycle
}
import examples.routemap {
	RouteMap,
	City,
	Route,
	example
}

import graph.traversal.propagator {
	VertexPropagatorFactory,
	VertexPropagator,
	EdgePropagatorFactory,
	EdgePropagator
}
import graph.traversal.visitor {
	VertexVisitor,
	EdgeVisitor,
	traversalVisitors
}

by ("ThorstenSeitz")
shared class VertexPropagatorTests() {

	Cycle cycle = Cycle(10);
	VertexVisitor<Integer> visitor = traversalVisitors.nullVertexVisitor<Integer>();
	VertexPropagatorFactory<Integer,Cycle> vertexPropagatorFactory = VertexPropagatorFactory<Integer,Cycle>(cycle, visitor);

	test
	shared void shouldPropagateToNeighbors() {
		VertexPropagator<Integer,Cycle> vertexPropagator = vertexPropagatorFactory.propagator(1);
		assertEquals(vertexPropagator.adjacencies.sequence(), [2]);
	}
}

by ("ThorstenSeitz")
shared class EdgePropagatorTests() {

	RouteMap routeMap = example.routeMap;
	EdgeVisitor<City,Route> visitor = traversalVisitors.nullEdgeVisitor<City,Route>();
	EdgePropagatorFactory<City,Route,RouteMap> edgePropagatorFactory = EdgePropagatorFactory<City,Route,RouteMap>(routeMap, visitor);

	test
	shared void shouldPropagateViaEdges() {
		EdgePropagator<City,Route,RouteMap> edgePropagator = edgePropagatorFactory.propagator(example.hannover);
		assertEquals(
			sort(edgePropagator.adjacencies.map(Route.name)),
			["A2", "A7", "A7", "B188", "B3", "B3", "B79"]);
	}

	test
	shared void shouldOrientEdgesOutwards() {
		City source = example.hannover;
		EdgePropagator<City,Route,RouteMap> edgePropagator = edgePropagatorFactory.propagator(source);
		assertTrue(edgePropagator.adjacencies.map(Route.source).every((City city) => city == source));
		assertEquals(
			sort(edgePropagator.adjacencies.map(Route.target).map(City.name)),
			["Berlin", "Berlin", "Hamburg", "Hamburg", "Kassel", "Kassel", "Leipzig"]);
	}

	test
	shared void shouldOrientEdgesOutwards2() {
		City source = example.hamburg;
		EdgePropagator<City,Route,RouteMap> edgePropagator = edgePropagatorFactory.propagator(source);
		assertTrue(edgePropagator.adjacencies.map(Route.source).every((City city) => city == source));
		assertEquals(
			sort(edgePropagator.adjacencies.map(Route.target).map(City.name)),
			["Berlin", "Hannover", "Hannover"]);
	}
}
