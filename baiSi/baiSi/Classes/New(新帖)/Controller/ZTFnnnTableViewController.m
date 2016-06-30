//
//  ZTFnnnTableViewController.m
//  baiSi
//
//  Created by feifei on 16/6/19.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFnnnTableViewController.h"

#import <MJExtension/MJExtension.h>
#import "ZTFnewTableViewCell.h"

#import <AFNetworking/AFNetworking.h>

#import "ZTFSubTagItem.h"

@interface ZTFnnnTableViewController ()

@property (strong , nonatomic) NSArray *arr;

@end

@implementation ZTFnnnTableViewController

static NSString *ID = @"cell1";

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"sdfs";
    
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ZTFnewTableViewCell" bundle:nil] forCellReuseIdentifier:ID];
    
    [self loadData];

}

- (void)loadData{

    //创建请求
    AFHTTPSessionManager *mgr= [AFHTTPSessionManager manager];
    //参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"tag_recommend";
    parameters[@"c"] = @"topic";
    parameters[@"action"] = @"sub";

    //发送请求
    [mgr GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray *  _Nullable responseObject) {
//        NSLog(@"%@",responseObject);

                _arr = [ZTFSubTagItem mj_objectArrayWithKeyValuesArray:responseObject];
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    

}
#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSLog(@"%zd",_arr.count);
    return _arr.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   ZTFnewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.subTagItem = _arr[indexPath.row];
    
//         [UIImage imageWithBorderW:0 borderColor:nil image:_Himage.image];
    
    return cell;

    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


@end
