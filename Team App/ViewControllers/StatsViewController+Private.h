#pragma mark - Private Interface

/// The private interface for the class.
///
@interface StatsViewController ()

#pragma mark - Private Properties

/// The index of the currently displayed page.
///
@property (nonatomic, assign) NSUInteger displayedPage;

#pragma mark - IBOutlet Properties

/// The label displaying the current page.
///
@property (nonatomic, weak) IBOutlet UILabel *label;

/// The segmented control that allows switching between pages.
///
@property (nonatomic, weak) IBOutlet UISegmentedControl *segmentedControl;

/// The container view that houses the segmented control.
///
@property (nonatomic, weak) IBOutlet UIView *segmentedControlContainer;

/// This method is invoked when the segmented control is tapped.
///
- (IBAction)segmentedControlTapped:(UISegmentedControl *)sender;

@end