
public struct Rect {
    
    public enum Corner {
        case bottomLeft
        case topLeft
        case bottomRight
        case topRight
    }
    
    public var origin: Point
    public var size: Size
    public var minX: Float { origin.x }
    public var maxX: Float { origin.x + size.width }
    public var minY: Float { origin.y }
    public var maxY: Float { origin.y + size.height }
    public var center: Point { Point(x:(minX + maxX) / 2.0, y:(minY+maxY) / 2.0 ) }
    
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
    
    public func contains(_ rect: Rect) -> Bool {
        return contains(rect.origin) && contains(rect.distalPoint)
    }

    public init(origin: Point, width: Float, height: Float) {
        self.origin = origin
        self.size = Size(width: width, height: height)
    }
    
    public init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
}
