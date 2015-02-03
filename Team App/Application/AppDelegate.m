#import "AppDelegate.h"
#import "AppDelegate+Private.h"

NSString * const URLSchemePageNumberKey = @"pageNumber";
NSString * const URLSchemeSectionNameKey = @"sectionName";

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self configureAppearanceProperties];
    
    self.rootViewController = [[RootViewController alloc] init];
    self.rootViewController.showsReturnButton = NO;
    
    self.window.rootViewController = self.rootViewController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)configureAppearanceProperties
{
    UIColor *burgundy = [UIColor colorWithRed:186.0 / 255.0 green:53.0 / 255.0 blue:65.0 / 255.0 alpha:1.0];
    
    [[UINavigationBar appearance] setBarTintColor:burgundy];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],
                                                           NSFontAttributeName : [UIFont fontWithName:@"MuseoSlab-700" size:22.0]}];
    [[UINavigationBar appearance] setTranslucent:NO];
    
    [[UITabBar appearance] setTintColor:burgundy];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    self.rootViewController.showsReturnButton = NO;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    NSString *queryString = [url query];
    NSArray *components = [queryString componentsSeparatedByString:@"&"];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    for (NSString *component in components)
    {
        NSArray *subcomponents = [component componentsSeparatedByString:@"="];
        [parameters setObject:subcomponents[1] forKey:subcomponents[0]];
    }
    
    NSString *sectionName = parameters[URLSchemeSectionNameKey];
    NSInteger pageNumber = [parameters[URLSchemePageNumberKey] integerValue];
    
    
    if ([sectionName isEqualToString:@"roster"])
    {
        [self.rootViewController.tabBarController setSelectedIndex:1];
    }
    else if ([sectionName isEqualToString:@"schedule"])
    {
        [self.rootViewController.tabBarController setSelectedIndex:2];
    }
    else
    {
        [self.rootViewController.tabBarController setSelectedIndex:0];
        
        UINavigationController *statsNavigationController = (UINavigationController *)self.rootViewController.tabBarController.selectedViewController;
        StatsViewController *statsViewController = [statsNavigationController.viewControllers firstObject];
        
        [statsViewController selectPageAtIndex:pageNumber];
    }
    
    self.rootViewController.showsReturnButton = YES;
    
    return YES;
}

@end
