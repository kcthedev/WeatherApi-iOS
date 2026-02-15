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
            let formattedTempurature = cityDetails.temperature.formatted(.number.precision(.fractionLength(1)))
            Text("\(formattedTempurature) F")
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
