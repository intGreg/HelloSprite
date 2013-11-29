//
//  PYMyScene.m
//  HelloSprite
//

#import "PYMyScene.h"

@interface PYMyScene()
@property(nonatomic) SKSpriteNode *sprite;

@end

@implementation PYMyScene

@synthesize sprite = _sprite;

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        
        // Set background image
        SKSpriteNode *snField = [SKSpriteNode spriteNodeWithImageNamed:@"SoccerField.gif"];
        snField.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        snField.size = CGSizeMake(400,240);
        snField.name = @"BACKGROUND";
        [self addChild:snField];
        
        // Create the sprite
        if (!self.sprite) {
            self.sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
            self.sprite.size = CGSizeMake(15, 15);
            self.sprite.position = CGPointMake(0, 0);
            [self addChild:self.sprite];
        }
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        // Location of the touch
        CGPoint location = [touch locationInNode:self];
    
        // Create action to move to touch location
        SKAction *action = [SKAction moveTo:location duration:1];
        [self.sprite runAction:[SKAction repeatActionForever:action]];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
