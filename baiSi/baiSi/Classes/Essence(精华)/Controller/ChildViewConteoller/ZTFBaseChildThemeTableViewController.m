//
//  ZTFBaseChildThemeTableViewController.m
//  baiSi
//
//  Created by feifei on 16/6/30.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//
static NSString * const ID = @"cell";
#import "ZTFBaseChildThemeTableViewController.h"
#import "ZTFAllTableViewCell.h"



#import <AFNetworking/AFNetworking.h>

#import <MJExtension/MJExtension.h>

#import "ZTFThemeViewModel.h"


@interface ZTFBaseChildThemeTableViewController ()

@property (strong , nonatomic) NSMutableArray *arr;
@end

@implementation ZTFBaseChildThemeTableViewController

- (NSMutableArray *)arr
{
    if (_arr == nil) {
        
        _arr = [NSMutableArray array];
    }
    return _arr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //注册cell
    [self.tableView registerClass:[ZTFAllTableViewCell class] forCellReuseIdentifier:ID];
    
    self.tableView.contentInset = UIEdgeInsetsMake(44+35, 0, 49, 0);
    
    //加载数据
  
    
}


#pragma mark - 加载数据
- (void)loadData:(ZTFThemeType)type
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"data";
    parameters[@"type"] = @(type);
    
    [manager GET:ZTFBaseUrl parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        //        [responseObject writeToFile:@"/Users/zhao/Desktop/theme.plist" atomically:YES];
        
        NSArray *a = responseObject[@"list"];
        //取出list中的数据
        NSArray *array = [ZTFAllItem mj_objectArrayWithKeyValuesArray:a];
        
        //遍历 放到
        for (ZTFAllItem *item in array) {
            ZTFThemeViewModel *vm = [[ZTFThemeViewModel alloc]init];
            vm.item = item;
            
            [self.arr addObject:vm];
            
        }
        
        
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZTFAllTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
    cell.item = _arr[indexPath.row];
    
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZTFThemeViewModel *vm = _arr[indexPath.row];
    
    return vm.cellH;
}

@end
