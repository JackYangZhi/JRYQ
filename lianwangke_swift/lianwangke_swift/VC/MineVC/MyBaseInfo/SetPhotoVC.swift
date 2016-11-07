//
//  SetPhotoVC.swift
//  lianwangke_swift
//
//  Created by 杨星 on 16/7/13.
//  Copyright © 2016年 杨星. All rights reserved.
//

import UIKit

class SetPhotoVC: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var pictureBtn: UIButton!
    
    @IBOutlet weak var photoBtn: UIButton!
    
    //初始化图片选择控制器
    let imagePickerController : UIImagePickerController = UIImagePickerController()
    
    var sourceType : Int!
    
    /*
    //下面这三个方法是关联Xib的
    //重写init(nibNameOrNil, bundleOrNil)
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    //重写无参数init方法
    convenience init(){
        var nibNameOrNil = String?("FormController")
        if NSBundle.mainBundle().pathForResource(nibNameOrNil, ofType: "xib") == nil
        {
            nibNameOrNil = nil
        }
        self.init(nibName:nibNameOrNil,bundle: nil)
    }
    //编译器提示需要加入的代码
    required init?(coder aDecoder: NSCoder) {
        fatalError("nit(coder:) has not been implemented")
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.photoImageView.backgroundColor=UIColor.red;
        self.photoImageView.isUserInteractionEnabled=true;
        self.photoImageView.contentMode=UIViewContentMode.scaleAspectFill
        self.photoImageView.clipsToBounds=true
        self.photoImageView.layer.shadowColor = UIColor.clear.cgColor
        self.photoImageView.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.photoImageView.layer.shadowOpacity = 0.5
        self.photoImageView.layer.shadowRadius = 2.0
        self.photoImageView.layer.borderColor = UIColor.red.cgColor
        self.photoImageView.layer.borderWidth = 2.0
        self.photoImageView.layer.masksToBounds = true
        self.photoImageView.layer.cornerRadius=self.photoImageView.frame.size.height/2
        
        self.pictureBtn.layer.cornerRadius=4.0
        self.photoBtn.layer.cornerRadius=4.0
        
        //初始值
        sourceType=0;

    }

    
    @IBAction func pictureBtn(_ sender: AnyObject) {
        print("相册")
        
    }
    
    
    @IBAction func photoBtn(_ sender: AnyObject) {
        print("相机")
    }
    
    
    func creatCameraData(_ Source : Int){
        self.imagePickerController.delegate=self
        self.imagePickerController.allowsEditing=true
        self.imagePickerController.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
