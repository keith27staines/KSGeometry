import XCTest
import KSGeometry

class RectTestCase: XCTestCase {
    
    let testOrigin = Point(x: -1, y: -2)
    let testSize = Size(width: 2, height: 4)
    
    func test_initialise_with_origin_width_height() {
        let sut = Rect(origin: testOrigin, width: testSize.width, height: testSize.height)
        XCTAssertTrue(sut.origin.isCoincidentWith(testOrigin))
        XCTAssertFalse(sut.origin.isCoincidentWith(Point(x: 0, y: 0)))
        XCTAssertEqual(sut.size.width, testSize.width)
        XCTAssertEqual(sut.size.height, testSize.height)
    }
    
    func test_initialise_with_origin_size() {
        let sut = makeSUT()
        XCTAssertTrue(sut.origin.isCoincidentWith(testOrigin))
        XCTAssertEqual(sut.size, testSize)
    }
    
    func test_min_and_max_coordinates() {
        let sut = makeSUT()
        XCTAssertEqual(sut.minX, testOrigin.x)
        XCTAssertEqual(sut.maxX, testOrigin.x + testSize.width)
        XCTAssertEqual(sut.minY, testOrigin.y)
        XCTAssertEqual(sut.maxY, testOrigin.y + testSize.height)
    }
    
    func test_midX_and_midY_coordinates() {
        let sut = makeSUT()
        XCTAssertEqual( sut.center.x, (testOrigin.x + testSize.width / 2.0) )
        XCTAssertEqual( sut.center.y, (testOrigin.y + testSize.height / 2.0) )
    }
    
    func test_distalPoint() {
        let sut = makeSUT()
        XCTAssertEqual(sut.distalPoint.x, testOrigin.x + testSize.width)
        XCTAssertEqual(sut.distalPoint.y, testOrigin.y + testSize.height)
    }
    
    func test_enumerated_corner() {
        let sut = makeSUT()
        XCTAssertTrue( sut.origin.isCoincidentWith(sut.corner(.bottomLeft)) )
        XCTAssertTrue( sut.distalPoint.isCoincidentWith(sut.corner(.topRight)) )
        XCTAssertEqual(sut.corner(.topLeft).x, sut.origin.x)
        XCTAssertEqual(sut.corner(.topLeft).y, sut.maxY)
        XCTAssertEqual(sut.corner(.topRight).x, sut.maxX)
        XCTAssertEqual(sut.corner(.bottomRight).y, sut.minY)
    }
    
    func test_contains_point() {
        let sut = makeSUT()
        XCTAssertTrue(sut.contains(Point(x: 0, y: 0)))
        XCTAssertFalse(sut.contains(Point(x: -1, y: 0)))
        XCTAssertFalse(sut.contains(Point(x: -2, y: 0)))
        XCTAssertFalse(sut.contains(Point(x: 0, y: -2)))
        XCTAssertFalse(sut.contains(Point(x: 0, y: 2)))
    }
    
    func test_contains_rect() {
        let sut = makeSUT()
        XCTAssertFalse(sut.contains(sut))
        XCTAssertFalse(
            sut.contains(
                Rect(
                    origin: Point(x: testOrigin.x+0.1, y: testOrigin.y+0.1),
                    size: Size(width: testSize.width, height: testSize.height)
                )
            )
        )
        XCTAssertFalse(
            sut.contains(
                Rect(
                    origin: Point(x: testOrigin.x, y: testOrigin.y),
                    size: Size(width: testSize.width-0.1, height: testSize.height-0.1)
                )
            )
        )
        XCTAssertTrue(sut.contains(Point(x: testOrigin.x+0.1, y: testOrigin.y+0.1)))
        XCTAssertTrue(sut.contains(Point(x: sut.distalPoint.x-0.1, y: sut.distalPoint.y-0.1)))
        XCTAssertTrue(
            sut.contains(
                Rect(
                    origin: Point(x: testOrigin.x+0.1, y: testOrigin.y+0.1),
                    size: Size(width: testSize.width-0.2, height: testSize.height-0.2)
                )
            )
        )
    }
    
    func makeSUT() -> Rect {
        Rect(origin: testOrigin, size: testSize)
    }
    
}
