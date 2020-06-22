// Comments for Point
public protocol XYLocatable {
    var x: Float { get }
    var y: Float { get }
    func isCoincidentWith(_ other: XYLocatable) -> Bool
}

public extension XYLocatable {
    func isCoincidentWith(_ other: XYLocatable) -> Bool {
        x == other.x && y == other.y
    }
}

public struct Point: XYLocatable {
    public var x: Float
    public var y: Float
    public init(x: Float, y: Float) {
        self.x = x
        self.y = y
    }
}
