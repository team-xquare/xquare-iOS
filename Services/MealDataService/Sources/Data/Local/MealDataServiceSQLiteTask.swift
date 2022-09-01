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
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        day TEXT NOT NULL,
        breakfast TEXT NOT NULL,
        lunch TEXT NOT NULL,
        dinner TEXT NOT NULL
        );
        """
        var statement: OpaquePointer? = nil

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

    func save(entity: MealMenuPerDayEntity) {
        let query = "INSERT INTO MealMenu(id, day, breakfast, lunch, dinner) VALUES(?, ?, ?, ?, ?);"

        var statement: OpaquePointer? = nil

        var breakfast: [String] = []
        var lunch: [String] = []
        var dinner: [String] = []

        for key in entity.menu {
            switch key.mealTime {
            case .breakfast:
                breakfast = key.menu
            case .lunch:
                lunch = key.menu
            case .dinner:
                dinner = key.menu
            }
        }
        if sqlite3_prepare_v2(self.dataBase, query, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_text(statement, 2, entity.date.toString(format: .fullDate), -1, nil)
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

    func findMealByDay(day: Date) -> MealMenuPerDayEntity {
        let query = "SELECT * FROM MealMenu WHERE day = '\(day.toString(format: .fullDate))';"

        var statement: OpaquePointer? = nil

        if sqlite3_prepare(self.dataBase, query, -1, &statement, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(dataBase)!)
            let date = Date()
            print("error while prepare: \(errorMessage)")
            return .init(
                date: date,
                menu: []
            )
        }

        var day: Date = Date()
        var breakfast: [String] = []
        var lunch: [String] = []
        var dinner: [String] = []

        while sqlite3_step(statement) == SQLITE_ROW {
            _ = sqlite3_column_int(statement, 0)
            day = String(cString: sqlite3_column_text(statement, 1)).toDate(format: .fullDate)
            breakfast = String(cString: sqlite3_column_text(statement, 2)).components(separatedBy: " ")
            lunch = String(cString: sqlite3_column_text(statement, 3)).components(separatedBy: " ")
            dinner = String(cString: sqlite3_column_text(statement, 4)).components(separatedBy: " ")
        }

        sqlite3_finalize(statement)

        return .init(
            date: day,
            menu: [
                .init(mealTime: .breakfast, menu: breakfast),
                .init(mealTime: .lunch, menu: lunch),
                .init(mealTime: .dinner, menu: dinner)
            ]
        )
    }

    func findMealByMonth(day: Date) -> [MealMenuPerDayEntity] {
        let query = """
        SELECT * FROM MealMenu
        WHERE day LIKE '\(day.toString(format: .year) + day.toString(format: .mounth))%';
        """
        print(query)

        // MARK: Save Login
        var statement: OpaquePointer? = nil
        var result: [MealMenuPerDayEntity] = []

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
                .init(date: day,
                      menu: [
                        .init(mealTime: .breakfast, menu: breakfast),
                        .init(mealTime: .lunch, menu: lunch),
                        .init(mealTime: .dinner, menu: dinner)
                      ]))
        }
        return result
    }
}
