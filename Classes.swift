//
//  Classes.swift
//  Uniflix
//
//  Created by Eduardo Fischer on 12/11/23.
//

import Foundation

class Usuario {
    static var contadorID: Int = 0
    
    private var id: Int
    private var nome: String
    private var senha: String
    private var tipoDeAssinatura: TipoAssinatura
    private var listaDePerfis: [Perfil]

    init(nome: String, senha: String, tipoDeAssinatura: TipoAssinatura) {
        Usuario.contadorID += 1
        self.id = Usuario.contadorID
        self.nome = nome
        self.senha = senha
        self.tipoDeAssinatura = tipoDeAssinatura
        self.listaDePerfis = []
    }

    // Getters
    var getNome: String {
        return nome
    }

    var getSenha: String {
        return senha
    }

    var getTipoDeAssinatura: TipoAssinatura {
        return tipoDeAssinatura
    }

    var getListaDePerfis: [Perfil] {
        return listaDePerfis
    }

    // Setters
    func setNome(_ novoNome: String) {
        nome = novoNome
    }

    func setSenha(_ novaSenha: String) {
        senha = novaSenha
    }

    func setTipoDeAssinatura(novoTipo: TipoAssinatura) {
        tipoDeAssinatura = novoTipo
    }

    // Verifica se é possível adicionar o perfil pelo tipo de assinatura do usuário
    func adicionarPerfil(nome: String, idade: Int) {
        // Guard é variavel de controle de fluxo; logo caso a condicao nao for verdadeira entra no escopo do guard
        guard listaDePerfis.count < tipoDeAssinatura.numeroMaximoDePerfis() else {
            print("Limite de perfis atingido para este tipo de assinatura.")
            return
        }

        let novoPerfil = Perfil(nome: nome, idade: idade)
        listaDePerfis.append(novoPerfil)
        print("Perfil \(nome) adicionado com sucesso.")
    }

    func removerPerfil(nome: String) {
        if let index = listaDePerfis.firstIndex(where: { $0.getNome == nome }) {
            listaDePerfis.remove(at: index)
            print("Perfil \(nome) removido com sucesso.")
        } else {
            print("Perfil \(nome) não encontrado.")
        }
    }

    func exibirInformacoes() {
        print("""
            Nome de Usuário: \(getNome)
            Tipo de Assinatura: \(tipoDeAssinatura.rawValue)
            Número de Perfis: \(listaDePerfis.count)
            """)
    }
}

class Perfil {
    private var nome: String
    private var idade: Int
    private var favoritos: [Midia]
    private var ultimosAssistidos: [Midia]

    init(nome: String, idade: Int) {
        self.nome = nome
        self.idade = idade
        self.favoritos = []
        self.ultimosAssistidos = []
    }

    // Getters
    var getNome: String {
        return nome
    }

    var getIdade: Int {
        return idade
    }

    // Métodos para adicionar e remover favoritos
    func adicionarFavorito(_ midia: Midia) {
        if !favoritos.contains(where: { $0.titulo == midia.titulo }) {
            favoritos.append(midia)
            print("Mídia favoritada: \(midia.titulo)")
        }
    }

    func removerFavorito(_ midia: Midia) {
        if let index = favoritos.firstIndex(where: { $0.titulo == midia.titulo }) {
            favoritos.remove(at: index)
            print("Mídia removida dos favoritos: \(midia.titulo)")
        }
    }

    // Método para adicionar à lista de últimos assistidos
    func adicionarUltimoAssistido(_ midia: Midia) {
        ultimosAssistidos.removeAll { $0.titulo == midia.titulo }
        ultimosAssistidos.append(midia)
        print("Mídia adicionada aos últimos assistidos: \(midia.titulo)")
    }
    
