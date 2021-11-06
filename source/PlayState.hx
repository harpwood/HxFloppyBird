package;

import flixel.text.FlxText;
import flixel.util.FlxColor;
import objects.ObstacleManager;
import objects.Foreground;
import objects.Bird;
import flixel.FlxG;
import objects.Background;
import flixel.FlxState;

class PlayState extends FlxState
{
	var bg:Background;
	var fg:Foreground;
	var bird:Bird;
	var obstacles:ObstacleManager;
	var obstacleTimer:Float = 0;
	var isGameOver:Bool = false;
	var statusText:FlxText;
	var scoreText:FlxText;
	var score:Int = 0;


	override public function create()
	{
		super.create();

		bgColor = FlxColor.TRANSPARENT;
		
		bg = new Background();
		add(bg);

		bg.canScroll = true;

		obstacles = new ObstacleManager();
		add(obstacles);

		obstacles.enableScroll(false);

		fg = new Foreground();
		add(fg);
		fg.canScroll = true;

		bird = new Bird(FlxG.width * .25, FlxG.height * .4);
		add(bird);

		scoreText = new FlxText(0, 0, 16, "0", 16);
		scoreText.color = FlxColor.RED;
		scoreText.alignment = FlxTextAlign.CENTER;
		add(scoreText);
		statusText = new FlxText(0, FlxG.height * .25, FlxG.width, "", 32);
		statusText.color = FlxColor.WHITE;
		statusText.alignment = FlxTextAlign.CENTER;
		statusText.text = "Ready?";
		add(statusText);

		
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);


		if (bird.y >= FlxG.height - 75) {
			isGameOver = true;
			stopScrolling();
		}

		if (FlxG.keys.justPressed.SPACE || FlxG.mouse.justPressed){ 
			
			if (isGameOver)	resetGame();
			else {
				statusText.text = " ";
				bird.flap();
				if (!obstacles.canScroll && !bird.isDead) obstacles.enableScroll(true);
			}
		}

		if(!isGameOver){
			obstacleTimer += elapsed;

			if (obstacleTimer > 4) {
				obstacles.addObstacle();
				obstacleTimer = 0;
			}

			if(obstacles.hasTouched(bird)) {
				stopScrolling();
				bird.loose();
			}

			if(obstacles.hasPassed(bird)){
				score++;
				scoreText.text = Std.string(score);
			}
			
		}

	}

	private function stopScrolling() {

		fg.canScroll = false;
		bg.canScroll = false;
		obstacles.enableScroll(false);
	}

	private function resetGame()
	{
		
		bird.resetBird();
		obstacles.killAll();
		isGameOver = false;
		bg.canScroll = true;
		fg.canScroll = true;
		score = 0;
		scoreText.text = Std.string(score);
		statusText.text = "Ready;";
			
	}
	
}
