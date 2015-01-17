by ("ThorstenSeitz")
interface Monoid<T,M> of M
		given T satisfies Summable<T> {
	shared formal T zero;
	shared default T plus(T x, T y) => x.plus(y);
}
