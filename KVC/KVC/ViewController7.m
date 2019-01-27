//
//  ViewController7.m
//  KVC
//


#import "ViewController7.h"


@interface ClassOne:NSObject{
@public
    NSString *_name;
    NSString *_isName;
    NSString *name;
    NSString *isName;
}
@end
@implementation ClassOne
@end

@interface ClassTwo:ClassOne
//@property (nonatomic,strong)NSString  *name;
@end
@implementation ClassTwo

//-(NSString*)getName{
//    return @"getName";
//}
//
//- (NSString *)name{
//    return @"name";
//}

//-(NSString*)isName{
//    return @"isName";
//}

-(id)valueForUndefinedKey:(NSString *)key{
    return @"UndefinedKey";
}

+(BOOL)accessInstanceVariablesDirectly{
    return YES;
}

@end


//==================

@interface ViewController7 ()

@end

@implementation ViewController7

- (void)viewDidLoad {
    [super viewDidLoad];
    ClassTwo *two = [[ClassTwo alloc]init];
    [two setValue:@"jack" forKey:@"name"];
    
    //KVC取值验证
    NSLog(@"%@",[two valueForKey:@"name"]);
    
    NSLog(@"======================");
    NSLog(@"_name%@",two->_name);
    NSLog(@"_isName%@",two->_isName);
    NSLog(@"name%@",two->name);
    NSLog(@"isName%@",two->isName);
}

@end
