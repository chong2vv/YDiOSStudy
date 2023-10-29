//
//  ViewController.m
//  YDiOSStudy
//
//  Created by 王远东 on 2023/10/12.
//

#import "ViewController.h"
#import "DyldBuild.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (IBAction)onClickObjC:(id)sender {
    DyldBuild *dyldBuild = [[DyldBuild alloc] init];
//    [dyldBuild build];
    [dyldBuild systemBuild];
}

- (IBAction)onClickSwift:(id)sender {
    
}
@end
