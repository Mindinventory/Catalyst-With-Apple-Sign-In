//
//  ViewController.swift
//  LoginDemoUni
//
//  Created by mac-00012 on 01/11/19.
//  Copyright © 2019 mac-00012. All rights reserved.
//

import UIKit
import AuthenticationServices

class ViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtUserName: UITextField! {
        didSet { txtUserName.attributedPlaceholder = NSAttributedString(string: "Username",
                                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]) }
    }
    @IBOutlet weak var txtPassword: UITextField! {
        didSet { txtPassword.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]) }
    }
    @IBOutlet weak var btnApple: ASAuthorizationAppleIDButton! {
        didSet { btnApple.cornerRadius = 10 }
    }
    @IBOutlet weak var btnSignIn: UIButton! {
        didSet { btnSignIn.layer.cornerRadius = 10 }
    }
    
    var userID = String()
    
    // Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
}


// MARK: - Ganaral Method
extension ViewController {
    
    func setUI() {
        // set button Animation
        btnApple.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        startAnimatingPressActions()
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 5.0,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self?.btnApple.transform = .identity
            },
                       completion: nil)
    }
    
    // Existing Account Setup Flow
    @objc func handleAppleIdRequest() {
        
        let appleSignInRequest = ASAuthorizationAppleIDProvider().createRequest()
        // set scope
        appleSignInRequest.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [appleSignInRequest])
        // set delegate
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
}

// MARK: - Button Action
extension ViewController {
    // Handle Login Button Press
    @IBAction func btnAppleClicked(_ sender: UIButton) {
        // Check Credential State
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        appleIDProvider.getCredentialState(forUserID: userID) {  (credentialState, error) in
            switch credentialState {
            case .authorized:
                // The Apple ID credential is valid.
                print("The Apple ID credential is valid.")
                break
            case .revoked:
                // The Apple ID credential is revoked.
                print("The Apple ID credential is revoked.")
                break
            case .notFound:
                // Existing Account Setup Flow
                self.handleAppleIdRequest()
                break
            default:
                print(String(describing: error?.localizedDescription))
                break
            }
        }
    }
    @IBAction func btnSignInClick(_ sender: Any) {
        if isValidate() {
            if let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HowmVC") as? HowmVC {
                homeVC.userName = "\(txtUserName.text ?? "")"
                self.navigationController?.pushViewController(homeVC, animated: true)
            }
        }
    }
}

// MARK: - Validation
extension ViewController {
    private func isValidate() -> Bool {
        
        if txtUserName.text!.isEmpty {
            self.alert(message: "Enter username", title: "Alert")
            return false
        } else if txtPassword.text!.isEmpty {
            self.alert(message: "Enter password", title: "Alert")
            return false
        }
        return true
    }
}

// MARK: - Delegate Methods
extension ViewController: ASAuthorizationControllerDelegate,ASAuthorizationControllerPresentationContextProviding {
    // ASAuthorizationController Presentation Context Providing
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    // Handle ASAuthorizationController Delegate and Presentation Context
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        guard let appleIDCredentials = authorization.credential as? ASAuthorizationAppleIDCredential else { return }
        let _ = appleIDCredentials.user
        let _ = appleIDCredentials.fullName
        let _ = appleIDCredentials.email
        userID = appleIDCredentials.user
        
        // first time get User Id, User Name, real user status, Identity Token and email when show email
        print("User Id - \(appleIDCredentials.user)")
        print("User Name - \(appleIDCredentials.fullName?.description ?? "N/A")")
        print("User Email - \(appleIDCredentials.email ?? "N/A")")
        print("Real User Status - \(appleIDCredentials.realUserStatus.rawValue)")
        
        if let identityTokenData = appleIDCredentials.identityToken,
            let identityTokenString = String(data: identityTokenData, encoding: .utf8) {
            print("Identity Token \(identityTokenString)")
        }
        if appleIDCredentials.user.count > 0 {
            if let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HowmVC") as? HowmVC {
                if ((appleIDCredentials.fullName?.givenName) != nil) {
                    homeVC.userName = ("\(appleIDCredentials.fullName?.givenName ?? "N/A")")
                } else {
                    homeVC.userName = "\(appleIDCredentials.user)"
                }
                
                self.navigationController?.pushViewController(homeVC, animated: true)
            }
        }
    }
    // Handle ASAuthorizationController Delegate and Presentation Context
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error.localizedDescription)
    }
}

// MARK: - Animation
extension ViewController {
    
    func startAnimatingPressActions() {
        btnApple.addTarget(self, action: #selector(animateDown), for: [.touchDown, .touchDragEnter])
        btnApple.addTarget(self, action: #selector(animateUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
    }
    
    @objc private func animateDown(sender: UIButton) {
        animate(sender, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
    }
    
    @objc private func animateUp(sender: UIButton) {
        animate(sender, transform: .identity)
    }
    
    private func animate(_ button: UIButton, transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 3,
                       options: [.curveEaseInOut],
                       animations: {
                        button.transform = transform
        }, completion: nil)
    }
    
}

extension UIViewController {
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
