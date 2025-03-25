//
//  ContentView.swift
//  imc
//
//  Created by Renan Toniolo Rocha on 18/03/25.
//

import SwiftUI

struct ContentView: View {
    @State private var weight = String()
    @State private var height = String()
    @State private var result = String()
    
    var body: some View {
        VStack {
            Text("IMC")
            .font(.title)
            .bold()
            TextField("Peso",
                      text: $weight)
                 .textFieldStyle(RoundedBorderTextFieldStyle())
                 .shadow(color: .gray, radius: 5)
                 .padding(15)
            TextField("Altura",
                      text: $height)
                 .textFieldStyle(RoundedBorderTextFieldStyle())
                 .shadow(color: .gray, radius: 5)
                 .padding(15)
            Button(action: {
               calculateIMC()
            }) {
               Text("Calcular")
                   .padding()
                   .foregroundColor(.white)
                   .background(.blue)
                   .cornerRadius(10)
            }
            Text(result)
            .font(.caption)
            .multilineTextAlignment(.center)
            .bold()
            .padding(15)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .background(Color.gray.opacity(0.1))
    }
}

extension ContentView {
    func calculateIMC() {
        guard let heightValue = Float(height), let weightValue = Float(weight) else {
            return
        }
        let imcValue = weightValue / pow(heightValue, 2)
        
        result = "Seu IMC é: \(imcValue)  \n"
        if imcValue < 0 {
            result = "Erro, insira um valor valido"
            return
        }
        
        result += from(imc: imcValue).rawValue
            
    }
    
    func from(imc: Float) -> IMCCategoria {
        switch imc {
        case 0..<18.5:
            return .abaixoDoPeso
        case 18.5..<24.9:
            return .pesoNormal
        case 25..<29.9:
            return .sobrepeso
        case 30..<34.9:
            return .obesidadeGrau1
        case 35..<39.9:
            return .obesidadeGrau2
        default:
            return .obesidadeGrau3
        }
    }
}

enum IMCCategoria: String {
    case abaixoDoPeso = "Abaixo do Peso"
    case pesoNormal = "Peso Normal"
    case sobrepeso = "Sobrepeso"
    case obesidadeGrau1 = "Obesidade Grau 1"
    case obesidadeGrau2 = "Obesidade Grau 2"
    case obesidadeGrau3 = "Obesidade Grau 3"
}

#Preview {
    ContentView()
}
