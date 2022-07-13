import Foundation

class LocalDataSourceImpl: LocalDataSource {

    static let shared = LocalDataSourceImpl()

    init() { }

    func fetchMorning(day: Date) -> [String] {
        <#code#>
    }

    func registerMorning(day: Date, menu: [String]) {
        <#code#>
    }

    func fetchLunch(day: Date) -> [String] {
        <#code#>
    }

    func registerLunch(day: Date, menu: [String]) {
        <#code#>
    }

    func fetchDinner(day: Date) -> [String] {
        <#code#>
    }

    func registerDinner(day: Date) {
        <#code#>
    }
}
