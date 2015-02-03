#import "RootViewController.h"
#import "StatsViewController.h"

#pragma mark - Private Interface

/// The private interface for the class.
///
@interface AppDelegate ()

#pragma mark - Private Properties

/// The root application view controller.
///
@property (nonatomic, strong) RootViewController *rootViewController;

#pragma mark - Private Methods

/// This method adds appearance properties to global design elements such as the navigation bar.
///
- (void)configureAppearanceProperties;

@end