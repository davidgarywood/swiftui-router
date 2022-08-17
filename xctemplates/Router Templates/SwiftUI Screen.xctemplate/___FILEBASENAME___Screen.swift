//___FILEHEADER___

import SwiftUI

protocol ___FILEBASENAMEASIDENTIFIER___Router: AnyObject {
}

struct ___FILEBASENAMEASIDENTIFIER___: View {
    @State var router: ___FILEBASENAMEASIDENTIFIER___Router?
    
    @StateObject var viewModel: ___VARIABLE_productName___ViewModel = ___VARIABLE_productName___ViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ___FILEBASENAMEASIDENTIFIER___Previews: PreviewProvider {
    static var previews: some View {
        ___FILEBASENAMEASIDENTIFIER___()
    }
}
