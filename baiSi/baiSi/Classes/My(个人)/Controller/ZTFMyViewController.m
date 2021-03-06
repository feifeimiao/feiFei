//
//  ZTFMyViewController.m
//  baiSi
//
//  Created by feifei on 16/6/15.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFMyViewController.h"

#import "ZTFSetTableViewController.h"

#import "ZTFMyCollectionViewCell.h"

#import <AFNetworking/AFNetworking.h>

#import <MJExtension/MJExtension.h>

#import "ZTFMyItem.h"

#import "UIView+Frame.h"

#import <SafariServices/SafariServices.h>

CGFloat margin = 1;
NSInteger cols = 4;
#define itemWH (ZTFScreenW - (cols - 1) * margin) / cols
@interface ZTFMyViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak , nonatomic) UICollectionView *collection;

@property (strong , nonatomic) NSMutableArray *arr;

@end

@implementation ZTFMyViewController
    static NSString *ID = @"cell";

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor purpleColor];
    
    [self setnb];
    
    [self footerView];
    
    [self data];
    
    self.tableView.sectionFooterHeight = 10;
    self.tableView.sectionHeaderHeight = 0;
    // 设置顶部额外滚动区域-25
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
}
#pragma mark - 请求数据
- (void)data{

    //请求
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //拼接
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"square";
    parameters[@"c"] = @"topic";
    
    //实现
   
        [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary*  _Nullable responseObject) {
            //        [responseObject writeToFile:@"/Users/zhao/Desktop/re.plist" atomically:YES encoding:0 error:nil];
            
            //        [responseObject writeToFile:@"/Users/zhao/Desktop/re.plist" atomically:YES];
            _arr = [ZTFMyItem mj_objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
            
            
            
           
            
         
                              NSInteger  cout = _arr.count;
            
            NSInteger rows = (cout-1) / cols + 1;
            
            CGFloat h = rows * itemWH + (rows -1) * margin;
            
            _collection.heigth = h;

                              self.tableView.tableFooterView = _collection;
                   
        

         
            [_collection reloadData];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];

}



#pragma mark - UICollectionView
- (void)footerView{

    //流水布局
    UICollectionViewFlowLayout *lay = ({
    UICollectionViewFlowLayout *lay = [[UICollectionViewFlowLayout alloc]init];

    lay.itemSize = CGSizeMake(itemWH, itemWH);
    lay.minimumLineSpacing = margin;
    lay.minimumInteritemSpacing = margin;
        lay;
    });
    
    //创建
    UICollectionView *collection = ({
     UICollectionView *collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:lay];
        
        
    collection.backgroundColor = [UIColor purpleColor];
    collection.dataSource = self;
        
        collection.delegate = self;
    [collection registerNib:[UINib nibWithNibName:@"ZTFMyCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:ID];
//        collection.canCancelContentTouches = YES;
        collection;
    });
    
    _collection = collection;
    
//    collection.touc
    self.tableView.tableFooterView = collection;

}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    NSLog(@"%zd",_arr.count);
    return _arr.count;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    ZTFMyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];

    cell.myItem = _arr[indexPath.row];

    
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    ZTFMyItem *my = _arr[indexPath.row];
        if (![my.url hasPrefix:@"http"]) return;
    NSURL *url = [NSURL URLWithString:my.url];
    
    SFSafariViewController *sf = [[SFSafariViewController alloc]initWithURL:url];

    [self presentViewController:sf animated:YES completion:nil];
    
}

#pragma mark - 设置顶部导航条
- (void)setnb{
    
    self.navigationItem.title = @"个人中心";
    
    UIBarButtonItem *item0 = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-setting-icon"] highImage:[UIImage imageNamed:@"mine-setting-icon-click"] target:self action:@selector(setting)];
    
    UIBarButtonItem *item1 = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-moon-icon"] selImage:[UIImage imageNamed:@"mine-moon-icon-click"] target:self action:@selector(night:)];

    self.navigationItem.rightBarButtonItems = @[item0,item1];


}
#pragma mark - 夜间模式
- (void)night:(UIButton *)but{

    but.selected = !but.selected;

}
#pragma mark - 跳转设置界面
- (void)setting{
    
    ZTFSetTableViewController *set = [[ZTFSetTableViewController alloc]init];
    set.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:set animated:YES];


}



@end
