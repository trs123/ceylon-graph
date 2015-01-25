import ceylon.test {
	test,
	assertEquals
}

import examples.cycle {
	Cycle
}
import examples.routemap {
	RouteMap,
	example,
	City
}

import graph.traversal {
	BfsTraversal
}
import graph.traversal.visitor {
	DistanceMapper
}
by ("ThorstenSeitz")
shared class DistanceMapperTest() {

	test
	shared void testDistancesInCycle() {
		Cycle graph = Cycle(10);
		DistanceMapper<Integer> distanceMapper = DistanceMapper<Integer>();
		graph.bfsTraversal(0, distanceMapper).traverse();
		// The distance of each vertex from vertex 0 should match its value.
		for (Integer i in 0..9) {
			assertEquals(i, distanceMapper.getHops(i));
		}
	}

	test
	shared void testDistancesInRouteMap() {
		RouteMap routeMap = example.routeMap;
		DistanceMapper<City> distanceMapper = DistanceMapper<City>();
		BfsTraversal(routeMap, example.hamburg, distanceMapper).traverse();
		for (city->distance in {
			example.hamburg->0,
			example.hannover->1,
			example.berlin->1,
			example.kassel->2,
			example.leipzig->2 }) {
			assertEquals(distance, distanceMapper.getHops(city));
		}
	}
}
