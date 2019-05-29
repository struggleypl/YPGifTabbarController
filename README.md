# YPGifTabbarController
gifTabbar
支持git图片
接入简单，低耦合

+ (GifTabBarController *)rootViewController {
    UIViewController *first = [[FirstViewController alloc] init];
    SecondViewController *third = [[SecondViewController alloc] init];
    ThirdViewController *fourth = [[ThirdViewController alloc] init];
    
    NSURL *url1 = [[NSBundle mainBundle] URLForResource:@"btn_overview" withExtension:@"gif"];
//    NSURL *url2 = [[NSBundle mainBundle] URLForResource:@"btn_transfer" withExtension:@"gif"];
    NSURL *url3 = [[NSBundle mainBundle] URLForResource:@"btn_fx" withExtension:@"gif"];
    NSURL *url4 = [[NSBundle mainBundle] URLForResource:@"btn_mine" withExtension:@"gif"];

    GifTabBarItem *oneTabBarItem = [[GifTabBarItem alloc]initWithTitle:@"首页" gifUrlString:[url1 absoluteString] navigation:[self navigation:first] viewController:first normalImage:[UIImage imageNamed:@"tabbar_overview_normal"] selectedImage:[UIImage imageNamed:@"tabbar_overview_select"]];
    
//    GifTabBarItem *twoTabBarItem = [[GifTabBarItem alloc]initWithTitle:WLTString(@"Tabbar_Transaction") gifUrlString:[url2 absoluteString] navigation:[self navigation:second] viewController:second normalImage:[UIImage imageNamed:@"tabbar_transaction_normal"] selectedImage:[UIImage imageNamed:@"tabbar_transaction_select"]];
    
    GifTabBarItem *threeTabBarItem = [[GifTabBarItem alloc]initWithTitle:@"发现" gifUrlString:[url3 absoluteString] navigation:[self navigation:third] viewController:third normalImage:[UIImage imageNamed:@"tabbar_find_normal"] selectedImage:[UIImage imageNamed:@"tabbar_find_select"]];
    
    GifTabBarItem *fourTabBarItem = [[GifTabBarItem alloc]initWithTitle:@"我的" gifUrlString:[url4 absoluteString] navigation:[self navigation:fourth] viewController:fourth normalImage:[UIImage imageNamed:@"tabbar_mine_normal"] selectedImage:[UIImage imageNamed:@"tabbar_mine_select"]];
    
    NSArray *tabItems = @[oneTabBarItem,threeTabBarItem,fourTabBarItem];
    GifTabBarController *tab = [[GifTabBarController alloc] initWithTabItems:tabItems];
    [WLTRootManager manager].tabbarController = tab;
    return tab;
}
