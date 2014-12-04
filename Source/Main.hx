package;

import flash.display.Sprite;
import flash.events.Event;
import flash.display.BitmapData;
import flash.display.Bitmap;
import flash.geom.Rectangle;

import openfl.display.FPS;

class Main extends Sprite
{
	//===== Can be modified =====
	private static inline var TARGET_WIDTH  = 800;
    private static inline var TARGET_HEIGHT = 450;

    //===== Screen purposes =====
  	private var sx:Float;
  	private var xs:Float;
  	private var fpsView:FPS;
  	private var game:Game;

	public function new ()
	{	
		super ();
		addEventListener(Event.ADDED_TO_STAGE, init);
	}

	private function init(e:Event)
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);
		var scape_width = stage.stageWidth;

		//Ensures the screen to be horizontal
		if (stage.stageHeight > stage.stageWidth)
        {
            scape_width = stage.stageHeight;
        }

        sx = scape_width/TARGET_WIDTH;
        xs = TARGET_WIDTH/scape_width;

        this.scaleX = sx;
        this.scaleY = sx;

        this.x = 0;
        this.y = (stage.stageHeight-TARGET_HEIGHT*sx)/2;
        
        this.scrollRect = new Rectangle(
            0, 
            0, 
            TARGET_WIDTH, 
            TARGET_HEIGHT);

        fpsView = new FPS(4, 4, 0xFFFFFF);
        game = new Game();

        var bgg:BitmapData = new BitmapData(TARGET_WIDTH,TARGET_HEIGHT,true,0xFF000000);
        var bg:Bitmap = new Bitmap(bgg);

        game.x = TARGET_WIDTH/2;
        game.y = TARGET_HEIGHT/2;

        addChild(bg);
        addChild(game);
        addChild(fpsView);
	}
}