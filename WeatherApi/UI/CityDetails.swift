struct CityDetails: Identifiable, Hashable {
    let name: String
    let weather: String
    let weatherDescription: String
    let temperature: Double
    let feelsLike: Double
    let low: Double
    let high: Double
    let humidity: Int
    let wind: Double
    let rain: Double?
}

extension CityDetails {
    var id: String {
        name
    }
}
