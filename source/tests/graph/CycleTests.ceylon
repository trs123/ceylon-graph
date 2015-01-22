import ceylon.test {
	test,
	assertEquals
}

import examples.cycle {
	Cycle
}

by ("ThorstenSeitz")
shared class CycleTests() {

	Cycle cycle = Cycle(10);

	test
	shared void shouldNotBeEmpty() {
		assert(cycle.notEmpty);
	}

	test
	shared void shouldHaveTenVertices() {
		assertEquals(cycle.vertices.size, 10);
	}

	test
	shared void shouldBeTraversedInOrder() {
		assertEquals(cycle.bfsTraversal(0).vertices.sequence(), 0..9);
		assertEquals(cycle.bfsTraversal(2).vertices.sequence(), (2..9).append(0..1));
		assertEquals(cycle.bfsTraversal(9).vertices.sequence(), [9].append(0..8));
	}
}