//
//  ViewController2.m
//  KVC
//


#import "ViewController2.h"

@interface Animal: NSObject
@property (nonatomic,assign)CGFloat  height;
@end

@implementation Animal
@end

@interface Person:NSObject{
    @public
    Animal  *_aimal;
}
@property (nonatomic,strong)NSString  *name;
@end

@implementation Person{
    NSString *_address;
     Animal  *_aimal2;
}

-(instancetype)init{
    if(self = [super init]){
        self->_aimal2 = [[Animal alloc]init];
    }
    return self;
}
-(void)setName:(NSString *)name{
    _name = name;
}
@end

@interface ViewController2 ()
@property (nonatomic,strong)Person  *p;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.p = [Person new];
    self.p->_aimal = [[Animal alloc]init];
    
    [self.p addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.p addObserver:self forKeyPath:@"_address" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.p addObserver:self forKeyPath:@"_aimal.height" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.p addObserver:self forKeyPath:@"_aimal2.height" options:NSKeyValueObservingOptionNew context:nil];
}

//使用kvc来赋值 触发了KVO
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
     [self.p setValue:@"Lucy" forKey:@"name"];//设置property外部属性
     [self.p setValue:@"Beijing" forKey:@"_address"];//设置内部的成员属性
     [self.p setValue:@(1.888) forKeyPath:@"_aimal.height"];//设置外部成员对象里面的属性
     [self.p setValue:@(2.999) forKeyPath:@"_aimal2.height"];///设置内部的成员对象里面的属性
    
    NSLog(@"---------------");
    
    //获取
    NSLog(@"%@",[self.p valueForKey:@"name"]);
    NSLog(@"%@",[self.p valueForKey:@"_address"]);
    NSLog(@"%@",[self.p valueForKeyPath:@"_aimal.height"]);
    NSLog(@"%@",[self.p valueForKeyPath:@"_aimal2.height"]);
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"KVO监听到了属性%@的变化了%@",keyPath,change);
}
-(void)dealloc{
    [self.p removeObserver:self forKeyPath:@"name"];
    [self.p removeObserver:self forKeyPath:@"_address"];
    [self.p removeObserver:self forKeyPath:@"_aimal.height"];
    [self.p removeObserver:self forKeyPath:@"_aimal2.height"];
    NSLog(@"%s",__FUNCTION__);
}

@end
