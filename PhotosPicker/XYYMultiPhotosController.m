//
//  XYYMultiPhotosController.m
//  PhotosPicker
//
//  Created by 全球沃 on 2016/12/1.
//  Copyright © 2016年 全球沃. All rights reserved.
//

#import "XYYMultiPhotosController.h"
#import <Masonry.h>

@interface XYYMultiPhotosController ()

/** imageView */
@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation XYYMultiPhotosController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    self.title = @"Multi";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
    
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor blackColor]];
    
    [self setupButton];
    
}

- (void)setupButton {
    
    for (int i = 0; i < 3; i++) {
        
        UIButton *button = [[UIButton alloc]init];
        
        [button setBackgroundColor:[UIColor purpleColor]];
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        switch (i) {
            case 0:
                
                [button setTitle:@"选择" forState:UIControlStateNormal];
                
                [button addTarget:self action:@selector(pickPhotos) forControlEvents:UIControlEventTouchUpInside];
                
                [button setFrame:CGRectMake(BSImageViewX, BSImageViewH + padding + 84, 50, 35)];
                
                break;
                
            case 1:
                
                [button setTitle:@"清空" forState:UIControlStateNormal];
                
                [button addTarget:self action:@selector(clearTheImage) forControlEvents:UIControlEventTouchUpInside];
                
                [button setFrame:CGRectMake(self.imageView.center.x - (CGFloat)25, BSImageViewH + padding + 84, 50, 35)];
                
                break;
                
            case 2:
                
                [button setTitle:@"分享" forState:UIControlStateNormal];
                
                [button addTarget:self action:@selector(presentShare) forControlEvents:UIControlEventTouchUpInside];
                
                [button setFrame:CGRectMake(BSImageViewW - (CGFloat)30, BSImageViewH + padding + 84, 50, 35)];
                
                break;
                
            default:
                break;
        }
        
        [self.view addSubview:button];
    }
    
    
    
}

- (void)pickPhotos {
    
    
    
}

- (void)clearTheImage {
    
    
    
}

- (void)presentShare {
    
    
    
    
}

- (void)setupImageView {
    
    UIImageView *imageView = [[UIImageView alloc]init];
    
    imageView.backgroundColor = [UIColor brownColor];
    
    [self.view addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.view.mas_left).offset(padding);
        
        make.right.mas_equalTo(self.view.mas_right).offset(-padding);
        
        make.top.mas_equalTo(self.view.mas_top).offset(84);
        
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-200);
        
    }];
    
    self.imageView = imageView;
    
}


- (void)dismiss {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
