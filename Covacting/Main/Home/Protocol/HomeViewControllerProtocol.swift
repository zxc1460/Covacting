//
//  HomeViewControllerProtocol.swift
//  Covacting
//
//  Created by Seok on 2021/03/13.
//

protocol ReviewTableViewCellDelegate: class {
    func expandButtonClicked(index: Int, isExpanded: Bool)
}
