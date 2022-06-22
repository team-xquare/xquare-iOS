import Foundation

public enum SQLiteError: Error {
    case failCreateTable
    case failInsert
    case failFetch
    case failUpdate
    case failDelete
}

extension SQLiteError: LocalizedError {
    public var errorMessage: String? {
        switch self {
        case .failCreateTable:
            return "테이블 생성이 실패하였습니다."
        case .failInsert:
            return "데이터 추가에 실패하였습니다."
        case .failFetch:
            return "데이터를 받아오는데 실패하였습니다."
        case .failUpdate:
            return "데이터를 갱신하는데 실패하였습니다."
        case .failDelete:
            return "데이터를 삭제하는데 실패하였습니다."
        }
    }
}
