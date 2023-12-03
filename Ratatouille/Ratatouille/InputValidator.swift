

import Foundation

struct InputValidator {
    static func validateName(name: String) -> Bool{
        if(name.isEmpty){
            return false
        }
        return true
    }
}
