import ceylon.test {
	assertEquals
}

by ("ThorstenSeitz")
shared U? map<T,U>(T? optional, U f(T item)) {
	if (exists optional) {
		return f(optional);
	} else {
		return null;
	}
}

by ("ThorstenSeitz")
void assertEqualElements<Element>({Element*} actual, {Element*} expected, String? message = null)
		given Element satisfies Object {
	for (index->pair in zipPairs(actual, expected).indexed) {
		assertEquals(pair[0], pair[1], "difference at index ``index``: expected <``pair[1]``> but was <``pair[0]``>");
	}
}
