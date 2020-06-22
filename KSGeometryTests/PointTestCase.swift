
import XCTest
import KSGeometry

class PointTestCase: XCTestCase {

    func test_initialise_with_coorindates() {
        let sut = Point(x:1,y:2)
        XCTAssertEqual(sut.x, 1)
        XCTAssertEqual(sut.y, 2)
    }
    
    func test_zero() {
        let sut = Point.zero
        XCTAssertEqual(sut, Point(x: 0, y: 0))
    }
    
//    func initialise_with_locatable() {
//        struct Locatable: XYLocatable {
//            var x: Float
//            var y: Float
//        }
//        
//    }

}
