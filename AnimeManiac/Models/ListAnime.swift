// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let date20211207Usd1128095 = try? newJSONDecoder().decode(Date20211207Usd1128095.self, from: jsonData)

import Foundation

// MARK: - Date20211207Usd1128095
struct ListAnime: Codable {
    let data: [Datum]
    let meta: Date20211207Usd1128095_Meta
    let links: Date20211207Usd1128095_Links
}

// MARK: - Datum
struct Datum: Codable {
    let id: String
    let type: TypeEnum
    let links: DatumLinks
    let attributes: Attributes
    let relationships: [String: Relationship]
}

// MARK: - Attributes
struct Attributes: Codable {
    let createdAt, updatedAt, slug, synopsis: String
    let attributesDescription: String
    let coverImageTopOffset: Int
    let titles: Titles
    let canonicalTitle: String
    let abbreviatedTitles: [String]
    let averageRating: String
    let ratingFrequencies: [String: String]
    let userCount, favoritesCount: Int
    let startDate: String
    let endDate, nextRelease: String?
    let popularityRank, ratingRank: Int
    let ageRating: AgeRating
    let ageRatingGuide: String
    let subtype: ShowTypeEnum
    let status: Status
    let tba: String?
    let posterImage: PosterImage
    let coverImage: CoverImage?
    let episodeCount, episodeLength: Int?
    let totalLength: Int
    let youtubeVideoID: String?
    let showType: ShowTypeEnum
    let nsfw: Bool

    enum CodingKeys: String, CodingKey {
        case createdAt, updatedAt, slug, synopsis
        case attributesDescription = "description"
        case coverImageTopOffset, titles, canonicalTitle, abbreviatedTitles, averageRating, ratingFrequencies, userCount, favoritesCount, startDate, endDate, nextRelease, popularityRank, ratingRank, ageRating, ageRatingGuide, subtype, status, tba, posterImage, coverImage, episodeCount, episodeLength, totalLength
        case youtubeVideoID = "youtubeVideoId"
        case showType, nsfw
    }
}

enum AgeRating: String, Codable {
    case pg = "PG"
    case r = "R"
}

// MARK: - CoverImage
struct CoverImage: Codable {
    let tiny, large, small: String
    let original: String
    let meta: CoverImageMeta
}

// MARK: - CoverImageMeta
struct CoverImageMeta: Codable {
    let dimensions: Dimensions
}

// MARK: - Dimensions
struct Dimensions: Codable {
    let tiny, large, small: Large
    let medium: Large?
}

// MARK: - Large
struct Large: Codable {
    let width, height: Int
}

// MARK: - PosterImage
struct PosterImage: Codable {
    let tiny, large, small, medium: String
    let original: String
    let meta: CoverImageMeta
}

enum ShowTypeEnum: String, Codable {
    case movie = "movie"
    case tv = "TV"
}

enum Status: String, Codable {
    case current = "current"
    case finished = "finished"
}

// MARK: - Titles
struct Titles: Codable {
    let en: String?
    let enJp, jaJp: String
    let enUs: String?

    enum CodingKeys: String, CodingKey {
        case en
        case enJp = "en_jp"
        case jaJp = "ja_jp"
        case enUs = "en_us"
    }
}

// MARK: - DatumLinks
struct DatumLinks: Codable {
    let linksSelf: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - Relationship
struct Relationship: Codable {
    let links: RelationshipLinks
}

// MARK: - RelationshipLinks
struct RelationshipLinks: Codable {
    let linksSelf, related: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case related
    }
}

enum TypeEnum: String, Codable {
    case anime = "anime"
}

// MARK: - Date20211207Usd1128095_Links
struct Date20211207Usd1128095_Links: Codable {
    let first, next, last: String
}

// MARK: - Date20211207Usd1128095_Meta
struct Date20211207Usd1128095_Meta: Codable {
    let count: Int
}
