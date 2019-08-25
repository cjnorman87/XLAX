//
//  UserProfileController.swift
//  Peek Beta
//
//  Created by Jacorey Brown on 1/30/19.
//  Copyright © 2019 Jacorey Brown. All rights reserved.
//

import UIKit
import Eureka

class EditEducationController : FormViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        form +++
            Section()
            
            <<< TextRow() { row in
                row.title = "College Name"
            }
            
            <<< TextRow() { row in
                row.title = "Concentration"
            }
            
            <<< CustomCheckRow("Custom Check Row") { row in
                row.title = "Graduated"
            }
            
            <<< DateRow() { row in
                row.title = "From"
                row.hidden = .function(["Custom Check Row"], { form -> Bool in
                    let row: RowOf<Bool>! = form.rowBy(tag: "Custom Check Row")
                    return row.value ?? false == false
                })
            }
            
            <<< DateRow() { row in
                row.title = "To"
                row.hidden = .function(["Custom Check Row"], { form -> Bool in
                    let row: RowOf<Bool>! = form.rowBy(tag: "Custom Check Row")
                    return row.value ?? false == false
                })
            }
            
            <<< DateRow() { row in
                row.title = "Start Date"
                row.hidden = .function(["Custom Check Row"], { form -> Bool in
                    let row: RowOf<Bool>! = form.rowBy(tag: "Custom Check Row")
                    return row.value ?? false == true
                })
        }
        
        form +++
            Section()
            <<< ButtonRow("Save") { row in
                row.title = "Save"
                }.cellUpdate({ (button, row) in
                    button.backgroundColor = UIColor.rgb(red: 136, green: 206, blue: 235)
                    button.textLabel?.textColor = .white
                })
        
    }
}
