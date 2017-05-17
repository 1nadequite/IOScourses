#import <UIKit/UIKit.h>

@interface LicenseViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextView *licenseTextView;
@property (retain, nonatomic) IBOutlet UIButton *doneButton;

- (IBAction)doneButtonTapped:(id)sender;

@end
