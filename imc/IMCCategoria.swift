//
//  IMCCategoria.swift
//  imc
//
//  Created by Renan Toniolo Rocha on 25/03/25.
//

enum IMCCategoria: String {
    case abaixoDoPeso = "Abaixo do Peso"
    case pesoNormal = "Peso Normal"
    case sobrepeso = "Sobrepeso"
    case obesidadeGrau1 = "Obesidade Grau 1"
    case obesidadeGrau2 = "Obesidade Grau 2"
    case obesidadeGrau3 = "Obesidade Grau 3"
    
    static func from(imc: Float) -> IMCCategoria {
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
