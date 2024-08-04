
import SwiftUI

struct CustomButton: View {
    
    var isSelected: Bool
    
    let buttonWidth: CGFloat = UIScreen.main.bounds.width - 40
    var buttonHeight: CGFloat = 55
    
    // MARK: - Setupped properties
    
    var localizedTitle: String
    var buttonAction: ()->()
    
    // MARK: - body
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 17)
                .foregroundStyle(.black)
                .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
            RoundedRectangle(cornerRadius: 17)
                .stroke(lineWidth: 1)
                .foregroundStyle(isSelected ? .pink : .white)
                .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
            Text(NSLocalizedString(localizedTitle, comment: ""))
                .font(.system(size: 22))
                .foregroundStyle(isSelected ? .pink : .white)
        }
        .onTapGesture {
            buttonAction()
        }
    }
}
