import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    
    private let service = WeatherService()
    
    @Published private(set) var cities: [CityDetails] = []
    
    init() {
        fetchCities()
    }

    private func fetchCities() {
        Task {
            for city in City.allCases {
                do {
                    let response = try await service.fetchWeatherForCity(city)
                    let cityDetails = CityDetails(
                        name: city.friendlyName,
                        weather: response.weather[0].main,
                        weatherDescription: response.weather[0].description,
                        temperature: response.main.temp,
                        feelsLike: response.main.feelsLike,
                        low: response.main.tempMin,
                        high: response.main.tempMax,
                        humidity: response.main.humidity,
                        wind: response.wind.speed,
                        rain: response.rain?.oneHour
                    )
                    
                    cities.append(cityDetails)
                } catch {
                    print("error occurred: \(error)")
                }
            }
        }
        //        [
        //            .losAngeles,
        //            .newYork,
        //            .sanFranciso,
        //            .seattle
        //        ]
    }
}
