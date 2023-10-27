//
//  types_of_gait.swift
//  GAIT
//
//  Created by Dishant Rajput on 25/10/23.
//  Copyright © 2023 EVS. All rights reserved.
//

import UIKit

class types_of_gait: UIViewController {

    var str_select_gait_type:String!
    
    @IBOutlet weak var tble_view:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        print(self.str_select_gait_type as Any)
        
        self.navigationItem.title = self.str_select_gait_type.uppercased()
         
        self.tble_view.delegate = self
        self.tble_view.dataSource = self
        self.tble_view.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Back Button X
        let backButton = UIBarButtonItem.init(image: #imageLiteral(resourceName: "back_icon").withRenderingMode(.alwaysOriginal) , style: .plain, target: self, action: #selector(self.backClickMethod))
        self.navigationItem.leftBarButtonItem = backButton
        backButton.tintColor = .black
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @objc func backClickMethod() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}


extension types_of_gait:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (self.str_select_gait_type == " Antalgic Gait") {
            
            if (indexPath.row == 0) {
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "half_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_description_text.text = "Description"
                cell.backgroundColor = .systemOrange
                
                return cell
                
            } else if (indexPath.row == 1) {
                
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "one_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_title.text = "An antalgic gait pattern is any compensation that is made to avoid pain during walking. In this gait, there is an asymmetry in the person’s gait pattern. The affected (or painful) limb has a shortened stance phase to avoid prolonged single limb support. A shorter stance phase results in decreased contralateral step length. The total range of motion of the joints may also be decreased."
                
                return cell
                
            } else if (indexPath.row == 2) {
                
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "two_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_pathalogies.text = "Pathologies"
                cell.backgroundColor = .systemOrange
                
                return cell
                
            } else {
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "three_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_pathalogies_content.textColor = .black
                cell.lbl_pathalogies_content.text = "This type of gait is typically associated with conditions of acute joint trauma, bone spurs, soft tissue damage or joint deformities. It can also be found chronically in degenerative joint disease, osteoarthritis, and rheumatoid arthritis."
                
                return cell
            }
            
            
        } else if (self.str_select_gait_type == " Apraxic Gait") {
            
            if (indexPath.row == 0) {
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "half_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_description_text.text = "Description"
                cell.backgroundColor = .systemOrange
                
                return cell
                
            } else if (indexPath.row == 1) {
                
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "one_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_title.text = "Apraxic gait (or gait apraxia) is an interesting condition because patients exhibit gait deviations, despite having no sensory loss, no motor weakness or cerebellar dysfunction. The typical gait pattern includes: difficulty with gait initiation, short shuffling and hesitating steps, reduced cadence and a relatively wider base of support. These patients are unable to perform coordinated lower limb movements in a weight bearing position, but are able to move both limbs \nin an alternative walking pattern or cycling pattern in a supine position. Even in a sitting position, gait apraxia patients are able to perform tasks such as writing on the floor with the foot. However, in a weight bearing position, their ability to perform walking-related movements gets impaired. Their gait pattern does not improve with visual or auditory cues, unlike other conditions, such as Parkinson’s disease."
                
                return cell
                
            } else if (indexPath.row == 2) {
                
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "two_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_pathalogies.text = "Pathologies"
                cell.backgroundColor = .systemOrange
                
                return cell
                
            } else {
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "three_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_pathalogies_content.textColor = .black
                cell.lbl_pathalogies_content.text = "The exact cause of apraxia is unknown. However, it is hypothesized that\n problems in brain areas which control executive functioning and higher level functions are responsible for apraxia."
                
                return cell
            }
            
            
        } else if (self.str_select_gait_type == " Cerebellar Ataxic Gait") {
            
            if (indexPath.row == 0) {
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "half_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_description_text.text = "Description"
                cell.backgroundColor = .systemOrange
                
                return cell
                
            } else if (indexPath.row == 1) {
                
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "one_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_title.text = "Cerebellar ataxic gait is characterized by a lack of balance during gait (i.e. unsteadiness), irregularity of steps and a wide base of support. Tandem walking (i.e. heel-to-toe gait) becomes challenging due to dysmetria, which is the inability to perform smooth and coordinated movements. Gait speed may not be affected and the step lengths may be similar to healthy individuals."
                
                return cell
                
            } else if (indexPath.row == 2) {
                
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "two_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_pathalogies.text = "Pathologies"
                cell.backgroundColor = .systemOrange
                
                return cell
                
            } else {
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "three_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_pathalogies_content.textColor = .black
                cell.lbl_pathalogies_content.text = "This gait type results from damage to the cerebellum, which is responsible for controlling balance and coordinated movements. Therefore, individuals with cerebellar damage do not have the sensory information or motor control for normal gait. This type of gait is typically seen in brain injury due to stroke, trauma to the brain, brain tumors or alcohol use disorder."
                
                return cell
            }
            
            
        } else if (self.str_select_gait_type == " Choreiform Gait (Hyperkinetic Gait)") {
            
            if (indexPath.row == 0) {
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "half_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_description_text.text = "Description"
                cell.backgroundColor = .systemOrange
                
                return cell
                
            } else if (indexPath.row == 1) {
                
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "one_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_title.text = "In Choreiform gait, uncontrollable movements of the upper and lower extremities are observed. The movements are involuntary, jerky and irregular, similar to dancing. The uncontrolled movements are observed during rest, and could get amplified during walking. This type of gait appears melodramatic and is also referred to as “Hyperkinetic gait”. The hyperkinetic gait pattern is opposite to the “hypokinetic” gait pattern (seen in patients with Parkinson’s disease), in which there is limited movements of the arms and legs."
                
                return cell
                
            } else if (indexPath.row == 2) {
                
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "two_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_pathalogies.text = "Pathologies"
                cell.backgroundColor = .systemOrange
                
                return cell
                
            } else {
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "three_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_pathalogies_content.textColor = .black
                cell.lbl_pathalogies_content.text = "Some medical conditions that can result in Choreiform gait are: Huntington’s disease, Sydenham’s chorea and Wilson’s disease."
                
                return cell
            }
            
            
        } else if (self.str_select_gait_type == " Circumduction Gait") {
            
            if (indexPath.row == 0) {
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "half_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_description_text.text = "Description"
                cell.backgroundColor = .systemOrange
                
                return cell
                
            } else if (indexPath.row == 1) {
                
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "one_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_title.text = "During the Swing interval of gait, as the limb moves form a trailing (posterior) position to a leading (anterior) position, the thigh moves along an arc and hip ABduction is observed. This deviation results from functional leg length discrepancy during the Swing interval of gait. Functional leg length discrepancy means that the limb is unable to perform its function of flexion during the Swing interval, which causes it to be longer than expected. Anatomically, there may not be a difference in length between the two limbs and the leg length discrepancy is only evident during the Swing interval due to insufficient flexion."
                
                return cell
                
            } else if (indexPath.row == 2) {
                
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "two_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_pathalogies.text = "Pathologies"
                cell.backgroundColor = .systemOrange
                
                return cell
                
            } else {
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "three_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_pathalogies_content.textColor = .black
                cell.lbl_pathalogies_content.text = "This deviation occurs in pathologies in which the patient is unable to flex the hip, knee and/or dorsiflex the ankle to achieve sufficient ground clearance for the swing limb. Some examples are: stroke, transfemoral amputee with a stiff prosthetic knee, hemiplegia, knee ankle foot orthosis user etc."
                
                return cell
            }
            
            
        } else if (self.str_select_gait_type == " Festinating Gait") {
            
            if (indexPath.row == 0) {
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "half_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_description_text.text = "Description"
                cell.backgroundColor = .systemOrange
                
                return cell
                
            } else if (indexPath.row == 1) {
                
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "one_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_title.text = "By definition, “festination” means haste or hurry. Festinating gait was initially identified by Dr. James Parkinson (the first person to identify symptoms of Parkinson’s disease) and he described it as “The propensity to lean forward becomes invincible, and the patient is thereby forced to step on the toes and fore part of the feet, whilst the upper part of the body is thrown so far forward as to render it difficult to avoid falling on the face. [The patient is].... irresistibly impelled to make much quicker and short steps, and thereby to adopt unwillingly a running pace.” In other words, festinating gait involves short, quick steps that are accompanied by an increase in gait speed and forward trunk lean. In advanced stages, the gait speed continues to increase until the person grabs an object to stop walking."
                
                return cell
                
            } else if (indexPath.row == 2) {
                
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "two_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_pathalogies.text = "Pathologies"
                cell.backgroundColor = .systemOrange
                
                return cell
                
            } else {
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "three_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_pathalogies_content.textColor = .black
                cell.lbl_pathalogies_content.text = "This type of gait is seen in patients with advanced stages of Parkinson’s disease."
                
                return cell
            }
            
            
        } else if (self.str_select_gait_type == " Festinating Gait") {
            
            if (indexPath.row == 0) {
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "half_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_description_text.text = "Description"
                cell.backgroundColor = .systemOrange
                
                return cell
                
            } else if (indexPath.row == 1) {
                
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "one_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_title.text = "This gait pattern is also referred to as “Scissoring Gait” or “Diplegic Gait”. It is characterized by severe tightness of the hip adductors, which causes the knees to cross the midline of the body during walking. The swing knee will have a tendency to hit the stance knee, unless compensations are made by the patient. Excessive hip adduction also results in a very narrow base of support and a functionally longer swing limb which can result in dragging of the toes. Hip abductor muscles become extremely weak due to muscle atrophy resulting from non-use. In addition to excessive hip adduction, other joint conditions, such as excessive plantarflexion at the ankle, internal rotation of the hip, knee flexion or hip flexion may also be present."
                
                return cell
                
            } else if (indexPath.row == 2) {
                
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "two_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_pathalogies.text = "Pathologies"
                cell.backgroundColor = .systemOrange
                
                return cell
                
            } else {
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "three_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_pathalogies_content.textColor = .black
                cell.lbl_pathalogies_content.text = "Pathological conditions that cause bilateral periventricular lesions result in scissoring gait. The most common pathologies are spastic cerebral palsy and arthrogryposis. Other pathologies could include trauma to the spinal cord or brain injury."
                
                return cell
            }
            
            
        } else if (self.str_select_gait_type == " Senile Apraxic Gait") {
            
            if (indexPath.row == 0) {
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "half_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_description_text.text = "Description"
                cell.backgroundColor = .systemOrange
                
                return cell
                
            } else if (indexPath.row == 1) {
                
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "one_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_title.text = "Senile means “of or belonging to old age or aged persons”. Senile apraxic gait refers to the condition of gait apraxia in elderly patients. These elderly patients have apraxic gait which results in: difficulty with gait initiation, short shuffling and hesitating steps, reduced cadence and a relatively wider base of support, as described earlier."
                
                return cell
                
            } else if (indexPath.row == 2) {
                
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "two_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_pathalogies.text = "Pathologies"
                cell.backgroundColor = .systemOrange
                
                return cell
                
            } else {
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "three_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_pathalogies_content.textColor = .black
                cell.lbl_pathalogies_content.text = "No known condition, except for old age and associated issues with brain function."
                
                return cell
            }
            
            
        } else if (self.str_select_gait_type == " Steppage Gait") {
            
            if (indexPath.row == 0) {
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "half_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_description_text.text = "Description"
                cell.backgroundColor = .systemOrange
                
                return cell
                
            } else if (indexPath.row == 1) {
                
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "one_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_title.text = "In this deviation, excessive knee and hip flexion is observed during the Swing interval of gait. Steppage gait is a strategy used to help the foot clear the ground, without dragging the toes. This type of gait is also referred to as “marching” gait, as it resembles the marching of soldiers or a musical band."
                
                return cell
                
            } else if (indexPath.row == 2) {
                
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "two_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_pathalogies.text = "Pathologies"
                cell.backgroundColor = .systemOrange
                
                return cell
                
            } else {
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "three_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_pathalogies_content.textColor = .black
                cell.lbl_pathalogies_content.text = "Any pathology which results in foot drop or excessive ankle plantarflexion during the Swing interval, e.g. peroneal nerve palsy, peripheral neuropathy etc. If the ankle dorsiflexors are weak and the patient is unable to dorsiflex the foot during swing, or if the patient has a loss of proprioception in the ankle, this strategy will be used."
                
                return cell
            }
            
            
        } else if (self.str_select_gait_type == " Tabetic Gait") {
            
            if (indexPath.row == 0) {
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "half_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_description_text.text = "Description"
                cell.backgroundColor = .systemOrange
                
                return cell
                
            } else if (indexPath.row == 1) {
                
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "one_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_title.text = "A person with Tabetic Gait (or sensory ataxia) will walk with excessive knee and/or hip flexion during the Swing interval. The foot is raised unusually high during swing and contacts the ground with a stomp, which helps in sensing the foot because there is a loss of proprioception. The stomping is exacerbated when patients cannot see their feet, e.g. in the dark. This type of gait is also known as “Stomping” gait."
                
                return cell
                
            } else if (indexPath.row == 2) {
                
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "two_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_pathalogies.text = "Pathologies"
                cell.backgroundColor = .systemOrange
                
                return cell
                
            } else {
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "three_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_pathalogies_content.textColor = .black
                cell.lbl_pathalogies_content.text = "Tabetic gait results from a condition known as Tabes Dorsalis. This condition is characterized by slow degeneration of neural tracts, primarily in the dorsal root ganglia of the spinal cord. Tabes Dorsalis is a late consequence of neurosyphilis. This gait can also be observed in pathologies affecting the peripheral nerves, such as peripheral neuropathy."
                
                return cell
            }
            
            
        } else if (self.str_select_gait_type == " Trendelenburg Gait") {
            
            if (indexPath.row == 0) {
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "half_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_description_text.text = "Description"
                cell.backgroundColor = .systemOrange
                
                return cell
                
            } else if (indexPath.row == 1) {
                
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "one_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_title.text = "Trendelenburg gait is characterized by an uncontrolled drop in the pelvis on the side of the swing limb during gait. In normal gait, when the reference limb is in the Swing interval, the contralateral limb (which is in the Single Support interval) keeps the pelvis level in the coronal plane. The hip abductor muscles of the contralateral limb (i.e. gluteus medius and gluteus minimus) control the movement of the pelvis and only allow for a 5 degree drop. In Trendelenburg gait, the abductor muscles are unable to control the pelvic movement, which results in a sudden drop of the pelvis. In some cases, pelvic drop is accompanied with a lateral lean of the trunk. This type of gait is also referred to as “waddling gait” because lateral trunk lean with each step resembles the waddling movement, similar to the walking pattern of penguins."
                
                return cell
                
            } else if (indexPath.row == 2) {
                
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "two_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_pathalogies.text = "Pathologies"
                cell.backgroundColor = .systemOrange
                
                return cell
                
            } else {
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "three_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_pathalogies_content.textColor = .black
                cell.lbl_pathalogies_content.text = "Any condition that results in weakness or paralysis of the hip abductor muscles, such as polio, post-operative nerve damage, hemiplegic cerebral palsy, muscular dystrophy etc. Some other conditions that may result in Trendelenburg gait are: osteoarthritis of the hip, fractures of the greater trochanter / femoral neck, hip replacement surgery etc."
                
                return cell
            }
        }  else if (self.str_select_gait_type == " Scissors Gait") {
            
            if (indexPath.row == 0) {
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "half_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_description_text.text = "Description"
                cell.backgroundColor = .systemOrange
                
                return cell
                
            } else if (indexPath.row == 1) {
                
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "one_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_title.text = "This gait pattern is also referred to as “Scissoring Gait” or “Diplegic Gait”. It is characterized by severe tightness of the hip adductors, which causes the knees to cross the midline of the body during walking. The swing knee will have a tendency to hit the stance knee, unless compensations are made by the patient. Excessive hip adduction also results in a very narrow base of support and a functionally longer swing limb which can result in dragging of the toes. Hip abductor muscles become extremely weak due to muscle atrophy resulting from non-use. In addition to excessive hip adduction, other joint conditions, such as excessive plantarflexion at the ankle, internal rotation of the hip, knee flexion or hip flexion may also be present."
                
                return cell
                
            } else if (indexPath.row == 2) {
                
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "two_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_pathalogies.text = "Pathologies"
                cell.backgroundColor = .systemOrange
                
                return cell
                
            } else {
                let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "three_table_cell") as! types_of_gait_table_cell
                cell.backgroundColor = .white
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .clear
                cell.selectedBackgroundView = backgroundView
                
                cell.lbl_pathalogies_content.textColor = .black
                cell.lbl_pathalogies_content.text = "Pathological conditions that cause bilateral periventricular lesions result in scissoring gait. The most common pathologies are spastic cerebral palsy and arthrogryposis. Other pathologies could include trauma to the spinal cord or brain injury."
                
                return cell
            }
        }

        
        else {
            let cell:types_of_gait_table_cell = tableView.dequeueReusableCell(withIdentifier: "one_table_cell") as! types_of_gait_table_cell
            cell.backgroundColor = .white
            
            let backgroundView = UIView()
            backgroundView.backgroundColor = .clear
            cell.selectedBackgroundView = backgroundView
            
            
            
            return cell
        }
        
        
        
        /*if (self.str_select_gait_type == " Antalgic Gait") {
            
             
            
        } else if (self.str_select_gait_type == " Apraxic Gait") {
            
            cell.lbl_title.text = "Description: .Pathologies: "
            
        } else if (self.str_select_gait_type == " Cerebellar Ataxic Gait") {
            
            cell.lbl_title.text = "Description: \n\nPathologies: "
            
        } else if (self.str_select_gait_type == " Choreiform Gait (Hyperkinetic Gait)") {
            
            cell.lbl_title.text = "Description: \nPathologies: "
            
        } else if (self.str_select_gait_type == " Circumduction Gait") {
            
            cell.lbl_title.text = "Description: \n\nPathologies:\n"
            
        } else if (self.str_select_gait_type == " Festinating Gait") {
            
            cell.lbl_title.text = "Description: \nPathologies: "
            
        } else if (self.str_select_gait_type == " Scissors Gait") {
            
            cell.lbl_title.text = "Description: \n\nPathologies: "
            
        } else if (self.str_select_gait_type == " Senile Apraxic Gait") {
            
            cell.lbl_title.text = "Description: \n\n Pathologies: "
            
        } else if (self.str_select_gait_type == " Steppage gait") {
            
            cell.lbl_title.text = "Description: \n\n Pathologies: "
            
        } else if (self.str_select_gait_type == " Tabetic Gait") {
            
            cell.lbl_title.text = "Description:  \n\nPathologies: "
            
        } else if (self.str_select_gait_type == " Trendelenburg Gait") {
            
            cell.lbl_title.text = "Description:  \n\nPathologies: "
            
        }*/
       
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (self.str_select_gait_type == " Antalgic Gait") {
            
            if (indexPath.row == 3) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/876787751/065bb992a8?share=copy"
                pushVC.str_video_header = " "+self.str_select_gait_type
                self.navigationController?.pushViewController(pushVC, animated: true)
            }
            
        } else if (self.str_select_gait_type == " Apraxic Gait") {
            
            if (indexPath.row == 3) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/876787462/973fd01286?share=copy"
                pushVC.str_video_header = " "+self.str_select_gait_type
                self.navigationController?.pushViewController(pushVC, animated: true)
            }
            
        } else if (self.str_select_gait_type == " Cerebellar Ataxic Gait") {
            
            if (indexPath.row == 3) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/876738858/592288819c?share=copy"
                pushVC.str_video_header = " "+self.str_select_gait_type
                self.navigationController?.pushViewController(pushVC, animated: true)
            }
            
        } else if (self.str_select_gait_type == " Choreiform Gait (Hyperkinetic Gait)") {
            
            if (indexPath.row == 3) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/876738549/bdd453eaaa?share=copy"
                pushVC.str_video_header = " "+self.str_select_gait_type
                self.navigationController?.pushViewController(pushVC, animated: true)
            }
            
        } else if (self.str_select_gait_type == " Circumduction Gait") {
            
            if (indexPath.row == 3) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/876738347/202cdec542?share=copy"
                pushVC.str_video_header = " "+self.str_select_gait_type
                self.navigationController?.pushViewController(pushVC, animated: true)
            }
            
        } else if (self.str_select_gait_type == " Festinating Gait") {
            
            if (indexPath.row == 3) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/876736496/908bcdbabd?share=copy"
                pushVC.str_video_header = " "+self.str_select_gait_type
                self.navigationController?.pushViewController(pushVC, animated: true)
            }
            
        } else if (self.str_select_gait_type == " Scissors Gait") {
            
            if (indexPath.row == 3) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/876735571/d3a1083c89?share=copy"
                pushVC.str_video_header = " "+self.str_select_gait_type
                self.navigationController?.pushViewController(pushVC, animated: true)
            }
            
        } else if (self.str_select_gait_type == " Senile Apraxic Gait") {
            
            if (indexPath.row == 3) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/876734940/814ca62194?share=copy"
                pushVC.str_video_header = " "+self.str_select_gait_type
                self.navigationController?.pushViewController(pushVC, animated: true)
            }
            
        } else if (self.str_select_gait_type == " Steppage Gait") {
            
            if (indexPath.row == 3) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/876734527/53aa4d8b4a?share=copy"
                pushVC.str_video_header = " "+self.str_select_gait_type
                self.navigationController?.pushViewController(pushVC, animated: true)
            }
            
        } else if (self.str_select_gait_type == " Tabetic Gait") {
            
            if (indexPath.row == 3) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/876732394/aebabbdcc7?share=copy"
                pushVC.str_video_header = " "+self.str_select_gait_type
                self.navigationController?.pushViewController(pushVC, animated: true)
            }
            
        } else if (self.str_select_gait_type == " Trendelenburg Gait") {
            
            if (indexPath.row == 3) {
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "play_videos_id") as! play_videos
                pushVC.str_video_link = "https://vimeo.com/876731890/7dbb160a33?share=copy"
                pushVC.str_video_header = " "+self.str_select_gait_type
                self.navigationController?.pushViewController(pushVC, animated: true)
            }
            
        }
       
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}


class types_of_gait_table_cell: UITableViewCell {

    @IBOutlet weak var btn_video:UIButton! {
        didSet {
            btn_video.layer.cornerRadius = 8
            btn_video.clipsToBounds = true
            btn_video.setTitle("Video", for: .normal)
            btn_video.setTitleColor(.white, for: .normal)
            btn_video.backgroundColor = UIColor.init(red: 232.0/255.0, green: 50.0/255.0, blue: 35.0/255.0, alpha: 1)
            btn_video.isUserInteractionEnabled = false
        }
    }
    
    @IBOutlet weak var lbl_description_text:UILabel! {
        didSet {
            lbl_description_text.backgroundColor = .clear
        }
    }
    @IBOutlet weak var lbl_title:UILabel! {
        didSet {
            lbl_title.backgroundColor = .clear
        }
    }
    @IBOutlet weak var lbl_pathalogies:UILabel! {
        didSet {
            lbl_pathalogies.backgroundColor = .clear
        }
    }
    @IBOutlet weak var lbl_pathalogies_content:UILabel! {
        didSet {
            lbl_pathalogies_content.backgroundColor = .clear
        }
    }
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
