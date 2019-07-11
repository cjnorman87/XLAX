//
//  HoldCode.swift
//  Peek Beta
//
//  Created by Jacorey Brown on 2/21/19.
//  Copyright © 2019 Jacorey Brown. All rights reserved.
//

import Foundation

//this code is code used to code a job search bar with a camera in the top right of the navigation bar for the purposes of giving job searchers the ability to use the camera to upload to their profile

//let jobSearchBar : UISearchBar = {
//    let bar = UISearchBar()
//    bar.placeholder = "Search Jobs"
//    bar.translatesAutoresizingMaskIntoConstraints = false
//    bar.backgroundImage = UIImage()
//    bar.setImage(UIImage(named: "search_unselected")?.withRenderingMode(.alwaysTemplate), for: .search, state: .normal)
//    bar.tintColor = .lightGray
//
//    UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = UIColor.white
//    UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.lightGray]
//    UILabel.appearance(whenContainedInInstancesOf: [UISearchBar.self]).textColor = .lightGray
//    return bar
//}()
//
//let extendedNavBar : UIView = {
//    let view = UIView()
//    view.backgroundColor = UIColor.rgb(red: 136, green: 206, blue: 235)
//    view.translatesAutoresizingMaskIntoConstraints = false
//    return view
//}()
//
//override func viewDidLoad() {
//    super.viewDidLoad()
//    setupNavigationController()
//    setupCollectionView()
//    setupExtendedNavBarAndSearchBar()
//}
//
//
//// set up search bar constraints
//func setupJobSearchBar() {
//    extendedNavBar.addSubview(jobSearchBar)
//    jobSearchBar.anchor(top: extendedNavBar.topAnchor, bottom: nil, right: extendedNavBar.rightAnchor, left: extendedNavBar.leftAnchor, paddingTop: 5, paddingBottom: 0, paddingRight: -5, paddingLeft: 5, height: 30, width: 0)
//}
//
////set up extended navigatin bar with constraints
//func setupExtendedNavBar() {
//    view.addSubview(extendedNavBar)
//    extendedNavBar.anchor(top: view.topAnchor, bottom: nil, right: view.rightAnchor, left: view.leftAnchor, paddingTop: 0, paddingBottom: 0, paddingRight: 0, paddingLeft: 0, height: 50, width: view.frame.width)
//}
//
//// place both methods to set up job search bar and extended nav bar
//func setupExtendedNavBarAndSearchBar() {
//    setupExtendedNavBar()
//    setupJobSearchBar()
//}
//
//func setupNavigationController() {
//    self.navigationItem.title = "Jobs"
//    self.navigationController?.navigationBar.isTranslucent = false
//    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//    self.navigationController?.navigationBar.shadowImage = UIImage()
//
//    let cameraButton = UIButton(type: .system)
//    cameraButton.setImage(#imageLiteral(resourceName: "camera3").withRenderingMode(.alwaysTemplate), for: .normal)
//    cameraButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
//    cameraButton.tintColor = .white
//    navigationItem.rightBarButtonItem = UIBarButtonItem(customView: cameraButton)
//}
//
//// set up collection view for job searches, sets color for navigation controller, creates inset for collectionview spacing, removes navigation bar grey line
//func setupCollectionView() {
//    let layout = UICollectionViewFlowLayout()
//    layout.sectionInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
//    layout.minimumLineSpacing = 1
//    layout.minimumInteritemSpacing = 1
//
//    collectionView.collectionViewLayout = layout
//    collectionView.backgroundColor = .white
//    collectionView.register(JobsCell.self , forCellWithReuseIdentifier: jobsCellID)
//
//}

/* code to create a collectionview controller alongside segment controller. Brian Voong Youtube Horizontal Layout Controller
 
 
 let jobsFeedCellID = "jobsCellID"
 
 lazy var segmentBar : SegmentBar = {
 let seg = SegmentBar()
 seg.jobsController = self
 return seg
 }()
 
 override func viewDidLoad() {
 super.viewDidLoad()
 setupCollectionView()
 setupSegmentBar()
 }
 
 func setupCollectionView() {
 let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
 layout.scrollDirection = .horizontal
 layout.minimumLineSpacing = 0
 collectionView.backgroundColor = .white
 collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
 collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
 collectionView.isPagingEnabled = true
 collectionView.register(JobsFeedCell.self, forCellWithReuseIdentifier: jobsFeedCellID)
 }
 
 override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
 return 2
 }
 
 override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: jobsFeedCellID, for: indexPath) as! JobsFeedCell
 return cell
 }
 
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
 return CGSize(width: view.frame.width, height: view.frame.height)
 }
 
 override func scrollViewDidScroll(_ scrollView: UIScrollView) {
 segmentBar.horizontalBarLeftConstraint?.constant = scrollView.contentOffset.x / 2
 }
 
 func scrollToMenuIndex(menuIndex: Int) {
 let indexPath = NSIndexPath(item: menuIndex, section: 0)
 collectionView?.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
 }
 
 override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
 let index = targetContentOffset.pointee.x / view.frame.width
 let indexPath = NSIndexPath(item: Int(index), section: 0)
 segmentBar.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: [])
 }
 
 func setupSegmentBar() {
 view.addSubview(segmentBar)
 segmentBar.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 80, left: 0, bottom: 0, right: 0), size: CGSize(width: view.frame.width, height: 50))
 }
 
 */

