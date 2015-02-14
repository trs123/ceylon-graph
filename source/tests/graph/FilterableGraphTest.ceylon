import ceylon.test {
	test,
	assertEquals,
	assertTrue,
	assertFalse
}

import examples.cycle {
	Cycle
}
import examples.routemap {
	example,
	RouteMap,
	Route,
	City
}

import graph.filter {
	FilterableAdjacencyGraph
}
import graph.traversal.visitor {
	mapHops,
	HopDistanceMap
}

by ("ThorstenSeitz")
shared class FilterableGraphTest() {

	test
	shared void filteredCycle() {
		class FCycle(Integer n)
				extends Cycle(n)
				satisfies FilterableAdjacencyGraph<Integer,FCycle> {

			shared actual FCycle filterVertices(Boolean predicate(Integer vertex)) {
				object filteredGraph extends FCycle(outer.n) {
					shared actual {Integer*} vertices => outer.vertices.filter(predicate);
					shared actual {Integer*} neighbors(Integer vertex) => outer.neighbors(vertex).filter(predicate);
				}
				return filteredGraph;
			}
		}
		FCycle cycle = FCycle(10);
		FCycle filteredCycle = cycle.filterVertices((Integer vertex) => vertex < 5);
		// check vertices
		assertEquals(filteredCycle.vertices.sequence(), [0,1,2,3,4]);
		// check neighbors
		assertEquals(filteredCycle.neighbors(0).sequence(), [1]);
		assertEquals(filteredCycle.neighbors(1).sequence(), [2]);
		assertEquals(filteredCycle.neighbors(2).sequence(), [3]);
		assertEquals(filteredCycle.neighbors(3).sequence(), [4]);
		assertEquals(filteredCycle.neighbors(4).sequence(), []);
	}

	test
	shared void edgeFilteredRouteMap() {
		RouteMap routeMap = example.routeMap;
		// filter
		RouteMap aroundBerlin = routeMap
				.filterEdges((Route edge) => edge.isEndpoint(example.berlin))
				.dropUnconnectedVertices();
		// check vertices
		assertEquals(
			aroundBerlin.vertices.sequence(),
			[example.berlin, example.hamburg, example.hannover, example.leipzig]);
		assertFalse(aroundBerlin.containsVertex(example.kassel));
		assertFalse(aroundBerlin.containsVertex(example.wuerzburg));
		// check edges
		for (Route route in aroundBerlin.edges) {
			assertTrue(route.isEndpoint(example.berlin));
		}
	}

	test
	shared void vertexFilteredRouteMap() {
		RouteMap routeMap = example.routeMap;
		HopDistanceMap<City> distanceMap = mapHops(routeMap, example.hamburg);
		// filter
		RouteMap twoHopsFromHamburg = routeMap
				.filterVertices((City city) => distanceMap.get(city)?.notLargerThan(2) else false);
		// check vertices
		assertEquals(
			twoHopsFromHamburg.vertices.sequence(),
			[example.berlin, example.hamburg, example.hannover, example.kassel, example.leipzig]);
		assertFalse(twoHopsFromHamburg.containsVertex(example.wuerzburg));
	}
}
