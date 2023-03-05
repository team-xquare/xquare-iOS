import Foundation

public enum DateFormat: String {
    /// yyyy-MM-dd'T'HH:mm:ss
    case fullDateWithTime = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSSS"
    /// yyyy-MM-dd
    case fullDate = "yyyy-MM-dd"
    /// yyyy
    case year = "yyyy"
    /// MM
    case month = "MM"
    /// dd
    case day = "dd"
    /// HH:mm:ss
    case time = "HH:mm:ss"
}
