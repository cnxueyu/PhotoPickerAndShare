//
//  XYYMainController.m
//  PhotosPicker
//
//  Created by 全球沃 on 2016/12/1.
//  Copyright © 2016年 全球沃. All rights reserved.
//

#import "XYYMainController.h"
#import "XYYSinglePhotoController.h"
#import "XYYMultiPhotosController.h"
@interface XYYMainController ()

@end

@implementation XYYMainController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupButton];
    
    self.view.backgroundColor = [UIColor grayColor];
    
}

- (void)setupButton {
    
    for (int i = 0; i < 2; i++) {
        
        UIButton *button = [[UIButton alloc]init];
        
        button.frame = CGRectMake(self.view.bounds.size.width * 0.5 - 50, 200 + i * 60 , 100, 30);
        
        [button setBackgroundColor:[UIColor purpleColor]];
        
        switch (i) {
            case 0:
                [button setTitle:@"单张上传" forState:UIControlStateNormal];
                
                [button addTarget:self action:@selector(presentToSingle) forControlEvents:UIControlEventTouchUpInside];
                
                break;
             case 1:
                
                [button setTitle:@"多张上传" forState:UIControlStateNormal];
                
                [button addTarget:self action:@selector(presentToMulti) forControlEvents:UIControlEventTouchUpInside];
                
            default:
                break;
        }
        
        [self.view addSubview:button];
        
    }
    
    
}

- (void)presentToSingle {
    
    UINavigationController *nvi = [[UINavigationController alloc]initWithRootViewController:[[XYYSinglePhotoController alloc]init]];
    
    [self presentViewController:nvi animated:YES completion:nil];
    
}

- (void)presentToMulti {
    
    UINavigationController *nvi = [[UINavigationController alloc]initWithRootViewController:[[XYYMultiPhotosController alloc]init]];
    
    [self presentViewController:nvi animated:YES completion:nil];
    
}
@end
