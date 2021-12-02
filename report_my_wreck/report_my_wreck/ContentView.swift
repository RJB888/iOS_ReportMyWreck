//
//  ContentView.swift
//  report_my_wreck
//
//  Created by ROBERT BRONSON on 10/21/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var isActive : Bool = false
    
    
    var body: some View {
        NavigationView {
            ZStack{
                Color("bg_color")
                    .ignoresSafeArea(.all, edges: .all)
            VStack{
                Text("Report My Wreck")
                    .font(.custom("Alatsi-Regular", size: 45))
                    .fontWeight(.bold)
                    .italic()
                    .foregroundColor(Color("title_color"))
                    .padding(-60)
            
            VStack{
                Image("main")
                    .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 250, height: 250, alignment: .center)
                        .padding(.bottom, 60)
                    
            NavigationLink(destination: LoginView(rootIsActive: self.$isActive),
                           isActive: self.$isActive
            ) {
                Text("Get Started")
                    .font(.custom("Alatsi-Regular", size: 25))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("button_color"))
                    .cornerRadius(50)
                }
            .isDetailLink(false)
            }
                .padding(90)
                }
            }
        }
    }
}
    /*@Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    } label: {
                        Text(item.timestamp!, formatter: itemFormatter)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}*/

/*private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()*/

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
