//
//  HomeDataManager.swift
//  Covacting
//
//  Created by Seok on 2021/03/13.
//

import Alamofire

class HomeDataManager: HomeDataManagerDelegate {
    weak var delegate: HomeViewControllerDelegate?
    
    init(delegate: HomeViewControllerDelegate) {
        self.delegate = delegate
    }
    
    func getReviews(standard: Int, vaccineName1: String?, vaccineName2: String?, vaccineName3: String?) {
        var url = "\(Constant.BASE_URL)/reviews?standard=\(standard)"
        
        if let vaccineName1 = vaccineName1 {
            url += "&vaccineName1=\(vaccineName1)"
        }
        
        if let vaccineName2 = vaccineName2 {
            url += "&vaccineName2=\(vaccineName2)"
        }
        
        if let vaccineName3 = vaccineName3 {
            url += "&vaccineName3=\(vaccineName3)"
        }
        
        print("url is \(url)")
        
        let encodedUrl = URL(string: url.addingPercentEncoding(withAllowedCharacters:.urlQueryAllowed)!)!
        
        AF.request("\(encodedUrl)", method: .get, headers: Constant.HEADERS).validate().responseDecodable(of: ReviewHomeResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.isSuccess, let result = response.result {
                    self.delegate?.didSuccessGetReviews(result: result)
                } else {
                    self.delegate?.failedToRequest(message: "서버와의 연결이 원활하지 않습니다.")
                }
            case .failure(let error):
                print(error.localizedDescription)
                self.delegate?.failedToRequest(message: "서버와의 연결이 원활하지 않습니다.")
            }
        }
    }
    
}
