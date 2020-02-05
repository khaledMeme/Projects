import UIKit
@IBDesignable
class GradientView: UIView {
    
    @IBInspectable
    var firstColor: UIColor = UIColor.clear {
        didSet{
            updateView()
        }
    }
    @IBInspectable
    var secondColor: UIColor = UIColor.clear {
        didSet{
            updateView()
        }
    }
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    override class var layerClass: AnyClass{
        get{
            return CAGradientLayer.self
        }
    }
    func updateView(){
        let layer = self.layer as! CAGradientLayer
        layer.colors = [firstColor.cgColor, secondColor.cgColor]
    }
}
