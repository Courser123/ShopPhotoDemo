//
//  ViewController.m
//  ShopPhotoDemo
//
//  Created by Courser on 2018/5/21.
//  Copyright © 2018 Courser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UITableView *backgroundView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)setupUI {
    self.backgroundView = [[UITableView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.backgroundView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.backgroundView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
