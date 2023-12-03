import SwiftUI

struct SignInView: View {
    @ObservedObject var viewModel: SignInViewModel

    @State private var username = ""
    @State private var password = ""

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center, spacing: 8) {
                    Spacer(minLength: 36)

                    VStack(alignment: .center) {
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                            .background(Color.white)
                            .ignoresSafeArea()
                            .padding(.horizontal, 48)
                            .padding(.top, 130)
                            .padding(.vertical, 10)

                        Text("Login")
                            .font(Font.system(.title2).bold())
                            .foregroundColor(.red)
                            .padding(.bottom, 8)

                        TextField("Usuário", text: $username)
                            .border(Color.black)

                        Text("Senha")
                            .font(Font.system(.title2).bold())
                            .padding(.bottom, 8)
                            .foregroundColor(.red)

                        SecureField("Senha", text: $password)
                            .border(Color.black)

                        // Exibir mensagem de erro, se houver
                        if case let .error(error) = viewModel.uiState {
                            Text(error)
                                .foregroundColor(.red)
                                .padding(.top, 8)
                        }

                        // Botões
                        HStack(spacing: 40) {
                            VStack {
                                Text("Ainda não tem cadastro?")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                                    .opacity(0.6)
                                    .bold()

                                NavigationLink(destination: Text("Tela de Cadastro"), label: {
                                    Text("Realize aqui").foregroundColor(.blue).font(.system(size: 14))
                                })
                            }

                            VStack {
                                // Chamando a função de login da ViewModel
                                Button(action: {
                                    viewModel.login(username: username, password: password)
                                    print(username)
                                    print(password)
                                }) {
                                    Text("Efetuar Login").foregroundColor(.blue).font(.system(size: 14))
                                }
                            }
                        }
                        .padding(30)

                        Button("Sair") {
                           
                            print("Sair pressionado")
                        }
                        .foregroundColor(.black)
                        .padding(.top, 50)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 32)
            .background(Color.white)
            .navigationBarTitle("Login", displayMode: .inline)
            .navigationBarHidden(true)
            .onReceive(viewModel.$uiState) { newUIState in
                if case .goToHomeScreen = newUIState {
                    // Navegar para a tela inicial
                    print("Navegar para a tela inicial")
                }
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SignInViewModel()
        SignInView(viewModel: viewModel)
    }
}
