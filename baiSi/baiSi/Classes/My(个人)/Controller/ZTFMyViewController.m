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

@interface ZTFMyViewController ()<UICollectionViewDataSource>

@end

@implementation ZTFMyViewController
    static NSString *ID = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor purpleColor];
    
    [self setnb];
    
    [self footerView];
}

- (void)footerView{


    //流水布局
    UICollectionViewFlowLayout *lay = ({
    UICollectionViewFlowLayout *lay = [[UICollectionViewFlowLayout alloc]init];
    CGFloat margin = 1;
    NSInteger cols = 4;
    CGFloat itemWH = (ZTFScreenW - (cols - 1) * margin) / cols;
    lay.itemSize = CGSizeMake(itemWH, itemWH);
    lay.minimumLineSpacing = margin;
    lay.minimumInteritemSpacing = margin;
        lay;
    });
    
    //创建
    UICollectionView *collection = ({
     UICollectionView *collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, 300) collectionViewLayout:lay];
    collection.backgroundColor = [UIColor purpleColor];
    collection.dataSource = self;
    [collection registerNib:[UINib nibWithNibName:@"ZTFMyCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:ID];
        collection;
    });
    
    
    
    self.tableView.tableFooterView = collection;
    

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 10;

}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];

//    cell.backgroundColor = [UIColor greenColor];
    
    return cell;
}




- (void)setnb{
    
    self.navigationItem.title = @"个人中心";
    
    UIBarButtonItem *item0 = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-setting-icon"] highImage:[UIImage imageNamed:@"mine-setting-icon-click"] target:self action:@selector(setting)];
    
    UIBarButtonItem *item1 = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-moon-icon"] selImage:[UIImage imageNamed:@"mine-moon-icon-click"] target:self action:@selector(night:)];

    self.navigationItem.rightBarButtonItems = @[item0,item1];


}
- (void)night:(UIButton *)but{

    but.selected = !but.selected;

}
- (void)setting{
    
    ZTFSetTableViewController *set = [[ZTFSetTableViewController alloc]init];
    set.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:set animated:YES];

}



@end
