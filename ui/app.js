let TargetData = [
]
let TargetCamAngle = 0

function Redraw(){
    $("#target-container").css("transform",`rotate(${TargetCamAngle}deg)`)
    TargetData.forEach((element)=>{
            const currentTarget = $(`<div class="target ${element[0] ? "target-friendly" : ""}"></div>`).appendTo("#target-container")
            $(currentTarget).css("margin-left",`${element[1]}px`)
            $(currentTarget).css("margin-bottom",`${element[2]}px`) 
    })
}

$(document).ready(()=>{
    $("#panel").hide()
    if(RadarPosition!=="Custom"){
        const nLeft =   (RadarPosition==="TopLeft"||RadarPosition=="BottomLeft") ? DistanceFromSide : null
        const nRight =  (RadarPosition==="TopRight"||RadarPosition=="BottomRight") ? DistanceFromSide : null
        const nTop =    (RadarPosition==="TopRight"||RadarPosition=="TopLeft") ? DistanceFromSide : null
        const nBottom = (RadarPosition==="BottomLeft"||RadarPosition=="BottomRight") ? DistanceFromSide : null
    
        $("#panel").css("left",    `${nLeft}px`)
        $("#panel").css("right",    `${nRight}px`)
        $("#panel").css("top",      `${nTop}px`)
        $("#panel").css("bottom",   `${nBottom}px`)
    } else if(RadarPosition==="Custom"){
        $("#panel").css("inset",CustomRadarOptions)
    }

    $(":root").get(0).style.setProperty("--base-color",RadarColor)
    $(":root").get(0).style.setProperty("--target-color",TargetColor)
    $(":root").get(0).style.setProperty("--friendly-color",FriendlyColor)

    window.addEventListener("message",(e)=>{
        const data = e.data
        if(data.show===true){
            $("#panel").fadeIn(200)
        }
        else if(data.show===false){
            $("#panel").fadeOut(200)
        }

        if(data.load){
            TargetData = []
            data.load.forEach((e)=>{
                TargetCamAngle = e[2]
                let starterPositionX = (e[0]/data.radarDistance)*250

                let starterPositionY = (e[1]/data.radarDistance)*250

                let degree =  Math.ceil(GetDegreeOfPoint([e[0],e[1]]))
                TargetData.push([e[3],starterPositionX,starterPositionY,degree])
            })
        }
    })

    const radarElement = getComputedStyle(document.getElementsByClassName("radar")[0])
    setInterval(() => {
        let degree = radarElement.getPropertyValue("--border-angle")
        degree = degree.slice(0,degree.length-3)
        degree = parseInt(degree)
        if(degree===360||degree===0){
            $(".target").remove()
            Redraw()
        }

        let suitableTargets = $("#target-container").find(`[data-degree='${degree}']`)
        if(suitableTargets.length>0){
            $(suitableTargets).remove()
            DrawByDegree(degree)
        }
    }, 5);
})


function GetDegreeOfPoint(point){
    let degree = 0
    if(point[0] < 0 && point[1] <= 0){
        degree = 
            (180-(-(Math.atan2(point[0] - 0, point[1] - 0) * 180 / Math.PI)))+180
        
    } else if(point[0] > 0 && point[1] <= 0){
        degree = 
            (Math.atan2(point[0] - 0, point[1] - 0) * 180 / Math.PI) 
        
    } else if(point[0] < 0 && point[1] > 0){
        degree = 
            (180-(-(Math.atan2(point[0] - 0, point[1] - 0) * 180 / Math.PI)))+180
        
    } else if(point[0] > 0 && point[1] > 0) {
        degree = 
            Math.atan2(point[0] - 0, point[1] - 0) * 180 / Math.PI
        
    }

    return degree
}