//
//  ViewController.m
//  KVC
//


#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView  *baseV;
@property (nonatomic,strong)NSArray  *sourcesArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"KVC";
    [self setUpUI];
}

-(NSArray*)sourcesArr{
    if(_sourcesArr==nil){
        _sourcesArr = @[
                        @"KVC修改属性触发KVO",
                        @"KVC过程探究",
                        @"为什么触发KVO?",
                        @"KVC的使用",
                        @"KVC设值详解",
                        @"KVC取值详解",
                        @"固定有序集合属性（NSArray）",
                        @"固定无序集合属性（NSSet)",
                        @"可变有序集合属性（NSMutableArray）",
                        @"可变无序集合属性（NSMutablSet)",
                        @"set/get异常处理",
                        @"键值验证",
                        @"非对象类型的处理",
                        @"集合操作符",
                        @"补充：可变有序集合（NSMutableOrderedSet）"
                        ];
    }
    return _sourcesArr;
}

-(void)setUpUI{
    self.baseV = [UITableView new];
    [self.view addSubview:self.baseV];
    self.baseV.frame = self.view.bounds;
    self.baseV.delegate =self;
    self.baseV.dataSource = self;
    self.baseV.tableFooterView  =[UIView new];
    self.baseV.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.baseV registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ViewController"];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.sourcesArr.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ViewController"];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld.%@",indexPath.row+2,self.sourcesArr[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Class cls =NSClassFromString([NSString stringWithFormat:@"ViewController%ld",indexPath.row+2]);
    UIViewController *vc = [[cls alloc] init];
    vc.title = [NSString stringWithFormat:@"%@_VC%ld",self.sourcesArr[indexPath.row],indexPath.row+2];
    vc.view.backgroundColor = UIColor.whiteColor;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
