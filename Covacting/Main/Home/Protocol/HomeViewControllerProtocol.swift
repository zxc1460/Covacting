//
//  HomeViewControllerProtocol.swift
//  Covacting
//
//  Created by Seok on 2021/03/13.
//

protocol ReviewTableViewCellDelegate: class {
    func expandButtonClicked(index: Int, isExpanded: Bool)
    func likeButtonClicked(index: Int, likeClicked: Bool)
}

protocol HomeDataManagerDelegate {
    func getReviews(standard: Int, vaccineName1: String?, vaccineName2: String?, vaccineName3: String?)
}

protocol HomeViewControllerDelegate: class {
    func didSuccessGetReviews(result: [ReviewHomeResult])
    func failedToRequest(message: String)
}
