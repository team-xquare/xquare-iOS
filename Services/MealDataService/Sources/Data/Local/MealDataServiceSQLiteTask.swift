import Foundation

import DateUtilModule
import SQLite3

class MealDataServiceSQLiteTask {

    static let shared = MealDataServiceSQLiteTask()

    var dataBase: OpaquePointer?

    let dataBaseName = "xquare.sqlite"

    init() {
        self.dataBase = createDataBase()
    }

    private func createDataBase() -> OpaquePointer? {

        // swiftlint:disable redundant_optional_initialization
        var dataBase: OpaquePointer? = nil

                do {
                    let dbPath: String = try FileManager.default.url(
                    for: .documentDirectory,
                    in: .userDomainMask,
                    appropriateFor: nil,
                    create: false).appendingPathComponent(dataBaseName).path

                    if sqlite3_open(dbPath, &dataBase) == SQLITE_OK {
                        print("Successfully created DB. Path: \(dbPath)")
                        return dataBase
                    }
                } catch {
                    print("Error while creating Database -\(error.localizedDescription)")
                }
                return nil
    }

    func createTable() {
        let query = """
CREATE TABLE MealMenu(
id INTEGER PRIMARY KEY AUTOINCREMENT
day VARCHAR(100) NOT NULL,
breakfast VARCHAR(100) NOT NULL,
lunch VARCHAR(100) NOT NULL,
dinner VARCHAR(100) NOT NULL
);
"""
        var statement: OpaquePointer? = nil

        if sqlite3_prepare_v2(self.dataBase, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Creating table has been succesfully done. db: \(String(describing: self.dataBase))")
            } else {
                let errorMessage = String(cString: sqlite3_errmsg(dataBase))
                print("\nsqlte3_step failure while creating table: \(errorMessage)")
            }
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(self.dataBase))
            print("\nsqlite3_prepare failure while creating table: \(errorMessage)")
        }

        sqlite3_finalize(statement)
    }

    func save(entity: MealMenuEntity) {
        let query = "INSERT INTO MealMenu(id, date, breakfast, lunch, dinner) VALUES(?, ?, ?, ?, ?)"

        var statement: OpaquePointer? = nil

        var breakfast: [String] = []
        var lunch: [String] = []
        var dinner: [String] = []

        for key in entity.menu {
            switch key.key {
            case .breakfast:
                breakfast = key.value
            case .lunch:
                lunch = key.value
            case .dinner:
                dinner = key.value
            }
        }
        if sqlite3_prepare_v2(self.dataBase, query, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_text(statement, 2, entity.date, -1, nil)
            sqlite3_bind_text(statement, 3, breakfast.joined(separator: " "), -1, nil)
            sqlite3_bind_text(statement, 4, lunch.joined(separator: " "), -1, nil)
            sqlite3_bind_text(statement, 5, dinner.joined(separator: " "), -1, nil)
        } else {
            print("sqlite binding fail")
        }

        if sqlite3_step(statement) == SQLITE_DONE {
            print("sqlite insertion success")
        } else {
            print("sqlite step failure")
        }
    }

    func findMealByDay(day: Date) -> MealMenuEntity {
        let query = "SELECT * FROM MealMenu WHERE day = \(day.toString(format: .fullDate))"

        var statement: OpaquePointer? = nil

        if sqlite3_prepare(self.dataBase, query, -1, &statement, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(dataBase)!)
            let date = Date()
            print("error while prepare: \(errorMessage)")
            return .init(
                date: date.toString(format: .fullDate),
                menu: [:]
            )
        }

        let date = String(cString: sqlite3_column_text(statement, 1))
        let breakfast = String(cString: sqlite3_column_text(statement, 2)).components(separatedBy: " ")
        let lunch = String(cString: sqlite3_column_text(statement, 3)).components(separatedBy: " ")
        let dinner = String(cString: sqlite3_column_text(statement, 4)).components(separatedBy: " ")

        return .init(
            date: date,
            menu: [
                .breakfast: breakfast,
                .lunch: lunch,
                .dinner: dinner
            ]
        )
    }

    func findMealByMonth(day: Date) -> [MealMenuEntity] {
        let query = """
SELECT * FROM MealMenu
WHERE day LIKE '\(day.toString(format: .year) + day.toString(format: .mounth))%'
"""

        // MARK: Save Login
        var statement: OpaquePointer? = nil
        var result: [MealMenuEntity] = []

        if sqlite3_prepare(self.dataBase, query, -1, &statement, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(dataBase)!)
            print("error while prepare: \(errorMessage)")
            return result
        }

        while sqlite3_step(statement) == SQLITE_ROW {
            let breakfast = String(cString: sqlite3_column_text(statement, 2)).components(separatedBy: " ")
            let lunch = String(cString: sqlite3_column_text(statement, 3)).components(separatedBy: " ")
            let dinner = String(cString: sqlite3_column_text(statement, 4)).components(separatedBy: " ")
            result.append(
                .init(date: day.toString(format: .fullDate),
                      menu: [
                        .breakfast: breakfast,
                        .lunch: lunch,
                        .dinner: dinner
                      ]))
        }
        return result
    }
}
