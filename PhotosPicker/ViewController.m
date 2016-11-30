//
//  ViewController.m
//  PhotosPicker
//
//  Created by 全球沃 on 2016/11/30.
//  Copyright © 2016年 全球沃. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import <Social/Social.h>
@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

/** imageView */
@property (strong, nonatomic) UIImageView *imageView;

/** pickBtn */
@property (strong, nonatomic) UIButton *button;

/** scrollView */
@property (strong, nonatomic) UIScrollView *scrollView;

/** UIImagePickerController */
@property (strong, nonatomic) UIImagePickerController *ipc;

@end

@implementation ViewController

- (UIImagePickerController *)ipc {
    
    if (!_ipc) {
        
        _ipc = [[UIImagePickerController alloc]init];
        
    }
    
    return _ipc;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self setupImageView];
    
    [self setupPickerBtn];
    
    [self setupShareBtn];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(presentShare) name:@"shareBtnClickNotifi" object:nil];
    
}

- (void)setupImageView {
    
    UIImageView *imageView = [[UIImageView alloc]init];
    
    imageView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.view.mas_left).offset(20);
        
        make.right.mas_equalTo(self.view.mas_right).offset(-20);
        
        make.top.mas_equalTo(self.view.mas_top).offset(64);
        
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-200);
        
    }];

    self.imageView = imageView;
    
}


- (void)setupPickerBtn {
    
    UIButton *button = [[UIButton alloc]init];
    
    [button setBackgroundColor:[UIColor purpleColor]];
    
    [button setTitle:@"select" forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(pickPhotos) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.imageView.mas_left);
        
        make.top.mas_equalTo(self.imageView.mas_bottom).offset(20);
        
        make.height.mas_equalTo(35);
        
        make.width.mas_equalTo(50);
        
    }];
    
    self.button = button;
    
}

- (void)setupShareBtn {
    
    UIButton *btn = [[UIButton alloc]init];
    
    [btn setBackgroundColor:[UIColor blueColor]];
    
    [btn setTitle:@"share" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(presentShare) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(self.imageView.mas_right);
        
        make.top.mas_equalTo(self.button.mas_top);
        
        make.height.mas_equalTo(self.button.mas_height);
        
        make.width.mas_equalTo(self.button.mas_width);
        
    }];

}

- (void)presentShare {
    
    NSString *text = @"分享内容";
    
    UIImage *image = self.imageView.image;
    
    NSURL *url = [NSURL URLWithString:@"http://www.qqw16888.com"];
    
    NSArray *activityItems = @[text, image, url];
    
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    
    [self presentViewController:activityViewController animated:YES completion:nil];
    
    [activityViewController setCompletionWithItemsHandler:^(NSString * __nullable activityType, BOOL completed, NSArray * __nullable returnedItems, NSError * __nullable activityError) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
    
    }];
    
}

- (void)pickPhotos {
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) return;
    
    self.ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    self.ipc.delegate = self;
    
    self.ipc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:self.ipc animated:YES completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo {
    
    [picker dismissViewControllerAnimated:YES completion:nil];

    self.imageView.image = image;
    
}

@end
