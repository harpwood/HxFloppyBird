package objects;

import flixel.FlxG;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxSprite;

class Bird extends FlxSprite {

    public static inline var GRAVITY:Int = 620;
    public static inline var FLAP_SPEED:Int = 250;
    
    var flapTimer:Float = 0;
    public var isDead(default, default):Bool = false;
    
    public function new(?X:Float = 0, ?Y:Float = 0, ?SimpleGraphic:FlxGraphicAsset) {
        super(X, Y, SimpleGraphic);

        loadGraphic("assets/images/bird.png", true, 32, 32);
        animation.add("idle", [0], 1, true);
        animation.add("flap", [0, 1, 2, 3, 4, 5], 30, true);
        animation.add("flying", [0, 1, 2, 3, 4, 5], 15, true);
        animation.play("flying");

        maxVelocity.set(0, FLAP_SPEED);
        
    }

    override public function update(elapsed:Float){
        super.update(elapsed);

        if(!isDead){
            flapTimer = flapTimer > 0 ? flapTimer - elapsed : 0;
            
            if(flapTimer > 0){
                velocity.y = -0.6 * maxVelocity.y;
            }
            if (flapTimer <= 0 && animation.name != "flying") animation.play("idle");

            angle += velocity.y * .02;
            
            if (angle != 0) angle = angle > 0 ? Math.min(angle, 45) : Math.max(angle, -45);
        }

        if (y >= FlxG.height - 75) {
            loose();
            acceleration.y = 0;
            velocity.y = 0;
        }

        if (y < 0) { 
            y = 0;
            velocity.y = 0;
        }

       
    }

    public function flap() {
      
        if(!isDead){
            if (acceleration.y == 0) acceleration.y = GRAVITY;
            
            if (animation.name != "flap") animation.play("flap");
            flapTimer = .2;
        }
        
    }

    public function loose() {
        
        if (!isDead){
            animation.play("idle");
            isDead = true;
         }

    }

    public function resetBird() {
        setPosition(FlxG.width * .25, FlxG.height * .4);
        isDead = false;
        angle = 0;
        acceleration.y = 0;
        velocity.y = 0;
        animation.play("flying");
    }
}