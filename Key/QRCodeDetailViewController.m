//
//  QRCodeDetailViewController.m
//  Key
//
//  Created by Juan Trejo on 10/5/17.
//  Copyright © 2017 Key. All rights reserved.
//

#import "QRCodeDetailViewController.h"

@interface QRCodeDetailViewController ()

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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self.navigationController setNavigationBarHidden:NO];
//    UINavigationBar *navbar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 20, UIScreen.mainScreen.bounds.size.width, 20)];
//    navbar.backgroundColor = [UIColor blackColor];
//    navbar.delegate = self;
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(onTapDone:)];
    
    self.navigationItem.title = @"QR Code";
    self.navigationItem.rightBarButtonItem = doneBtn;
    
   // navbar.items = [NSArray arrayWithObject:navitem];
    
   // [self.view addSubview:navbar];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)onTapDone:(UIBarButtonItem*)item{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
