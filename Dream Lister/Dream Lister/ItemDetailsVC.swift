//
//  ItemDetailsVC.swift
//  Dream Lister
//
//  Created by Miguel Herrero on 30/11/16.
//  Copyright © 2016 Miguel Herrero. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var itemTypePicker: UIPickerView!
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    @IBOutlet weak var thumbImage: UIImageView!
    
    // MARK: - Variables
    
    var stores = [Store]()
    var itemTypes = [ItemType]()
    var fetchedRequestsController: NSFetchedResultsController<Store>!
    var itemToEdit: Item? //Only when editing, not when creating
    var imagePicker: UIImagePickerController!

    // MARK: - View funcs
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Replace default Back button with a button without a title
        if let topItem = self.navigationController?.navigationBar.topItem {
            
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        
        storePicker.delegate = self
        storePicker.dataSource = self
        
        itemTypePicker.delegate = self
        itemTypePicker.dataSource = self
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        //generateTestData()
        
        getStores()
        getItemTypes()
        
        if itemToEdit != nil {
            loadItemData()
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func savePressed(_ sender: UIButton) {
        
        let item = itemToEdit ?? Item(context: context)
        
        let picture = Image(context: context)
        picture.image = thumbImage.image
        item.toImage = picture
        
        if let title = self.titleField.text {
            item.title = title
        }
        
        if let price = self.priceField.text {
            item.price = Double(price)!
        }
        
        if let details = self.detailsField.text {
            item.details = details
        }
        
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        
        item.toItemType = itemTypes[itemTypePicker.selectedRow(inComponent: 0)]
        
        ad.saveContext()
        
        // Dismiss view controller and take the user to the main view
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deletePressed(_ sender: UIBarButtonItem) {
        
        if itemToEdit != nil {
            context.delete(itemToEdit!)
            ad.saveContext()
        }
        
        // Dismiss view controller and take the user to the main view
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func addImage(_ sender: UIButton) {
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    // MARK: - Other funcs
    
    func loadItemData() {
        
        if let item = itemToEdit {
            
            titleField.text = item.title
            priceField.text = "\(item.price)"
            detailsField.text = item.details
            thumbImage.image = item.toImage?.image as? UIImage
            
            // Set the Store picker to the item's Store
            if let store = item.toStore {
                storePicker.selectRow(stores.index(of: store)!, inComponent: 0, animated: false)
            }
            
            // Set the ItemType picker to the item's Type
            if let itemType = item.toItemType {
                itemTypePicker.selectRow(itemTypes.index(of: itemType)!, inComponent: 0, animated: false)
            }
        }
    }
    
    func getStores() {
        
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do {
            self.stores = try context.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()
        } catch {
            //Handle the error
        }
    }
    
    func getItemTypes() {
        
        let fetchRequest: NSFetchRequest<ItemType> = ItemType.fetchRequest()
        
        do {
            self.itemTypes = try context.fetch(fetchRequest)
            self.itemTypePicker.reloadAllComponents()
        } catch {
            // Handle the error
        }
    }
    
    func generateTestData() {
        let store1 = Store(context: context)
        store1.name = "Best Buy"
        let store2 = Store(context: context)
        store2.name = "Tesla Dealership"
        let store3 = Store(context: context)
        store3.name = "Frys Electronics"
        let store4 = Store(context: context)
        store4.name = "Target"
        let store5 = Store(context: context)
        store5.name = "Amazon"
        let store6 = Store(context: context)
        store6.name = "K Mart"
        ad.saveContext()
        
        let itemType1 = ItemType(context: context)
        itemType1.type = "Electronics"
        let itemType2 = ItemType(context: context)
        itemType2.type = "Cars"
        let itemType3 = ItemType(context: context)
        itemType3.type = "Travel"
        let itemType4 = ItemType(context: context)
        itemType4.type = "House"
        let itemType5 = ItemType(context: context)
        itemType5.type = "Office"
        ad.saveContext()
    }

}


// MARK: - UIPickerViewDataSource, UIPickerViewDelegate

extension ItemDetailsVC: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch pickerView.tag {
        case 0:
            let store = stores[row]
            return store.name
        case 1:
            let itemType = itemTypes[row]
            return itemType.type
        default:
            let store = stores[row]
            return store.name
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch pickerView.tag {
        case 0:
            return stores.count
        case 1:
            return itemTypes.count
        default:
            return stores.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        // Update when selected
    }
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate

extension ItemDetailsVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            thumbImage.image = image
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
}