    /*
    // Método para listar mídias apropriadas para a idade
    func listarMidiasApropriadas(tipo: TipoMidia, catalogo: Catalogo) -> [Midia] {
        let listaCompleta = catalogo.obterLista(tipo: tipo)
        let midiasApropriadas = listaCompleta.filter { $0.apropriadaParaIdade(idade) }
        return midiasApropriadas
    }
    */
    
    // Método para assistir a uma mídia
    func assistir(_ midia: Midia) {
        print("Mídia assistida: \(midia.titulo)")
        adicionarUltimoAssistido(midia)
    }

    // Método para favoritar ou desfavoritar uma mídia
    func favoritar(_ midia: Midia, _ favoritar: Bool) {
        if favoritar {
            adicionarFavorito(midia)
        } else {
            removerFavorito(midia)
        }
    }
    
    /**
    // Método para buscar por título no catálogo
    func buscarPorTitulo(_ titulo: String, catalogo: Catalogo) -> [Midia] {
        var resultados: [Midia] = []

        for tipo in TipoMidia.allCases {
            let listaCompleta = catalogo.obterLista(tipo: tipo)
            let midiasEncontradas = listaCompleta.filter { $0.titulo.lowercased().contains(titulo.lowercased()) }
            resultados.append(contentsOf: midiasEncontradas)
        }

        return resultados
    }
     
    */
}

enum TipoAssinatura: String {
    case simples = "Simples"
    case premium = "Premium"

    // Retorna um int
    func numeroMaximoDePerfis() -> Int {
        switch self {
        case .simples:
            return 3
        case .premium:
            return 5
        }
    }

    func propagandaIncluida() -> Bool {
        return self == .simples
    }

    func custoMensal() -> Double {
        switch self {
        case .simples:
            return 29.90
        case .premium:
            return 49.90
        }
    }
}

class Midia {
    static var contadorID: Int = 0

    var id: Int
    var tipo: String
    var titulo: String
    var genero: String
    var anoLancamento: Int
    var classificacao: String

    init(tipo: String, titulo: String, genero: String, anoLancamento: Int, classificacao: String) {
        Midia.contadorID += 1
        self.id = Midia.contadorID
        self.tipo = tipo
        self.titulo = titulo
        self.genero = genero
        self.anoLancamento = anoLancamento
        self.classificacao = classificacao
    }
    
    // Sera utilizada para sobrescrever
    // Daria pra forcar atraves do protocol em Swift
    // TO DO - ESTUDAR PROTOCOL
    func exibirInformacoes() {
        print("""
            ID: \(id)
            Tipo: \(tipo)
            Título: \(titulo)
            Gênero: \(genero)
            Ano de Lançamento: \(anoLancamento)
            Classificação: \(classificacao)
            """)
    }
}

class Serie: Midia {
    var numeroTemporadas: Int
    var episodiosPorTemporada: [String]

    init(titulo: String, genero: String, anoLancamento: Int, classificacao: String, numeroTemporadas: Int, episodiosPorTemporada: [String]) {
        self.numeroTemporadas = numeroTemporadas
        self.episodiosPorTemporada = episodiosPorTemporada
        super.init(tipo: "Série", titulo: titulo, genero: genero, anoLancamento: anoLancamento, classificacao: classificacao)
    }

    // Sobrescevendo a classe mae
    override func exibirInformacoes() {
        super.exibirInformacoes()
        print("Número de Temporadas: \(numeroTemporadas)")
        print("Episódios por Temporada: \(episodiosPorTemporada)")
    }

    func listarEpisodios(numeroTemporada: Int) {
        print("Lista de Episódios da Temporada \(numeroTemporada): \(episodiosPorTemporada)")
    }
}

class Filme: Midia {
    var diretor: String
    var produtor: String

    init(titulo: String, genero: String, anoLancamento: Int, classificacao: String, diretor: String, produtor: String) {
        self.diretor = diretor
        self.produtor = produtor
        super.init(tipo: "Filme", titulo: titulo, genero: genero, anoLancamento: anoLancamento, classificacao: classificacao)
    }

