
public struct Rect: Hashable, Equatable {
    
    public enum Corner {
        case bottomLeft
        case topLeft
        case bottomRight
        case topRight
    }
    public static var zero = Rect(origin: .zero, size: .zero)
    
    public var origin: Point
    public var size: Size
    public var minX: Float { origin.x }
    public var maxX: Float { origin.x + size.width }
    public var midX: Float { (minX + maxX) / 2.0 }
    public var midY: Float { (minY + maxY) / 2.0 }
    public var minY: Float { origin.y }
    public var maxY: Float { origin.y + size.height }
    public var center: Point { Point(x: midX, y: midY) }
    public var midXPoint: Point { return Point(x: midX, y: minY) }
    public var midYPoint: Point { return Point(x: minX, y: midY) }
    public var maxXPoint: Point { return Point(x: maxX, y: minY) }
    public var maxYPoint: Point { return Point(x: minX, y: maxY) }
    
    public var distalPoint: Point {
        return Point(x: origin.x + size.width, y: origin.y + size.height)
    }
    
    public func corner(_ id: Corner) -> Point {
        switch id {
        case .bottomLeft: return origin
        case .topLeft: return Point(x: minX, y: maxY)
        case .bottomRight: return Point(x: maxX, y: minY)
        case .topRight: return distalPoint
        }
    }
    
    public func contains(_ point: XYLocatable) -> Bool {
        minX < point.x && minY < point.y && maxX > point.x && maxY > point.y
    }
    
    public func isOnOrWithinBoundary(_ point: XYLocatable) -> Bool {
        minX <= point.x && minY <= point.y && maxX >= point.x && maxY >= point.y
    }
    
    public func contains(_ rect: Rect) -> Bool {
        return isOnOrWithinBoundary(rect.origin) && isOnOrWithinBoundary(rect.distalPoint)
    }
    
    public func intersects(_ rect: Rect) -> Bool {
        if rect.maxX <= minX { return false }
        if rect.minX >= maxX { return false }
        if rect.maxY <= minY { return false }
        if rect.minY >= maxY { return false }
        return true
    }

    public init(origin: Point, width: Float, height: Float) {
        self.origin = origin
        self.size = Size(width: width, height: height)
    }
    
    public init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    public init(center: Point, size: Size) {
        origin = Point(x: center.x - size.width/2.0, y: center.y - size.height/2.0)
        self.size = size
    }
    
    public init(x: Float, y: Float, width: Float, height: Float) {
        self.init(origin: Point(x: x, y: y), size: Size(width: width, height: height))
    }
}
