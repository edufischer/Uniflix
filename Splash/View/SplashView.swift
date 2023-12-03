//
//  SplashView.swift
//  Uniflix
//
//  Created by Eduardo Fischer on 12/11/23.
//

import SwiftUI


// TOMA A ACAO QUE ESTA OLHANDO NA VIEW MODEL
// Componente da interface do Slash, ou seja, o design
// Aqui SOMENTE COISAS DE DESIGN, A LOGICA SERA TRATADA NO VIEWMODEL
struct SplashView: View {
    
    @ObservedObject var viewModel: SplashViewModel
    
    @State var showAlert = false
    
    // No body que sera definido os containers e lógicas
    var body: some View {
        Group{
            // aqui é o obervador do estado uiState la do viewmodel
            switch viewModel.uiState {
            case .loading:
                // navegar para proxima tela:
                loadingView()
            case .goToSignInScreen:
                viewModel.signInView()
            case .goToMenuScreen:
                Text("menu")
                //tele de cadastro
            case .goToSignUpScreen:
                viewModel.signUpView()
            case .error(let msg):
                loadingView(error: msg)
            }
            
        }
        .onAppear(perform: viewModel.onApper)
        // O ON APPER é chamada toda vez que a tela aparecer(o start do APP)
    }
}

// Compartilhamento de objeto
extension SplashView {
    func loadingView(error: String? = nil) -> some View {
        ZStack {
            Image("Logo")
            // declaracao dos métodos do objeto
            // sempre usar resizable para imagem
            // e sempre usar o scale e frame
                .resizable()
                .scaledToFit()
                .frame(width: 280, height: 100, alignment: .center)
                .background(Color.white)
                .ignoresSafeArea()
            
            if let error = error {
                Text("").alert(isPresented: .constant(true)) {
                    Alert(title: Text("Uniflix"), message: Text(error), dismissButton: .default(Text("Ok")) {
                        // faz algo quando some o alerta aqui
                    })
                }
            }
        }
    }
}


//struct SplashView_Previews: PreviewProvider {
//    static var previews: some View {
//        let viewModel = SplashViewModel()
//        SplashView(viewModel: viewModel)
//    }
//}
