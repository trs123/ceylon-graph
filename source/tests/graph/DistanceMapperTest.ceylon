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
	City,
	Distance,
	km
}

import graph.traversal.visitor {
	mapDistances,
	HopDistanceMap,
	mapHops,
	DistanceMap
}

"Test [[graph.traversal.visitor::DistanceMapper]]."
by ("ThorstenSeitz")
shared class DistanceMapperTest() {

	test
	shared void testHopDistancesInCycle() {
		Cycle graph = Cycle(10);
		HopDistanceMap<Integer> distanceMap = mapHops<Integer,Cycle>(graph, 0);
		// The hop distance of each vertex from vertex 0 should match its value.
		for (Integer i in 0..9) {
			assertEquals(i, distanceMap.get(i));
		}
	}

	test
	shared void testHopDistancesInRouteMap() {
		RouteMap routeMap = example.routeMap;
		HopDistanceMap<City> distanceMap = mapHops(routeMap, example.hamburg);
		for (city->distance in {
			example.hamburg->0,
			example.hannover->1,
			example.berlin->1,
			example.kassel->2,
			example.leipzig->2 }) {
			assertEquals(distance, distanceMap.get(city));
		}
	}

	test
	shared void testDistancesInRouteMap() {
		RouteMap routeMap = example.routeMap;
		DistanceMap<City,Distance> distanceMap = mapDistances(routeMap, example.hamburg, routeMap.distances);
		for (city->distance in {
			example.hamburg->km(0),
			example.hannover->km(151),
			example.berlin->km(288),
			example.kassel->km(307),
			example.leipzig->km(414) }) {
			assertEquals(distance, distanceMap.get(city));
		}
	}
}
