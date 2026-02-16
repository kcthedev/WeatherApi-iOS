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
            for city in CityRequest.allCases {
                do {
                    let response = try await service.fetchWeatherForCity(city)
                    let cityDetails = response.toCityDetails(city.friendlyName)
                    
                    cities.append(cityDetails)
                } catch {
                    print("An error occurred: \(error)")
                }
            }
        }
    }
}
