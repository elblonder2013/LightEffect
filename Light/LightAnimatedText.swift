//
//  LightAnimatedText.swift
//  Light
//
//  Created by Alexei on 4/5/25.
//
import SwiftUI


struct LightAnimatedText: View {
    var angleDeg: Double
    var lightColor: Color = .white
    
    var body: some View {
        ZStack {
            Rectangle().fill(.clear)
            Text("Light")
                .font(.custom("Poppins-Black", size: 100))
                .foregroundColor(Color(white: 0.2))
                .overlay(
                    Text("Light")
                        .font(.custom("Poppins-Black", size: 100))
                        .foregroundColor(lightColor)
                        .mask(
                            GeometryReader { geo in
                                let center = CGPoint(x: geo.size.width * 0.25, y: geo.size.height * 0.1)
                                DynamicLightCone(
                                    angleDeg: angleDeg,
                                    length: geo.size.width * 1.5,
                                    width: geo.size.width * 2.0,
                                    center: center
                                )
                                .fill(Color.white)
                            }
                        )
                )
            
                .overlay(alignment: .topLeading){
                    // Circle over the "i"
                    Circle()
                        .fill(lightColor)
                        .frame(width: 30, height: 30)
                        .offset(x: 51.5, y: 15)
                }
        }.background {
            Rectangle().fill(Color(uiColor: #colorLiteral(red: 0.1893056631, green: 0.126000613, blue: 0.129724592, alpha: 1)))
        }
    }
}

// MARK: - Light Cone
struct DynamicLightCone: Shape {
    var angleDeg: Double
    var length: CGFloat
    var width: CGFloat
    var center: CGPoint
    
    func path(in rect: CGRect) -> Path {
        let angleRad = Angle(degrees: angleDeg).radians
        let top = center
        
        let bottomX = top.x + length * CGFloat(cos(angleRad))
        let bottomY = top.y + length * CGFloat(sin(angleRad))
        let baseCenter = CGPoint(x: bottomX, y: bottomY)
        
        let baseAngle = angleRad + .pi / 2
        let halfWidth = width / 2
        
        let base1 = CGPoint(
            x: baseCenter.x + halfWidth * CGFloat(cos(baseAngle)),
            y: baseCenter.y + halfWidth * CGFloat(sin(baseAngle))
        )
        let base2 = CGPoint(
            x: baseCenter.x - halfWidth * CGFloat(cos(baseAngle)),
            y: baseCenter.y - halfWidth * CGFloat(sin(baseAngle))
        )
        
        var path = Path()
        path.move(to: top)
        path.addLine(to: base1)
        path.addLine(to: base2)
        path.closeSubpath()
        return path
    }
    
    var animatableData: Double {
        get { angleDeg }
        set { angleDeg = newValue }
    }
}
