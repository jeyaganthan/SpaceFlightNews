//
//  Article_Base.swift
//  Spaceflight News
//
//  Created by jeyaganthan.p on 21/10/23.
//

import Foundation
struct Article_Base : Codable {
	let count : Int?
	let next : String?
	let previous : String?
	let results : [Results]?

	enum CodingKeys: String, CodingKey {

		case count = "count"
		case next = "next"
		case previous = "previous"
		case results = "results"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		count = try values.decodeIfPresent(Int.self, forKey: .count)
		next = try values.decodeIfPresent(String.self, forKey: .next)
		previous = try values.decodeIfPresent(String.self, forKey: .previous)
		results = try values.decodeIfPresent([Results].self, forKey: .results)
	}

}
