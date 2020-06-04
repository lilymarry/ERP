

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageHelper : NSObject
+(UIImage*)zipAndStoreTheChoosedImageWithController:(UIImagePickerController *)picker AndInfo:(NSDictionary *)info;
+(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;
@end
