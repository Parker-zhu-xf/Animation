//
//  ViewController.m
//  XFCoreAnimation
//
//  Created by 朱晓峰 on 16/9/9.
//  Copyright © 2016年 朱晓峰. All rights reserved.
//
//说明：添加cell需要在nameArr里面添加个名字，在didSelectRowAtIndexPath方法里面添加控制器
//规范：添加文件夹
#import "ViewController.h"
#import "XFCAEmitterLayer.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView  *tableView;
@property(nonatomic,strong)NSArray *nameArr;

@end
static NSString *ID=@"cell";

@implementation ViewController
-(NSArray *)nameArr{
    if (!_nameArr) {
        _nameArr=[NSArray array];
    }
    return _nameArr;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource=self;
        _tableView.delegate=self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title=@"动画组";
    self.nameArr=@[@"粒子"];
    [self tableView];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.textLabel.text=self.nameArr[indexPath.row];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.nameArr.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        XFCAEmitterLayer *vc=[XFCAEmitterLayer new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
