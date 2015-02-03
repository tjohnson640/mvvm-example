#pragma mark - Interface

/// The root application view controller. Handles display of the tab bar controller and the return
/// button bar.
///
@interface RootViewController : UIViewController

#pragma mark - Properties

/// The main tab bar controller.
///
@property (nonatomic, strong) UITabBarController *tabBarController;

/// A boolean value that toggles the return button bar. Setting YES will display the button bar,
/// setting NO will hide the bar.
///
@property (nonatomic, assign) BOOL showsReturnButton;

@end
