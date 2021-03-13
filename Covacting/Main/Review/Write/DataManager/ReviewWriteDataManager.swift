//
//  ReviewWriteDataManager.swift
//  Covacting
//
//  Created by Seok on 2021/03/13.
//

import Alamofire

class ReviewWriteDataManager: ReviewWriteDataManagerDelegate {
    weak var delegate: ReviewWriteViewControllerDelegate?
    
    init(delegate: ReviewWriteViewControllerDelegate) {
        self.delegate = delegate
    }
    
    func postReview(body: ReviewWriteBody) {
        AF.request("\(Constant.BASE_URL)/reviews", method: .post, parameters: body, encoder: JSONParameterEncoder(), headers: Constant.HEADERS).validate().responseDecodable(of: ReviewWriteResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    self.delegate?.didSuccessPostReview()
                } else {
                    self.delegate?.failedToRequest(message: ReviewWriteCode().message)
                }
            case .failure(let error):
                print(error.localizedDescription)
                self.delegate?.failedToRequest(message: ReviewWriteCode().message)
            }
        }
    }
    
    func patchReview() {
    }

}
