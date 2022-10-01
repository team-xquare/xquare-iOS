import Foundation

import KeychainSwift

public class KeychainModule<Key: KeychainKeyType>: KeychainSwift {

    // MARK: - SET
    @discardableResult
    public func set(_ value: String, forKey key: Key, withAccess access: KeychainSwiftAccessOptions? = nil) -> Bool {
        return super.set(value, forKey: key.keyString, withAccess: access)
    }

    @discardableResult
    public func set(_ value: Data, forKey key: Key, withAccess access: KeychainSwiftAccessOptions? = nil) -> Bool {
        return super.set(value, forKey: key.keyString, withAccess: access)
    }

    @discardableResult
    public func set(_ value: Bool, forKey key: Key, withAccess access: KeychainSwiftAccessOptions? = nil) -> Bool {
        return super.set(value, forKey: key.keyString, withAccess: access)
    }

    // MARK: - GET
    public func get(_ key: Key) -> String? {
        return super.get(key.keyString)
    }

    public func getData(_ key: Key, asReference: Bool = false) -> Data? {
        return super.getData(key.keyString, asReference: asReference)
    }

    public func getBool(_ key: Key) -> Bool? {
        return super.getBool(key.keyString)
    }

    // MARK: - DELETE
    @discardableResult
    public func delete(_ key: Key) -> Bool {
        return super.delete(key.keyString)
    }

}
