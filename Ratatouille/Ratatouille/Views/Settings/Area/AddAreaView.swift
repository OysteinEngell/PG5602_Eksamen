

import SwiftUI

struct AddAreaView: View {
    
    @Environment(\.managedObjectContext) private var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State var inputName = ""
    @State var inputFlag = ""
    
    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("Navn")){
                    TextField("Legg til navn", text: $inputName)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                }
                
                Section(header: Text("Landskode")){
                    HStack{
                        TextField("Landskode (f.eks NO)", text: $inputFlag)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                        Spacer()
                        AsyncImage(url: URL(string: "https://flagsapi.com/\(inputFlag)/flat/32.png")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
            }
            .navigationTitle("Rediger landområde")
            .toolbar(content: {
                Button(action: {
                    handleSave()
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
            if let existingArea = try moc.fetch(Area.fetchRequest(for: inputName)).first {
                print("\(inputName) already exists")
                existingArea.archived = false
            }else{
                if(InputValidator.validateName(name: inputName)){
                    let newArea = Area(context: moc)
                    newArea.name = inputName
                    newArea.flag = inputFlag
                    newArea.archived = false
                    newArea.date = nil
                    newArea.id = "\(inputName)\(arc4random())"
                    
                    do{
                        try moc.save()
                    }catch let error{
                        print(error)
                    }
                }
            }
            presentationMode.wrappedValue.dismiss()
        }catch let error{
            print(error)
        }
    }
    
    
}

#Preview {
    AddAreaView()
}
