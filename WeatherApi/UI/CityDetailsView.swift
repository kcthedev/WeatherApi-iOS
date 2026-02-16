import SwiftUI

struct CityDetailsView: View {
    let details: CityDetails
    
    init(_ details: CityDetails) {
        self.details = details
    }
    
    private var isBackgroundDark: Bool {
        switch details.weather {
        case "Clear": true
        default: false
        }
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
        .background(background)
        .foregroundColor(isBackgroundDark ? .white : .black)
        .padding()
        .navigationTitle(details.name)
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
    
    @ViewBuilder
    private var background: some View {
        let resource = switch details.weather {
        case "Clear": "clear"
        case "Clouds": "clouds"
        default: "snow"
        }
        Image(resource)
            .ignoresSafeArea()
    }
}
