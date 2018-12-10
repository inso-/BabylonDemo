//
//	User.swift Generate By modelGenerator
//	Create the Thu Dec 06 2018
//	https://github.com/inso-/modelGenerator
//

public struct User: Codable {

	public let username: String
	public let website: String
	public let name: String
	public let company: Company
	public let email: String
	public let phone: String
	public let address: Address
	public let id: Int

	public init(username: String,
			website: String,
			name: String,
			company: Company,
			email: String,
			phone: String,
			address: Address,
			id: Int) {
		self.username = username
		self.website = website
		self.name = name
		self.company = company
		self.email = email
		self.phone = phone
		self.address = address
		self.id = id
	}

}

extension User: Equatable {
	public static func == (lhs: User, rhs: User) -> Bool {
		return lhs.username == rhs.username &&
			lhs.website == rhs.website &&
			lhs.name == rhs.name &&
			lhs.company == rhs.company &&
			lhs.email == rhs.email &&
			lhs.phone == rhs.phone &&
			lhs.address == rhs.address &&
			lhs.id == rhs.id
	}
}
