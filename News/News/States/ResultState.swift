//
//  ResultState.swift
//  News
//
//  Created by Dominik Kowalewski on 14/03/2023.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
