
import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let label = UILabel()
    var textfield = UITextField()
    let button = UIButton() // solution 3: let button = myButton()
    let label2 = UILabel()
   
    // MARK: - Initalisation
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        self.view.backgroundColor = UIColor.gray
        
        /* label */
        self.label.text = "What's your name ?"
        self.label.textColor = UIColor.white
        self.label.textAlignment = .center
        self.label.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        self.label.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.label)
        
        /* textfield */
        self.textfield.placeholder = "information text"
        self.textfield.isSecureTextEntry = false // for password, change to true
        self.textfield.textColor = UIColor.black
        self.textfield.textAlignment = .center
        self.textfield.backgroundColor = UIColor.white
        self.textfield.borderStyle = .line
        self.textfield.autocorrectionType = .no
        self.textfield.clearButtonMode = .whileEditing
        self.textfield.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.textfield)
        
        /* button */
        self.button.setTitle("confirm", for: .normal)
        self.button.setTitleColor(UIColor.white, for: .normal)
        self.button.backgroundColor = UIColor.systemPink
        self.button.layer.borderColor = UIColor.black.cgColor
        self.button.layer.borderWidth = 2
        self.button.layer.cornerRadius = 3
        self.button.translatesAutoresizingMaskIntoConstraints = false
      
        
        // button action
       self.button.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
        
        self.view.addSubview(self.button)
        
        /* label 2 */
        self.label2.textColor = UIColor.black
        self.label2.textAlignment = .center
        self.label2.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        self.label2.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.label2)

        /* constraint */
        let views = ["label": self.label, "textfield": self.textfield, "button": self.button, "label2": self.label2]
        let metrics = ["width150": 150, "high50": 50]
        var constraints = [NSLayoutConstraint]()
        
   
        
        /* width of all elements */
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "|-[label]-|", options: [], metrics: metrics, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "[textfield(width150)]", options: [], metrics: metrics, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "[button(width150)]", options: [], metrics: metrics, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "|-[label2]-|", options: [], metrics: metrics, views: views)
        
        /* high and vertical position of all elements */
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-200-[label(high50)]-[textfield(high50)]-[button(high50)]-[label2(high50)]", options: [], metrics: metrics, views: views)
        
        /* active constraint */
    
        NSLayoutConstraint.activate(constraints) //The relationship between two user interface objects that must be satisfied by the constraint-based layout system.
    }
    
    // MARK: - button action
    //sender variable is normally the object that send the message
    
    @objc func buttonAction(sender: UIButton) {
         guard let name = self.textfield.text
        else {
            self.label2.text = ""
            return
        }
        self.label2.text = "Hello " + name + " ;) "
    }

}
