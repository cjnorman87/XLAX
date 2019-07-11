//
//  EditExperienceController.swift
//  Peek Beta
//
//  Created by Jacorey Brown on 5/12/19.
//  Copyright © 2019 Jacorey Brown. All rights reserved.
//

import UIKit
import Eureka
import SplitRow

class EditExperienceController : FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        tableView.separatorColor = tableView.backgroundColor
        navigationItem.title = "Edit Work Experience"
        
        let calendar = Calendar(identifier: .gregorian)
        var comps = DateComponents()
        comps.year = 0
        let maxDate = calendar.date(byAdding: comps, to: Date())
        comps.year = -100
        let minDate = calendar.date(byAdding: comps, to: Date())
        
        
        form +++
            Section()
            <<< TextRow() { row in
                row.placeholder = "Job Title"
                }.cellSetup({ (cell, _) in
                })
            
            <<< TextRow() { row in
                row.placeholder = "Company Name"
                }.cellUpdate({ (cell, row) in
                   
                })
        
            <<< TextAreaRow() { row in
                row.placeholder = "Description"
                }.cellUpdate({ (cell, row) in
                    cell.textView.textColor = UIColor(white: 0.5, alpha: 1)
                })
        
        form +++
            Section()
            <<< DateInlineRow("StartDate") { row in
                row.title = "Start Date"
                row.value = Date()
                row.maximumDate = maxDate
                row.minimumDate = minDate
                }.onChange({ [weak self](row) in
                    let endRow: DateInlineRow! = self?.form.rowBy(tag: "EndDate")
                    if row.value?.compare(endRow.value!) == .orderedDescending {
                        endRow.value = Date(timeInterval: 60*60*24, since: row.value!)
                        endRow.minimumDate = Date(timeInterval: 60*60*24, since: row.value!)
                    }
                    row.updateCell()
                }).cellUpdate({ (cell, row) in
                    cell.textLabel?.textColor = .lightGray
                    cell.detailTextLabel?.textColor = .lightGray
                })
        
            <<< DateInlineRow("EndDate") { row in
                row.title = "End Date"
                row.value = Date()
                row.minimumDate = minDate
                row.disabled = Condition.function(["WorkSwitch"], { (form) -> Bool in
                    let row: SwitchRow! = form.rowBy(tag: "WorkSwitch")
                    return row?.value ?? false == true
                })
                }.onChange({ [weak self] (row) in
                    let startRow : DateInlineRow! = self?.form.rowBy(tag: "StartDate")
                    if row.value?.compare(startRow.value!) == .orderedAscending {
                        startRow.value = Date(timeInterval: 60*60*24, since: row.value!)
                    }
                    row.updateCell()
                }).cellUpdate({ (cell, row) in
                    cell.textLabel?.textColor = .lightGray
                    cell.detailTextLabel?.textColor = .lightGray
                }).onExpandInlineRow({ [weak self] (cell, row, inlineRow)  in
                    inlineRow.cellUpdate() { cell, dateRow  in
                        let allRow : SwitchRow! = self?.form.rowBy(tag: "WorkSwitch")
                        if allRow.value ?? false {
                            cell.datePicker.date = Date()
                            row.disabled = true
                        } else {
                            row.disabled = false
                        }
                    }
                })
        
            <<< SwitchRow ("WorkSwitch") { row in
                row.title = "I currently work here"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.textColor = UIColor(white: 0.5, alpha: 1)
                }).onChange({ (row) in
                    let endDate: DateInlineRow! = self.form.rowBy(tag: "EndDate")
                    if row.value ?? false {
                        endDate.value = Date()
                        endDate.disabled = true
                    } else {
                        endDate.disabled = false
                    }
                    endDate.updateCell()
                    endDate.inlineRow?.updateCell()
                })
        
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
