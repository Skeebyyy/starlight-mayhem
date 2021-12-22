package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxPoint;
import flixel.util.FlxTimer;
import flixel.text.FlxText;
import flixel.system.FlxSound;
import lime.app.Application;
#if windows
import Discord.DiscordClient;
#end
import openfl.display.BitmapData;
import openfl.utils.Assets;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.FlxGraphic;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import openfl.display.BitmapData;
import sys.thread.Thread;
import haxe.Exception;
import flixel.tweens.FlxEase;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;

using StringTools;

enum Preloadtype {
    image;
}
class Cache extends MusicBeatState
{
	public static var graphicassets:Map<String, FlxGraphic>;
	var aaaaa:FlxText;
	var percentlol:FlxText;

	var images = [];
	var images2 = [];
	var images3 = [];
	var music = [];

	var whatisloading:String = '';

	var characterlist = ['Max','MaxRGB','new/cj_assets','BFGFRGB','BFGF'
	,'NoGFRGB','NoGF','new/ruby_assets','AbelRGB','Abel','Olley','Olley2','ruby_assets','new/duet_assets','new/duet_assets2'];

	override function create()
	{
		FlxG.mouse.visible = false;

		FlxG.worldBounds.set(0,0);

		FlxGraphic.defaultPersist = true;

		var menuBG:FlxSprite = new FlxSprite().loadGraphic(Paths.image('load'));
		menuBG.screenCenter();
		add(menuBG);

		graphicassets = new Map<String, FlxGraphic>();

		aaaaa = new FlxText(12, 12, 0, "Loading...", 12);
		aaaaa.scrollFactor.set();
		aaaaa.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(aaaaa);
		changetext();
		percentlol = new FlxText(12, 40, 0, "", 12);
		percentlol.scrollFactor.set();
		percentlol.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(percentlol);

		cachethem();

		super.create();
	}
	override function update(elapsed) 
	{
		super.update(elapsed);
		//percentlol.text = '$whatisloading ${Std.string(flixel.math.FlxMath.roundDecimal(ism / max * 100, 0))}%';
	}

	function changetext() {
		new FlxTimer().start(0.5, function(tmr:FlxTimer)
		{
			aaaaa.text = 'Loading.';
			new FlxTimer().start(0.5, function(tmr:FlxTimer)
			{
				aaaaa.text = 'Loading..';
				new FlxTimer().start(0.5, function(tmr:FlxTimer)
				{
					aaaaa.text = 'Loading...';
					changetext();
				});
			});
		});
	}

	function cachethem() 
	{       
		new FlxTimer().start(5, function(tmr:FlxTimer)
		{
			FlxG.switchState(new TitleState());
		});
    }

	function getAnumbaNine(getm:Int) // really sorry for this code lmao
		{
			var theAmount:Int = 0;
			switch (getm)
			{
				case 0:
					theAmount = 18;

				case 1:
				for (i in 0...characterlist.length)
					{
						theAmount += 1;
					}
			}
			return theAmount;
		}
}