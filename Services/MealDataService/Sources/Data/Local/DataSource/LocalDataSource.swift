import Foundation

protocol LocalDataSource {
    func fetchMorning(day: Date) -> [String]
    func registerMorning(day: Date, menu: [String])
    func fetchLunch(day: Date) -> [String]
    func registerLunch(day: Date, menu: [String])
    func fetchDinner(day: Date) -> [String]
    func registerDinner(day: Date)
}
