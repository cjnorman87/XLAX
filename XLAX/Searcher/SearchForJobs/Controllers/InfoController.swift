//
//  InfoController.swift
//  XLAX
//
//  Created by Jacorey Brown on 7/29/19.
//  Copyright © 2019 Christopher Norman. All rights reserved.
//

import UIKit

class InfoController : UITableViewController {
    
    //creates the job image view
    let jobImage : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.image = UIImage(imageLiteralResourceName: "astronaut")
        return img
    }()
    
    let completeLabel : UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "Software Engineer ", attributes: [NSAttributedString.Key.font : UIFont(name: "SFProRounded-Bold", size: 16)!])
        attributedText.append(NSAttributedString(string: "@ Google", attributes: [NSAttributedString.Key.font : UIFont(name: "SFProRounded-Bold", size: 16)!, NSAttributedString.Key.foregroundColor : UIColor.lightGray]))
        label.attributedText = attributedText
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //creates the location label for the view
    let locationLabel : UILabel = {
        let label = UILabel()
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "location")?.withRenderingMode(.alwaysTemplate)
        attachment.bounds = CGRect(x: 0, y: 0, width: 10, height: 10)
        let attributedString = NSMutableAttributedString(string: "12545 Riata Vista Cir, Austin, TX 78727", attributes: [NSAttributedString.Key.font : UIFont(name: "SFProRounded-Light", size: 14)!, NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        let imageString = NSAttributedString(attachment: attachment)
        let fullString = NSMutableAttributedString(string: "")
        fullString.append(imageString)
        fullString.append(attributedString)
        label.attributedText = fullString
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    lazy var applyButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.rgb(red: 136, green: 206, blue: 235)
        button.setTitle("Apply", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(applyToJob), for: .touchDown)
        return button
    }()
    
    lazy var header : UIView = {
        let view = UIView()
        view.addSubview(jobImage)
        jobImage.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), size: CGSize(width: 80, height: 80))
        jobImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        jobImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30).isActive = true
        jobImage.layer.cornerRadius = 40
        
        view.addSubview(completeLabel)
        completeLabel.anchor(top: jobImage.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 0))
        completeLabel.centerXAnchor.constraint(equalTo: jobImage.centerXAnchor).isActive = true
        
        view.addSubview(locationLabel)
        locationLabel.anchor(top: completeLabel.bottomAnchor, bottom: nil, right: nil, left: nil, paddingTop: 8, paddingBottom: 0, paddingRight: 0, paddingLeft: 0, height: 0, width: 0)
        locationLabel.centerXAnchor.constraint(equalTo: jobImage.centerXAnchor).isActive = true
        
        let stackView = HorizontalStackView(arrangedSubviews: [VerticalStackView(arrangedSubviews: [
            levelTitleLabel,
            levelLabel], spacing: 4), VerticalStackView(arrangedSubviews: [industryTitleLabel, industryLabel], spacing: 4), VerticalStackView(arrangedSubviews: [typeTitleLabel, typeLabel], spacing: 4), ], spacing: 12)
        stackView.distribution = .equalCentering
        
        view.addSubview(stackView)
        stackView.anchor(top: locationLabel.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 30, left: 30, bottom: 0, right: 30), size: CGSize(width: 0, height: 0))
        return view
    }()
    
    lazy var footerView : UIView = {
       let view = UIView()
        view.addSubview(applyButton)
        applyButton.anchor(top: nil, bottom: view.bottomAnchor, right: view.rightAnchor, left: view.leftAnchor, paddingTop: 0, paddingBottom: 15, paddingRight: 25, paddingLeft: 25, height: 50, width: 0)
        applyButton.layer.cornerRadius = 25
        return view
    }()
    
    let levelTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Level"
        label.font = UIFont(name: "SFProRounded-Bold", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    let levelLabel : UILabel = {
        let label = UILabel()
        label.text = "Entry"
        label.font = UIFont(name: "SFProRounded-Bold", size: 12)
        label.textColor = UIColor(white: 0.6, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    let industryTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Industry"
        label.font = UIFont(name: "SFProRounded-Bold", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    let industryLabel : UILabel = {
        let label = UILabel()
        label.text = "Technology"
        label.font = UIFont(name: "SFProRounded-Bold", size: 12)
        label.textColor = UIColor(white: 0.6, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    let typeTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Type"
        label.font = UIFont(name: "SFProRounded-Bold", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    let typeLabel : UILabel = {
        let label = UILabel()
        label.text = "Full-Time"
        label.font = UIFont(name: "SFProRounded-Bold", size: 12)
        label.textColor = UIColor(white: 0.6, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
  

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor.rgb(red: 136, green: 206, blue: 235)
        customizeTableView()
    }
    
    func customizeTableView() {
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.register(InfoCell.self, forCellReuseIdentifier: "cellID")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        footerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 75)
        tableView.tableFooterView = footerView
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return header
        }
        return UIView()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 250 : 40
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 1:
            let cell = InfoCell(style: .default, reuseIdentifier: "cellID")
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 8
            return cell
        default:
            break
        }
        return tableView.dequeueReusableCell(withIdentifier: "cell")!
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
    
    @objc func applyToJob() {
        print("apply to this job")
    }
}

class InfoCell : UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let cv = DynamicHeightCollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setupCollectionView()
    }
    let postings : [Posting] = {
        return [Posting(title: "Who We Are", paragraph: "Our mission is to organize the world’s information and make it universally accessible and useful."), Posting(title: "What you will do", paragraph: "As a software engineer, you work on a small team and can switch teams and projects as our fast-paced business grows and evolves. We need our engineers to be versatile and always eager to tackle new problems as we continue to push technology forward"), Posting(title: "Team Fun Fact", paragraph: "Google was originally named BackRub")]
    }()
    func setupCollectionView() {
        addSubview(collectionView)
        collectionView.register(JobDetailCell.self, forCellWithReuseIdentifier: "cellID")
        collectionView.fillSuperview()
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = 20
        collectionView.contentInsetAdjustmentBehavior = .automatic
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! JobDetailCell
        let posting = postings[indexPath.item]
        cell.posting = posting
        cell.layer.cornerRadius = 16
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let dummyCell = JobDetailCell(frame: CGRect(x: 0, y: 0, width: frame.width - 10 * 2, height: 1000))
        dummyCell.layoutIfNeeded()
        
        let estimatedSize = dummyCell.systemLayoutSizeFitting(CGSize(width: frame.width - 10 * 2, height: 300))
        print(estimatedSize.height)
        return CGSize(width: estimatedSize.width, height: estimatedSize.height + 30)
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        self.collectionView.frame = CGRect(x: 0, y: 0, width: targetSize.width, height: 1000)
        self.collectionView.layoutIfNeeded()
        return CGSize(width: collectionView.contentSize.width, height: collectionView.contentSize.height)
    }
}

class JobDetailCell : UICollectionViewCell {
    var posting : Posting? {
        didSet{
            testTitleLabel.text = posting?.title
            testLabel.text = posting?.paragraph
        }
    }
    let testTitleLabel = UILabel(text: "Who are are", font: UIFont(name: "SFProRounded-Bold", size: 16)!)
    let testLabel = UILabel(text: "Our mission is to organize the world’s information and make it universally accessible and useful.", font: UIFont(name: "SFProRounded-Light", size: 16)!, numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupStackView()
    }
    func setupStackView() {
        customizeLabels()
        let stackView = VerticalStackView(arrangedSubviews: [
            testTitleLabel,
            testLabel
            ], spacing: 8)
        addSubview(stackView)
        stackView.fillSuperview(padding: UIEdgeInsets(top: 6, left: 20, bottom: 20, right: 20))
        
    }
    
    func setupView() {
        addSubview(testTitleLabel)
        addSubview(testLabel)
        testTitleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0), size: CGSize(width: 20, height: 20))
        testLabel.anchor(top: testTitleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 0))
    }
    func customizeLabels() {
        testTitleLabel.textColor = UIColor(white: 0.1, alpha: 1)
        testLabel.textColor = UIColor(white: 0.6, alpha: 1)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        layoutIfNeeded()
        let layoutAttributes = super.preferredLayoutAttributesFitting(layoutAttributes)
        layoutAttributes.bounds.size = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .defaultLow)
        return layoutAttributes
    }
}

struct Posting {
    let title : String?
    let paragraph: String?
}

