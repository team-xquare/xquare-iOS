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
    ) {
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
            print(SQLiteError.createTableError.errorMessage!)
        }
    }

    func insertData(_ table: Table, _ values: Setter...) {
        let insert = table.insert(values)
        do {
            try dataBase.run(insert)
        } catch {
            print(SQLiteError.insertDataError.errorMessage!)
        }
    }

    func fetchData(_ query: QueryType) -> [Row] {
        var items = [Row]()
        do {
            for row in try dataBase.prepare(query) {
                items.append(row)
            }
            return items
        } catch {
            print(SQLiteError.fetchDataError.errorMessage!)
            return items
        }
    }

    func updateData(
        _ table: Table,
        _ id: Int64,
        _ query: Setter...
    ) {
        let alice = table.filter(id == rowid)
        do {
            try dataBase.run(alice.update(query))
        } catch {
            print(SQLiteError.updateDataError.errorMessage!)
        }
    }

    func deleteData(
        _ table: Table,
        _ id: Int64
    ) {
        let alice = table.filter(id == rowid)
        do {
            try dataBase.run(alice.delete())
        } catch {
            print(SQLiteError.deleteDataError.errorMessage!)
        }
    }
}
