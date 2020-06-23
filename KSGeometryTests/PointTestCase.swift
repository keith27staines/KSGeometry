
import XCTest
import KSGeometry

class PointTestCase: XCTestCase {

    func test_initialise_with_coordinates() {
        let sut = Point(x:1,y:2)
        XCTAssertEqual(sut.x, 1)
        XCTAssertEqual(sut.y, 2)
    }
    
    func test_zero() {
        let sut = Point.zero
        XCTAssertEqual(sut, Point(x: 0, y: 0))
    }
    
    func test_distance() {
        let p1 = Point.zero
        let p2 = Point(x: 3, y: 4)
        XCTAssertEqual(p1.distance2From(p2), 25)
        XCTAssertEqual(p1.distance2From(p2), p2.distance2From(p1))
    }

}
