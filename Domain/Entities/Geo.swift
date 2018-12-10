//
//	Geo.swift Generate By modelGenerator
//	Create the Thu Dec 06 2018
//	https://github.com/inso-/modelGenerator
//

public struct Geo: Codable {

	public let lat: String
	public let lng: String

	public init(lat: String,
			lng: String) {
		self.lat = lat
		self.lng = lng
	}

}

extension Geo: Equatable {
	public static func == (lhs: Geo, rhs: Geo) -> Bool {
		return lhs.lat == rhs.lat &&
			lhs.lng == rhs.lng
	}
}
