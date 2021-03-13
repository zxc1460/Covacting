//
//  ReviewHomeResponse.swift
//  Covacting
//
//  Created by Seok on 2021/03/13.
//

struct ReviewHomeResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var userIdx: Int
    var result: [ReviewHomeResult]?
}

struct ReviewHomeResult: Decodable {
    var reviewIdx: Int
    var userIdx: Int
    var userNickname: String
    var userProfileImgLink: String?
    var reviewContent: String
    var vaccineName: String
    var likeReviewCount: Int
    var likeStatus: Int
    var createdAt: String
    var isExpanded: Bool?
    var likeClicked: Bool?
}

struct ReviewHomeCode {
    var code: Int = -1
    var message: String {
        switch code {
        case 1000:
            return "조회 성공"
        case 4444:
            return "로그인이 되어 있지 않습니다"
        case 2100:
            return "비활성화되어 있거나 탈퇴한 회원입니답"
        default:
            return "서버와의 연결이 원활하지 않습니다"
        }
    }
}
