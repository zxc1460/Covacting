//
//  ReviewWriteResponse.swift
//  Covacting
//
//  Created by Seok on 2021/03/13.
//

struct ReviewWriteResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var userIdx: Int
}

struct ReviewWriteBody: Encodable {
    var reviewContent: String
    var vaccineName: String
}

struct ReviewWriteCode {
    var code: Int = -1
    var message: String {
        switch code {
        case 1000:
            return "후기 작성 성공"
        case 4444:
            return "로그인 되어 있지 않습니다"
        case 2100:
            return "탈퇴하거나 비활성화된 유저입니다"
        default:
            return "서버와의 연결이 원활하지 않습니다"
        }
    }
}
