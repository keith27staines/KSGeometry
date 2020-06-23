
public protocol XYLocatable {
    var x: Float { get }
    var y: Float { get }
    func isCoincidentWith(_ other: XYLocatable) -> Bool
    func distance2From(_ other: XYLocatable) -> Float
}

public extension XYLocatable {
    func isCoincidentWith(_ other: XYLocatable) -> Bool {
        x == other.x && y == other.y
    }
    func distance2From(_ other: XYLocatable) -> Float {
        (x - other.x)*(x - other.x) + (y - other.y)*(y - other.y)
    }
}

public struct Point: XYLocatable, Hashable, Equatable {
    public static let zero = Point(x: 0, y: 0)
    public var x: Float
    public var y: Float
    public init(x: Float, y: Float) {
        self.x = x
        self.y = y
    }
}
