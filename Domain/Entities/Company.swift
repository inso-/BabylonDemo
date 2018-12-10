//
//	Company.swift Generate By modelGenerator
//	Create the Thu Dec 06 2018
//	https://github.com/inso-/modelGenerator
//

public struct Company: Codable {

	public let catchPhrase: String
	public let name: String
	public let bs: String

	public init(catchPhrase: String,
			name: String,
			bs: String) {
		self.catchPhrase = catchPhrase
		self.name = name
		self.bs = bs
	}

}

extension Company: Equatable {
	public static func == (lhs: Company, rhs: Company) -> Bool {
		return lhs.catchPhrase == rhs.catchPhrase &&
			lhs.name == rhs.name &&
			lhs.bs == rhs.bs
	}
}
