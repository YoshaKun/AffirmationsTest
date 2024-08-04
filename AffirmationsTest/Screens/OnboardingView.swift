import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    @AppStorage("cathegoryChoosed") private var selectedCategory = ""
    @AppStorage("backgroundColorChoosed") private var selectedColor = ""
    @AppStorage("genderChoosed") private var selectedGender = ""
    
    var body: some View {
        
        ZStack {
            Color(.black)
            VStack {
                if currentPage == 0 {
                    categorySelectionView
                } else if currentPage == 1 {
                    colorSelectionView
                } else if currentPage == 2 {
                    genderSelectionView
                }
                
                Button("Continue") {
                    nextPage()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(17)
                .padding(.top, 40)
            }
            .padding()
        }
        .ignoresSafeArea()
        .transition(.slide)
        .animation(.default)
    }
    
    private var categorySelectionView: some View {
        VStack {
            Text(NSLocalizedString("chooseCategory", comment: ""))
                .font(.largeTitle)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
            VStack {
                CustomButton(
                    isSelected: selectedCategory == CategoriesEnum.love ? true : false,
                    localizedTitle: "love"
                ) {
                    selectedCategory = CategoriesEnum.love
                }
                .padding(.bottom)
                
                CustomButton(
                    isSelected: selectedCategory == CategoriesEnum.friendship ? true : false,
                    localizedTitle: "friendship"
                ) {
                    selectedCategory = CategoriesEnum.friendship
                }
            }
        }
    }
    
    private var colorSelectionView: some View {
        VStack {
            Text(NSLocalizedString("backgroundColor", comment: ""))
                .font(.largeTitle)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
            VStack {
                CustomButton(
                    isSelected: selectedColor == ColorsEnum.blue ? true : false,
                    localizedTitle: "blue"
                ) {
                    selectedColor = ColorsEnum.blue
                }
                .padding(.bottom)
                
                CustomButton(
                    isSelected: selectedColor == ColorsEnum.red ? true : false,
                    localizedTitle: "red"
                ) {
                    selectedColor = ColorsEnum.red
                }
            }
        }
    }
    
    private var genderSelectionView: some View {
        VStack {
            Text(NSLocalizedString("genderTitle", comment: ""))
                .font(.largeTitle)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
            VStack {
                CustomButton(
                    isSelected: selectedGender == GenderEnum.male ? true : false,
                    localizedTitle: "male"
                ) {
                    selectedGender = GenderEnum.male
                }
                .padding(.bottom)
                
                CustomButton(
                    isSelected: selectedGender == GenderEnum.female ? true : false,
                    localizedTitle: "female"
                ) {
                    selectedGender = GenderEnum.female
                }
            }
        }
    }
    
    private func nextPage() {
        withAnimation {
            if currentPage == 2 {
                hasSeenOnboarding = true
            } else {
                currentPage += 1
            }
        }
    }
    
    private func completeOnboarding() {
        hasSeenOnboarding = true
    }
}

struct OnboardingView_Preview: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
