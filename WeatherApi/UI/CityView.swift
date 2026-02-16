import SwiftUI

struct CityView: View {
    let cityDetails: CityDetails
    
    init(_ cityDetails: CityDetails) {
        self.cityDetails = cityDetails
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(cityDetails.name)
                Text(cityDetails.weather)
            }
            Spacer()
            Text("\(cityDetails.temperature.truncateDecimals(1)) F")
        }
    }
}

#Preview {
    CityView(
        CityDetails(
            name: "Los Angeles",
            weather: "Clear",
            weatherDescription: "",
            temperature: 61.893,
            feelsLike: 0.0,
            low: 0.0,
            high: 0.0,
            humidity: 0,
            wind: 0.0,
            rain: nil
        )
    )
}
