extension WeatherResponse {
    func toCityDetails(_ name: String) -> CityDetails {
        CityDetails(
            name: name,
            weather: self.weather[0].main,
            weatherDescription: self.weather[0].description,
            temperature: self.main.temp,
            feelsLike: self.main.feelsLike,
            low: self.main.tempMin,
            high: self.main.tempMax,
            humidity: Double(self.main.humidity), // API returns Int, but use Double for convenience
            wind: self.wind.speed,
            rain: self.rain?.oneHour
        )
    }
}
