//
//  RegisterScreen.swift
//  LoginViewCode-Curso
//
//  Created by Celio Ferreira on 13/10/22.
//

import UIKit
//Para passar as ações do botão para view controller
protocol RegisterScreenProtocol: class {
    func actionBackButton()
    func actionRegisterButton()
}

class RegisterScreen: UIView {
    
    weak private var delegate: RegisterScreenProtocol?
    
    func delegate(delegate: RegisterScreenProtocol?){
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    lazy var imageAddUser: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "user")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var emailTextField: UITextField = {
        let emailTf = UITextField()
        emailTf.translatesAutoresizingMaskIntoConstraints = false
        emailTf.autocorrectionType = .no
        emailTf.backgroundColor = .white
        emailTf.borderStyle = .roundedRect
        emailTf.placeholder = "Digite seu email"
        emailTf.textColor = .black
        emailTf.keyboardType = .emailAddress
        
        return emailTf
    }()
    
    lazy var passwordTextField: UITextField = {
        let passwordTf = UITextField()
        passwordTf.translatesAutoresizingMaskIntoConstraints = false
        passwordTf.autocorrectionType = .no
        passwordTf.backgroundColor = .white
        passwordTf.borderStyle = .roundedRect
        passwordTf.placeholder = "Digite seu sua senha"
        passwordTf.textColor = .darkGray
        passwordTf.keyboardType = .default
        passwordTf.isSecureTextEntry = true
        
        return passwordTf
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Registrar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7
        button.backgroundColor = UIColor(red: 3/255, green: 28/255, blue: 51/255, alpha: 1.0)
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        
        return button
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackgroudColor()
        self.configSuperView()
        
        //CONFIGURAÇÕES DE CONSTRAINSTS
        //self.setUpConstrainsts()
        self.configImageAddUserConstraint()
        self.configBackButtonConstraint()
        self.configEmailTextFieldConstraint()
        self.configPasswordTextFieldConstraint()
        self.configRegisterButtonConstraint()
        
        
        self.configButtonEnable(false)
    }
    
    public func getEmail() -> String {
        return self.emailTextField.text ?? ""
    }
    public func getPassword() -> String {
        return self.passwordTextField.text ?? ""
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configSuperView(){
        self.addSubview(self.backButton)
        self.addSubview(self.imageAddUser)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.registerButton)
    }
    private func configBackgroudColor(){
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc private func tappedBackButton(){
        
        self.delegate?.actionBackButton()
    }
    @objc private func tappedRegisterButton(){
       
        self.delegate?.actionRegisterButton()
    }
    
    public func validaTextFields(){
        
        let email: String = self.emailTextField.text ?? ""
        let password: String = self.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            self.configButtonEnable(true)
        }else {
            self.configButtonEnable(false)
        }
        
    }
    private func configButtonEnable(_ enable:Bool){
        if enable {
            self.registerButton.setTitleColor(.white, for: .normal)
            self.registerButton.isEnabled = true
        }else {
            self.registerButton.setTitleColor(.lightGray, for: .normal)
            self.registerButton.isEnabled = false
        }
    }
    
    private func configImageAddUserConstraint(){
        NSLayoutConstraint.activate([
            
            self.imageAddUser.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            self.imageAddUser.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageAddUser.widthAnchor.constraint(equalToConstant: 100),
            self.imageAddUser.heightAnchor.constraint(equalToConstant: 100),
            ])
    }
    private func configBackButtonConstraint(){
        NSLayoutConstraint.activate([
            
            self.backButton.topAnchor.constraint(equalTo: self.imageAddUser.topAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            ])
    }
    private func configEmailTextFieldConstraint(){
        NSLayoutConstraint.activate([
            
            self.emailTextField.topAnchor.constraint(equalTo: self.imageAddUser.bottomAnchor, constant: 20),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 35),
            
            ])
    }
    private func configPasswordTextFieldConstraint(){
        NSLayoutConstraint.activate([
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 20),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            ])
    }
    private func configRegisterButtonConstraint(){
        NSLayoutConstraint.activate([
            
            self.registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
            self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            ])
    }
    
    //Configuração geral das constrainsts
//    private func setUpConstrainsts(){
//
//        NSLayoutConstraint.activate([
//
//            self.imageAddUser.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
//            self.imageAddUser.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            self.imageAddUser.widthAnchor.constraint(equalToConstant: 100),
//            self.imageAddUser.heightAnchor.constraint(equalToConstant: 100),
//
//
//            self.backButton.topAnchor.constraint(equalTo: self.imageAddUser.topAnchor),
//            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
//
//
//            self.emailTextField.topAnchor.constraint(equalTo: self.imageAddUser.bottomAnchor, constant: 20),
//            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
//            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
//            self.emailTextField.heightAnchor.constraint(equalToConstant: 35),
//
//
//            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 20),
//            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
//
//
//            self.registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
//            self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            self.registerButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
//        ])
//
//
//
//    }
}

