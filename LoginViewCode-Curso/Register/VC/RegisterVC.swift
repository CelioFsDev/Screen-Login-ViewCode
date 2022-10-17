//
//  RegisterVC.swift
//  LoginViewCode-Curso
//
//  Created by Celio Ferreira on 13/10/22.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    
    var registerScreen: RegisterScreen?
    
    var auth: Auth?
    
    var alert:Alert?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.configTextFieldDelegate(delegate: self)
//        self.view.backgroundColor = .red cor para teste de backGroud
        self.registerScreen?.delegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
    }

}

extension RegisterVC: UITextFieldDelegate {
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    //Função dispara Quando fecha o teclado
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
        self.registerScreen?.validaTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        
        return true
    }
    
}
extension RegisterVC: RegisterScreenProtocol {
    func actionBackButton() {
    print("back")
        self.navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton() {
        
        guard let register = self.registerScreen else {return}
        
        
        self.auth?.createUser(withEmail: register.getEmail(), password: register.getPassword(), completion: { (result, error) in
            
            if error != nil {
                print("Error ao cadastrar")
                self.alert?.getAlert(titulo: "Atenção", mensagem: "Erro ao Cadastrar, verifiQue os dados e tente novamente")
            }else {
                print("Sucesso ao cadastrar")
                self.alert?.getAlert(titulo: "Paranems", mensagem: "Cadastro efetuado com sucesso", completion: {
                    self.navigationController?.popViewController(animated: true)	
                })
            }
            
        })
        print("register")
    }
    
    
}
