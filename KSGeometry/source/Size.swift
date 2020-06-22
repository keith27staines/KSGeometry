
public struct Size: Hashable, Equatable {
    public static let zero = Size(width: 0, height: 0)
    public var width: Float
    public var height: Float
    public init(width: Float, height: Float) {
        self.width = width
        self.height = height
    }
}
