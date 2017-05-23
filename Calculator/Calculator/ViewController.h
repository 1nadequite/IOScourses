#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (retain, nonatomic) IBOutlet UILabel *displayLabel;
@property (retain, nonatomic) IBOutletCollection(UIButton) NSArray *digitCollectionButtons;
@property (retain, nonatomic) IBOutlet UIButton *clearButton;
@property (retain, nonatomic) IBOutlet UIButton *dotButton;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *aboutBarButtonItem;
@property (retain, nonatomic) IBOutlet UIButton *licenseButton;
@property (assign, nonatomic, getter=isNumberFloat) BOOL numberFloat;

- (IBAction)digitCollectionButtonTapped:(id)sender;
- (IBAction)clearButtonTapped:(id)sender;
- (IBAction)dotButtonTapped:(id)sender;
- (void)swipeRight:(UISwipeGestureRecognizer*)gestureRecognizer;
- (IBAction)aboutButtonTapped:(id)sender;
- (IBAction)licenseButtonTapped:(id)sender;

@end

