//
//  SplashViewModel.swift
//  Uniflix
//
//  Created by Eduardo Fischer on 13/11/23.
//

/*
 AQUI FICARÁ A LOGICA DO VIEW
 ONDE EFETUARA A ALTERACAO DO ESTADO
Ficara armezanado neste arquivos variaveis que sofreram mudanca de estado
que vai refletir no design (View)
*/

import SwiftUI

/**
 SplashViewModel é observável (Observable) e tem uma variavel também observável (Published).. Sempre que essa variavel mudar, ela irá notificar/disparar o evento informando "olha, eu mudei, tenho um novo estado". Com isso, aquele que está observando-a, (Observed) irá desenhar a tela com o novo estado... neste caso, a SplashView que está observando a SplashViewModel irá desenhar a tela baseado no novo estado.
 */

// É UMA CLASS OBSERVADA
// RESPONSAVEL PELAS ACTIONS E EDICOES PARA FORMATAR O QUE APARECERA NA VIEW
// ARMEZARA A LOGICA
// TOMA ACOES BASEADA NO SISTEMA OU NO INPUT DE USUARIO


class SplashViewModel: ObservableObject {
    
    //é uma variavel que conforme varia faz com que o renderize novamente o body
    //aqui defini a instrucao start do state
    
    // aqui a VIEW FICA "OLHANDO" TUDO QUE TEM PUBLISHED
    @Published var uiState: SplashUIState = .loading
    
    // SERVE PARA DISPARAR EVENTOS
    func onApper(){
        // faz algo assincrono, por exemplo, consulta o database e, apos a resposta, muda o estado do uiState
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            // aqui é chamado apos 3 segundos
            self.uiState = .goToSignInScreen
        }
        
    }
}

// nome de funcao sempre com inicial em minusculo e classe em maisuculo
extension SplashViewModel{
    func signUpView() -> some View{
        // chama o metodo de construir a tela de login
        return SplashViewRouter.makeSignUpView()
    }
    
    func signInView() -> some View{
        // chama o metodo de construir a tela inicial
        return SplashViewRouter.makeSignInView()
    }
}

