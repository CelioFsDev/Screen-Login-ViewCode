//
//  LoginScreen.swift
//  LoginViewCode-Curso
//
//  Created by Celio Ferreira on 10/10/22.
//

import UIKit

//Protocolo para pegar nossa viewcontroller e fazer ela ser a nossa assinante
protocol LoginScreenProtocol: class {
    func actionLoginButton()
    func actionRegisterButton()
}

class LoginScreen: UIView {
    //Boa pratica criar com lazy
    /*
     1- Cria label
     2- TranslatesAutoresizingMaskIntoConstrainsts = false tem Que colocar false
     3- Selecionando a cor da label.textColor = .white e font e label.text = "Texto da label"
     4- Cria a Constrainsts
     5- Joga tudo na viewDidLoad
     */
    weak var delegate: LoginScreenProtocol?
    
    func delegate(delegate:LoginScreenProtocol?){
        self.delegate = delegate
    }
    
    
    lazy var logoAppImageView:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")//Busca dentro da pasta dos assets
        image.tintColor = .green
        image.contentMode = .scaleAspectFit
        
        return image
        
    }()
    
    lazy var loginLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Login"
        return label
    }()
    
    lazy var emailTextField:UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no //auto corretor
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.placeholder = "Digite seu E-mail:"
        tf.textColor = .darkGray
        
        return tf
    }()
    
    lazy var passwordTextField:UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no //auto corretor
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Digite sua senha:"
        tf.isSecureTextEntry = true
        tf.textColor = .darkGray
        
        return tf
    }()
    
    lazy var loginButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 3/255, green: 28/255, blue: 51/255, alpha: 1.0)
        button.setTitle("Logar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true //Botão redondo
        button.layer.cornerRadius = 7.5
        button.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var registerButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Não tem conta? Cadastre-se aqui.", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        
        return button
    }()
    
    //Metodo construtor PARA ADICIONAR UMA VIEW
    //Para ficar mais limpo meu construtor crio metodos e adiciono esses metodos no construtor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackGroud()
        self.configSuperView()
        self.setUpConstrainsts()
        self.configButtonEnable(false)
    }
    
    private func configBackGroud(){
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    //Metodo para chamar as subview para o metodo construtor
    private func configSuperView(){
        
        self.addSubview(self.logoAppImageView)
        self.addSubview(self.loginLabel)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.loginButton)
        self.addSubview(self.registerButton)
    }
    
    //
    public func configTextFieldDelegate(delegate: UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc private func tappedLoginButton(){
    
        self.delegate?.actionLoginButton()
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
            self.loginButton.setTitleColor(.white, for: .normal)
            self.loginButton.isEnabled = true
        }else {
            self.loginButton.setTitleColor(.lightGray, for: .normal)
            self.loginButton.isEnabled = false
        }
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
    
    //eQualto:
    //Basear em um terminado elemento
    
    //constante:
    //me afastar aproximar do elemento referente (eQualto)
    
    //eQualtoConstante:
    //setando um valor fixo para um terminado elemento
    
    private func setUpConstrainsts(){
        NSLayoutConstraint.activate([
        
            
            
            self.logoAppImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.logoAppImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            //self.logoAppImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            self.logoAppImageView.heightAnchor.constraint(equalToConstant: 100),
            
            self.loginLabel.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 20),
            self.loginLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            //self.loginLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 20),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 20),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
            self.loginButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.loginButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            
            self.registerButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 15),
            self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
        ])
    }
}
