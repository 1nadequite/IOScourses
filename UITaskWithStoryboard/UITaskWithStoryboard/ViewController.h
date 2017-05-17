#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, assign) IBOutlet UILabel *firstNameLabel;
@property (nonatomic, assign) IBOutlet UILabel *lastNameLabel;
@property (nonatomic, assign) IBOutlet UILabel *fullNameLabel;
@property (nonatomic, assign) IBOutlet UITextField *firstNameTextField;
@property (nonatomic, assign) IBOutlet UITextField *lastNameTextField;
@property (nonatomic, assign) IBOutlet UIButton *helloButton;

- (IBAction)helloButtonTapped:(id)sender;

@end
