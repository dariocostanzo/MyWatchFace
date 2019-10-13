using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;


class MyWatchFaceView extends Ui.WatchFace {

    var customFont = null;
   	
    function onLayout(dc) {
        customFont = Ui.loadResource(Rez.Fonts.customFont);        
    }

    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        dc.clear();
        var clockTime = System.getClockTime();
        var hour = clockTime.hour;
        if (!Sys.getDeviceSettings().is24Hour) {
            hour = hour % 12;
            if (hour == 0){
                hour = 12;
            }

        }
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
    	dc.fillCircle(116, 150, 30);
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
    	dc.fillCircle(91, 120, 15); //fillCircle(x, y, radius)
    	dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
    	dc.fillCircle(141, 120, 15); //fillCircle(x, y, radius)
    	dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
        dc.drawText(dc.getWidth() / 2, 22, customFont, hour.toString(), Gfx.TEXT_JUSTIFY_RIGHT);
        dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
	    dc.drawText(dc.getWidth() / 2, 22, customFont, Lang.format("$1$", [clockTime.min.format("%02d")]), Gfx.TEXT_JUSTIFY_LEFT );
	    dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_TRANSPARENT);
	    dc.drawText(dc.getHeight() / 2, dc.getHeight() / 1.5, Gfx.FONT_TINY, Lang.format("$1$", [clockTime.sec.format("%02d")]), Gfx.TEXT_JUSTIFY_LEFT | Gfx.TEXT_JUSTIFY_VCENTER);
//	    dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
//    	dc.drawText(
//        dc.getWidth() / 2,                      // gets the width of the device and divides by 2
//        dc.getHeight() / 2,                     // gets the height of the device and divides by 2
//        Gfx.FONT_LARGE,                    // sets the font size
//        "Dario Costanzo",                          // the String to display
//        Gfx.TEXT_JUSTIFY_CENTER            // sets the justification for the text]
//                );
 // Call the parent onUpdate function to redraw the layout
 }
    
    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}