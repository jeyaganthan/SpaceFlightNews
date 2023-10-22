//
//  Launches.swift
//  Spaceflight News
//
//  Created by jeyaganthan.p on 21/10/23.
//

import Foundation
struct Launches : Codable {
	let launch_id : String?
	let provider : String?

	enum CodingKeys: String, CodingKey {

		case launch_id = "launch_id"
		case provider = "provider"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		launch_id = try values.decodeIfPresent(String.self, forKey: .launch_id)
		provider = try values.decodeIfPresent(String.self, forKey: .provider)
	}

}
