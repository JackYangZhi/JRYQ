//
//  MapViewController.m
//  lianwangke_swift
//
//  Created by 杨星 on 16/7/18.
//  Copyright © 2016年 杨星. All rights reserved.
//

#import "MapViewController.h"
#import "SenicCell.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.navigationController.navigationBar.hidden=YES;
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    [AMapServices sharedServices].apiKey = @"51f03e8b6f8e45feba7d08a60fe9ba32";
    
    [self initMapView];
    
    //UI
    [self creatUI];
    

    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //定位
    self.mapView.showsUserLocation = YES;
    self.mapView.userTrackingMode = MAUserTrackingModeFollow;
}

//初始化地图
- (void)initMapView
{
    self.mapView = [[MAMapView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];
}


/**
 *  hook,子类覆盖它,实现想要在viewDidAppear中执行一次的方法,搜索中有用到
 */
- (void)hookAction
{
    
}

#pragma mark - Handle Action

- (void)returnAction
{
    [self.navigationController popViewControllerAnimated:YES];
    
    [self clearMapView];
}

- (void)clearMapView
{
    self.mapView.showsUserLocation = NO;
    
    [self.mapView removeAnnotations:self.mapView.annotations];
    
    [self.mapView removeOverlays:self.mapView.overlays];
    
    self.mapView.delegate = nil;
}


//定位
-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation{
    if(updatingLocation){
        NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
    }
}

#pragma mark **********************UI部分************************
-(void)creatUI{
    _topView=[[UIView alloc]initWithFrame:CGRectMake(10, 20, ScreenWidth-60, 44)];
    _topView.backgroundColor=[UIColor whiteColor];
    _topView.layer.cornerRadius=4.0;
    _topView.userInteractionEnabled=YES;
    _topView.layer.borderWidth=0.3;
    _topView.layer.borderColor=[UIColor lightGrayColor].CGColor;
    [self.view addSubview:_topView];
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(0, 0, 44, 44);
    [btn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_topView addSubview:btn];
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(50, 5, 0.5, 34)];
    label.backgroundColor=[UIColor lightGrayColor];
    [_topView addSubview:label];
    
    _locationLabel=[[UILabel alloc]initWithFrame:CGRectMake(55, 0, _topView.frame.size.width-60, 44)];
    _locationLabel.text=@"位置信息";
    _locationLabel.font=[UIFont systemFontOfSize:15];
    [_topView addSubview:_locationLabel];
    
    
    //左边两个按钮
    NSArray *twoImages=[[NSArray alloc]initWithObjects:@"MapHelp",@"MapLocation", nil];
    for(int i=0;i<2;i++){
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(20, ScreenHeight-160 + i*50, 40, 40);
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[twoImages objectAtIndex:i]]] forState:UIControlStateNormal];
        btn.tag=i+1;
        [btn addTarget:self action:@selector(twoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    //左边三个按钮
    NSArray *threeImages=[[NSArray alloc]initWithObjects:@"MapRight1",@"MapRight2",@"MapRight3", nil];
    NSArray *threeImageSelects=[[NSArray alloc]initWithObjects:@"MapRightS1",@"MapRightS2",@"MapRightS3", nil];
    for(int i=0;i<3;i++){
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(ScreenWidth-60, ScreenHeight-210 + i*50, 40, 40);
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[threeImages objectAtIndex:i]]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[threeImageSelects objectAtIndex:i]]] forState:UIControlStateSelected];
        btn.tag=i+10;
        [btn addTarget:self action:@selector(threeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    //底部类型
    NSArray *downBtnTitles=[NSArray arrayWithObjects:@"景区",@"导览",@"周边", nil];
    NSArray *downBtnImages=[NSArray arrayWithObjects:@"MapDown1",@"MapDown2",@"MapDown3", nil];
    for(int i=0;i<3;i++){
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(ScreenWidth/3*i, ScreenHeight-50, ScreenWidth/3, 50);
        btn.backgroundColor=[UIColor whiteColor];
        [btn setTitleColor:colorWithRGB(0x55a6ff, 1.0f) forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[downBtnImages objectAtIndex:i]]] forState:UIControlStateNormal];
        [btn setTitle:[NSString stringWithFormat:@"  %@",[downBtnTitles objectAtIndex:i]] forState:UIControlStateNormal];
        btn.tag=i+100;
        [btn addTarget:self action:@selector(downBtnsClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}

-(void)creatTableView{
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0,ScreenHeight, ScreenWidth, ScreenHeight-300)];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
}

