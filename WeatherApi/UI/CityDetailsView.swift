import SwiftUI

struct CityDetailsView: View {
    let details: CityDetails
    private let background: Background
    
    init(_ details: CityDetails) {
        self.details = details
        self.background = Background(details: details)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            header
            Row("Tempurature", value: details.temperature, unit: "F")
            Row("Feels Like", value: details.feelsLike, unit: "F")
            Row("High", value: details.high, unit: "F")
            Row("Low", value: details.low, unit: "F")
            Row("Humidity", value: details.humidity, unit: "%")
            Row("Wind", value: details.wind, unit: "m/s")
            if let rain = details.rain {
                Row("Rain", value: rain, unit: "mm/h")
            }
            Spacer()
        }
        .background(
            Image(background.imageResource)
                .ignoresSafeArea()
        )
        .foregroundColor(background.overlayColor)
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(details.name)
                    .font(.headline)
                    .foregroundColor(background.overlayColor)
            }
        }
        .navigationTitle(details.name, background.overlayColor)
    }
    
    @ViewBuilder
    private var header: some View {
        Text(details.weather)
            .frame(maxWidth: .infinity, alignment: .center)
            .font(.system(size: 48))
        Text(details.weatherDescription)
            .frame(maxWidth: .infinity, alignment: .center)
        Color.clear
            .frame(height: 12)
    }
    
    private struct Row: View {
        let label: String
        let value: Double
        let unit: String

        init(_ label: String, value: Double, unit: String = "") {
            self.label = label
            self.value = value
            self.unit = unit
        }
        
        var body: some View {
            HStack {
                Text(label)
                Spacer()
                Text("\(value.truncateDecimals(1)) \(unit)")
            }
        }
    }

    private struct Background {
        let details: CityDetails
        
        var imageResource: String {
            switch details.weather {
            case "Clear": "clear"
            case "Clouds": "clouds"
            default: "snow"
            }
        }
        
        var overlayColor: Color {
            switch details.weather {
            case "Clear": .white
            case "Clouds": .black
            default: .black
            }
        }
    }
}
