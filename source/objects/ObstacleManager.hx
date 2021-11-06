package objects;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;

class ObstacleManager extends FlxTypedGroup<FlxTypedGroup<FlxSprite>>{

    public var canScroll(default, default):Bool = true;
    
    public function new() {
        super();

    }

    public function addObstacle(){
		
        if(canScroll){

            var obs:Obstacle = cast(this.getFirstDead(), Obstacle);
            if (obs == null){

                obs = new Obstacle();
                add(obs);
                obs.canScroll = canScroll;
            }
            else {
                obs.revive();
                obs.resetPosition();
            }

            trace("obstacles count: " + this.length);
        }
        else trace("Obstacle did not created");

	}

    public function hasTouched(bird:Bird):Bool {

        for(i in 0...this.length){
			var obs:Obstacle = cast(this.members[i], Obstacle);

			if (obs.hasTouched(bird)) return true;
		}
        
        return false;
    }

    public function hasPassed(bird:Bird):Bool {
        var passed:Bool = false;
        for(i in 0...this.length){
			var obs:Obstacle = cast(this.members[i], Obstacle);
            if(obs.hasPassed(bird) && obs.alive){
                passed = true;
                break;
            }
        } 
        return passed;
    }

    public function enableScroll(canScroll:Bool) {

        this.canScroll = canScroll;

        for(i in 0...this.length){
			var obs:Obstacle = cast(this.members[i], Obstacle);

			obs.canScroll = canScroll;
		}
    }

    public function killAll() {
        for(i in 0...this.length){
            var obs:Obstacle = cast(this.members[i], Obstacle);
            obs.canScroll = false;
            for(j in 0...obs.length){
                var k = obs.members[j];
                k.x = FlxG.width;
            }
            obs.kill();
        }
    }

}