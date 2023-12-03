//
//  UniflixApp.swift
//  Uniflix
//
//  Created by Eduardo Fischer on 12/11/23.
//

import CoreData
import SwiftUI

// @main daqui o codigo sera executado principalmente
@main
struct UniflixApp: App {
    // PARA UTILIZAR COREDATE COMO BANCO DE DADOS
    let persistenceController = PersistenceController.shared
    
    // CRIA A PRIMEIRA VIEW DO APP
    var body: some Scene {
        WindowGroup {
            SplashView(viewModel: SplashViewModel())
        }
        }
    
    
}


