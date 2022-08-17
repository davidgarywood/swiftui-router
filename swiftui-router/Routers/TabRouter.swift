//
//  TabRouter.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import Foundation
import SwiftUI

enum TabType: Hashable {
    case help
    case home
    case account
}

class TabRouter: ObservableObject {
    
    // MARK: - Published vars
    @Published var selectedTab: TabType = .home
    
    // MARK: - Initialization
    init() {
        Logger.print("init:\(#file)")
    }
    
    deinit {
        Logger.print("deinit:\(#file)")
    }
    
    // MARK: - Methods
    @ViewBuilder func home() -> some View {
        HomeScreen(router: self)
    }
    
    @ViewBuilder func help() -> some View {
        HelpRouterView()
    }

    @ViewBuilder func account() -> some View {
        AccountRouterView()
    }
}

struct TabRouterView: View {
    @StateObject var router: TabRouter = TabRouter()
    
    var body: some View {
        TabView(selection: self.$router.selectedTab) {
            self.router.help()
                .tabItem {
                    Label("Help", systemImage: "questionmark.circle.fill")
                }
                .tag(TabType.help)

            self.router.home()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(TabType.home)

            self.router.account()
                .tabItem {
                    Label("Account", systemImage: "person.fill")
                }
                .tag(TabType.account)
        }
    }
}

extension TabRouter: HomeScreenRouter {
}
