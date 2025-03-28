//
//  CustomTextField.swift
//  CoinCak
//
//  Created by Ryan Vieri Kwa on 28/03/25.
//

import SwiftUI

struct CustomTextField: UIViewRepresentable {
    @Binding var text: String
    /// Will supress keyboard showing
    var shouldSupressKeyboard: Bool = false
    var placeholder: String = ""

    func makeUIView(context: Context) -> UIView {
        let containerView = UIView()
        
        let textField = UITextField()
        if shouldSupressKeyboard {
            textField.inputView = UIView() // Prevent keyboard
            textField.inputAccessoryView = UIView()
        }
        textField.placeholder = placeholder
        textField.textColor = UIColor.black
        textField.font = UIFont.systemFont(ofSize: 32.0)
        textField.textAlignment = .right
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(textField)
        // Constraints to prevent out of screen
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: containerView.topAnchor),
            textField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            textField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            textField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
        
        return containerView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        if let textField = uiView.subviews.first as? UITextField {
            textField.text = text
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String
        init(text: Binding<String>) {
            self._text = text
        }
    }
}
