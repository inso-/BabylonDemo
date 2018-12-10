//
//	Address.swift Generate By modelGenerator
//	Create the Thu Dec 06 2018
//	https://github.com/inso-/modelGenerator
//

public struct Address: Codable {

	public let suite: String
	public let street: String
	public let geo: Geo
	public let zipcode: String
	public let city: String

	public init(suite: String,
			street: String,
			geo: Geo,
			zipcode: String,
			city: String) {
		self.suite = suite
		self.street = street
		self.geo = geo
		self.zipcode = zipcode
		self.city = city
	}

}

extension Address: Equatable {
	public static func == (lhs: Address, rhs: Address) -> Bool {
		return lhs.suite == rhs.suite &&
			lhs.street == rhs.street &&
			lhs.geo == rhs.geo &&
			lhs.zipcode == rhs.zipcode &&
			lhs.city == rhs.city
	}
}