    override func exibirInformacoes() {
        super.exibirInformacoes()
        print("Diretor: \(diretor)")
        print("Produtor: \(produtor)")
    }
}

class Documentario: Midia {
    var tema: String

    init(titulo: String, genero: String, anoLancamento: Int, classificacao: String, tema: String) {
        self.tema = tema
        super.init(tipo: "Documentário", titulo: titulo, genero: genero, anoLancamento: anoLancamento, classificacao: classificacao)
    }

    override func exibirInformacoes() {
        super.exibirInformacoes()
        print("Tema: \(tema)")
    }
}

class Animacao: Midia {
    var estudio: String

    init(titulo: String, genero: String, anoLancamento: Int, classificacao: String, estudio: String) {
        self.estudio = estudio
        super.init(tipo: "Animação", titulo: titulo, genero: genero, anoLancamento: anoLancamento, classificacao: classificacao)
    }

    override func exibirInformacoes() {
        super.exibirInformacoes()
        print("Estúdio: \(estudio)")
    }
}

class ProgramaTV: Midia {
    var numeroEpisodios: Int
    var listaEpisodios: [String]

    init(titulo: String, genero: String, anoLancamento: Int, classificacao: String, numeroEpisodios: Int, listaEpisodios: [String]) {
        self.numeroEpisodios = numeroEpisodios
        self.listaEpisodios = listaEpisodios
        super.init(tipo: "ProgramaTV", titulo: titulo, genero: genero, anoLancamento: anoLancamento, classificacao: classificacao)
    }

    override func exibirInformacoes() {
        super.exibirInformacoes()
        print("Número de Episódios: \(numeroEpisodios)")
        print("Lista de Episódios: \(listaEpisodios)")
    }

    func listarEpisodios() {
        print("Lista de Todos os Episódios: \(listaEpisodios)")
    }
}

class Catalogo {
    var listaDeSeries: [Serie] = []
    var listaDeFilmes: [Filme] = []
    var listaDeDocumentarios: [Documentario] = []
    var listaDeAnimacoes: [Animacao] = []
    var listaDeProgramasTV: [ProgramaTV] = []

    func adicionarMidia(midia: Midia) {
        switch midia.tipo {
        case "Série":
            listaDeSeries.append(midia as! Serie)
        case "Filme":
            listaDeFilmes.append(midia as! Filme)
        case "Documentário":
            listaDeDocumentarios.append(midia as! Documentario)
        case "Animação":
            listaDeAnimacoes.append(midia as! Animacao)
        case "ProgramaTV":
            listaDeProgramasTV.append(midia as! ProgramaTV)
        default:
            print("Tipo de mídia desconhecido.")
        }
    }

    func obterLista(tipo: String) -> [Midia] {
        switch tipo {
        case "Série":
            return listaDeSeries
        case "Filme":
            return listaDeFilmes
        case "Documentário":
            return listaDeDocumentarios
        case "Animação":
            return listaDeAnimacoes
        case "ProgramaTV":
            return listaDeProgramasTV
        default:
            print("Tipo de mídia desconhecido.")
            return []
        }
    }
}

// Testes de instanciacoes

let catalogo = Catalogo()

let breakingBad = Serie(titulo: "Breaking Bad", genero: "Drama", anoLancamento: 2008, classificacao: "16+", numeroTemporadas: 5, episodiosPorTemporada: ["Episódio 1", "Episódio 2"])
let avengersEndgame = Filme(titulo: "Avengers: Endgame", genero: "Ação", anoLancamento: 2019, classificacao: "12+", diretor: "Anthony and Joe Russo", produtor: "Kevin Feige")

/*
catalogo.adicionarMidia(midia: breakingBad)
catalogo.adicionarMidia(midia: avengersEndgame)

print(catalogo.obterLista(tipo: "Série"))
print(catalogo.obterLista(tipo: "Filme"))

*/
