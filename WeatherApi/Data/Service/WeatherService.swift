import Foundation

class WeatherService {
    // In an actual, real-world project, store API keys on the server side and use encryption
    static let apiKey = "810e002de92ac3b8789c5377ce288bb7"

    static let domain = "api.openweathermap.org"
    static let endpointPath = "data/2.5/weather"
    
    func fetchWeatherForCity(_ request: CityRequest) async throws -> WeatherResponse {
        var components = URLComponents(string: "https://\(WeatherService.domain)/\(WeatherService.endpointPath)")!

        components.queryItems = [
            URLQueryItem(name: "lat", value: "\(request.lat)"),
            URLQueryItem(name: "lon", value: "\(request.lon)"),
            URLQueryItem(name: "appid", value: WeatherService.apiKey),
            URLQueryItem(name: "units", value: "imperial")
        ]
        
        let (data, _) = try await URLSession.shared.data(from: components.url!)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try decoder.decode(WeatherResponse.self, from: data)
    }
}
