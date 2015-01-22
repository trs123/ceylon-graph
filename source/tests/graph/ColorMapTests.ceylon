import ceylon.test {
	test,
	assertEquals
}

import graph.traversal.iterator {
	ColorMap,
	white,
	gray,
	black
}

shared class ColorMapTests() {

	test
	shared void shouldBeWhiteByDefault() {
		ColorMap<Integer> colorMap = ColorMap<Integer>();
		assertEquals(colorMap.getColor(1), white);
	}

	test
	shared void shouldSetColor() {
		ColorMap<Integer> colorMap = ColorMap<Integer>();
		// gray
		colorMap.setColor(1, gray);
		assertEquals(colorMap.getColor(1), gray);
		// black
		colorMap.setColor(1, black);
		assertEquals(colorMap.getColor(1), black);
	}
}