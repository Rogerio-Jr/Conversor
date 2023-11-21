//
//  ConversorView.swift
//  ConversorRomano
//
//  Created by Rogério Júnior on 20/11/23.
//

import SwiftUI

struct ConversorView: View {
    @State private var inputValue = ""
    @State private var romanValue = ""
    

    var body: some View {
        VStack {
         
            Image("logo_demander")
            
            Form{
                Section(header: Text("Conversor de inteiro para Romano")){
                    
                    TextField("Informe um valor inteiro", text:$inputValue).keyboardType(.decimalPad)
                    
                    Text("Número Romano: \(romanValue)")
                }
                
                Button("Converter") {
                    if let intValue = Int(inputValue) {
                        romanValue = convertToRoman(intValue)
                    } else {
                        romanValue = "Valor inválido"
                    }
                }.foregroundColor(.blue)
                    .frame(width: 300, height: 25)
            }
        }
    }

    func convertToRoman(_ number: Int) -> String {
        guard number > 0 else {
            return "Número inválido"
        }
        
        var result = ""
        var num = number

        let values: [(value: Int, numeral: String)] = [
            (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"),
            (100, "C"), (90, "XC"), (50, "L"), (40, "XL"),
            (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
        

        for tuple in values {
            while num >= tuple.value { //7 
                result += tuple.numeral
                num -= tuple.value
            }
        }
        return result
    }
    
}

struct ConversorView_Previews: PreviewProvider {
    static var previews: some View {
        ConversorView()
    }
}
