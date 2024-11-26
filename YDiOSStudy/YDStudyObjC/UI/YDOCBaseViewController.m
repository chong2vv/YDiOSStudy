//
//  YDOCBaseViewController.m
//  YDiOSStudy
//
//  Created by 王远东 on 2024/11/26.
//

#import "YDOCBaseViewController.h"
#import "YDiOSStudy-Swift.h"
#import "Masonry.h"
#import "YDOCBaseViewController+YDOCRuntime.h"

@interface YDOCBaseViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *homeTableView;
@property (nonatomic, copy) NSString *type;

@end

@implementation YDOCBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configData];
    [self configUI];
}

+ (YDOCBaseViewController *) creatVC:(NSString *) type {
    YDOCBaseViewController *vc = [[YDOCBaseViewController alloc] init];
    vc.type = type;
    return vc;
}

- (void)configData {
    if ([self.type isEqual:@"OC特性相关"]) {
        
    }else if ([self.type isEqual:@"Runtime相关"]) {
        [self loadRuntimeData];
    }
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
    UITableViewCell *cell = [UITableViewCell ydCellWithTableView:self.homeTableView identifier:@"YDOCBaseTableView"];
    NSString *title = self.data[indexPath.row];
    cell.textLabel.text = title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *title = self.data[indexPath.row];
    if ([self.type isEqual:@"OC特性相关"]) {
        
    }else if ([self.type isEqual:@"Runtime相关"]) {
        [self didRuntimeTypeClick:title];
    }
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
