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

import graph.traversal.visitor {
	DistanceMap,
	mapDistances
}

"Test [[graph.traversal.visitor::DistanceMapper]]."
by ("ThorstenSeitz")
shared class DistanceMapperTest() {

	test
	shared void testDistancesInCycle() {
		Cycle graph = Cycle(10);
		DistanceMap<Integer> distanceMap = mapDistances(graph, 0);
		// The distance of each vertex from vertex 0 should match its value.
		for (Integer i in 0..9) {
			assertEquals(i, distanceMap.get(i));
		}
	}

	test
	shared void testDistancesInRouteMap() {
		RouteMap routeMap = example.routeMap;
		DistanceMap<City> distanceMap = mapDistances(routeMap, example.hamburg);
		for (city->distance in {
			example.hamburg->0,
			example.hannover->1,
			example.berlin->1,
			example.kassel->2,
			example.leipzig->2 }) {
			assertEquals(distance, distanceMap.get(city));
		}
	}
}
