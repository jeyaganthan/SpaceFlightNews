//
//  Events.swift
//  Spaceflight News
//
//  Created by jeyaganthan.p on 21/10/23.
//

import Foundation
struct Events : Codable {
	let event_id : Int?
	let provider : String?

	enum CodingKeys: String, CodingKey {

		case event_id = "event_id"
		case provider = "provider"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		event_id = try values.decodeIfPresent(Int.self, forKey: .event_id)
		provider = try values.decodeIfPresent(String.self, forKey: .provider)
	}

}
