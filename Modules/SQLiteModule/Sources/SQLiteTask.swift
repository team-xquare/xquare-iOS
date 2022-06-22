import Foundation

import SQLite

public class SQLiteTask {
    public static let shared = SQLiteTask()

    var dbPath = String()
    var dataBase: Connection

    // swiftlint:disable force_try
    init() {
        let fileManager = FileManager()
        let docPathURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        self.dbPath = docPathURL.appendingPathComponent("xquare.sqlite").path

        if fileManager.fileExists(atPath: self.dbPath) == false {
            let dataBaseSource = Bundle.main.path(forResource: "xquare", ofType: "sqlite")
            try! fileManager.copyItem(atPath: dataBaseSource!, toPath: self.dbPath)
        }
        self.dataBase = try! Connection(dbPath)
    }

    func createTable<T: Value>(
        _ table: Table,
        _ primaryKey: Expression<T>,
        _ foreignKey: Expression<T>?,
        _ expression: Expression<T>...
    ) throws {
        do {
            try dataBase.run(table.create {
                if foreignKey != nil {
                    $0.column(foreignKey!)
                }
                $0.column(primaryKey, primaryKey: true)
                for column in expression {
                    $0.column(column)
                }
            })
        } catch {
            throw SQLiteError.failCreateTable
        }
    }

    func insertData(_ table: Table, _ values: Setter...) throws {
        let insert = table.insert(values)
        do {
            try dataBase.run(insert)
        } catch {
            throw SQLiteError.failInsert
        }
    }

    func fetchData(_ query: QueryType) throws -> [Row] {
        var items = [Row]()
        do {
            for row in try dataBase.prepare(query) {
                items.append(row)
            }
            return items
        } catch {
            throw SQLiteError.failFetch
        }
    }

    func updateData(
        _ table: Table,
        _ id: Int64,
        _ query: Setter...
    ) throws {
        let alice = table.filter(id == rowid)
        do {
            try dataBase.run(alice.update(query))
        } catch {
            throw SQLiteError.failUpdate
        }
    }

    func deleteData(
        _ table: Table,
        _ id: Int64
    ) throws {
        let alice = table.filter(id == rowid)
        do {
            try dataBase.run(alice.delete())
        } catch {
            throw SQLiteError.failDelete
        }
    }
}
