import ceylon.test {
	test,
	assertEquals
}

import examples.routemap {
	example,
	RouteMap,
	City,
	Route,
	period,
	km
}

import graph {
	Walk
}

"Test [[Walk]] using [[RouteMap]] [[example]]."
by ("ThorstenSeitz")
shared class WalkTests() {

	RouteMap routeMap = example.routeMap;

	// helper to determine unique route between two cities.
	Route autobahn(City from, City to) {
		Route? route = routeMap
			.edgesConnecting(from, to)
			.find((Route route) => route.name.startsWith("A"));
		assert(is Route route);
		return route;
	}

	"Test [[Walk.distance]] with different [[weights|graph::Weights]]."
	test
	shared void walkDistances() {
		// define TravelRoute
		class TravelRoute(shared actual [Route*] edges) satisfies Walk<City,Route> {}
		// find legs for the travel route hamburg->berlin->leipzig
		Route hamburgBerlin = autobahn(example.hamburg, example.berlin);
		Route berlinLeipzig = autobahn(example.berlin, example.leipzig);
		// create travel route (= a Walk)
		TravelRoute travelRoute = TravelRoute([hamburgBerlin, berlinLeipzig]);
		// check different distances along that Walk
		assertEquals(travelRoute.distance(routeMap.distances), km(288+190));
		assertEquals(travelRoute.distance(routeMap.travelTimes), period(2, 54) + period(2, 11));
	}
}
