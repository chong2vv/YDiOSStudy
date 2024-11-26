//
//  YDOCListViewController.m
//  YDiOSStudy
//
//  Created by 王远东 on 2024/11/26.
//

#import "YDOCListViewController.h"
#import "YDiOSStudy-Swift.h"
#import "Masonry.h"
#import "YDOCBaseViewController.h"

@interface YDOCListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *homeTableView;

@property (nonatomic, copy) NSArray *data;

@end

@implementation YDOCListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configData];
    [self configUI];
    
}

- (void)configData {
    
    self.data = @[
        @"OC特性相关",
        @"Runtime相关",
        @"内存管理相关"
    ];
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
    return self.data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell ydCellWithTableView:self.homeTableView identifier:@"YDOCTableView"];
    NSString *title = self.data[indexPath.row];
    cell.textLabel.text = title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *key = self.data[indexPath.row];
    YDOCBaseViewController *vc;
    vc = [YDOCBaseViewController creatVC:key];
    
    [self.navigationController pushViewController:vc animated:YES];
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
