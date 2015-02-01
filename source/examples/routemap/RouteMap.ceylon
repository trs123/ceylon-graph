import ceylon.time {
	Period,
	zeroPeriod=zero
}

import graph {
	IncidenceGraph,
	Walk,
	Weights
}
import graph.impl {
	AbstractIncidenceList
}
import graph.multigraph {
	Multigraph
}
import graph.undirected {
	UndirectedEdge,
	UndirectedGraph
}

"Convenience function to create periods from hours and minutes only."
by ("ThorstenSeitz")
shared Period period(Integer hours, Integer minutes) => Period(0, 0, 0, hours, minutes, 0, 0);

"Convenience function to create a [[Distance]]."
by ("ThorstenSeitz")
shared Distance km(Integer kilometers, Integer meters = 0) => Distance(kilometers * 1000 + meters);

"Distance measured in km (Value Object)."
by ("ThorstenSeitz")
shared final class Distance(shared Integer meters) satisfies Summable<Distance> & Comparable<Distance> {
	shared actual Distance plus(Distance other) => Distance(meters + other.meters);
	shared actual Comparison compare(Distance other) => meters.compare(other.meters);
	shared actual Boolean equals(Object other) { // TODO: rewrite as if expression in next Ceylon version
		if (is Distance other) {
			return meters.equals(other.meters);
		} else {
			return false;
		}
	}
	shared actual Integer hash => meters.hash;
	shared actual String string => "``meters`` m";
}

"A city (Value Object)."
by ("ThorstenSeitz")
shared final class City(shared String name) satisfies Comparable<City> {
	shared actual Comparison compare(City other) => name.compare(other.name);
	shared actual Boolean equals(Object other) { // TODO: rewrite as if expression in next Ceylon version
		if (is City other) {
			return name.equals(other.name);
		} else {
			return false;
		}
	}
	shared actual Integer hash => name.hash;
	shared actual String string => name;
}

"A route between two cities."
by ("ThorstenSeitz")
shared final class Route(
	shared String name,
	shared actual City source,
	shared actual City target,
	shared Distance distance,
	shared Period travelTime) satisfies UndirectedEdge<City,Route> {

	shared actual Route reversed => Route(name, target, source, distance, travelTime);
}

"A route map of [[cities|City]] connected by undirected [[routes|Route]] with a given [[distance|Distance]]
 and [[travel time|ceylon.time::Period]].
 The same cities may be connected by multiple routes (e.g. Autobahn or Bundesstraße) with different distances
 and travel times. The route map is therefore a [[Multigraph]]."
by ("ThorstenSeitz")
shared final class RouteMap({City*} cities, {Route*} routes)
		extends AbstractIncidenceList<City,Route,RouteMap>(cities, routes)
		satisfies Multigraph<City,Route> & IncidenceGraph<City,Route> & UndirectedGraph<City,Route> {

	"An accessor for the [[distance|Route.distance]] of a route."
	shared object distances satisfies Weights<Distance,City,Route> {
		shared actual Distance weight(Route route) => route.distance;
		shared actual Distance zero => km(0);
	}

	"An accessor for the [[travel time|Route.travelTime]] of a route."
	shared object travelTimes satisfies Weights<Period,City,Route> {
		shared actual Period weight(Route route) => route.travelTime;
		shared actual Period zero => zeroPeriod;
	}

	"Answer all routes between the given cities."
	shared actual {Route*} edgesConnecting(City source, City target) => adjacentEdges(source).filter((Route route) => route.target == target);

	"Create RouteMap from vertices and edges (used by filter methods)."
	shared actual RouteMap create({City*} vertices, {Route*} edges) => RouteMap(vertices, edges);
}

"This example combines a concrete [[RouteMap]] with a named list of the cities forming its vertices."
shared object example {
	shared City leipzig = City("Leipzig");
	shared City hamburg = City("Hamburg");
	shared City berlin = City("Berlin");
	shared City hannover = City("Hannover");
	shared City kassel = City("Kassel");
	shared RouteMap routeMap = RouteMap(
		{ berlin, hamburg, hannover, kassel, leipzig },
		{
			Route("A7", hamburg, hannover, km(151), period(1, 38)),
			Route("B3", hamburg, hannover, km(159), period(3, 15)),
			Route("A2", hannover, berlin, km(285), period(3, 4)),
			Route("B188", hannover, berlin, km(292), period(5, 4)),
			Route("A24", hamburg, berlin, km(288), period(2, 54)),
			Route("A9", berlin, leipzig, km(190), period(2, 11)),
			Route("B2", berlin, leipzig, km(174), period(3, 31)),
			Route("B79", hannover, leipzig, km(263), period(4, 38)),
			Route("A38", leipzig, kassel, km(254), period(2, 26)),
			Route("A4", leipzig, kassel, km(287), period(3, 23)),
			Route("B249", leipzig, kassel, km(258), period(4, 34)),
			Route("A7", hannover, kassel, km(167), period(1, 54)),
			Route("B3", hannover, kassel, km(156), period(2, 44))
		});
}

"Example code demonstrating how to calculate different distances on a path or [[walk|Walk]]."
shared void printPathInfo(RouteMap routeMap, Walk<City,Route> shortestPath) {

	Distance distance = shortestPath.distance(routeMap.distances);
	Period travelTime = shortestPath.distance(routeMap.travelTimes);

	print("Distance = ``distance``");
	print("Travel time = ``travelTime``");
}
