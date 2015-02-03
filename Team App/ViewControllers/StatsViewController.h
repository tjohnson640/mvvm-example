#pragma mark - Interface

/// This class displays team statistics.
///
@interface StatsViewController : UIViewController

/// This method selects a page of statistics at a given index.
///
/// @param pageIndex
///     The index ofthe page to select.
///
- (void)selectPageAtIndex:(NSUInteger)pageIndex;

@end
