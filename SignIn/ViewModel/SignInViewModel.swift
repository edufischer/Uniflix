import SwiftUI

class SignInViewModel: ObservableObject {
    @Published var uiState: SignInUIState = .none

    func login(username: String, password: String) {
        // Simulação do banco de dados
        let mockDatabase: [Usuario] = [
            Usuario(nome: "Admin", senha: "password", tipoDeAssinatura: .simples),
            Usuario(nome: "Teste", senha: "123", tipoDeAssinatura: .premium)
        ]

        if (mockDatabase.first(where: { $0.getNome == username && $0.getSenha == password }) != nil) {
            DispatchQueue.main.async {
                self.uiState = .goToHomeScreen
            }
        } else {
            DispatchQueue.main.async {
                self.uiState = .error("Usuário ou Senha inválidos! Tente novamente.")
            }
        }
    }
}
