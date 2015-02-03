#import "RosterViewController.h"
#import "ScheduleViewController.h"
#import "StatsViewController.h"

#pragma mark - Private Interface

/// The private interface for the class.
///
@interface RootViewController ()

#pragma mark - Private Properties

/// The button that returns the user to the Bleachr app on tap.
///
@property (nonatomic, weak) IBOutlet UIButton *returnButton;

/// The container view for the return button.
///
@property (nonatomic, weak) IBOutlet UIView *returnButtonContainer;

/// The height of the return button container.
///
@property (nonatomic, assign) CGFloat returnButtonContainerHeight;

/// The constraint that sets the height of the return button container.
///
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *returnButtonContainerHeightConstraint;

#pragma mark - Private IBAction Methods

/// Invoked with the user taps the return button. This method switches the foreground app back to
/// the Bleachr app.
///
- (IBAction)returnButtonPressed:(id)sender;

@end