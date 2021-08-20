import Foundation

public struct UUIDv4: RawRepresentable, Codable, Hashable {
    public let rawValue: String
    
    /// Generates a new lowercase UUID
    public init() {
        rawValue = UUID().uuidString.lowercased()
    }
    
    /// Returns nil if invalid
    public init?(rawValue: String) {
        guard type(of: self).isValid(rawValue) else {
            return nil
        }
        self.rawValue = rawValue.lowercased()
    }
    
    private static func isValid(_ string: String) -> Bool {
        return UUID(uuidString: string) != nil
    }
}

extension UUIDv4: CustomStringConvertible {
    public var description: String {
        rawValue
    }
}
