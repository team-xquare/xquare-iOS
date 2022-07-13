import Foundation

import SQLite
import SQLiteModule

class MorningSQLiteEntity {

    let sqliteTask = SQLiteTask.shared

    init() {
        sqliteTask.createTable(
            morning,
            id,
            nil,
            menu
        )
    }

    // MARK: - Table
    let morning = Table("Morning")

    // MARK: - Column
    let id = Expression<Int64>("id")
    let day = Expression<Date>("day")
    let menu = Expression<[String]>("menu")
}
