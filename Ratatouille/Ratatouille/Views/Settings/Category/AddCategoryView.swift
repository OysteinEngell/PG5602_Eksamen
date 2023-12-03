

import SwiftUI

struct AddCategoryView: View {
    @Environment(\.managedObjectContext) private var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State var inputTitle = ""
    @State var inputInfo = ""
    @State var inputImage = ""
    
    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("Tittel")){
                    TextField("Legg til tittel", text: $inputTitle)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                }
                
                Section(header: Text("Bilde")){
                    HStack{
                        AsyncImage(url: URL(string: inputImage)){image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 75)
                            .cornerRadius(40)}placeholder: {
                                ProgressView()
                            }
                        TextField("Legg til bilde url", text: $inputImage, axis: .vertical)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                    }
                }
                
                Section(header: Text("Informasjon")){
                    TextField("Legg til beskrivelse", text: $inputInfo, axis: .vertical)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                }
            }
            .navigationTitle("Rediger kategori")
            .toolbar(content: {
                Button(action: {
                    handleSave()
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    HStack{
                        Image(systemName: "square.and.arrow.down.on.square.fill")
                        Text("Lagre")
                    }
                })
            })
        }
    }
    
    func handleSave(){
        do{
            if let existingCategory = try moc.fetch(Category.fetchRequest(has: inputTitle)).first {
                existingCategory.archived = false
                print("\(inputTitle) already exists")
            }else{
                if(InputValidator.validateName(name: inputTitle)){
                    let newCategory = Category(context: moc)
                    newCategory.id = "\(inputTitle)\(arc4random())"
                    newCategory.title = inputTitle
                    newCategory.image = inputImage
                    newCategory.info = inputInfo
                    newCategory.archived = false
                    newCategory.date = nil
                    
                    do{
                        try moc.save()
                    }catch let error{
                        print(error)
                    }
                }
            }
        }catch let error{
            print(error)
        }
    }
}

#Preview {
    AddCategoryView()
}
