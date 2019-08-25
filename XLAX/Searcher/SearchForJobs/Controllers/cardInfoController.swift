//
//  cardInfoController.swift
//  Peek Beta
//
//  Created by Jacorey Brown on 3/7/19.
//  Copyright © 2019 Jacorey Brown. All rights reserved.
//

import UIKit

class cardInfoController : BaseListController {
    
    let titleLabel = UILabel(text: "Who We Are", font: .boldSystemFont(ofSize: 25))
    
    let textView : UITextView = {
       let text = UITextView()
        text.isEditable = false
        text.text = "Here's to the crazy ones. The misfits. The rebels. The troublemakers. The round pegs in the square holes. The ones who see things differently. They're not fond of rules. And they have no respect for the status quo. You can quote them, disagree with them, glorify or vilify them. About the only thing you can't do is ignore them. Because they change things. They push the human race forward. And while some may see them as the crazy ones, we see genius. Because the people who are crazy enough to think they can change the world, are the ones who do."
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 16)
        text.sizeToFit()
        text.isScrollEnabled = false
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        
        view.addSubview(textView)
        textView.fillSuperview()
    }
}