-(void)creatMyNavView{
    _myNavView=[[UIView alloc]initWithFrame:CGRectMake(0, 236, ScreenWidth, 64)];
    _myNavView.userInteractionEnabled=YES;
    _myNavView.backgroundColor=[UIColor redColor];
    _myNavView.hidden=YES;
    [self.view addSubview:_myNavView];
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake((ScreenWidth-120)/2, 20, 120, 44)];
    label.text=@"周边景区";
    label.textColor=[UIColor whiteColor];
    label.font=[UIFont boldSystemFontOfSize:24];
    [_myNavView addSubview:label];
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(0, 20, 60, 44);
    [btn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_myNavView addSubview:btn];
}



-(void)twoBtnClick:(UIButton *)btn{
    NSLog(@"%ld",(long)btn.tag);
}

-(void)threeBtnClick:(UIButton *)btn{
    NSLog(@"%ld",(long)btn.tag);
}

-(void)downBtnsClick:(UIButton *)btn{
    NSLog(@"%ld",(long)btn.tag);
    
    //创建景区列表
    [self creatTableView];
    //创建导航栏
    [self creatMyNavView];
    
    [UIView animateWithDuration:0.25 animations:^{
        
        _tableView.frame=CGRectMake(0,300, ScreenWidth, ScreenHeight-300);
        
    } completion:^(BOOL finished) {
        
    }];
}

-(void)backBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark *************UITableViewDelegate**************

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName=@"cell";
    SenicCell *cell = (SenicCell *)[tableView dequeueReusableCellWithIdentifier:cellName];
    if(cell==nil)
    {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"SenicCell" owner:self options:nil];
        cell = [array objectAtIndex:0];
    }
    
    return cell;
}



#pragma mark ***********scrollviewDelegate************
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    NSLog(@"scrollView.contentOffset.y  =  %f",scrollView.contentOffset.y );
//    
//    if(scrollView.contentOffset.y>0 ){
//        [UIView animateWithDuration:0.25 animations:^{
//            
//            _tableView.frame=CGRectMake(0, 0, ScreenWidth, ScreenHeight);
//            
//        } completion:^(BOOL finished) {
//            
//        }];
//        return;
//    }
//    
//    if(scrollView.contentOffset.y<0){
//        [UIView animateWithDuration:0.25 animations:^{
//            NSLog(@"下去下去");
//            _tableView.frame=CGRectMake(0,300, ScreenWidth, ScreenHeight-300);
//            
//            
//            if(scrollView.contentOffset.y<-20 && scrollView.contentOffset.y>-60){
//                [UIView animateWithDuration:0.25 animations:^{
//                    NSLog(@"下去下去");
//                    _tableView.frame=CGRectMake(0,ScreenHeight, ScreenWidth, ScreenHeight);
//                } completion:^(BOOL finished) {
//                    [_tableView removeFromSuperview];
//                    
//                }];
//                return;
//            }
//
//            
//            
//        } completion:^(BOOL finished) {
//            
//        }];
//        return;
//    }
//}


-(void)cancelBtnClick{
    NSLog(@"取消");
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if(scrollView.contentOffset.y<-50 ){
        [UIView animateWithDuration:0.25 animations:^{
            NSLog(@"下去下去");
            _tableView.frame=CGRectMake(0,ScreenHeight, ScreenWidth, ScreenHeight);
            _myNavView.frame=CGRectMake(0, ScreenHeight, ScreenWidth, 64);
            
            _topView.frame=CGRectMake(10, 20, ScreenWidth-60, 44);

            
        } completion:^(BOOL finished) {
            [_tableView removeFromSuperview];
            [_myNavView removeFromSuperview];
            
        }];
    }else if(scrollView.contentOffset.y>0 ){
        [UIView animateWithDuration:0.25 animations:^{
            //添加导航栏
            _myNavView.hidden=NO;
            _myNavView.frame=CGRectMake(0, 0, ScreenWidth, 64);
            
            _tableView.frame=CGRectMake(0, 64, ScreenWidth, ScreenHeight-64);
            
            //头部位置信息
            _topView.frame=CGRectMake(10, -64, ScreenWidth-60, 44);

            
        } completion:^(BOOL finished) {
            
        }];
    }else{
        [UIView animateWithDuration:0.25 animations:^{
            //取消导航栏
            _myNavView.frame=CGRectMake(0, 300, ScreenWidth, 64);
            
            _tableView.frame=CGRectMake(0,300, ScreenWidth, ScreenHeight-300);
            
            _topView.frame=CGRectMake(10, 20, ScreenWidth-60, 44);

        } completion:^(BOOL finished) {
            _myNavView.hidden=YES;

        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
