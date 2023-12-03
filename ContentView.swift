/**
 
 import SwiftUI


 // ContentView renderiza a primeira tela
 // struct define o conteudo da View
 struct NetflixLoginView: View {
     @State private var username: String
     @State private var senha: String
     @State private var criarContaUsername: String
     @State private var criarContaSenha: String

     init(username: String = "", senha: String = "") {
         self._username = State(initialValue: username)
         self._senha = State(initialValue: senha)
         self._criarContaUsername = State(initialValue: "")
         self._criarContaSenha = State(initialValue: "")
     }

     var body: some View {
         /** objeto VSTack
                  O SwiftUI oferece vários outros tipos de contêineres de layout, como VSTack (vertiical stakc),
                  HStack (horizontal stack) para organizar as visualizações horizontalmente,
                  ZStack para empilhar visualizações em profundidade (camadas)  **/
         
         VStack() {
             // Logotipo do Netflix
             Image("Logo")
                 // declaracao dos métodos do objeto
                 // sempre usar resizable para imagem
                 // e sempre usar o scale e frame
                 .resizable()
                 .scaledToFit()
                 .frame(width: 280, height: 100, alignment: .center)
                 .background(Color.white)
                 .ignoresSafeArea()

             // Botões
             HStack(spacing: 40) {
                 // Botão "Criar conta"
                 Button("Criar Conta") {
                     let novoUsuario = Usuario(nome: criarContaUsername, senha: criarContaSenha, tipoDeAssinatura: .simples)
                     // Faça algo com o novo usuário, como adicioná-lo a uma lista de usuários
                     print("Novo usuário criado: \(novoUsuario.getNome)")
                 }

                 // Botão "Acessar"
                 Button("Efetuar Login") {
                     // Implemente a lógica de login aqui
                 }
             }
             .padding(30)
         }
     }
 }


 struct NetflixLoginView_Previews: PreviewProvider {
     static var previews: some View {
         NetflixLoginView()
     }
 }

*/
 
 
