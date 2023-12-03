//
//  SignInView.swift
//  Uniflix
//
//  Created by Eduardo Fischer on 16/11/23.
//

import SwiftUI

struct SignUpView: View {
    
    // Esta obersanando uma viewModel do tipo signInviewmodel
    @ObservedObject var viewModel: SignUpViewModel
    
    var body: some View {
        Text("Estou na tela de SignUpView!")
    }
    
}

