package objects;

import flixel.FlxG;
import flixel.math.FlxRandom;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxSprite;

class Obstacle extends FlxTypedGroup<FlxSprite>{
    
    inline static var obstacleGap = 90;
    public var canScroll(default, default):Bool = false;
   
    var topObstacle:FlxSprite;
    var botObstacle:FlxSprite;
    var passed:Bool = false;
    var random:FlxRandom = new FlxRandom();
    
    public function new() {
        super();

        topObstacle = new FlxSprite(FlxG.width, 0, AssetPaths.obs__png);
        botObstacle = new FlxSprite(FlxG.width, 0, AssetPaths.obs__png);
        
        randomGapHeight();

        add(topObstacle);
        add(botObstacle);
    }

    override function update(elapsed:Float) {
        if (canScroll && alive){
            topObstacle.x -= 1;

            if (topObstacle.x + topObstacle.width < 0) {
               
                this.kill();
            }

            botObstacle.x = topObstacle.x;
        }

        super.update(elapsed); 
    }

    public function resetPosition() {
        forEach(sprite -> sprite.setPosition(FlxG.width, 0));
        randomGapHeight();
        passed = false;
     }

    public function hasPassed(bird:Bird):Bool {
        if (bird.x > topObstacle.x + topObstacle.width && !passed && alive) {
            passed = true;
            return true;
        } 
        return false;
    }

    public function hasTouched(bird:Bird) {
       
        return FlxG.pixelPerfectOverlap(bird, topObstacle) || FlxG.pixelPerfectOverlap(bird, botObstacle);
    }

    private function randomGapHeight() {
        topObstacle.y = random.int(50, 250) - topObstacle.height;
        botObstacle.y = topObstacle.y + topObstacle.height + obstacleGap;
    }


}