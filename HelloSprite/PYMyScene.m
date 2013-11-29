//
//  PYMyScene.m
//  HelloSprite
//

#import "PYMyScene.h"

@implementation PYMyScene

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
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
