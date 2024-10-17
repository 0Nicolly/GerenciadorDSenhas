print("""
Seja bem vindo(a) ao nosso gerenciador de senhas!
Nele você poderá armazenar suas senhas, recuperá-las e excluí-las de acordo com o serviço relacionado a ela. 🎀
Aqui está um menu, para escolher basta digitar o número correspondente:
""")


func mostrarMenu() {
    print("""
    \nMenu de opções:
    1. Adicionar nova senha 🔑
    2. Recuperar senha 🔍
    3. Deletar senha ❌
    4. Lista dos serviços com senhas salvas 📋
    5. Sair 🚪
    """)
}

class GerencSenhas {
    var SenhaSalva: [String: String] = [:]


    func adicionarSenha(serviço: String, senha: String) {
        SenhaSalva[serviço] = senha
        print("Senha para \(serviço) salva com sucesso!😊")
    }

   
    func recuperarSenha(serviço: String) {
        if let senha = SenhaSalva[serviço] {
            print("Senha para \(serviço): \(senha) 🔑")
        } else {
            print("Senha não encontrada para o serviço \(serviço).")
        }
    }

    
    func excluirSenha(serviço: String) {
        if SenhaSalva.removeValue(forKey: serviço) != nil {
            print("Senha para \(serviço) excluída com sucesso. ")
        } else {
            print("Nenhuma senha encontrada para o serviço /(serviço).")
        }
    }

    
    func listaServiços() {
        if SenhaSalva.isEmpty {
            print("Nenhum serviço com senha salva no momento.")
        } else {
            print("Serviços com senhas salvas:")
            for serviço in SenhaSalva.keys {
                print("- \(serviço)")
            }
        }
    }
}


let gerenciador = GerencSenhas()

var continuar = true
while continuar {
    mostrarMenu()
    if let opção = readLine() {
        switch opção {
        case "1":
            print("Insira o nome do serviço que deseja salvar a senha:")
            if let serviço = readLine() {
                print("Insira a senha para \(serviço):")
                if let senha = readLine() {
                    gerenciador.adicionarSenha(serviço: serviço, senha: senha)
                }
            }
        case "2":
            print("Insira o nome do serviço que deseja recuperar a senha:")
            if let serviço = readLine() {
                gerenciador.recuperarSenha(serviço: serviço)  
            }
        case "3":
            print("Insira o nome do serviço que deseja deletar a senha:")
            if let serviço = readLine() {
                gerenciador.excluirSenha(serviço: serviço)  
            }
        case "4":
            gerenciador.listaServiços()
        case "5":
            continuar = false
            print("Saindo... Tchau tchau! 🌟")
        default:
            print("Opção inválida, tente novamente.")
        }
    }
}
