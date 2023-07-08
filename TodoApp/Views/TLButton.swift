//
//  TLButton.swift
//  TodoApp
//
//  Created by Ozeito on 08/07/2023.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        
        Button {
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 50)
                    .foregroundColor(background)
                    
                Text(title)
                    .foregroundColor(Color.white)
                    .font(.system(size: 25))
                    .bold()
            }
            .padding(.top, 20)
            .padding(.bottom, 20)
        }
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "title", background: .blue) {
            //code here
        }
    }
}
