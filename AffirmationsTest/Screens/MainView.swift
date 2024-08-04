//
//  ContentView.swift
//  AffirmationsTest
//
//  Created by Yosha Kun on 04.08.2024.
//

import SwiftUI
import CoreData

struct MainView: View {
    
    // MARK: - UserDefaults parameters
    
    @AppStorage("cathegoryChoosed") private var selectedCategory = ""
    @AppStorage("backgroundColorChoosed") private var selectedColor = ""
    @AppStorage("genderChoosed") private var selectedGender = ""
    
    // MARK: - Count of items in each Category
    
    let categoriesCount = 10
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            ZStack() {
                configureBackground()
                
                configureTabView()
                
                VStack() {
                    HStack() {
                        Spacer()
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gear")
                                .resizable()
                                .foregroundStyle(Color(.white))
                                .frame(width: 40, height: 40)
                        }
                    }
                    .padding(.trailing)
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width)
            }
        }
    }
    
    // MARK: - configure Background color
    
    @ViewBuilder
    private func configureBackground() -> some View {
        if selectedColor == "Blue" {
            Color(.blue)
                .ignoresSafeArea()
        } else {
            Color(.red)
                .ignoresSafeArea()
        }
    }
    
    // MARK: - configure vertical Tab view
    
    @ViewBuilder
    private func configureTabView() -> some View {
        TabView {
            ForEach(generateCategoryArray(nameCategory: selectedCategory, elements: categoriesCount), id: \.self) { category in
                VStack {
                    Spacer()
                    Text(NSLocalizedString(category, comment: ""))
                        .font(.largeTitle)
                        .frame(maxWidth: UIScreen.main.bounds.width - 40, maxHeight: .infinity)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color(.white))
                    Spacer()
                }
                .rotationEffect(.degrees(-90)) // Поворачиваем содержимое обратно
                .frame(width: UIScreen.main.bounds.height, height: UIScreen.main.bounds.width)
            }
        }
        .rotationEffect(.degrees(90)) // Поворачиваем TabView
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .frame(width: UIScreen.main.bounds.height, height: UIScreen.main.bounds.width)
    }
    
    // MARK: - Generator localization array from selected Category
    
    private func generateCategoryArray(nameCategory: String, elements: Int) -> [String] {
        // target string need to be like this: "String_0" -> nameCategory + "_" + "currentElement"
        var resultArray: [String] = []
        
        for i in 0..<elements {
            let newElement = "\(nameCategory)_\(i)"
            resultArray.append(newElement)
        }
        
        return resultArray
    }
}

#Preview {
    MainView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
