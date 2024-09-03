//
//  ViewController.m
//  YDiOSStudy
//
//  Created by 王远东 on 2023/10/12.
//

#import "ViewController.h"
#import "DyldBuild.h"
#import "YDiOSStudy-Swift.h"
#import "YDSVProgressHUD/YDProgressHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"iOS 小册子";
    
}

- (IBAction)onClickObjC:(id)sender {
    DyldBuild *dyldBuild = [[DyldBuild alloc] init];
//    [dyldBuild build];
    [dyldBuild systemBuild];
}

- (IBAction)onClickSwift:(id)sender {
    [self.navigationController pushViewController:[[SwiftListViewController alloc] init] animated:YES];
}
@end
