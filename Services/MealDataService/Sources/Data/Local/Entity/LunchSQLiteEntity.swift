import Foundation

import SQLite
import SQLiteModule

class LunchSQLiteEntity {

    let sqliteTask = SQLiteTask.shared

    init() {
        sqliteTask.createTable(
            lunch,
            id,
            nil,
            menu
        )
    }

    // MARK: - Table
    let lunch = Table("Lunch")

    // MARK: - Column
    let id = Expression<Int64>("id")
    let day = Expression<Date>("day")
    let menu = Expression<String>("menu")
}
