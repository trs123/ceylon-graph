import ceylon.test {
	test,
	assertEquals,
	assertTrue
}

import examples.cycle {
	Cycle
}
import examples.routemap {
	example,
	RouteMap,
	Route
}

import graph.filter {
	FilterableAdjacencyGraph
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
					shared actual Link? edgeConnecting(Integer source, Integer target) {
						if (predicate(source) && predicate(target)) {
							return outer.edgeConnecting(source, target);
						} else {
							return null;
						}
					}
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
		// check edges
		assertEquals(filteredCycle.edgeConnecting(9,0), null);
		assertEquals(filteredCycle.edgeConnecting(0,1), filteredCycle.Link(0,1));
		assertEquals(filteredCycle.edgeConnecting(4,5), null);
	}

	test
	shared void filteredRouteMap() {
		RouteMap routeMap = example.routeMap;
		// filter
		RouteMap aroundBerlin = routeMap
				.filterEdges((Route edge) => edge.isEndpoint(example.berlin))
				.dropUnconnectedVertices();
		// check vertices
		assertEquals(
			aroundBerlin.vertices.sequence(),
			[example.berlin, example.hamburg, example.hannover, example.leipzig]);
		// check edges
		for (Route route in aroundBerlin.edges) {
			assertTrue(route.isEndpoint(example.berlin));
		}
	}
}
