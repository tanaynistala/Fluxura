//
//  EquationView.swift
//  Fluxura
//
//  Created by Tanay Nistala on 7/21/20.
//  Copyright © 2020 Tanay Nistala. All rights reserved.
//

import SwiftUI

struct EquationView: View {
    @EnvironmentObject var data: AppData
    let letters = (97...131).map({Character(UnicodeScalar($0))})
    
    var LHS: some View {
        VStack {
            if self.data.type == 1 {
                Text("f ")
                .italic()
                +
                Text("(\(self.data.inputs[2].count))")
                    .font(Font.system(.footnote, design: .serif))
                    .baselineOffset(6.0)
                    .italic()
                +
                Text(" = ")
            }
        }
    }
    
    var RHS: some View {
        ForEach((1..<self.data.inputs[self.data.loadedPreset==nil ? 1 : 2].count).reversed(), id: \.self) { input in
            Group {
                if input != self.data.inputs[2].count {
                    Text(" + ")
                }
                
                Text(String(self.letters[self.data.inputs[2].count - input]))
                    .italic()
                
                Variable(input: input)
                    .environmentObject(AppData.shared)
            }
            .font(Font.system(.body, design: .serif))
        }
    }
    
    var body: some View {
        HStack(spacing: 0) {
            self.LHS
            
            self.RHS
            
            Text(" + ")
            Text("\(String(self.letters[self.data.inputs[1].count-1]))")
            .italic()
        }
        .font(Font.system(.body, design: .serif))
    }
}

struct Variable: View {
    @EnvironmentObject var data: AppData
    @State var input: Int
    
    var body: some View {
        Group {
            if self.data.type == 1 {
                Group {
                    Text("f ").italic()
                        +
                    Text("(\(input-1))")
                        .font(Font.system(.footnote, design: .serif))
                        .italic()
                        .baselineOffset(6.0)
                }
            } else {
                CoefficientsList().list[self.data.vars - 1][input-1]
                    .italic()
            }
        }
    }
}
