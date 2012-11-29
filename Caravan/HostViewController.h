//
//  HostViewController.h
//  Caravan
//
//  Created by Danny Cook on 11/5/12.
//  Copyright (c) 2012 Danny Cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface HostViewController : UIViewController <MFMailComposeViewControllerDelegate,
MFMessageComposeViewControllerDelegate, UINavigationControllerDelegate> {
    IBOutlet UILabel *feedbackMsg;
}
- (IBAction)showMailPicker:(id)sender;
- (IBAction)showSMSPicker:(id)sender;
- (void)displayMailComposerSheet;
- (void)displaySMSComposerSheet;
@property (weak, nonatomic) IBOutlet UILabel *feedbackMsg;

@end
