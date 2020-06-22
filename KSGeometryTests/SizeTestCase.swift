import XCTest
import KSGeometry

class SizeTestCase: XCTestCase {
    
    func test_initialise() {
        let sut = Size(width: 6, height: 7)
        XCTAssertEqual(sut.width, 6)
        XCTAssertEqual(sut.height, 7)
    }
}
