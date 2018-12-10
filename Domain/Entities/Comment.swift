//
//	Comment.swift Generate By modelGenerator
//	Create the Thu Dec 06 2018
//	https://github.com/inso-/modelGenerator
//

public struct Comment: Codable {

	public let body: String
	public let CommentId: Int?
	public let email: String
	public let name: String
	public let id: Int

	public init(body: String,
			CommentId: Int?,
			email: String,
			name: String,
			id: Int) {
		self.body = body
		self.CommentId = CommentId
		self.email = email
		self.name = name
		self.id = id
	}

}

extension Comment: Equatable {
	public static func == (lhs: Comment, rhs: Comment) -> Bool {
		return lhs.body == rhs.body &&
			lhs.CommentId == rhs.CommentId &&
			lhs.email == rhs.email &&
			lhs.name == rhs.name &&
			lhs.id == rhs.id
	}
}
