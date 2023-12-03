//
//  SplashUIState.swift
//  Uniflix
//
//  Created by Eduardo Fischer on 12/11/23.
//


import SwiftUI

// onde fica o banco de dados
// 
// Vai controlar o estado da Splash User Interface
// ARMAZENA OS CASES, VARIAVEIS E DADOS RELACIONADOS AO BANCO DE DADOS

enum SplashUIState {
    case loading
    case goToSignInScreen
    case goToSignUpScreen
    case goToMenuScreen
    case error(String="Não foi possível efetuar o carregamento do app")
}
