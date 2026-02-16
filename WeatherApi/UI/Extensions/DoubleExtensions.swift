import Foundation

extension Double {
    func truncateDecimals(_ decimals: Int = 1) -> String {
        return formatted(.number.precision(.fractionLength(decimals)))
    }
}
