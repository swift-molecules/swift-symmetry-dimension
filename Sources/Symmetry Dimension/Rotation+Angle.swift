public import Dimension
public import Symmetry
public import Symmetry_Algebra
internal import Real

extension Rotation where N == 2, Scalar: BinaryFloatingPoint & Numeric.Transcendental & Sendable {

    public var angle: Radian<Scalar> {
        get { Radian(_unchecked: Scalar._atan2(matrix[1][0], matrix[0][0])) }
        set { self = Self(angle: newValue) }
    }

    @inlinable
    public init(angle: Radian<Scalar>) {
        let c = angle.cos.value
        let s = angle.sin.value
        var m = InlineArray<2, InlineArray<2, Scalar>>(
            repeating: InlineArray<2, Scalar>(repeating: .zero)
        )
        m[0][0] = c
        m[0][1] = -s
        m[1][0] = s
        m[1][1] = c
        self.init(matrix: m)
    }

    @inlinable
    public init(degrees: Degree<Scalar>) {
        self.init(angle: degrees.radians)
    }

    @inlinable
    public func rotated(by angle: Radian<Scalar>) -> Self {
        concatenating(Self(angle: angle))
    }

    @inlinable
    public func rotated(by degrees: Degree<Scalar>) -> Self {
        rotated(by: degrees.radians)
    }

    @inlinable
    public static var quarterTurn: Self {
        Self(angle: Radian<Scalar>(_unchecked: Scalar.pi / 2))
    }

    @inlinable
    public static var halfTurn: Self {
        Self(angle: Radian<Scalar>(_unchecked: Scalar.pi))
    }

    @inlinable
    public static var quarterTurnClockwise: Self {
        Self(angle: Radian<Scalar>(_unchecked: -Scalar.pi / 2))
    }
}
