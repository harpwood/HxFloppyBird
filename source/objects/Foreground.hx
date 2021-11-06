package objects;

import flixel.math.FlxPoint;
import flixel.FlxG;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.FlxSprite;

class Foreground extends FlxTypedSpriteGroup<FlxSprite> {

    public var canScroll(default, default):Bool = false;

    private var dirt1:FlxSprite;
    private var dirt2:FlxSprite;

    public function new() {
        super();
    
        dirt1 = new FlxSprite(0, FlxG.height - 50);
        dirt1.loadGraphic("assets/images/dirt.png", false, 160, 50);
        add(dirt1);
        dirt2 = new FlxSprite(dirt1.width, FlxG.height - 50);
        dirt2.loadGraphic("assets/images/dirt.png", false, 160, 50);
        add(dirt2);
    }

    override function update(elapsed:Float) {
        if (canScroll){
            var vel:Float = 1;
            
            dirt1.x -= vel;
            dirt2.x -= vel;

            if (dirt1.x == -dirt1.width) dirt1.x = dirt1.width;
            if (dirt2.x == -dirt2.width) dirt2.x = dirt2.width;
        }
    }
}
