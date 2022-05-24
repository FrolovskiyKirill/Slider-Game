//
//  SliderTest.swift
//  Slider Game
//
//  Created by Кирилл on 24.05.2022.
//

import SwiftUI

struct SwiftUISlider: UIViewRepresentable {
  
    @Binding var value: Double
  
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.value = Float(value)
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.thumbTintColor = .red
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged(_:)),
            for: .valueChanged
        )
        return slider
    }
  
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(self.value)
    }
    func makeCoordinator() -> SwiftUISlider.Coordinator {
        Coordinator(value: $value)
    }
}

extension SwiftUISlider {
    class Coordinator: NSObject {

        var value: Binding<Double>

        init(value: Binding<Double>) {
            self.value = value
        }

        @objc func valueChanged(_ sender: UISlider) {
            self.value.wrappedValue = Double(sender.value)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUISlider(value: .constant(0))
    }
}

//Изменение цвета ползунка реализовать не успел(( С нетерпением жду отзыв и разбор! Заранее спасибо!
