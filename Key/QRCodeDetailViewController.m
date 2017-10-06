//
//  QRCodeDetailViewController.m
//  Key
//
//  Created by Juan Trejo on 10/5/17.
//  Copyright © 2017 Key. All rights reserved.
//

#import "QRCodeDetailViewController.h"

@interface QRCodeDetailViewController ()

@property (nonatomic, strong) UIImageView* codeImageView;

@end

@implementation QRCodeDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - Load View

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadNavigationBar];
    [self loadCodeImageView];
}

-(void)loadCodeImageView {
    CGFloat halfScreenHeight = UIScreen.mainScreen.bounds.size.height / 2.0;
    CGFloat halfScreenWidth = UIScreen.mainScreen.bounds.size.width / 2.0;
    CGFloat imageWidth = halfScreenWidth * (4.0 / 3.0);  // 2/3 of image screen
    CGFloat imageHeight = imageWidth;
    CGFloat x_pos = halfScreenWidth - imageWidth / 2.0;
    CGFloat y_pos = halfScreenHeight * (4.0 / 5.0) - imageHeight / 2.0;  // y location = 2/5 of full screen down top of screen
    _codeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(x_pos, y_pos, imageWidth, imageHeight)];
    _codeImageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_codeImageView];
}

-(void)loadNavigationBar {
    // Navigation Bar
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(onTapDone:)];
    self.navigationItem.title = _codeTitle;
    self.navigationItem.rightBarButtonItem = doneBtn;
}

-(void)viewWillAppear:(BOOL)animated {
    _codeImageView.image = _codeImage;
    //self.navigationController
}

#pragma mark - Navigation

-(void)onTapDone:(UIBarButtonItem*)item{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Memory

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
