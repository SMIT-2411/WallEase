import SwiftUI

struct HomeView: View {
    
    @State private var activeTab: Tab = .home
    
    // for smooth shape sliding effect
    @Namespace private var animation
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {  // Set spacing to 0 to remove any gap
                TabView(selection: $activeTab) {
                    ProductView()
                        .tag(Tab.home)
                        .toolbar(.hidden, for: .tabBar)
                    
                    Text("Cart")
                        .tag(Tab.cart)
                        .toolbar(.hidden, for: .tabBar)
                    
                    USDZScannerView()
                        .tag(Tab.favourite)
                        .toolbar(.hidden, for: .tabBar)
                    
                    Text("Profile")
                        .tag(Tab.profile)
                        .toolbar(.hidden, for: .tabBar)
                }
                .ignoresSafeArea() // Ensure the content in the TabView extends under the tab bar
                
                customTabBar()
                    .frame(width: UIScreen.main.bounds.width, height: 70)
                    .ignoresSafeArea() // Make sure the tab bar also ignores safe areas
            }
        }
    }
    
    // Custom tab bar
    @ViewBuilder
    func customTabBar(_ tint: Color = Color("Blue"), _ inactiveTint: Color = .blue) -> some View {
        
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                TabItem(
                    tint: tint,
                    inactiveTint: inactiveTint,
                    tab: tab,
                    animation: animation,
                    activeTab: $activeTab
                )
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 5)
        .background {
            RoundedRectangle(cornerRadius: 25)
                .fill(.black)
                .ignoresSafeArea()
        }
        .animation(.interactiveSpring(response: 0.6,
                                      dampingFraction: 0.7, blendDuration: 0.7), value: activeTab)
    }
    
    struct TabItem: View {
        var tint: Color
        var inactiveTint: Color
        var tab: Tab
        var animation: Namespace.ID
        
        @Binding var activeTab: Tab
        
        var body: some View {
            VStack(spacing: 0) {
                Image(systemName: tab == activeTab ? tab.filledImage : tab.systemImage)
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: activeTab == tab ? 60 : 35, height: activeTab == tab ? 60 : 35)
            }
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle())
            .onTapGesture {
                activeTab = tab
            }
        }
    }
}

#Preview {
    HomeView()
}
