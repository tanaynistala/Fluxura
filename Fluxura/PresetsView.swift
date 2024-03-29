//
//  PresetsView.swift
//  Fluxura
//
//  Created by Tanay Nistala on 6/29/20.
//  Copyright © 2020 Tanay Nistala. All rights reserved.
//

import SwiftUI

struct PresetsView: View {
    @EnvironmentObject var data: AppData
    @Environment(\.presentationMode) var presentationMode
    @State var showFilter: Bool = false
    
    var body: some View {
        Form {
            /*
            if showFilter {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Filters")
                        .font(.headline)
                        .padding([.leading, .top])
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        SubjectPicker()
                            .padding()
                            .environmentObject(AppData.shared)
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(10)
                }
            }
             */
            
            Section {
                HStack {
                    if !UserDefaults.standard.bool(forKey: "reduce_colors") {
                        Rectangle()
                            .frame(width: 8)
                            .foregroundColor(Color(.systemIndigo))
                    }
                    VStack(alignment: .leading) {
                        Text("Generic ODE")
                            .font(.headline)
                    }
                    Spacer()
                    Button(action: {
                        self.data.loadedPreset = nil
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Load")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 12)
                            .background(
                                Capsule()
                                    .foregroundColor(
                                        UserDefaults.standard.bool(forKey: "reduce_colors") ?
                                            Color(.systemGray4) :
                                        Color(UserDefaults.standard.string(forKey: "app_tint") ?? "indigo")
                                    )
                            )
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .padding(.vertical)
                }
                .listRowInsets(UserDefaults.standard.bool(forKey: "reduce_colors") ? nil : EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
            }
            
            Section {
                ForEach(0..<data.presets.count, id: \.self) { preset in
                    Group {
                        if self.data.selectedField == "All" ||
                            (self.data.selectedField == self.data.presets[preset].subject.rawValue) {
                            VStack {
                                NavigationLink(destination:
                                    PresetDetailView(preset: self.data.presets[preset])
                                        .environmentObject(AppData.shared)
                                ) {
                                    PresetRow(preset: self.data.presets[preset])
                                        .environmentObject(AppData.shared)
                                        .contextMenu {
                                            if UserDefaults.standard.bool(forKey: "pro") {
                                                Button(action: {
                                                    self.data.loadedPreset = self.data.presets[preset]
                                                    self.presentationMode.wrappedValue.dismiss()
                                                }) {
                                                    Text("Load Preset")
                                                    Image(systemName: "rectangle.stack.badge.plus")
                                                }
                                            }

                                            Button(action: {
                                                UIApplication.shared.open(URL(string: self.data.presets[preset].url)!)
                                            }) {
                                                Text("Learn More")
                                                Image(systemName: "link")
                                            }
                                        }
                                }
                            }
                            .listRowInsets(UserDefaults.standard.bool(forKey: "reduce_colors") ? nil : EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
                        }
                    }
                }
            }
            
            if UIDevice.current.userInterfaceIdiom == .pad {
                Spacer(minLength: self.data.presetsShown ? 0 : (self.data.keyboardShown ? (self.data.keyboardView == 1 ? 324 : 264) : 48))
                .listRowBackground(Color(.systemGroupedBackground))
            }
        }
        .environment(\.horizontalSizeClass, .regular)
        .onAppear {
            UITableView.appearance().separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        .navigationBarTitle("Presets")
        .navigationBarItems(trailing:
            Image(systemName: "line.horizontal.3.decrease.circle")
                .imageScale(.large)
                .foregroundColor(
                    UserDefaults.standard.bool(forKey: "reduce_colors") ?
                    Color.primary :
                    Color(UserDefaults.standard.string(forKey: "app_tint") ?? "indigo")
                )
                .font(.headline)
                .frame(width: 24, height: 24)
                .contextMenu {
                    ForEach(Preset.Subject.allCases, id: \.self) { subject in
                        Button(action: {
                            self.data.selectedField = subject.rawValue
                        }) {
                            Text(subject.rawValue)
                            if self.data.selectedField == subject.rawValue {
                                Image(systemName: "checkmark.circle")
                            }
                        }
                    }
                }
        )
//        .navigationBarItems(trailing:
//            Button(action: {self.showFilter.toggle()}) {
//                Image(systemName: "line.horizontal.3.decrease.circle")
//                    .imageScale(.large)
//                    .foregroundColor(
//                        UserDefaults.standard.bool(forKey: "reduce_colors") ?
//                        Color.primary :
//                        Color(UserDefaults.standard.string(forKey: "app_tint") ?? "indigo")
//                    )
//                    .font(.headline)
//                    .frame(width: 24, height: 24)
//            }
//            .actionSheet(isPresented: $showFilter) {
//                ActionSheet(
//                    title: Text("Filter"),
//                    buttons: [
//                        .default(Text("All"), action: {self.data.selectedField = "All"}),
//                        .default(Text("Physics"), action: {self.data.selectedField = "Physics"}),
//                        .default(Text("Chemistry"), action: {self.data.selectedField = "Chemistry"}),
//                        .default(Text("Biology"), action: {self.data.selectedField = "Biology"}),
//                        .default(Text("Economics"), action: {self.data.selectedField = "Economics"}),
//                        .cancel()
//                    ]
//                )
//            }
//        )
    }
}

struct PresetsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                PresetsView()
                .environmentObject(AppData())
            }
            
            NavigationView {
                PresetsView()
                .environmentObject(AppData())
            }
            .environment(\.colorScheme, .dark)
        }
    }
}