/* code used to create a profile controller using view controller but not experience cells/ collectoin view is not scrollable 
let headerID = "headerID"
let profileExperienceID = "profileExperienceID"
let profileEducationID = "profileEducationID"

// header view where profile image resides
let profileHeader : UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    //        view.backgroundColor = UIColor.rgb(red: 136, green: 206, blue: 235)
    view.backgroundColor = #colorLiteral(red: 0.9538685679, green: 0.9487213492, blue: 0.9574434161, alpha: 1)
    return view
}()

let userProfileImage : UIImageView = {
    let view = UIImageView()
    view.image = #imageLiteral(resourceName: "placeholderImg")
    view.layer.borderColor = UIColor.white.cgColor
    view.layer.borderWidth = 2
    view.layer.cornerRadius = 80
    view.translatesAutoresizingMaskIntoConstraints = false
    view.clipsToBounds = true
    view.contentMode = .scaleAspectFill
    return view
}()

let nameLabel : UILabel = {
    let label = UILabel()
    label.text = "Jacorey Brown"
    label.font = .systemFont(ofSize: 20)
    //        label.textColor = .white
    label.textColor = UIColor.rgb(red: 136, green: 206, blue: 235)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.sizeToFit()
    return label
}()

let locationLabel : UILabel = {
    let label = UILabel()
    label.text = "Austin, Tx"
    label.font = .systemFont(ofSize: 20)
    //        label.textColor = .white
    label.textColor = UIColor.rgb(red: 136, green: 206, blue: 235)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.sizeToFit()
    return label
}()

let locationIcon : UIImageView = {
    let icon = UIImageView()
    icon.image = UIImage(named: "location")?.withRenderingMode(.alwaysTemplate)
    //        icon.tintColor = .white
    icon.tintColor = UIColor.rgb(red: 136, green: 206, blue: 235)
    icon.translatesAutoresizingMaskIntoConstraints = false
    return icon
}()

lazy var collectionView : UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.translatesAutoresizingMaskIntoConstraints = false
    cv.dataSource = self
    cv.delegate = self
    return cv
}()

lazy var profileSegmentBar : ProfileSegmentBar = {
    let seg = ProfileSegmentBar()
    seg.userProfileController = self
    return seg
}()

override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.9538685679, green: 0.9487213492, blue: 0.9574434161, alpha: 1)
    setupNavBar()
    setupProfileHeader()
    setupProfileImage()
    setupNameLabel()
    setupLocationLabel()
    setupLocationIcon()
    setupSegmentBar()
    setupCollectionView()
}

func setupProfileHeader() {
    view.addSubview(profileHeader)
    profileHeader.anchor(top: view.topAnchor, bottom: nil, right: view.rightAnchor, left: view.leftAnchor, paddingTop: 40, paddingBottom: 0, paddingRight: 0, paddingLeft: 0, height: 400, width: view.frame.width)
}


func setupCollectionView() {
    view.addSubview(collectionView)
    collectionView.anchor(top: profileSegmentBar.bottomAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, left: view.leftAnchor, paddingTop: 0, paddingBottom: 0, paddingRight: 0, paddingLeft: 0, height: 0, width: 0)
    //        collectionView.backgroundColor = #colorLiteral(red: 0.9538685679, green: 0.9487213492, blue: 0.9574434161, alpha: 1)
    collectionView.backgroundColor = .white
    collectionView.register(ProfileExperienceCell.self, forCellWithReuseIdentifier: profileExperienceID)
    collectionView.register(ProfileEducationCell.self, forCellWithReuseIdentifier: profileEducationID)
}


func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 2
}


func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch indexPath.item {
    case 0:
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: profileExperienceID, for: indexPath) as! ProfileExperienceCell
        return cell
    case 1:
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: profileEducationID, for: indexPath) as! ProfileEducationCell
        return cell
    default:
        return collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
    }
}


func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width - 20, height: 375)
}

//sets up navigation bar. changes the navigation bar to translucent so it blends with the view. removes grey line
func setupNavBar() {
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    self.navigationController?.navigationBar.shadowImage = UIImage()
    self.navigationController?.navigationBar.isTranslucent = false
    navigationController?.isNavigationBarHidden = true
    navigationItem.title = "Profile"
}


func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
}


func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
}

func setupProfileImage() {
    profileHeader.addSubview(userProfileImage)
    userProfileImage.centerXAnchor.constraint(equalTo: profileHeader.centerXAnchor).isActive = true
    userProfileImage.centerYAnchor.constraint(equalTo: profileHeader.centerYAnchor, constant: -45).isActive = true
    userProfileImage.heightAnchor.constraint(equalToConstant: 160).isActive = true
    userProfileImage.widthAnchor.constraint(equalToConstant: 160).isActive = true
}

func setupNameLabel() {
    profileHeader.addSubview(nameLabel)
    nameLabel.anchor(top: userProfileImage.bottomAnchor, bottom: nil, right: nil, left: nil, paddingTop: 10, paddingBottom: 0, paddingRight: 0, paddingLeft: 0, height: 20, width: 0)
    nameLabel.centerXAnchor.constraint(equalTo: userProfileImage.centerXAnchor).isActive = true
}

func setupLocationLabel() {
    profileHeader.addSubview(locationLabel)
    locationLabel.anchor(top: nameLabel.bottomAnchor, bottom: nil, right: nil, left: nil, paddingTop: 8, paddingBottom: 0, paddingRight: 0, paddingLeft: 0, height: 20, width: 0)
    locationLabel.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor).isActive  = true
}

func setupLocationIcon() {
    profileHeader.addSubview(locationIcon)
    locationIcon.anchor(top: locationLabel.topAnchor, bottom: nil, right: locationLabel.leftAnchor, left: nil, paddingTop: 0, paddingBottom: 0, paddingRight: -5, paddingLeft: 0, height: 20, width: 20)
}

func setupSegmentBar() {
    view.addSubview(profileSegmentBar)
    profileSegmentBar.anchor(top: profileHeader.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), size: CGSize(width: view.frame.width, height: 50))
}

 */

