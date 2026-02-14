import Foundation

class WeatherService {
    static let apiKey = "810e002de92ac3b8789c5377ce288bb7"
    
    func fetchWeatherForCity(_ city: City) async throws -> WeatherResponse {
        //        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather")!
        //        let (data, _) = try await URLSession.shared.data(from: url)
        //        return try JSONDecoder().decode(WeatherResponse.self, from: data)
        
        // 1. Define the base URL
        var components = URLComponents(string: "https://api.openweathermap.org/data/2.5/weather")!
        
        // 2. Map your parameters to Query Items
        components.queryItems = [
            URLQueryItem(name: "lat", value: "\(city.lat)"),
            URLQueryItem(name: "lon", value: "\(city.lon)"),
            URLQueryItem(name: "appid", value: WeatherService.apiKey),
            URLQueryItem(name: "units", value: "imperial")
        ]
        //
        //        // 3. Extract the final URL
        //        guard let url = components.url else { return }
        //
        // Resulting URL: https://api.example.com/v1/forecast?lat=40.7&lon=-74.0&appid=xyz&units=metric
        //        print("Requesting: \(url.absoluteString)")
        
        
        let (data, _) = try await URLSession.shared.data(from: components.url!)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try decoder.decode(WeatherResponse.self, from: data)
    }
}
