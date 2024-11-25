//
//  YDOCListViewController.m
//  YDiOSStudy
//
//  Created by 王远东 on 2024/11/26.
//

#import "YDOCListViewController.h"
#import "YDiOSStudy-Swift.h"
#import "Masonry.h"

@interface YDOCListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *homeTableView;

@property (nonatomic, copy) NSDictionary *groupData;

@end

@implementation YDOCListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configData];
    [self configUI];
    
}

- (void)configData {
    self.groupData = @{
        @"OC特性相关": @[@"语法基础", @"基础类型", @"类和结构体"],
        @"Runtime相关": @[@"222", @"基3", @"类和结4"],
        @"Swift语法": @[@"语s础", @"基s型", @"a构体"]
    };
}

- (void)configUI {
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.homeTableView];
    [self.homeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
    }];
    
    [self.homeTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *keys = self.groupData.allKeys;
    NSString *key = keys[section];
    NSArray *list = self.groupData[key];
    return list.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groupData.allKeys.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *key = self.groupData.allKeys[section];
    return key;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell ydCellWithTableView:self.homeTableView identifier:@"YDOCTableView"];
    NSArray *keys = self.groupData.allKeys;
    NSString *key = keys[indexPath.section];
    NSArray *list = self.groupData[key];
    NSString *title = list[indexPath.row];
    cell.textLabel.text = title;
    return cell;
}

- (UITableView *)homeTableView {
    if (_homeTableView == nil) {
        _homeTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _homeTableView.delegate = self;
        _homeTableView.dataSource = self;
    }
    return _homeTableView;
}

@end