/* user profile setup with rounded cards for experience, education and other things
 class UserProfile : BaseListController, UICollectionViewDelegateFlowLayout {
 
 let headerID = "headerID"
 let profileExperienceID = "profileExperienceID"
 let profileEducationID = "profileEducationID"
 
 override func viewDidLoad() {
 super.viewDidLoad()
 view.backgroundColor = #colorLiteral(red: 0.9538685679, green: 0.9487213492, blue: 0.9574434161, alpha: 1)
 setupNavBar()
 setupCollectionView()
 }
 
 
 func setupCollectionView() {
 collectionView.backgroundColor = #colorLiteral(red: 0.9538685679, green: 0.9487213492, blue: 0.9574434161, alpha: 1)
 collectionView.register(ProfileExperienceCell.self, forCellWithReuseIdentifier: profileExperienceID)
 collectionView.register(ProfileEducationCell.self, forCellWithReuseIdentifier: profileEducationID)
 collectionView.register(UserProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
 }
 
 
 
 
 override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
 return 2
 }
 
 
 override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
 switch indexPath.item {
 case 0:
 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: profileExperienceID, for: indexPath) as! ProfileExperienceCell
 return cell
 case 1:
 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: profileEducationID, for: indexPath) as! ProfileEducationCell
 return cell
 default:
 return collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
 }
 }
 
 override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
 let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! UserProfileHeader
 return header
 }
 
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
 return CGSize(width: view.frame.width, height: 300)
 }
 
 
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
 return CGSize(width: view.frame.width, height: 375)
 }
 
 //sets up navigation bar. changes the navigation bar to translucent so it blends with the view. removes grey line
 func setupNavBar() {
 self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
 self.navigationController?.navigationBar.shadowImage = UIImage()
 self.navigationController?.navigationBar.isTranslucent = false
 navigationController?.isNavigationBarHidden = true
 navigationItem.title = "Profile"
 }
 
 
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
 return 10
 }
 
 
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
 return UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
 }
 }
 
 
*/
// holding code for the jobs controller that allows the correct layout

/*
class JobsController : BaseListController, UICollectionViewDelegateFlowLayout {
    
    let appliedControllerCellID = "appliedControllerCell"
    let savedControllerCellID = "savedControllerCell"
    
    lazy var segmentBar : SegmentBar = {
        let seg = SegmentBar()
        seg.jobsController = self
        return seg
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupSegmentBar()
    }
    
    
    func setupCollectionView() {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: appliedControllerCellID)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: savedControllerCellID)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appliedControllerCellID, for: indexPath)
            let appliedVC = AppliedController()
            cell.addSubview(appliedVC.view)
            addChild(appliedVC)
            return cell
        } else  if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: savedControllerCellID, for: indexPath)
            let savedVC = SavedController()
            cell.addSubview(savedVC.view)
            addChild(savedVC)
            return cell
        }
        return collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = view.frame.height - 200
        return CGSize(width: view.frame.width, height: height)
    }
    
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        segmentBar.horizontalBarLeftConstraint?.constant = scrollView.contentOffset.x / 2
    }
    
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / view.frame.width
        let indexPath = NSIndexPath(item: Int(index), section: 0)
        segmentBar.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: [])
    }
    
    func setupSegmentBar() {
        view.addSubview(segmentBar)
        segmentBar.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 80, left: 0, bottom: 0, right: 0), size: CGSize(width: view.frame.width, height: 50))
    }
    
    
}
*/
 
