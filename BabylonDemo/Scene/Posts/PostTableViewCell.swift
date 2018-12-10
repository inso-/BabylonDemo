//
//  PostTableViewCell.swift
//  BabylonDemo
//
//  Created by inso on 06/12/2018.
//  Copyright © 2018 Thomas Moussajee. All rights reserved.
//

import Foundation
import UIKit

final class PostTableViewCell: UITableViewCell {
	@IBOutlet weak var titleLabel: UILabel!

	func bind(_ viewModel: PostItemViewModel) {
		self.titleLabel.text = viewModel.title
	}

}
