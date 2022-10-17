//
//  ViewController.swift
//  LoginViewCode-Curso
//
//  Created by Celio Ferreira on 10/10/22.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?
    
    var auth: Auth?
    
    var alert:Alert?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
       
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.configTextFieldDelegate(delegate: self)
        self.loginScreen?.delegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
    }
    
    
    
    //Ocultando a navigationBar
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

}
extension LoginVC: LoginScreenProtocol {
    func actionLoginButton() {
        print("Deu certo o login button")
        let vc:HomeVC = HomeVC()
      self.navigationController?.pushViewController(vc, animated: true)
        
//        guard let login = self.loginScreen else {return}
//        
//        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { ussuario, error in
//            
//            if error != nil {
//                print("Atenção dados incorretos")
//                self.alert?.getAlert(titulo: "Atenção", mensagem: "Dados incorretos, verifiQue e tente novamente")
//            }else {
//                
//                if ussuario == nil {
//                    print("Tivemos um problema inesperado, tente mais tarde")
//                    self.alert?.getAlert(titulo: "Atenção", mensagem: "Tivemos um problema inesperado tente novamente mais tarde")
//                }else {
//                    print("Usuario logado com sucesso")
//                  //  self.alert?.getAlert(titulo: "Parabens", mensagem: "Usuario logado com sucesso")
//                }
//                
//            }
//           
//        })
    }
    
    func actionRegisterButton() {
        print("Deu certo register button")
        let vc:RegisterVC = RegisterVC()
      self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}


extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TextFieldBeginEditing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("TextFieldDidienting")
        self.loginScreen?.validaTextFields()
    }
    
    //extension para fazer retornar o teclado quando clicar no return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("TextFieldShouldReturn")
        textField.resignFirstResponder()
        return true
    }
}
