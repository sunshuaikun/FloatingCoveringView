//
//  ViewController.m
//  FloatingCoveringView
//
//  Created by sunshuaikun on 17/3/13.
//  Copyright © 2017年 sunshuaikun. All rights reserved.
//

#import "ViewController.h"
#import "SKFloatingCoveringView.h"

@interface ViewController (){
    UITextView *_floatTextViewContent;
}
@property (nonatomic,strong) SKFloatingCoveringView *floatingView;
@property (nonatomic,strong) UITextView             *textViewContent;
@end

@implementation ViewController

- (void)loadView
{
    [super loadView];
    [self.view addSubview:self.textViewContent];
    [self.textViewContent setText:@"Shared bikes must be scrapped after three years of use and have a GPS positioning function, and children under the age of 12 will be banned from using the bikes, according to draft regulations from Shanghai government.Shanghai government said that an investigation has showed that the bikes produced under current national standards might have potential safety problems after being in high demand and over long distances.The draft rules showed that shared bikes must be produced to meet national standards and be scrapped after three years' use. Parts from scrapped bikes cannot be used to assemble new bikes. Privately owned bikes are banned from the service.The investigation also showed that companies put too many bikes on the market as there aren't enough workers for management and maintenance. Problems also include misplacing bikes and the unclear management of cash deposits.Guo Jianrong, secretary-general of the Shanghai Bicycle Association, said that misplacing bikes is a big problem in urban management, and Shanghai government is expected to offer parking places for shared bikes.The draft regulations require shared bikes to be installed with positioning devices, which would help the companies and users find the bikes, Gou said. He said that some companies now can't even find their own bikes.Guo pointed out that some companies focus on putting new bikes on the market and leave old ones on the streets, occupying public spaces. He suggested the companies should put bikes in both downtown areas and the suburbs.The companies should have enough workers to manage their bikes on the streets, and the standard should follow 50 service workers for each 10,000 shared bikes, compared with 100 servicemen for each 10,000 bikes at fixed pick-up points, Guo said.The draft regulations also include that 95 percent of shared bikes on the market must be in good condition and 98 percent of the batteries on electric bikes must be good.Bike share users should be from 1.45 meters to 1.95 meters tall and ages 12 to 70. People over 70 must provide their health documentation to apply to use the bikes.Companies must repay users' cash deposits within seven days after users meet requirements.Bike sharing apps also should be compatible to other sharing services."];
    [self.view addSubview:self.floatingView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dropDownNotification:) name:KDragNotification object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)dropDownNotification:(NSNotification*)notification{
    NSDictionary *nameDictionary = [notification userInfo];
    CGFloat myHight = [[nameDictionary objectForKey:@"myHeight"] floatValue];
    _textViewContent.frame = CGRectMake(0, 10, self.view.frame.size.width, myHight);
    _floatingView.frame = CGRectMake(0, [[nameDictionary objectForKey:@"myHeight"] floatValue], self.view.frame.size.width,
                                     self.view.frame.size.height-[[nameDictionary objectForKey:@"myHeight"] floatValue]);
    _floatTextViewContent.frame = CGRectMake(0, KDragviewHeight, SCREEN_MAIN_WIDTH, _floatingView.frame.size.height-KDragviewHeight);
}

- (UITextView*)textViewContent
{
    if (_textViewContent == nil) {
        _textViewContent = [[UITextView alloc] initWithFrame:CGRectMake(0, 10, self.view.frame.size.width, SCREEN_MAIN_HEIGHT-KDragviewHeight)];
        [_textViewContent setFont:[UIFont systemFontOfSize:14.0f]];
        [_textViewContent setTextColor:[UIColor darkTextColor]];
        _textViewContent.editable = NO;
        _textViewContent.backgroundColor =  RGB(240, 240, 240);
    }
    return  _textViewContent;
}

- (SKFloatingCoveringView *)floatingView{
    if (_floatingView == nil) {
        _floatingView = [[SKFloatingCoveringView alloc]
                         initWithFrame:CGRectMake(0, 275, self.view.frame.size.width,
                                                  self.view.frame.size.height-275)];
        _floatingView.backgroundColor = [UIColor whiteColor];
        
        _floatTextViewContent = [[UITextView alloc] initWithFrame:CGRectMake(0, KDragviewHeight, SCREEN_MAIN_WIDTH, _floatingView.frame.size.height-KDragviewHeight)];
        [_floatTextViewContent setFont:[UIFont systemFontOfSize:14.0f]];
        [_floatTextViewContent setTextColor:[UIColor redColor]];
        _floatTextViewContent.editable = NO;
        _floatTextViewContent.backgroundColor = RGB(213, 235, 217);
        [_floatTextViewContent setText:@"共享自行车必须报废，使用三年后，有一个GPS定位功能，和12岁以下的儿童将被禁止使用自行车，根据条例草案，上海政府，上海政府说调查表明，自行车生产国家现行标准下可能是在高需求和长距离后有潜在的安全问题。草案显示，共享自行车必须生产出满足国家标准和报废三年后使用。从报废自行车零件不能用来组装新的自行车。调查显示，由于没有足够的工人进行管理和维护，企业在市场上投入了太多的自行车。问题还包括乱放自行车和现金存款不清楚管理。郭建荣的上海自行车协会秘书长说，乱放自行车是城市管理的一大难题，上海政府预计将共享自行车提供停车场所。草案规定需要共享自行车安装定位设备，这将有助于企业和用户找到自行车，Gou说。他说，有些公司现在甚至找不到自己的自行车，郭指出，一些公司专注于投放市场上的新自行车，把旧的街道上，占据公共空间。他建议，企业应该把自行车在市区和郊区，公司应该有足够的工人来管理街上的自行车，和标准应遵循50个服务人员每10000共享自行车，与100名军人每10000自行车在固定的接送点，郭说，条例草案还包括的共享自行车市场上百分之95必须处于良好的状态和电池电动自行车百分之98必须好。自行车分享用户应该从1.45米到1.95米的身高和年龄在12到70。超过70岁的人必须提供他们的健康文件来申请使用自行车.公司必须在用户满足要求后的七天内偿还用户的现金存款。"];
        [_floatingView addSubview:_floatTextViewContent];
    }

    return _floatingView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
