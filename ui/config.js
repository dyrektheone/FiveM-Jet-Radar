var RadarPosition = "TopLeft" // AVAILABLE OPTIONS : TopLeft, BottomLeft, TopRight, BottomRight, Custom

var DistanceFromSide = 50       // Defines the radar's distance from the side of the screen

var CustomRadarOptions = "60% 0 0 30%" 
        // FORMAT: "TOP RIGHT BOTTOM LEFT" 
        // 0 0 0 0 will result in center of screen
        // this basically sets the "inset" property of the radar
        // This will only apply if the RadarPosition is set to "Custom"

var RadarColor = "#3277cd"
        // Change the color theme of the radar
        // This is basically a color property so you can use HEX-, RGB-codes or predefined colors (blue,red,green)

var TargetColor = "red"
        // Change the color of the targets
        // This is basically a color property so you can use HEX-, RGB-codes or predefined colors (blue,red,green)

var FriendlyColor = "lawngreen"
        // Change the color of the friendlies
        // This is basically a color property so you can use HEX-, RGB-codes or predefined colors (blue,red,green)