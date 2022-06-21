import Foundation

public enum SQLiteError: Error {
    case createTableError
    case insertDataError
    case fetchDataError
    case updateDataError
    case deleteDataError
}

extension SQLiteError {
    public var errorMessage: String? {
        switch self {
        case .createTableError:
            return "테이블 생성이 실패하였습니다."
        case .insertDataError:
            return "데이터 추가에 실패하였습니다."
        case .fetchDataError:
            return "데이터를 받아오는데 실패하였습니다."
        case .updateDataError:
            return "데이터를 갱신하는데 실패하였습니다."
        case .deleteDataError:
            return "데이터를 삭제하는데 실패하였습니다."
        }
    }
}
