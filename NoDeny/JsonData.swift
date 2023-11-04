//
//  JsonData.swift
//  NoDeny
//
//  Created by Евгений Подъячев on 22.04.2023.
//
// https://app.quicktype.io
//   let noError = try? JSONDecoder().decode(NoError.self, from: jsonData)
//   let noKey = try? JSONDecoder().decode(NoKey.self, from: jsonData)
//   let noData = try? JSONDecoder().decode(NoData.self, from: jsonData)


import Foundation

// MARK: - NoError
struct NoError: Codable {
    let errCod: String
    let error: String
    var version: String
   // "error" : "Вы не авторизованы",
   //  "err_cod" : "unauthorized"
    
    enum CodingKeys: String, CodingKey {
        case errCod = "err_cod"
        case version = ""
        case error = "err_or"
    }
}
//*********************************************
// MARK: - NoKey
struct NoKey: Codable {
    let result, ses: String //result "auth ok"
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let id: Int
    let role: String
    let trust: Int
}
//*********************************************
// MARK: - NoData

// MARK: - NoData
struct NoData: Codable {
    let result: Result
}

// MARK: - Result
struct Result: Codable {
    let services: [Service]
    let pays: [Pay]
    let credits: [Credit]
    let usr: USR
}

// MARK: - Credit
struct Credit: Codable {
    let date: String
    let time, cash: Int
}

// MARK: - Pay
struct Pay: Codable {
    let reason: String
    let category, creatorIP, creatorID, id: Int
    let time: Int
    let date: String
    let cash: Int
    let comment, creator: String

    enum CodingKeys: String, CodingKey {
        case reason, category
        case creatorIP = "creator_ip"
        case creatorID = "creator_id"
        case id, time, date, cash, comment, creator
    }
}

// MARK: - Service
struct Service: Codable {
    let id: Int
    let humanEndTime: String
    let nextServicePrice, timeStart, nextServiceID, timeLeft: Int
    let serviceID: Int
    let title: String
    let price, frozen: Int
    let humanTime, canChangeSrv, nextServiceTitle: String

    enum CodingKeys: String, CodingKey {
        case id
        case humanEndTime = "human_end_time"
        case nextServicePrice = "next_service_price"
        case timeStart = "time_start"
        case nextServiceID = "next_service_id"
        case timeLeft = "time_left"
        case serviceID = "service_id"
        case title, price, frozen
        case humanTime = "human_time"
        case canChangeSrv = "can_change_srv"
        case nextServiceTitle = "next_service_title"
    }
}

// MARK: - USR
struct USR: Codable {
    let grpName: String
    let grp, uid, in5: Int
    let ips: [IP]
    let id: Int
    let state: String
    let cstate, in6: Int
    let recommendedPay, stateOff: String
    let out2, out6, traf3, limitBalance: Int
    let comment: String
    let in7, traf1: Int
    let fio, trafIn: String
    let lstate, out7, in8, blockIfLimit: Int
    let out3: Int
    let contract, name: String
    let test, in1, submoney: Int
    let contractDateAsText: String
    let in2, out8, out4: Int
    let trafOut, traf: String
    let debt, traf4, modifyTime, traf2: Int
    let in3: Int
    let dopdata: [Dopdatum]
    let actual, frozenSrv, balance, contractDate: Int
    let cstateTime, discount, in4: Int
    let ppc: String
    let out1, out5: Int

    enum CodingKeys: String, CodingKey {
        case grpName = "grp_name"
        case grp, uid, in5, ips, id, state, cstate, in6
        case recommendedPay = "recommended_pay"
        case stateOff = "state_off"
        case out2, out6, traf3
        case limitBalance = "limit_balance"
        case comment, in7, traf1, fio
        case trafIn = "traf_in"
        case lstate, out7, in8
        case blockIfLimit = "block_if_limit"
        case out3, contract, name, test, in1, submoney
        case contractDateAsText = "contract_date_as_text"
        case in2, out8, out4
        case trafOut = "traf_out"
        case traf, debt, traf4
        case modifyTime = "modify_time"
        case traf2, in3, dopdata, actual
        case frozenSrv = "frozen_srv"
        case balance
        case contractDate = "contract_date"
        case cstateTime = "cstate_time"
        case discount, in4, ppc, out1, out5
    }
}

// MARK: - Dopdatum
struct Dopdatum: Codable {
    let value, title, show, name: String
}
// MARK: - IP
struct IP: Codable {
    let start, last, uid, release: Int
    let auth: Int
    let type: String
    let tag: [JSONAny]
    let tmAuth: Int
    let ip, properties, numTag: String
    let ipn: Int

    enum CodingKeys: String, CodingKey {
        case start, last, uid, release, auth, type, tag
        case tmAuth = "tm_auth"
        case ip, properties
        case numTag = "num_tag"
        case ipn
    }
}

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public func hash(into hasher: inout Hasher) {
           hasher.combine(0)
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

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
