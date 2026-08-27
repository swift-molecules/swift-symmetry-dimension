public import Dimension
public import Symmetry

extension Shear where N == 2 {

    @inlinable
    public static func horizontal(_ factor: Scale<1, Scalar>) -> Self
    where Scalar: ExpressibleByIntegerLiteral {
        Self(x: factor.value, y: 0)
    }

    @inlinable
    public static func vertical(_ factor: Scale<1, Scalar>) -> Self
    where Scalar: ExpressibleByIntegerLiteral {
        Self(x: 0, y: factor.value)
    }
}
