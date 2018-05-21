//
//  ViewController.m
//  ShopPhotoDemo
//
//  Created by Courser on 2018/5/21.
//  Copyright © 2018 Courser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *backgroundView;
@property (nonatomic, strong) UIView      *headerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupUI];
}

- (void)setupUI {
    self.backgroundView = [[UITableView alloc] initWithFrame:CGRectZero];
    self.backgroundView.delegate = self;
    self.backgroundView.dataSource = self;
    self.backgroundView.contentInset = UIEdgeInsetsMake(245, 0, 0, 0);
    [self.view addSubview:self.backgroundView];
    
    self.headerView = [[UIView alloc] init];
    self.headerView.backgroundColor = [UIColor blackColor];
    [self.backgroundView addSubview:self.headerView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.backgroundView.frame = self.view.bounds;
    self.headerView.frame = CGRectMake(0, -50, self.view.bounds.size.width, 50);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse"];
    }
    cell.contentView.backgroundColor = [UIColor lightGrayColor];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
