//
//  ContentView.swift
//  Fourier
//
//  Created by Tanay Nistala on 6/15/20.
//  Copyright © 2020 Tanay Nistala. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var solver = Solver()
    @EnvironmentObject var data: AppData
    @Environment(\.accessibilityReduceMotion) var reduceMotion

    @State var settingsShown = false
    @State var configShown = true {didSet{}}
    private var vars = ["x", "y", "z"]
    
    /// Code to call the Runge-Kutta solver
    /// Button(action: {print(self.solver.RungeKutta(model: self.solver.LotkaVolteraModel(t:x:parameters:), x0: [20, 5], t0: 0, tf: 100, dt: 0.01).1[1][1])}){Text("Toggle")}
    
    var body: some View {
        NavigationView {
            Form {
                if self.configShown {
                    Section(
                        header: HStack {
                            HStack {
                                Image(systemName: "slider.horizontal.3")
                                Text("Configuration")
                            }.font(.headline)
                            Spacer()
                            ResetFieldsView().environmentObject(self.data).padding(4)
                        },
                        footer: Text("Nonlinear differential equations are not supported yet.")
                    ) {
                        HStack {
    //                        Text("\(self.data.type == 1 ? "d" : "∂")")
    //                            .font(.headline)
                            Text("Type")
                            Spacer()
                            Picker(selection: self.$data.type, label: Text("Type")) {
                                Text("Ordinary").tag(1)
                                Text("Partial").tag(2)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .fixedSize(horizontal: true, vertical: true)
                            .animation(.none)
                        }
                        
                        HStack {
                            Image(systemName: "\(self.data.order).square")
                                .accessibility(hidden: true)
                                .imageScale(.large)
                                .font(.headline)
                            
                            Stepper("Order", value: self.$data.order, in: 1...4, onEditingChanged: {_ in
                                if self.data.activeInput >= self.data.inputCount {
                                    self.data.activeInput = self.data.inputCount - 1
                                }
                                
                                if UserDefaults.standard.bool(forKey: "haptics_enabled") {
                                    UISelectionFeedbackGenerator().selectionChanged()
                                }
                            })
                            .animation(.none)
                        }
                        
                        if self.data.type == 2 {
                            HStack {
                                ForEach(0..<3, id: \.self) { item in
                                    Image(systemName: "\(self.vars[item]).square\(item < self.data.vars ? ".fill" : "")")
                                        .imageScale(.large)
                                        .font(.headline)
                                        .frame(width: 24, height: 24)
                                        .foregroundColor(
                                            UserDefaults.standard.bool(forKey: "reduce_colors") ?
                                            Color.primary :
                                                (item < self.data.vars ? Color(UserDefaults.standard.string(forKey: "app_tint") ?? "indigo") : Color.primary)
                                        )
                                        .onTapGesture {
                                            self.data.vars = item+1
                                            if self.data.activeInput >= self.data.inputCount {
                                                self.data.activeInput = self.data.inputCount - 1
                                            }
                                    }
                                }
                                
                                Stepper("Variables", value: self.$data.vars, in: 1...3, onEditingChanged: {_ in
                                    if self.data.activeInput >= self.data.inputCount {
                                        self.data.activeInput = self.data.inputCount - 1
                                    }
                                    
                                    if UserDefaults.standard.bool(forKey: "haptics_enabled") {
                                        UISelectionFeedbackGenerator().selectionChanged()
                                    }
                                })
                                .animation(.none)
                            }
                        }
                        
                        Toggle("Linear", isOn: self.$data.isLinear)
                            .disabled(true)
                    }
                    .transition(.slide)
                }
                
                
//                    if !UserDefaults.standard.bool(forKey: "native_keyboard") {
//                        Section(header: ClearFieldsView().environmentObject(self.data)) {
//                            NativeEntryView()
//                                .environmentObject(self.data)
//                        }
//                    } else {
                Section(header: HStack {
                    HStack {
                        Image(systemName: "\(self.data.inputCount).square")
                            .imageScale(.large)
                        Text("Coefficient\(self.data.inputCount == 1 ? "" : "s")")
                    }
                    .font(.headline)
                    Spacer()
                    ClearFieldsView().environmentObject(self.data).padding(4)
                }) {
                    EntryView()
                        .animation(nil)
                        .environmentObject(self.data)
                }
//                    }
                
                
                Section {
                    Text("= Answer")
                        .font(Font.system(.title).weight(.semibold))
                        .foregroundColor(
                            UserDefaults.standard.bool(forKey: "reduce_colors") ?
                            Color.primary :
                            Color(UserDefaults.standard.string(forKey: "app_tint") ?? "indigo")
                        )
                }
            }
            .environment(\.horizontalSizeClass, .regular)
            .navigationBarTitle("Fourier")
            .navigationBarItems(trailing:
                HStack {
                    Button(action: {
                        self.configShown.toggle()
                        if UserDefaults.standard.bool(forKey: "haptics_enabled") {
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        }
                    }) {
                        Image(systemName: "dial\(self.configShown ? ".fill" : "")")
                            .imageScale(.large)
                            .font(Font.system(size: 16).weight(.bold))
                            .frame(width: 24, height: 24)
                    }
                    .buttonStyle(IconButtonStyle())
                    .accessibility(label: Text("Configuration"))
                    
                    NavigationLink(
                        destination:
                            PresetsView()
                                .navigationBarTitle("Presets")
                                .navigationBarBackButtonHidden(false),
                        isActive: self.$data.presetsShown) {
                            Image(systemName: "square.stack.3d.down.right\(self.data.presetsShown ? ".fill" : "")")
                                .imageScale(.large)
                                .font(Font.system(size: 16).weight(.bold))
                                .frame(width: 24, height: 24)
                    }
                    .buttonStyle(IconButtonStyle())
                    .accessibility(label: Text("Presets"))
                    
                    Button(action: {
                        self.settingsShown.toggle()
                        if UserDefaults.standard.bool(forKey: "haptics_enabled") {
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        }
                    }) {
                        Image(systemName: "gear")
                            .imageScale(.large)
                            .font(Font.system(size: 16).weight(.bold))
                            .frame(width: 24, height: 24)
                            .rotationEffect(.degrees(self.reduceMotion || UserDefaults.standard.bool(forKey: "reduce_motion") ? 0 : (self.settingsShown ? 180 : 0)))
                            .animation(.spring())
                    }
                    .buttonStyle(IconButtonStyle())
                    .sheet(isPresented: self.$settingsShown, onDismiss: {self.data.refresh()}) {
                        SettingsView()
                            .environmentObject(SettingsStore())
                    }
                    .accessibility(label: Text("Settings"))
                }
                .foregroundColor(
                    UserDefaults.standard.bool(forKey: "reduce_colors") ?
                    Color.primary :
                    Color(UserDefaults.standard.string(forKey: "app_tint") ?? "indigo")
                )
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppData())
    }
}
