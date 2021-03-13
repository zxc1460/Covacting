//
//  ReviewWriteProtocol.swift
//  Covacting
//
//  Created by Seok on 2021/03/13.
//

protocol ReviewWriteDataManagerDelegate {
    func postReview(body: ReviewWriteBody)
    func patchReview()
}

protocol ReviewWriteViewControllerDelegate: class {
    func didSuccessPostReview()
    func didSuccessPatchReview()
    func failedToRequest(message: String)
}
