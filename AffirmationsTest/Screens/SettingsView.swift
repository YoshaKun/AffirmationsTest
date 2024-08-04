import SwiftUI

struct SettingsView: View {
    // MARK: - UserDefaults parameters
    
    @AppStorage("cathegoryChoosed") private var selectedCategory = ""
    @AppStorage("backgroundColorChoosed") private var selectedColor = ""
    @AppStorage("genderChoosed") private var selectedGender = ""
    
    // MARK: - Body
    
    var body: some View {
        List {
            createSectionPicker(arrayOfStrings: CategoriesEnum.allCases, sectionLocal: "chooseCategory", pickerLocal: "categoryTitle", selectedItemUserDef: $selectedCategory)
            
            createSectionPicker(arrayOfStrings: ColorsEnum.allCases, sectionLocal: "backgroundColor", pickerLocal: "color", selectedItemUserDef: $selectedColor)
            
            createSectionPicker(arrayOfStrings: GenderEnum.allCases, sectionLocal: "genderTitle", pickerLocal: "genderWord", selectedItemUserDef: $selectedGender)
            
            Section(header: Text(NSLocalizedString("chooseLanguage", comment: ""))) {
                Link(destination: URL(string: UIApplication.openSettingsURLString)!) {
                    HStack {
                        Text(NSLocalizedString("languageSettings", comment: ""))
                        Spacer()
                        Text(NSLocalizedString("enRu", comment: ""))
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationTitle("Settings")
    }
    
    // MARK: - Create Section Picker
    
    @ViewBuilder
    private func createSectionPicker(
        arrayOfStrings: [String],
        sectionLocal: String,
        pickerLocal: String,
        selectedItemUserDef: Binding<String>
    ) -> some View {
        Section(header: Text(NSLocalizedString(sectionLocal, comment: ""))) {
            Picker(NSLocalizedString(pickerLocal, comment: ""), selection: selectedItemUserDef) {
                ForEach(arrayOfStrings, id: \.self) { category in
                    Text(NSLocalizedString(category.lowercased(), comment: "")).tag(category)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}

// MARK: - Preview

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

