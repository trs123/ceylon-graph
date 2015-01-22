import ceylon.collection {
	MutableMap,
	HashMap
}

"Vertex visit state is encoded by color."
by ("ThorstenSeitz")
shared abstract class VisitColor() of white | gray | black {}
"white = vertex has not been visited yet"
shared object white extends VisitColor() {}
"gray = vertex has been visited but we are not done with all of its out-edges yet"
shared object gray extends VisitColor() {}
"black = vertex has been visited and we are not done with all of its out-edges"
shared object black extends VisitColor() {}

"A ColorMap stores the visit state of vertices. All vertices start out colored white.
 Implementation note: white vertices are not stored explicitly because white is the default."
by ("ThorstenSeitz")
shared class ColorMap<V>() given V satisfies Object {

	MutableMap<V,VisitColor> colorMap = HashMap<V,VisitColor>();

	shared void clear() => colorMap.clear();
	shared VisitColor getColor(V vertex) => colorMap.get(vertex) else white;
	shared void setColor(V vertex, VisitColor color) => colorMap.put(vertex, color);
}
