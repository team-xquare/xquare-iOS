import Foundation

import SQLite3
import MealDataService

class MealDataServiceSQLiteTask {

    let shared = MealDataServiceSQLiteTask()

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

        // swiftlint:disable statement_position
        if sqlite3_prepare_v2(self.dataBase, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Creating table has been succesfully done. db: \(String(describing: self.dataBase))")
            }
            else {
                let errorMessage = String(cString: sqlite3_errmsg(dataBase))
                print("\nsqlte3_step failure while creating table: \(errorMessage)")
            }
        }
        else {
            let errorMessage = String(cString: sqlite3_errmsg(self.dataBase))
            print("\nsqlite3_prepare failure while creating table: \(errorMessage)")
        }

               sqlite3_finalize(statement)
    }

    func insertData(
        date: Date,
        breakfast: String,
        lunch: String,
        dinner: String
    ) {
        let query = "INSERT INTO MealMenu(id, date, breakfast, lunch, dinner) VALUES(?, ?, ?, ?, ?)"

        var statement: OpaquePointer? = nil

        if sqlite3_prepare_v2(self.dataBaseName, insertQuery, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_text(statement, 2, date.toString())
            sqlite3_bind_text(statement, 3, breakfast)
            sqlite3_bind_text(statement, 4, lunch)
            sqlite3_bind_text(statement, 5, dinner)
        }
        else {
            print("sqlite binding fail")
        }

        if sqlite3_step(statement) == SQLITE_DONE {
            print("sqlite insertion success")
        }
        else {
            print("sqlite step failure")
        }
    }

    func readData(day: Date) -> DayToMealMenuEntity {
        let query = "SELECT * FROM MealMenu WHERE day = \(day.toString())"

        var statement: OpaquePointer? = nil

        var result = DayToMealMenuEntity

        if sqlite3_prepare(self.dataBase, query, -1, &statement, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(dataBase)!)
            print("error while prepare: \(errorMessage)")
            return result
        }
    }
}
