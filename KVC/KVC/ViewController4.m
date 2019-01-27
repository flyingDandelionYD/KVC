//
//  ViewController4.m
//  KVC
//


#import "ViewController4.h"

@interface Person_:NSObject
@property (nonatomic,strong)NSString  *name;
@end

@implementation Person_
-(void)setName:(NSString *)name{
    _name = name;
}
@end

@interface ViewController4 ()

@property (nonatomic,strong)Person_  *p;
@end

@implementation ViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    self.p = [Person_ new];
    [self.p addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
}

//使用kvc来赋值 触发了KVO
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.p setValue:@"Lucy" forKey:@"name"];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"KVO监听到了属性%@的变化了%@",keyPath,change);
}

-(void)dealloc{
    [self.p removeObserver:self forKeyPath:@"name"];
    NSLog(@"%s",__FUNCTION__);
}

@end
