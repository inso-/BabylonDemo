//
//	Post.swift Generate By modelGenerator
//	Create the Thu Dec 06 2018
//	https://github.com/inso-/modelGenerator
//

public struct Post: Codable {

	public let body: String?
	public let userId: Int
	public let id: Int
	public let title: String

	public let numberOfComments: Int?
	public let userName: String?

	public init(body: String,
			userId: Int,
			id: Int,
			title: String) {
		self.body = body
		self.userId = userId
		self.id = id
		self.title = title
		self.numberOfComments = nil
		self.userName = nil
	}

	public init(body: String,
				userId: Int,
				id: Int,
				title: String,
				numberOfComments: Int,
				userName: String) {
		self.body = body
		self.userId = userId
		self.id = id
		self.title = title
		self.numberOfComments = numberOfComments
		self.userName = userName
	}

}

extension Post: Equatable {
	public static func == (lhs: Post, rhs: Post) -> Bool {
		return lhs.body == rhs.body &&
			lhs.userId == rhs.userId &&
			lhs.id == rhs.id &&
			lhs.title == rhs.title
	}
}
