package objects;

import flixel.math.FlxPoint;
import flixel.FlxG;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.FlxSprite;

class Background extends FlxTypedSpriteGroup<FlxSprite> {

    public var canScroll(default, default):Bool = false;
   // private var plx1:FlxSprite;
    private var plx2a:FlxSprite;
    private var plx2b:FlxSprite;
    private var plx3a:FlxSprite;
    private var plx3b:FlxSprite;
    private var plx4a:FlxSprite;
    private var plx4b:FlxSprite;
    private var plx5a:FlxSprite;
    private var plx5b:FlxSprite;

   
    public function new()
    {
        super();

       // plx1 = new FlxSprite();
       // plx1.loadGraphic("assets/images/plx/plx-1.png", false, 384, 216);
       // add(plx1);

     
        plx2a = new FlxSprite();
        plx2a.loadGraphic("assets/images/plx/plx-2.png", false, 384, 216);
        add(plx2a);
        
        plx2b = new FlxSprite(plx2a.width);
        plx2b.loadGraphic("assets/images/plx/plx-2.png", false, 384, 216);
        add(plx2b);

        plx3a = new FlxSprite();
        plx3a.loadGraphic("assets/images/plx/plx-3.png", false, 384, 216);
        add(plx3a);
        plx3b = new FlxSprite(plx3a.width);
        plx3b.loadGraphic("assets/images/plx/plx-3.png", false, 384, 216);
        add(plx3b);

        plx4a = new FlxSprite();
        plx4a.loadGraphic("assets/images/plx/plx-4.png", false, 384, 416);
        add(plx4a);
        plx4b = new FlxSprite(plx4a.width);
        plx4b.loadGraphic("assets/images/plx/plx-4.png", false, 384, 416);
        add(plx4b);

        plx5a = new FlxSprite();
        plx5a.loadGraphic("assets/images/plx/plx-5.png", false, 384, 416);
        add(plx5a);
        plx5b = new FlxSprite(plx5a.width);
        plx5b.loadGraphic("assets/images/plx/plx-5.png", false, 384, 416);
        add(plx5b);

         var _scaleFactor = FlxG.height / plx2a.height;
         var _scale:FlxPoint = new FlxPoint(_scaleFactor, _scaleFactor);
        // plx1.scale = _scale;
        // plx1.updateHitbox();
        // plx1.y = FlxG.height - plx1.height;

        plx2a.scale = _scale;
        plx2a.updateHitbox();
        plx2a.y = FlxG.height - plx2a.height;
        plx2b.scale = _scale;
        plx2b.updateHitbox();
        plx2b.y = FlxG.height - plx2b.height;

        plx3a.scale = _scale;
        plx3a.updateHitbox();
        plx3a.y = FlxG.height - plx3a.height;
        plx3b.scale = _scale;
        plx3b.updateHitbox();
        plx3b.y = FlxG.height - plx3b.height;

        plx4a.scale = _scale;
        plx4a.updateHitbox();
        plx4a.y = FlxG.height - plx4a.height;
        plx4b.scale = _scale;
        plx4b.updateHitbox();
        plx4b.y = FlxG.height - plx4b.height;

        plx5a.scale = _scale;
        plx5a.updateHitbox();
        plx5a.y = FlxG.height - plx5a.height;
        plx5b.scale = _scale;
        plx5b.updateHitbox();
        plx5b.y = FlxG.height - plx5b.height;

    }
    
    override function update(elapsed:Float) {
        if (canScroll){
            var vel:Float = .1;
     
           plx2a.x -= vel;
           plx2b.x -= vel;

           if (plx2a.x <= -plx2a.width) plx2a.x = plx2b.x + plx2a.width - 2;
           if (plx2b.x <= -plx2b.width) plx2b.x = plx2a.x + plx2b.width;

            vel = .2;
            plx3a.x -= vel;
            plx3b.x -= vel;

            if (plx3a.x <= -plx3a.width) plx3a.x = plx3b.x + plx3b.width;
            if (plx3b.x <= -plx3b.width) plx3b.x =  plx3a.x +plx3b.width;

            vel = .4;
            plx4a.x -= vel;
            plx4b.x -= vel;

            if (plx4a.x <= -plx4a.width) plx4a.x = plx4b.x + plx4a.width;
            if (plx4b.x <= -plx4b.width) plx4b.x = plx4a.x + plx4b.width;

            vel = .8;
            plx5a.x -= vel;
            plx5b.x -= vel;
            
            if (plx5a.x <= -plx5a.width) plx5a.x = plx5b.x + plx5a.width;
            if (plx5b.x <= -plx5b.width) plx5b.x = plx5a.x + plx5b.width;

            
        }
    }
}