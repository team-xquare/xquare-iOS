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

        var dataBase: OpaquePointer?

                do {
                    let dbPath: String = try FileManager.default.url(
                    for: .documentDirectory,
                    in: .userDomainMask,
                    appropriateFor: nil,
                    create: false).appendingPathComponent(dataBaseName).path

                    if sqlite3_open(dbPath, &dataBase) == SQLITE_OK {
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
        day TEXT PRIMARY KEY NOT NULL ,
        menu TEXT NOT NULL
        );
        """
        var statement: OpaquePointer?

        if sqlite3_prepare_v2(self.dataBase, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) != SQLITE_DONE {
                let errorMessage = String(cString: sqlite3_errmsg(dataBase))
                print("\nsqlte3_step failure while creating table: \(errorMessage)")
            }
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(self.dataBase))
            print("\nsqlite3_prepare failure while creating table: \(errorMessage)")
        }

        sqlite3_finalize(statement)
    }

    func save(entity: MealMenu) {
        let query = """
        INSERT OR REPLACE
        INTO
        MealMenu(day, menu)
        VALUES(?, ?);
        """

        var statement: OpaquePointer?

        if sqlite3_prepare_v2(self.dataBase, query, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_text(statement, 1, entity.day.toString(format: .fullDate), -1, nil)
            sqlite3_bind_text(statement, 2, "\(entity.breakfast)/\(entity.lunch)/\(entity.dinner)", -1, nil)
        } else {
            print("sqlite binding fail")
        }

        if sqlite3_step(statement) != SQLITE_DONE {
            print("sqlite step failure")
        }
    }

    func findMealByDay(day: Date) -> MealMenu {
        let query = """
        SELECT * FROM MealMenu
        WHERE day='\(day.toString(format: .fullDate))';
        """

        var statement: OpaquePointer?

        if sqlite3_prepare_v2(self.dataBase, query, -1, &statement, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(dataBase)!)
            print("error while prepare: \(errorMessage)")
            return .init(
                day: day,
                breakfast: "",
                lunch: "",
                dinner: ""
            )
        }

        var menu: String = ""
        var breakfast: String = ""
        var lunch: String = ""
        var dinner: String = ""

        while sqlite3_step(statement) == SQLITE_ROW {
            menu = String(cString: sqlite3_column_text(statement, 1))
        }

        let menuList = Array(menu.components(separatedBy: "/"))

        if menuList.count == 3 {
            breakfast = menuList[0]
            lunch = menuList[1]
            dinner = menuList[2]
        }

        sqlite3_finalize(statement)

        return .init(
            day: day,
            breakfast: breakfast,
            lunch: lunch,
            dinner: dinner
        )
    }

    func findMealByMonth(day: Date) -> [MealMenu] {
        let query = """
        SELECT * FROM MealMenu
        WHERE day LIKE '\(day.toString(format: .year) + day.toString(format: .month))%';
        """

        // MARK: Save Login
        var statement: OpaquePointer?
        var result: [MealMenu] = []

        if sqlite3_prepare_v2(self.dataBase, query, -1, &statement, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(dataBase)!)
            print("error while prepare: \(errorMessage)")
            return result
        }

        while sqlite3_step(statement) == SQLITE_ROW {
            let date = String(cString: sqlite3_column_text(statement, 0))
            let menu = Array(String(cString: sqlite3_column_text(statement, 1)).components(separatedBy: " "))
            if menu.count == 3 {
                let breakfast = String(menu[0])
                let lunch = String(menu[1])
                let dinner = String(menu[2])
                result.append(
                    MealMenu(
                        day: date.toDate(format: .fullDate),
                        breakfast: breakfast,
                        lunch: lunch,
                        dinner: dinner
                    ))
            }
        }

        return result
    }

    private func onSQLErrorPrintErrorMessage(_ dataBase: OpaquePointer?) {
        let errorMessage = String(cString: sqlite3_errmsg(dataBase))
        print("Error preparing update: \(errorMessage)")
        return
    }
}
