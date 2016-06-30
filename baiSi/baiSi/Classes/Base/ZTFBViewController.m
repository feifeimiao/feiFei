//
//  ZTFBViewController.m
//  baiSi
//
//  Created by feifei on 16/6/24.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFBViewController.h"
#import "UIView+Frame.h"
#import "ZTFTextTableViewController.h"
#import "ZTFAllTableViewController.h"
#import "ZTFVideoTableViewController.h"
#import "ZTFPictureTableViewController.h"

static NSString * const ID = @"cell";

@interface ZTFBViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak , nonatomic) UIScrollView *topTitView;

@property (weak , nonatomic) UICollectionView *collection;

@property (weak , nonatomic) UIButton *button;

@property (strong , nonatomic) NSMutableArray *arr;

@end

@implementation ZTFBViewController
- (NSMutableArray *)arr
{
    if (_arr == nil) {
        
        _arr = [NSMutableArray array];
    }
    
    return _arr;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    [self setNB];
    
    [self setupButtomView];
    
    [self setupTopView];
    
    [self addAllChildView];
    
    //    NSLog(@"%d",self.childViewControllers.count);
    
    [self setAlltopTitbutton];
    self.automaticallyAdjustsScrollViewInsets = NO;
}
#pragma mark - 设置顶部
- (void)setupTopView
{
    CGFloat w = ZTFScreenW;
    CGFloat h = 35;
    CGFloat x = 0;
    CGFloat y = 64;
    
    UIScrollView *topView = [[UIScrollView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    topView.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    [self.view addSubview:topView];
    _topTitView = topView;
}

#pragma mark - 设置顶部View按钮
- (void)setAlltopTitbutton
{
    NSInteger count = self.childViewControllers.count;
    CGFloat w = ZTFScreenW / count;
    CGFloat h = _topTitView.heigth;
    CGFloat x = 0;
    CGFloat y = 0;
    
    
    
    for (int i = 0; i < count ; i++) {
        UIButton *titBut = [UIButton buttonWithType:UIButtonTypeCustom];
        titBut.tag = i;
        UIViewController *vc = self.childViewControllers[i];
        //        NSLog(@"%@",self.childViewControllers[i]);
        [titBut setTitle:vc.title forState:UIControlStateNormal];
        
        [titBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [titBut setTitleColor:[UIColor redColor ] forState:UIControlStateSelected];
        titBut.titleLabel.font = [UIFont systemFontOfSize:15];
        
        x = ( w * i);
        titBut.frame = CGRectMake(x, y, w, h);
        
        
        [_topTitView addSubview:titBut];
        [self.arr addObject:titBut];
        [titBut addTarget:self action:@selector(clickTitBut:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            [self setButton:titBut];
        }
        
        
        
    }
    
}

#pragma mark - scrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //CollectionView的偏移量 除 屏幕大小  = 当前视图的页数
    NSInteger page = scrollView.contentOffset.x / ZTFScreenW;
    
    UIButton *but = self.arr[page];
    
    [self setButton:but];
    
}
#pragma mark - 点击顶部按钮
- (void)clickTitBut:(UIButton *)button
{
    NSInteger i = button.tag;
    
    [self setButton:button];
    CGFloat x = i * ZTFScreenW;
    
    //    [UIView animateWithDuration:0.5 animations:^{
    _collection.contentOffset = CGPointMake(x, 0);
    //    }];
    
}

#pragma mark - 按钮选中

- (void)setButton:(UIButton *)button
{
    _button.selected = NO;
    
    button.selected = YES;
    
    _button = button;
}

#pragma  mark - 添加所有子类
- (void)addAllChildView
{
    ZTFAllTableViewController *all = [[ZTFAllTableViewController alloc]init];
    
    all.title = @"全部";
    [self addChildViewController:all];
    
    ZTFVideoTableViewController *video = [[ZTFVideoTableViewController alloc]init];
    video.title = @"视频";
    [self addChildViewController: video];
    
    ZTFPictureTableViewController *pict = [[ZTFPictureTableViewController alloc]init];
    pict.title = @"图片";
    [self addChildViewController: pict];
    //
    ZTFTextTableViewController *textView = [[ZTFTextTableViewController alloc]init];
    textView.title = @"段子";
    [self addChildViewController: textView];
    
}

#pragma mark - 设置底部CollectionView
- (void)setupButtomView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout. minimumLineSpacing = 1;
    layout.minimumInteritemSpacing = 1;
    UICollectionView *collection = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    collection.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:collection];
    
    _collection = collection;
    
    collection.dataSource = self;
    
    collection.delegate =self;
    
    collection.pagingEnabled = YES;
    
    
    [collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
}


#pragma mark - UICollectionDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.childViewControllers.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //    cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    UIViewController *vc = self.childViewControllers[indexPath.row];
    
    [cell.contentView addSubview:vc.view];
    
    return cell;
    
}

@end
