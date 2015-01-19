var index = [
{'name': 'graph', 'type': 'package', 'url': 'index.html#section-package', 'doc': '', 'tags': [],'icons': ['icon-package']},
{'name': 'AdjacencyGraph.vertices', 'type': 'value', 'url': 'AdjacencyGraph.type.html#vertices', 'doc': '<p>All vertices of the graph.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'AdjacencyGraph.neighbors', 'type': 'function', 'url': 'AdjacencyGraph.type.html#neighbors', 'doc': '<p>All neighbor vertices of the given vertex.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'AdjacencyGraph.forEachNeighbor', 'type': 'function', 'url': 'AdjacencyGraph.type.html#forEachNeighbor', 'doc': '<p>Apply action for each neighbor of the given vertex.</p>\n', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'AdjacencyGraph.degreeOf', 'type': 'function', 'url': 'AdjacencyGraph.type.html#degreeOf', 'doc': '<p>Answer the degree of the given vertex, i.e. the number of neighbors.</p>\n', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'AdjacencyGraph.hasNeighbors', 'type': 'function', 'url': 'AdjacencyGraph.type.html#hasNeighbors', 'doc': '<p>Answer whether the given vertex has at least one neighbor.</p>\n', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'AdjacencyGraph.containsEdge', 'type': 'function', 'url': 'AdjacencyGraph.type.html#containsEdge', 'doc': '<p>Answer whether the graph contains an edge from source to target.</p>\n', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'AdjacencyGraph.empty', 'type': 'attribute', 'url': 'AdjacencyGraph.type.html#empty', 'doc': '<p>Answer whether the graph is empty, i.e. contains no vertices.</p>\n', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'AdjacencyGraph.notEmpty', 'type': 'attribute', 'url': 'AdjacencyGraph.type.html#notEmpty', 'doc': '<p>Answer whether the graph is not empty, i.e. contains at least one vertex.</p>\n', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'AdjacencyGraph', 'type': 'interface', 'url': 'AdjacencyGraph.type.html', 'doc': '<h2>Concept</h2>\n<p>An <code><a class=\'link\' href=\'AdjacencyGraph.type.html\' title=\'Go to graph::AdjacencyGraph\'><span class=\'type-identifier\'>AdjacencyGraph</span></a></code> is a graph which is concerned only with the vertices and not with the edges.</p>\n', 'tags': [],'icons': ['icon-interface']},
{'name': 'Edge.source', 'type': 'value', 'url': 'Edge.type.html#source', 'doc': '<p>The source vertex of the edge.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'Edge.target', 'type': 'value', 'url': 'Edge.type.html#target', 'doc': '<p>The target vertex of the edge.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'Edge.isDirected', 'type': 'value', 'url': 'Edge.type.html#isDirected', 'doc': '<p>Whether the edge is directed.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'Edge.isLoop', 'type': 'attribute', 'url': 'Edge.type.html#isLoop', 'doc': '<p>Answer whether the edge is a loop, i.e. source == target.</p>\n', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'Edge.isLink', 'type': 'attribute', 'url': 'Edge.type.html#isLink', 'doc': '<p>Answer whether the edge is a link between two different vertices.</p>\n', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'Edge.otherEnd', 'type': 'function', 'url': 'Edge.type.html#otherEnd', 'doc': '<p>Given one endpoint of the edge answer its other endpoint.</p>\n', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'Edge.reversed', 'type': 'value', 'url': 'Edge.type.html#reversed', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'Edge.isIncident', 'type': 'function', 'url': 'Edge.type.html#isIncident', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'Edge', 'type': 'interface', 'url': 'Edge.type.html', 'doc': '<p>A generic edge between two vertices of type Vertex.</p>\n', 'tags': [],'icons': ['icon-interface', 'icon-decoration-enumerated']},
{'name': 'IncidenceGraph.edges', 'type': 'value', 'url': 'IncidenceGraph.type.html#edges', 'doc': '<p>All edges of the graph.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'IncidenceGraph.adjacentEdges', 'type': 'function', 'url': 'IncidenceGraph.type.html#adjacentEdges', 'doc': '<p>The adjacent edges of the given vertex.</p>\n', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'IncidenceGraph.forEachAdjacentEdge', 'type': 'function', 'url': 'IncidenceGraph.type.html#forEachAdjacentEdge', 'doc': '<p>Apply action(E) for each adjacent edge of the given vertex.</p>\n', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'IncidenceGraph.neighbors', 'type': 'function', 'url': 'IncidenceGraph.type.html#neighbors', 'doc': '<p>All neighbor vertices of the given vertex.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'IncidenceGraph.hasNeighbors', 'type': 'function', 'url': 'IncidenceGraph.type.html#hasNeighbors', 'doc': '<p>Answer whether the given vertex has at least one neighbor.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-over']},
{'name': 'IncidenceGraph.containsEdge', 'type': 'function', 'url': 'IncidenceGraph.type.html#containsEdge', 'doc': '<p>Answer whether the graph contains an edge from source to target.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-over']},
{'name': 'IncidenceGraph', 'type': 'interface', 'url': 'IncidenceGraph.type.html', 'doc': '<p>A graph with explicit edges.</p>\n', 'tags': [],'icons': ['icon-interface']},
{'name': 'run', 'type': 'function', 'url': 'index.html#run', 'doc': '<p>Run the module <code>graph</code>.</p>\n', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'SimpleGraph.edgeConnecting', 'type': 'function', 'url': 'SimpleGraph.type.html#edgeConnecting', 'doc': '<p>Answer the edge between the given vertices if it exists.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'SimpleGraph.adjacentEdges', 'type': 'function', 'url': 'SimpleGraph.type.html#adjacentEdges', 'doc': '<p>The adjacent edges of the given vertex.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-over']},
{'name': 'SimpleGraph', 'type': 'interface', 'url': 'SimpleGraph.type.html', 'doc': '<p>A <code><a class=\'link\' href=\'SimpleGraph.type.html\' title=\'Go to graph::SimpleGraph\'><span class=\'type-identifier\'>SimpleGraph</span></a></code> contains at most one undirected or two directed (but opposite) edges between any two vertices.</p>\n', 'tags': [],'icons': ['icon-interface']},
{'name': 'Walk.edges', 'type': 'value', 'url': 'Walk.type.html#edges', 'doc': '<p>The edges comprising the walk.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'Walk.vertices', 'type': 'attribute', 'url': 'Walk.type.html#vertices', 'doc': '<p>The vertices touched by the walk.</p>\n', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'Walk.startpoint', 'type': 'attribute', 'url': 'Walk.type.html#startpoint', 'doc': '<p>The vertex where the walk starts or none if the walk is empty.</p>\n', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'Walk.endpoint', 'type': 'attribute', 'url': 'Walk.type.html#endpoint', 'doc': '<p>The vertex where the walk end or none if the walk is empty.</p>\n', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'Walk.length', 'type': 'attribute', 'url': 'Walk.type.html#length', 'doc': '<p>The length of the walk, i.e. the number of edges.</p>\n', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'Walk.distance', 'type': 'function', 'url': 'Walk.type.html#distance', 'doc': '<p>The distance of a walk with recpect to the given <code><a class=\'link\' href=\'Weights.type.html\' title=\'Go to graph::Weights\'><span class=\'type-identifier\'>Weights</span></a></code>.</p>\n', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'Walk.empty', 'type': 'attribute', 'url': 'Walk.type.html#empty', 'doc': '<p>Answer whether the walk is empty.</p>\n', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'Walk.notEmpty', 'type': 'attribute', 'url': 'Walk.type.html#notEmpty', 'doc': '<p>Answer whether the walk is not empty.</p>\n', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'Walk.compare', 'type': 'function', 'url': 'Walk.type.html#compare', 'doc': '<p>Compare walks by length.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'Walk', 'type': 'interface', 'url': 'Walk.type.html', 'doc': '<p>A Walk is a possibly empty sequence of edges connecting two vertices.</p>\n', 'tags': [],'icons': ['icon-interface']},
{'name': 'Weights.weight', 'type': 'function', 'url': 'Weights.type.html#weight', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'Weights.zero', 'type': 'value', 'url': 'Weights.type.html#zero', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'Weights', 'type': 'interface', 'url': 'Weights.type.html', 'doc': '<p><code><a class=\'link\' href=\'Weights.type.html\' title=\'Go to graph::Weights\'><span class=\'type-identifier\'>Weights</span></a></code> gives a mapping from <code><a class=\'link\' href=\'Edge.type.html\' title=\'Go to graph::Edge\'><span class=\'type-identifier\'>Edge</span></a></code>s to weights and a zero element to make <code><span class=\'type-parameter\'>Weight</span></code> a monoid.</p>\n', 'tags': [],'icons': ['icon-interface']},
{'name': 'graph.directed', 'type': 'package', 'url': 'directed/index.html', 'doc': '', 'tags': [],'icons': ['icon-package']},
{'name': 'DirectedEdge.isDirected', 'type': 'attribute', 'url': 'directed/DirectedEdge.type.html#isDirected', 'doc': '<p>Whether the edge is directed.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'DirectedEdge.isIncident', 'type': 'function', 'url': 'directed/DirectedEdge.type.html#isIncident', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'DirectedEdge', 'type': 'interface', 'url': 'directed/DirectedEdge.type.html', 'doc': '', 'tags': [],'icons': ['icon-interface', 'icon-decoration-enumerated']},
{'name': 'DirectedGraph.outgoingEdgesOf', 'type': 'function', 'url': 'directed/DirectedGraph.type.html#outgoingEdgesOf', 'doc': '', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'DirectedGraph.incomingEdgesOf', 'type': 'function', 'url': 'directed/DirectedGraph.type.html#incomingEdgesOf', 'doc': '', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'DirectedGraph.edges', 'type': 'attribute', 'url': 'directed/DirectedGraph.type.html#edges', 'doc': '<p>All edges of the graph.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'DirectedGraph', 'type': 'interface', 'url': 'directed/DirectedGraph.type.html', 'doc': '', 'tags': [],'icons': ['icon-interface']},
{'name': 'graph.example.cycle', 'type': 'package', 'url': 'example/cycle/index.html', 'doc': '', 'tags': [],'icons': ['icon-package']},
{'name': 'Link.reversed', 'type': 'attribute', 'url': 'example/cycle/Cycle.Link.type.html#reversed', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'Link', 'type': 'class', 'url': 'example/cycle/Cycle.Link.type.html', 'doc': '', 'tags': [],'icons': ['icon-class', 'icon-decoration-final']},
{'name': 'Cycle.edgeConnecting', 'type': 'function', 'url': 'example/cycle/Cycle.type.html#edgeConnecting', 'doc': '<p>Answer the edge between the given vertices if it exists.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'Cycle.neighbors', 'type': 'function', 'url': 'example/cycle/Cycle.type.html#neighbors', 'doc': '<p>All neighbor vertices of the given vertex.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'Cycle.vertices', 'type': 'attribute', 'url': 'example/cycle/Cycle.type.html#vertices', 'doc': '<p>All vertices of the graph.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'Cycle.bfsTraversal', 'type': 'function', 'url': 'example/cycle/Cycle.type.html#bfsTraversal', 'doc': '', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'Cycle', 'type': 'class', 'url': 'example/cycle/Cycle.type.html', 'doc': '<p>Simple directed graph forming a cycle of <code>n</code> vertices.</p>\n', 'tags': [],'icons': ['icon-class', 'icon-decoration-final']},
{'name': 'BfsTraversal.graphIterator', 'type': 'function', 'url': 'example/cycle/BfsTraversal.type.html#graphIterator', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'BfsTraversal', 'type': 'class', 'url': 'example/cycle/BfsTraversal.type.html', 'doc': '<p>Breadth first traversal for a <code><a class=\'link\' href=\'example/cycle/Cycle.type.html\' title=\'Go to graph.example.cycle::Cycle\'><span class=\'type-identifier\'>Cycle</span></a></code> using a <code><a class=\'link\' href=\'traversal/propagator/VertexPropagator.type.html\' title=\'Go to graph.traversal.propagator::VertexPropagator\'><span class=\'type-identifier\'>VertexPropagator</span></a></code>.</p>\n', 'tags': [],'icons': ['icon-class']},
{'name': 'graph.example.routemap', 'type': 'package', 'url': 'example/routemap/index.html', 'doc': '<p>This package contains an example for a <a class=\'link-custom-text\' href=\'multigraph/Multigraph.type.html\' title=\'Go to graph.multigraph::Multigraph\'>multigraph</a> representing a route map for…</p>\n', 'tags': [],'icons': ['icon-package']},
{'name': 'Distance.plus', 'type': 'function', 'url': 'example/routemap/Distance.type.html#plus', 'doc': '<p>The result of adding the given value to this value.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'Distance', 'type': 'class', 'url': 'example/routemap/Distance.type.html', 'doc': '<p>Distance measured in km.</p>\n', 'tags': [],'icons': ['icon-class', 'icon-decoration-final']},
{'name': 'Duration.plus', 'type': 'function', 'url': 'example/routemap/Duration.type.html#plus', 'doc': '<p>The result of adding the given value to this value.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'Duration', 'type': 'class', 'url': 'example/routemap/Duration.type.html', 'doc': '<p>Duration measured in hours.</p>\n', 'tags': [],'icons': ['icon-class', 'icon-decoration-final']},
{'name': 'City', 'type': 'class', 'url': 'example/routemap/City.type.html', 'doc': '<p>A city.</p>\n', 'tags': [],'icons': ['icon-class', 'icon-decoration-final']},
{'name': 'Route.reversed', 'type': 'attribute', 'url': 'example/routemap/Route.type.html#reversed', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'Route', 'type': 'class', 'url': 'example/routemap/Route.type.html', 'doc': '<p>A route between two cities.</p>\n', 'tags': [],'icons': ['icon-class', 'icon-decoration-final']},
{'name': 'RouteMap.edges', 'type': 'attribute', 'url': 'example/routemap/RouteMap.type.html#edges', 'doc': '<p>All edges of the graph.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'RouteMap.vertices', 'type': 'attribute', 'url': 'example/routemap/RouteMap.type.html#vertices', 'doc': '<p>All vertices of the graph.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'distances.weight', 'type': 'function', 'url': 'example/routemap/RouteMap.distances.object.html#weight', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'distances.zero', 'type': 'attribute', 'url': 'example/routemap/RouteMap.distances.object.html#zero', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'distances', 'type': 'object', 'url': 'example/routemap/RouteMap.distances.object.html', 'doc': '', 'tags': [],'icons': ['icon-object']},
{'name': 'RouteMap.distances', 'type': 'value', 'url': 'example/routemap/RouteMap.type.html#distances', 'doc': '', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'travelTimes.weight', 'type': 'function', 'url': 'example/routemap/RouteMap.travelTimes.object.html#weight', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'travelTimes.zero', 'type': 'attribute', 'url': 'example/routemap/RouteMap.travelTimes.object.html#zero', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'travelTimes', 'type': 'object', 'url': 'example/routemap/RouteMap.travelTimes.object.html', 'doc': '', 'tags': [],'icons': ['icon-object']},
{'name': 'RouteMap.travelTimes', 'type': 'value', 'url': 'example/routemap/RouteMap.type.html#travelTimes', 'doc': '', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'RouteMap.edgesConnecting', 'type': 'function', 'url': 'example/routemap/RouteMap.type.html#edgesConnecting', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'RouteMap', 'type': 'class', 'url': 'example/routemap/RouteMap.type.html', 'doc': '<p>A route map of <a class=\'link-custom-text\' href=\'example/routemap/City.type.html\' title=\'Go to graph.example.routemap::City\'>cities</a> connected by undirected <a class=\'link-custom-text\' href=\'example/routemap/Route.type.html\' title=\'Go to graph.example.routemap::Route\'>routes</a> with a given <a class=\'link-custom-text\' href=\'example/routemap/Distance.type.html\' title=\'Go to graph.example.routemap::Distance\'>distance</a>\nand [[travel…</p>\n', 'tags': [],'icons': ['icon-class', 'icon-decoration-final']},
{'name': 'printPathInfo', 'type': 'function', 'url': 'example/routemap/index.html#printPathInfo', 'doc': '<p>Example code demonstrating how to calculate different distances on a path or <a class=\'link-custom-text\' href=\'Walk.type.html\' title=\'Go to graph::Walk\'>walk</a>.</p>\n', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'graph.multigraph', 'type': 'package', 'url': 'multigraph/index.html', 'doc': '', 'tags': [],'icons': ['icon-package']},
{'name': 'Multigraph.edgesConnecting', 'type': 'function', 'url': 'multigraph/Multigraph.type.html#edgesConnecting', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'Multigraph.occurrencesOfEdge', 'type': 'function', 'url': 'multigraph/Multigraph.type.html#occurrencesOfEdge', 'doc': '', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'Multigraph', 'type': 'interface', 'url': 'multigraph/Multigraph.type.html', 'doc': '', 'tags': [],'icons': ['icon-interface']},
{'name': 'graph.traversal', 'type': 'package', 'url': 'traversal/index.html', 'doc': '', 'tags': [],'icons': ['icon-package']},
{'name': 'GraphTraversal.graph', 'type': 'value', 'url': 'traversal/GraphTraversal.type.html#graph', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'GraphTraversal.start', 'type': 'value', 'url': 'traversal/GraphTraversal.type.html#start', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'GraphTraversal.graphIterator', 'type': 'function', 'url': 'traversal/GraphTraversal.type.html#graphIterator', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'GraphTraversal.iterator', 'type': 'function', 'url': 'traversal/GraphTraversal.type.html#iterator', 'doc': '<p>An iterator for the elements belonging to this stream.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'GraphTraversal.vertices', 'type': 'attribute', 'url': 'traversal/GraphTraversal.type.html#vertices', 'doc': '<p>Answer the vertices of the <code>graph</code> reached by this traversal starting by <code>start</code> in traversal order.</p>\n', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'GraphTraversal', 'type': 'interface', 'url': 'traversal/GraphTraversal.type.html', 'doc': '', 'tags': [],'icons': ['icon-interface']},
{'name': 'graph.traversal.iterator', 'type': 'package', 'url': 'traversal/iterator/index.html', 'doc': '', 'tags': [],'icons': ['icon-package']},
{'name': 'BfsIterator.push', 'type': 'function', 'url': 'traversal/iterator/BfsIterator.type.html#push', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'BfsIterator.nextVertex', 'type': 'function', 'url': 'traversal/iterator/BfsIterator.type.html#nextVertex', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'BfsIterator', 'type': 'class', 'url': 'traversal/iterator/BfsIterator.type.html', 'doc': '<p>Generic breadth first search traversal.</p>\n', 'tags': [],'icons': ['icon-class', 'icon-decoration-abstract']},
{'name': 'DfsIterator.push', 'type': 'function', 'url': 'traversal/iterator/DfsIterator.type.html#push', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'DfsIterator.nextVertex', 'type': 'function', 'url': 'traversal/iterator/DfsIterator.type.html#nextVertex', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'DfsIterator', 'type': 'class', 'url': 'traversal/iterator/DfsIterator.type.html', 'doc': '<p>Generic depth first search traversal.</p>\n', 'tags': [],'icons': ['icon-class', 'icon-decoration-abstract']},
{'name': 'GraphIterator.graph', 'type': 'value', 'url': 'traversal/iterator/GraphIterator.type.html#graph', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'GraphIterator.start', 'type': 'value', 'url': 'traversal/iterator/GraphIterator.type.html#start', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'GraphIterator', 'type': 'interface', 'url': 'traversal/iterator/GraphIterator.type.html', 'doc': '', 'tags': [],'icons': ['icon-interface']},
{'name': 'PropagatorBasedIterator.propagatorFor', 'type': 'function', 'url': 'traversal/iterator/PropagatorBasedIterator.type.html#propagatorFor', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'PropagatorBasedIterator', 'type': 'interface', 'url': 'traversal/iterator/PropagatorBasedIterator.type.html', 'doc': '<p>Graph iterator using a <code><a class=\'link\' href=\'traversal/propagator/Propagator.type.html\' title=\'Go to graph.traversal.propagator::Propagator\'><span class=\'type-identifier\'>Propagator</span></a></code> to abstract from propagating to neighbors via adjacent vertices\nor incident edges.</p>\n', 'tags': [],'icons': ['icon-interface']},
{'name': 'VertexIterator.visitor', 'type': 'attribute', 'url': 'traversal/iterator/VertexIterator.type.html#visitor', 'doc': '', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'VertexIterator.propagatorFor', 'type': 'function', 'url': 'traversal/iterator/VertexIterator.type.html#propagatorFor', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'VertexIterator', 'type': 'interface', 'url': 'traversal/iterator/VertexIterator.type.html', 'doc': '', 'tags': [],'icons': ['icon-interface']},
{'name': 'EdgeIterator.visitor', 'type': 'attribute', 'url': 'traversal/iterator/EdgeIterator.type.html#visitor', 'doc': '', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'EdgeIterator.propagatorFor', 'type': 'function', 'url': 'traversal/iterator/EdgeIterator.type.html#propagatorFor', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'EdgeIterator', 'type': 'interface', 'url': 'traversal/iterator/EdgeIterator.type.html', 'doc': '', 'tags': [],'icons': ['icon-interface']},
{'name': 'StandardGraphIterator.next', 'type': 'function', 'url': 'traversal/iterator/StandardGraphIterator.type.html#next', 'doc': '<p>The next element, or <span class=\'link-unresolvable\'><code>finished</code></span> if there are no more\nelements to be iterated.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'StandardGraphIterator.startWith', 'type': 'function', 'url': 'traversal/iterator/StandardGraphIterator.type.html#startWith', 'doc': '', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'StandardGraphIterator.push', 'type': 'function', 'url': 'traversal/iterator/StandardGraphIterator.type.html#push', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'StandardGraphIterator.nextVertex', 'type': 'function', 'url': 'traversal/iterator/StandardGraphIterator.type.html#nextVertex', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'StandardGraphIterator', 'type': 'class', 'url': 'traversal/iterator/StandardGraphIterator.type.html', 'doc': '<p>Generic traversal by using white/gray/black vertex colors and a collection of vertices waiting to be visited.</p>\n', 'tags': [],'icons': ['icon-class', 'icon-decoration-abstract']},
{'name': 'graph.traversal.propagator', 'type': 'package', 'url': 'traversal/propagator/index.html', 'doc': '', 'tags': [],'icons': ['icon-package']},
{'name': 'EdgePropagator.adjacencies', 'type': 'attribute', 'url': 'traversal/propagator/EdgePropagator.type.html#adjacencies', 'doc': '<p>Answer the adjacencies allowing access to the neighboring vertices.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'EdgePropagator.target', 'type': 'function', 'url': 'traversal/propagator/EdgePropagator.type.html#target', 'doc': '<p>Answer the target vertex reached by an adjacency.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'EdgePropagator.backEdge', 'type': 'function', 'url': 'traversal/propagator/EdgePropagator.type.html#backEdge', 'doc': '<p>Calls visitor.backEdge according to the approprate signature of the visitor\'s method.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'EdgePropagator.examineEdge', 'type': 'function', 'url': 'traversal/propagator/EdgePropagator.type.html#examineEdge', 'doc': '<p>Calls visitor.examineEdge according to the approprate signature of the visitor\'s method.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'EdgePropagator.forwardEdge', 'type': 'function', 'url': 'traversal/propagator/EdgePropagator.type.html#forwardEdge', 'doc': '<p>Calls visitor.forwardEdge according to the approprate signature of the visitor\'s method.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'EdgePropagator.nonTreeEdge', 'type': 'function', 'url': 'traversal/propagator/EdgePropagator.type.html#nonTreeEdge', 'doc': '<p>Calls visitor.nonTreeEdge according to the approprate signature of the visitor\'s method.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'EdgePropagator.treeEdge', 'type': 'function', 'url': 'traversal/propagator/EdgePropagator.type.html#treeEdge', 'doc': '<p>Calls visitor.treeEdge according to the approprate signature of the visitor\'s method.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'EdgePropagator', 'type': 'class', 'url': 'traversal/propagator/EdgePropagator.type.html', 'doc': '', 'tags': [],'icons': ['icon-class']},
{'name': 'EdgePropagatorFactory.propagator', 'type': 'function', 'url': 'traversal/propagator/EdgePropagatorFactory.type.html#propagator', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'EdgePropagatorFactory', 'type': 'class', 'url': 'traversal/propagator/EdgePropagatorFactory.type.html', 'doc': '', 'tags': [],'icons': ['icon-class']},
{'name': 'Propagator.adjacencies', 'type': 'value', 'url': 'traversal/propagator/Propagator.type.html#adjacencies', 'doc': '<p>Answer the adjacencies allowing access to the neighboring vertices.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'Propagator.target', 'type': 'function', 'url': 'traversal/propagator/Propagator.type.html#target', 'doc': '<p>Answer the target vertex reached by an adjacency.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'Propagator.examineVertex', 'type': 'function', 'url': 'traversal/propagator/Propagator.type.html#examineVertex', 'doc': '<p>Calls visitor.examineVertex(source).</p>\n', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'Propagator.discoverVertex', 'type': 'function', 'url': 'traversal/propagator/Propagator.type.html#discoverVertex', 'doc': '<p>Calls visitor.discoverVertex(source).</p>\n', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'Propagator.finishVertex', 'type': 'function', 'url': 'traversal/propagator/Propagator.type.html#finishVertex', 'doc': '<p>Calls visitor.finishVertex(source).</p>\n', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'Propagator.examineEdge', 'type': 'function', 'url': 'traversal/propagator/Propagator.type.html#examineEdge', 'doc': '<p>Calls visitor.examineEdge according to the approprate signature of the visitor\'s method.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'Propagator.treeEdge', 'type': 'function', 'url': 'traversal/propagator/Propagator.type.html#treeEdge', 'doc': '<p>Calls visitor.treeEdge according to the approprate signature of the visitor\'s method.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'Propagator.nonTreeEdge', 'type': 'function', 'url': 'traversal/propagator/Propagator.type.html#nonTreeEdge', 'doc': '<p>Calls visitor.nonTreeEdge according to the approprate signature of the visitor\'s method.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'Propagator.backEdge', 'type': 'function', 'url': 'traversal/propagator/Propagator.type.html#backEdge', 'doc': '<p>Calls visitor.backEdge according to the approprate signature of the visitor\'s method.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'Propagator.forwardEdge', 'type': 'function', 'url': 'traversal/propagator/Propagator.type.html#forwardEdge', 'doc': '<p>Calls visitor.forwardEdge according to the approprate signature of the visitor\'s method.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'Propagator', 'type': 'class', 'url': 'traversal/propagator/Propagator.type.html', 'doc': '<p>A <code><a class=\'link\' href=\'traversal/propagator/Propagator.type.html\' title=\'Go to graph.traversal.propagator::Propagator\'><span class=\'type-identifier\'>Propagator</span></a></code> defines how a graph traversal propagates to adjacent vertices of a given vertex.</p>\n', 'tags': [],'icons': ['icon-class', 'icon-decoration-abstract']},
{'name': 'PropagatorFactory.propagator', 'type': 'function', 'url': 'traversal/propagator/PropagatorFactory.type.html#propagator', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-formal']},
{'name': 'PropagatorFactory', 'type': 'class', 'url': 'traversal/propagator/PropagatorFactory.type.html', 'doc': '', 'tags': [],'icons': ['icon-class', 'icon-decoration-abstract']},
{'name': 'VertexPropagator.adjacencies', 'type': 'attribute', 'url': 'traversal/propagator/VertexPropagator.type.html#adjacencies', 'doc': '<p>Answer the adjacencies allowing access to the neighboring vertices.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'VertexPropagator.target', 'type': 'function', 'url': 'traversal/propagator/VertexPropagator.type.html#target', 'doc': '<p>Answer the target vertex reached by an adjacency.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'VertexPropagator.backEdge', 'type': 'function', 'url': 'traversal/propagator/VertexPropagator.type.html#backEdge', 'doc': '<p>Calls visitor.backEdge according to the approprate signature of the visitor\'s method.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'VertexPropagator.examineEdge', 'type': 'function', 'url': 'traversal/propagator/VertexPropagator.type.html#examineEdge', 'doc': '<p>Calls visitor.examineEdge according to the approprate signature of the visitor\'s method.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'VertexPropagator.forwardEdge', 'type': 'function', 'url': 'traversal/propagator/VertexPropagator.type.html#forwardEdge', 'doc': '<p>Calls visitor.forwardEdge according to the approprate signature of the visitor\'s method.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'VertexPropagator.nonTreeEdge', 'type': 'function', 'url': 'traversal/propagator/VertexPropagator.type.html#nonTreeEdge', 'doc': '<p>Calls visitor.nonTreeEdge according to the approprate signature of the visitor\'s method.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'VertexPropagator.treeEdge', 'type': 'function', 'url': 'traversal/propagator/VertexPropagator.type.html#treeEdge', 'doc': '<p>Calls visitor.treeEdge according to the approprate signature of the visitor\'s method.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'VertexPropagator', 'type': 'class', 'url': 'traversal/propagator/VertexPropagator.type.html', 'doc': '', 'tags': [],'icons': ['icon-class']},
{'name': 'VertexPropagatorFactory.propagator', 'type': 'function', 'url': 'traversal/propagator/VertexPropagatorFactory.type.html#propagator', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'VertexPropagatorFactory', 'type': 'class', 'url': 'traversal/propagator/VertexPropagatorFactory.type.html', 'doc': '', 'tags': [],'icons': ['icon-class']},
{'name': 'graph.traversal.visitor', 'type': 'package', 'url': 'traversal/visitor/index.html', 'doc': '', 'tags': [],'icons': ['icon-package']},
{'name': 'GraphVisitor.examineVertex', 'type': 'function', 'url': 'traversal/visitor/GraphVisitor.type.html#examineVertex', 'doc': '', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'GraphVisitor.discoverVertex', 'type': 'function', 'url': 'traversal/visitor/GraphVisitor.type.html#discoverVertex', 'doc': '', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'GraphVisitor.finishVertex', 'type': 'function', 'url': 'traversal/visitor/GraphVisitor.type.html#finishVertex', 'doc': '', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'GraphVisitor', 'type': 'interface', 'url': 'traversal/visitor/GraphVisitor.type.html', 'doc': '', 'tags': [],'icons': ['icon-interface']},
{'name': 'VertexVisitor.examineEdge', 'type': 'function', 'url': 'traversal/visitor/VertexVisitor.type.html#examineEdge', 'doc': '', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'VertexVisitor.treeEdge', 'type': 'function', 'url': 'traversal/visitor/VertexVisitor.type.html#treeEdge', 'doc': '', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'VertexVisitor.nonTreeEdge', 'type': 'function', 'url': 'traversal/visitor/VertexVisitor.type.html#nonTreeEdge', 'doc': '', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'VertexVisitor.backEdge', 'type': 'function', 'url': 'traversal/visitor/VertexVisitor.type.html#backEdge', 'doc': '', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'VertexVisitor.forwardEdge', 'type': 'function', 'url': 'traversal/visitor/VertexVisitor.type.html#forwardEdge', 'doc': '', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'VertexVisitor', 'type': 'interface', 'url': 'traversal/visitor/VertexVisitor.type.html', 'doc': '', 'tags': [],'icons': ['icon-interface']},
{'name': 'EdgeVisitor.examineEdge', 'type': 'function', 'url': 'traversal/visitor/EdgeVisitor.type.html#examineEdge', 'doc': '', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'EdgeVisitor.treeEdge', 'type': 'function', 'url': 'traversal/visitor/EdgeVisitor.type.html#treeEdge', 'doc': '', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'EdgeVisitor.nonTreeEdge', 'type': 'function', 'url': 'traversal/visitor/EdgeVisitor.type.html#nonTreeEdge', 'doc': '', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'EdgeVisitor.backEdge', 'type': 'function', 'url': 'traversal/visitor/EdgeVisitor.type.html#backEdge', 'doc': '', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'EdgeVisitor.forwardEdge', 'type': 'function', 'url': 'traversal/visitor/EdgeVisitor.type.html#forwardEdge', 'doc': '', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'EdgeVisitor', 'type': 'interface', 'url': 'traversal/visitor/EdgeVisitor.type.html', 'doc': '', 'tags': [],'icons': ['icon-interface']},
{'name': 'graph.undirected', 'type': 'package', 'url': 'undirected/index.html', 'doc': '', 'tags': [],'icons': ['icon-package']},
{'name': 'UndirectedEdge.isDirected', 'type': 'attribute', 'url': 'undirected/UndirectedEdge.type.html#isDirected', 'doc': '<p>Whether the edge is directed.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'UndirectedEdge.isIncident', 'type': 'function', 'url': 'undirected/UndirectedEdge.type.html#isIncident', 'doc': '', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'UndirectedEdge', 'type': 'interface', 'url': 'undirected/UndirectedEdge.type.html', 'doc': '', 'tags': [],'icons': ['icon-interface', 'icon-decoration-enumerated']},
{'name': 'UndirectedGraph.outgoingEdgesOf', 'type': 'function', 'url': 'undirected/UndirectedGraph.type.html#outgoingEdgesOf', 'doc': '', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'UndirectedGraph.incomingEdgesOf', 'type': 'function', 'url': 'undirected/UndirectedGraph.type.html#incomingEdgesOf', 'doc': '', 'tags': [],'icons': ['icon-shared-member']},
{'name': 'UndirectedGraph.edges', 'type': 'attribute', 'url': 'undirected/UndirectedGraph.type.html#edges', 'doc': '<p>All edges of the graph.</p>\n', 'tags': [],'icons': ['icon-shared-member', 'icon-decoration-impl']},
{'name': 'UndirectedGraph', 'type': 'interface', 'url': 'undirected/UndirectedGraph.type.html', 'doc': '', 'tags': [],'icons': ['icon-interface']},
{'name': 'graph', 'type': 'module', 'url': 'index.html', 'doc': '', 'tags': [],'icons': []}];
var tagIndex = [
];
