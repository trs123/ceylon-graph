import graph {
	IncidenceGraph,
	Walk,
	Weights
}
import graph.multigraph {
	Multigraph
}
import graph.undirected {
	UndirectedEdge,
	UndirectedGraph
}

"Distance measured in km."
by ("ThorstenSeitz")
shared final class Distance(shared Float km) satisfies Summable<Distance> {
	shared actual Distance plus(Distance other) => Distance(km + other.km);
}

"Duration measured in hours."
by ("ThorstenSeitz")
shared final class Duration(shared Float hours) satisfies Summable<Duration> {
	shared actual Duration plus(Duration other) => Duration(hours + other.hours);
}

"A city."
by ("ThorstenSeitz")
shared final class City(shared String name) {}

"A route between two cities."
by ("ThorstenSeitz")
shared final class Route(
	shared String name,
	shared actual City source,
	shared actual City target,
	shared Distance distance,
	shared Duration travelTime) satisfies UndirectedEdge<City,Route> {

	shared actual Route reversed => Route(name, target, source, distance, travelTime);
}

"A route map of [[cities|City]] connected by undirected [[routes|Route]] with a given [[distance|Distance]]
 and [[travel time|Duration]].
 The same cities may be connected by multiple routes (e.g. Autobahn or Bundesstraße) with different distances
 and travel times. The route map is therefore a [[Multigraph]]."
by ("ThorstenSeitz")
shared final class RouteMap({City*} cities, {Route*} routes) satisfies Multigraph<City,Route> & IncidenceGraph<City,Route> & UndirectedGraph<City,Route> {

	shared actual {Route*} edges => routes;

	shared actual {City*} vertices => cities;

	shared object distances satisfies Weights<Distance,Route> {
		shared actual Distance weight(Route route) => route.distance;
		shared actual Distance zero => Distance(0.0);
	}

	shared object travelTimes satisfies Weights<Duration,Route> {
		shared actual Duration weight(Route route) => route.travelTime;
		shared actual Duration zero => Duration(0.0);
	}

	shared actual {Route*} edgesConnecting(City source, City target) => adjacentEdges(source).filter((Route route) => route.target == target);
}

"Example code demonstrating how to calculate different distances on a path or [[walk|Walk]]."
shared void printPathInfo(RouteMap routeMap, Walk<City,Route> shortestPath) {

	Distance distance = shortestPath.distance(routeMap.distances);
	Duration travelTime = shortestPath.distance(routeMap.travelTimes);

	print("Distance = ``distance``");
	print("Travel time = ``travelTime``");
}
