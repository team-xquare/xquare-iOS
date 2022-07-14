import Foundation

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

    func save(mealMenu: MealMenu) {
        let query = "INSERT INTO MealMenu(id, date, breakfast, lunch, dinner) VALUES(?, ?, ?, ?, ?)"

        var statement: OpaquePointer? = nil

        if sqlite3_prepare_v2(self.dataBase, query, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_text(statement, 2, mealMenu.day.toString(), -1, nil)
            sqlite3_bind_text(statement, 3, mealMenu.breakfast, -1, nil)
            sqlite3_bind_text(statement, 4, mealMenu.lunch, -1, nil)
            sqlite3_bind_text(statement, 5, mealMenu.dinner, -1, nil)
        } else {
            print("sqlite binding fail")
        }

        if sqlite3_step(statement) == SQLITE_DONE {
            print("sqlite insertion success")
        } else {
            print("sqlite step failure")
        }
    }

    func findMealByDay(day: Date) -> DayToMealMenuEntity {
        let query = "SELECT * FROM MealMenu WHERE day = \(day.toString())"

        var statement: OpaquePointer? = nil

        if sqlite3_prepare(self.dataBase, query, -1, &statement, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(dataBase)!)
            print("error while prepare: \(errorMessage)")
            return DayToMealMenuEntity(breakfast: [], lunch: [], dinner: [])
        }

        let breakfast = String(cString: sqlite3_column_text(statement, 2)).components(separatedBy: " ")
        let lunch = String(cString: sqlite3_column_text(statement, 3)).components(separatedBy: " ")
        let dinner = String(cString: sqlite3_column_text(statement, 4)).components(separatedBy: " ")

        return DayToMealMenuEntity(breakfast: breakfast, lunch: lunch, dinner: dinner)
    }

    func findMealByMonth(day: Date) -> [MonthToMealMenuEntity] {
        let query = "SELECT * FROM MealMenu WHERE day LIKE '\(day.toYearMonthString())%'"

        var statement: OpaquePointer? = nil
        var result: [MonthToMealMenuEntity] = []

        if sqlite3_prepare(self.dataBase, query, -1, &statement, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(dataBase)!)
            print("error while prepare: \(errorMessage)")
            return result
        }

        while sqlite3_step(statement) == SQLITE_ROW {
            let breakfast = String(cString: sqlite3_column_text(statement, 2)).components(separatedBy: " ")
            let lunch = String(cString: sqlite3_column_text(statement, 3)).components(separatedBy: " ")
            let dinner = String(cString: sqlite3_column_text(statement, 4)).components(separatedBy: " ")
            result.append(MonthToMealMenuEntity(
                date: day.toString(),
                breakfast: breakfast,
                lunch: lunch,
                dinner: dinner
            ))
        }

        return result
    }
}
