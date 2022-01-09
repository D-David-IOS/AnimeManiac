// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let listAnime = try? newJSONDecoder().decode(ListAnime.self, from: jsonData)

import Foundation

// MARK: - ListAnime
struct ListAnime: Codable {
    let data: [Datum]
    let meta: ListAnimeMeta
    let links: ListAnimeLinks
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
    let createdAt: String
    let updatedAt: UpdatedAt
    let slug: String
    let synopsis, attributesDescription: String?
    let coverImageTopOffset: Int
    let titles: Titles
    let canonicalTitle: String
    let abbreviatedTitles: [String?]
    let averageRating: String?
    let ratingFrequencies: [String: String]
    let userCount, favoritesCount: Int
    let startDate, endDate: String?
    let nextRelease: JSONNull?
    let popularityRank: Int
    let ratingRank: Int?
    let ageRating: AgeRating?
    let ageRatingGuide: String?
    let subtype: ShowTypeEnum
    let status: Status
    let tba: String?
    let posterImage: PosterImage
    let coverImage: CoverImage?
    let episodeCount, episodeLength, totalLength: Int?
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
    case g = "G"
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
    let dimensions: PurpleDimensions
}

// MARK: - PurpleDimensions
struct PurpleDimensions: Codable {
    let tiny, large, small: Large
}

// MARK: - Large
struct Large: Codable {
    let width, height: Int?
}

// MARK: - PosterImage
struct PosterImage: Codable {
    let tiny, large, small, medium: String
    let original: String
    let meta: PosterImageMeta
}

// MARK: - PosterImageMeta
struct PosterImageMeta: Codable {
    let dimensions: FluffyDimensions
}

// MARK: - FluffyDimensions
struct FluffyDimensions: Codable {
    let tiny, large, small, medium: Large
}

enum ShowTypeEnum: String, Codable {
    case movie = "movie"
    case music = "music"
    case ona = "ONA"
    case ova = "OVA"
    case special = "special"
    case tv = "TV"
}

enum Status: String, Codable {
    case current = "current"
    case finished = "finished"
    case tba = "tba"
    case unreleased = "unreleased"
    case upcoming = "upcoming"
}

// MARK: - Titles
struct Titles: Codable {
    let enJp: String?
    let jaJp, en: String?
    let koKr, zhCN, enUs, enCN: String?

    enum CodingKeys: String, CodingKey {
        case enJp = "en_jp"
        case jaJp = "ja_jp"
        case en
        case koKr = "ko_kr"
        case zhCN = "zh_cn"
        case enUs = "en_us"
        case enCN = "en_cn"
    }
}

enum UpdatedAt: String, Codable {
    case the20220109T180004840Z = "2022-01-09T18:00:04.840Z"
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

// MARK: - ListAnimeLinks
struct ListAnimeLinks: Codable {
    let first, next, last: String
}

// MARK: - ListAnimeMeta
struct ListAnimeMeta: Codable {
    let count: Int
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
