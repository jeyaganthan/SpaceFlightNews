//
//  NewsDetails_Base.swift
//  Spaceflight News
//
//  Created by jeyaganthan.p on 22/10/23.
//

import Foundation
struct NewsDetails_Base : Codable {
	let id : Int?
	let title : String?
	let url : String?
	let image_url : String?
	let news_site : String?
	let summary : String?
	let published_at : String?
	let updated_at : String?
	let featured : Bool?
	let launches : [Launches]?
	let events : [Events]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case title = "title"
		case url = "url"
		case image_url = "image_url"
		case news_site = "news_site"
		case summary = "summary"
		case published_at = "published_at"
		case updated_at = "updated_at"
		case featured = "featured"
		case launches = "launches"
		case events = "events"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
		news_site = try values.decodeIfPresent(String.self, forKey: .news_site)
		summary = try values.decodeIfPresent(String.self, forKey: .summary)
		published_at = try values.decodeIfPresent(String.self, forKey: .published_at)
		updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
		featured = try values.decodeIfPresent(Bool.self, forKey: .featured)
		launches = try values.decodeIfPresent([Launches].self, forKey: .launches)
		events = try values.decodeIfPresent([Events].self, forKey: .events)
	}
}
