struct WeatherResponse: Decodable {
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let rain: Rain? // Will be null unless weather.main is "Rain"
}

struct Weather: Decodable {
    let main: String
    let description: String
}

struct Main: Decodable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let humidity: Int
}

struct Wind: Decodable {
    let speed: Double
}

struct Rain: Decodable {
    let oneHour: Double
}
