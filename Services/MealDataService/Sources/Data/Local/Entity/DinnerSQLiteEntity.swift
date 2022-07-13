import Foundation

import SQLite
import SQLiteModule

class DinnerSQLiteEntity {

    let sqliteTask = SQLiteTask.shared

    init() {
        sqliteTask.createTable(
            dinner,
            id,
            nil,
            menu
        )
    }

    // MARK: - Table
    let dinner = Table("Dinner")

    // MARK: - Column
    let id = Expression<Int64>("id")
    let day = Expression<Date>("day")
    let menu = Expression<[String]>("menu")
}
