//
//  SignInUIState.swift
//  Uniflix
//
//  Created by Eduardo Fischer on 17/11/23.
//

import Foundation

enum SignInUIState {
    case none
    case loading
    case goToHomeScreen
    case error(String)
}
