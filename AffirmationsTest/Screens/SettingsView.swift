import SwiftUI

struct SettingsView: View {
    @AppStorage("cathegoryChoosed") private var selectedCategory = ""
    @AppStorage("backgroundColorChoosed") private var selectedColor = ""
    @AppStorage("genderChoosed") private var selectedGender = ""
    
    var body: some View {
        List {
            Section(header: Text(NSLocalizedString("love", comment: ""))) {
                Picker(NSLocalizedString("categoryTitle", comment: ""), selection: $selectedCategory) {
                    Text(NSLocalizedString("love", comment: "")).tag("Love")
                    Text(NSLocalizedString("friendship", comment: "")).tag("Friendship")
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text(NSLocalizedString("backgroundColor", comment: ""))) {
                Picker(NSLocalizedString("color", comment: ""), selection: $selectedColor) {
                    Text(NSLocalizedString("blue", comment: "")).tag("Blue")
                    Text(NSLocalizedString("red", comment: "")).tag("Red")
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text(NSLocalizedString("genderTitle", comment: ""))) {
                Picker(NSLocalizedString("genderWord", comment: ""), selection: $selectedGender) {
                    Text(NSLocalizedString("male", comment: "")).tag("Male")
                    Text(NSLocalizedString("female", comment: "")).tag("Female")
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
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
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

