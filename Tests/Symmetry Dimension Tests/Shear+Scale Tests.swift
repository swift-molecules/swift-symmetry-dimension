import Dimension
import Symmetry
import Testing

@testable import Symmetry_Dimension

@Suite
struct `Shear Scale Tests` {

    @Test
    func `Horizontal shear only affects x`() {
        let shear = Shear<2, Double>.horizontal(0.5)
        #expect(shear.x == 0.5)
        #expect(shear.y == 0)
    }

    @Test
    func `Vertical shear only affects y`() {
        let shear = Shear<2, Double>.vertical(0.3)
        #expect(shear.x == 0)
        #expect(shear.y == 0.3)
    }
}
