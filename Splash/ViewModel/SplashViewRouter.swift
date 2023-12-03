//
//  SplashViewRouter.swift
//  Uniflix
//
//  Created by Eduardo Fischer on 16/11/23.
//


import SwiftUI


// SERA O ROTEADOR, OU SEJA, GERENCIA AS ROTAS DE TELAS

// SERA RESPONSAVEL POR CRIAR TODAS VIEWS E VIEWMODELS 
enum SplashViewRouter {
    // GERENCIA AS ROTAS DE TELAS
    
    static func makeSignUpView() -> some View{
        // aqui cria a variavel com a viewmodel para passar por parametro depois
        // recebe uma instancia do signinviewmodel
        let viewModel = SignUpViewModel()
        // a view necessita passar por parametor uma viewmodel respecitvamente
        return SignUpView(viewModel: viewModel)
    }
    
    static func makeSignInView() -> some View{
        // aqui cria a variavel com a viewmodel para passar por parametro depois
        // recebe uma instancia do signinviewmodel
        let viewModel = SignInViewModel()
        // a view necessita passar por parametor uma viewmodel respecitvamente
        return SignInView(viewModel: viewModel)
        
    }
    
}
