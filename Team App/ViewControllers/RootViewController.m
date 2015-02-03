#import "RootViewController.h"
#import "RootViewController+Private.h"

#pragma mark - Implementation

@implementation RootViewController

#pragma mark - Custom Accessors

- (void)setShowsReturnButton:(BOOL)showsReturnButton
{
    _showsReturnButton = showsReturnButton;
    
    self.returnButton.hidden = !_showsReturnButton;
    
    if (_showsReturnButton) {
        self.returnButtonContainerHeight = [UIApplication sharedApplication].statusBarFrame.size.height * 2;
    }
    else
    {
        self.returnButtonContainerHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    }
    
    if (self.returnButtonContainerHeightConstraint) {
        self.returnButtonContainerHeightConstraint.constant = self.returnButtonContainerHeight;
    }
}

#pragma mark - Private IBAction Methods

- (IBAction)returnButtonPressed:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"bleachr://"];
    
    if ([[UIApplication sharedApplication] canOpenURL:url])
    {
        [[UIApplication sharedApplication] openURL:url];
    }
}

#pragma mark - UIViewController Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.returnButtonContainerHeightConstraint.constant = self.returnButtonContainerHeight;
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    RosterViewController *roster = [[RosterViewController alloc] init];
    UINavigationController *rosterNavigationController = [[UINavigationController alloc] initWithRootViewController:roster];
    
    ScheduleViewController *schedule = [[ScheduleViewController alloc] init];
    UINavigationController *scheduleNavigationController = [[UINavigationController alloc] initWithRootViewController:schedule];
    
    StatsViewController *stats = [[StatsViewController alloc] init];
    UINavigationController *statsNavigationController = [[UINavigationController alloc] initWithRootViewController:stats];
    
    self.tabBarController.viewControllers = @[statsNavigationController, rosterNavigationController, scheduleNavigationController];
    
    [self addChildViewController:self.tabBarController];
    [self.view addSubview:self.tabBarController.view];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[button][tabBar]|"
                                                                      options:kNilOptions
                                                                      metrics:nil
                                                                        views:@{@"button" : self.returnButtonContainer, @"tabBar" : self.tabBarController.view}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tabBar]|"
                                                                      options:kNilOptions
                                                                      metrics:nil
                                                                        views:@{@"tabBar" : self.tabBarController.view}]];
    
    self.returnButtonContainer.backgroundColor = [[UINavigationBar appearance] barTintColor];
}

@end
