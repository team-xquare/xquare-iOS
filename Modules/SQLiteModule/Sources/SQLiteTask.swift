import Foundation

import SQLite

public class SQLiteTask {

    public static let shared = SQLiteTask()

    let db = try! Connection(.inMemory)

    func create(
        _ table: Table,
        _ primaryKey: Expression,
        _ column: Expression...
    ) {
        do {
            try db.run(table.create { table in
                table.column(primaryKey, primaryKey: true)
                for column in column {
                    table.column(column)
                }
            })
        } catch {
            print(error.localizedDescription)
        }
    }

    func insert(_ table: Table, _ query: [Setter]) {
        let insert = table.insert(query)
        db.run(insert)
    }

    func fetch<T>(_ table: Table) -> [T] {
        let list: [T] = [T]()
        for row in try db.prepare(table) {
            list.append(row)
        }
        return list
    }

    func fetch<T>(_ query: String) -> [T] {
        let list: [T] = [T]()
        for row in try db.prepare(query) {
            list.append(row)
        }
        return list
    }

    func update(_ table: Table, _ id: Int, _ query: Update) {
        let update = table.filter(id == rowid)
        try? db.run(update.update(query))
    }

    func delete(_ table: Table, _ id: Int) {
        let delete = table.filter(id == rowid)
        try? db.run(delete.delete())
    }
}
