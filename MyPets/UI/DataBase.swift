//
//  DataBase.swift
//  MyPets
//
//  Created by DuongIOS on 1/18/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//


import SQLite



class DataBase {
    
    private let id = Expression<Int64>("id")
    private let id_pet = Expression<Int64>("id_pet")
    
    private let pets = Table("PETS")
    private let name = Expression<String>("name")
    private let dateOfBirtth = Expression<String?>("dateOfBirtth")
    
    private let petImages = Table("PETIMAGES")
    private let imagePath = Expression<String?>("imagePath")
    
    private let milestone = Table("MILESTONE")
    private let title = Expression<String?>("title")
    private let note_milestone = Expression<String?>("note_milestone")
    
    private let veterinary = Table("VETERINARY")
    private let name_veterinary = Expression<String?>("name_veterinary")
    private let phone = Expression<String?>("phone")
    private let address = Expression<String?>("address")
    private let note_veterinary = Expression<String?>("note_veterinary")
    
    private let detailVeterinary = Table("DETAIL_VETERINARY")
    private let id_veterinary = Expression<Int64>("id_veterinary")

    private let medication = Table("MEDICATION")
    private let name_medication = Expression<String?>("name_medication")
    private let dostage = Expression<String?>("dostage")
    private let frequency = Expression<String?>("frequency")
    private let side_effects = Expression<String?>("side_effects")
    private let note_medication = Expression<String?>("note_medication")
    
    private let detailMedicaton = Table("DETAIL_MEDICATION")
    private let id_medication = Expression<Int64>("id_medication")
    
    private let allergy = Table("ALLERGY")
    private let name_allergy = Expression<String?>("name_allergy")
    private let reaction = Expression<String?>("reaction")
    private let severity = Expression<String?>("severity")
    private let note_allergy = Expression<String?>("note_allergy")
    
    private let detailAllergy = Table("DETAIL_ALLERGY")
    private let id_allergy = Expression<Int64>("id_allergy")
    
    private let vaccination = Table("VACCINATION")
    
    private let name_vaccination = Expression<String?>("name_vaccination")
    private let received = Expression<String?>("received")
    private let remind = Expression<Bool?>("remind")
    private let note_vaccination = Expression<String?>("note_vaccination")
    
    private let detailVaccination = Table("DETAIL_VACCINATION")
    private let id_vaccination = Expression<Int64>("id_vaccination")
    
    static let shareInstance = DataBase()
    private var db: Connection?
    
    private init() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        do {
            db = try Connection("\(path)/MyPets.sqlite3")
            createTablePets()
            createTablePetImage()
            createTableMilestone()
            createTableVeterinary()
            createTableDetailVeterinary()
            createTableAllergy()
            createTableDetailAllergy()
            createTableMedication()
            createTableDetailMedication()
            createTableVaccination()
            createTableDetailVaccination()
            
            try db?.execute("PRAGMA foreign_keys = ON")     //De thuc thi duoc foreign key
            
            let rowidpet = addData(pets, data: [name <- "Alex", dateOfBirtth <- "1/1/2000"])
            let rowidpet2 = addData(pets, data: [name <- "Rex", dateOfBirtth <- "2/2/2002"])

            let rowidVeterinary = addData(veterinary, data: [name_veterinary <- "Doctor1", phone <- "0123", address <- "HN", note_veterinary <- "note1"])

            _ = addData(detailVeterinary, data: [id_pet <- rowidpet!, id_veterinary <- rowidVeterinary!])
            
            let rowidVeterinary2 = addData(veterinary, data: [name_veterinary <- "Doctor2", phone <- "0123", address <- "HCM", note_veterinary <- "note2"])
            _ = addData(detailVeterinary, data: [id_pet <- rowidpet!, id_veterinary <- rowidVeterinary2!])
            _ = addData(detailVeterinary, data: [id_pet <- rowidpet2!, id_veterinary <- rowidVeterinary2!])
            
            _ = addData(petImages, data: [id_pet <- 1, imagePath <- "local/...1"])
            _ = addData(petImages, data: [id_pet <- 1, imagePath <- "local/...2"])
            _ = addData(milestone, data: [id_pet <- 1, title <- "title", note_milestone <- "note"])
            
            
            print(path)
            
            let vete = getVeterinary(1)
            print(vete.count)
            print(vete[0].name)
            print(vete[1].name)
            let vete2 = getVeterinary(2)
            print(vete2.count)
            print(vete2[0].name)
//            let count = try db?.scalar(pets.count)
//            print(count)
            //delete(petImages, ID: 1)
            
            //update(milestone, 1, data: [title <- "title2", note_milestone <- "note"])
            
        } catch {
            //db = nil
            print("Unable to open database")
        }
    }
    
    
/*
     CREATE TABLE "PETS" (
     "id" INTEGER PRIMARY KEY NOT NULL,
     "name" TEXT,
     "dateOfBirtth" TEXT
     )
*/
    func createTablePets(){
        do {
            try db!.run(pets.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(name)
                table.column(dateOfBirtth)
            })
        } catch {
            print("Unable to create table Pets")
        }
    }
    func createTablePetImage(){
        do {
            try db!.run(petImages.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(id_pet)
                table.column(imagePath, unique: true)
                table.foreignKey(id_pet, references: pets, id, delete: .cascade)
            })
        } catch {
            print("Unable to create table PetImage")
        }
    }
    func createTableMilestone(){
        do {
            try db!.run(milestone.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(id_pet)
                table.column(title)
                table.column(note_milestone)
                table.foreignKey(id_pet, references: pets, id, delete: .cascade)
            })
        } catch {
            print("Unable to create table Milestone")
        }
    }
    func createTableVeterinary(){
        do {
            try db!.run(veterinary.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(name_veterinary)
                table.column(phone)
                table.column(address)
                table.column(note_veterinary)
            })
        } catch {
            print("Unable to create table Veterinary")
        }
    }
    func createTableDetailVeterinary(){
        do {
            try db!.run(detailVeterinary.create(ifNotExists: true) { table in
                //table.column(id_detailVeterinary, primaryKey: true)
                table.column(id_pet)
                table.column(id_veterinary)
                table.primaryKey(id_pet, id_veterinary)
                table.foreignKey(id_pet, references: pets, id, delete: .cascade)
                table.foreignKey(id_veterinary, references: veterinary, id, delete: .cascade)
            })
        } catch {
            print("Unable to create table DetailVeterinary")
        }
    }
    func createTableMedication(){
        do {
            try db!.run(medication.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(name_medication)
                table.column(dostage)
                table.column(frequency)
                table.column(side_effects)
                table.column(note_medication)
            })
        } catch {
            print("Unable to create table Veterinary")
        }
    }
    func createTableDetailMedication(){
        do {
            try db!.run(detailMedicaton.create(ifNotExists: true) { table in
                table.column(id_pet)
                table.column(id_medication)
                table.primaryKey(id_pet, id_medication)
                table.foreignKey(id_pet, references: pets, id, delete: .cascade)
                table.foreignKey(id_medication, references: medication, id, delete: .cascade)
            })
        } catch {
            print("Unable to create table DetailMedication")
        }
    }
    func createTableAllergy(){
        do {
            try db!.run(allergy.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(name_allergy)
                table.column(reaction)
                table.column(severity)
                table.column(note_allergy)
            })
        } catch {
            print("Unable to create table Allergy")
        }
    }
    func createTableDetailAllergy(){
        do {
            try db!.run(detailAllergy.create(ifNotExists: true) { table in
                table.column(id_pet)
                table.column(id_allergy)
                table.primaryKey(id_pet, id_allergy)
                table.foreignKey(id_pet, references: pets, id, delete: .cascade)
                table.foreignKey(id_allergy, references: allergy, id, delete: .cascade)
            })
        } catch {
            print("Unable to create table DetailAllergy")
        }
    }
    func createTableVaccination(){
        do {
            try db!.run(vaccination.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(name_vaccination)
                table.column(received)
                table.column(remind)
                table.column(note_vaccination)
            })
        } catch {
            print("Unable to create table Vaccination")
        }
    }
    func createTableDetailVaccination(){
        do {
            try db!.run(detailVaccination.create(ifNotExists: true) { table in
                table.column(id_pet)
                table.column(id_vaccination)
                table.primaryKey(id_pet, id_vaccination)
                table.foreignKey(id_pet, references: pets, id, delete: .cascade)
                table.foreignKey(id_vaccination, references: vaccination, id, delete: .cascade)
            })
        } catch {
            print("Unable to create table DetailVaccination")
        }
    }
    
    
    
// #MARK: Add Data
    func addData(_ nameTable: Table, data: [Setter]) -> Int64? {
        do {
            let insert = nameTable.insert(data)
            let rowid = try db!.run(insert)

            return rowid
        } catch let err as NSError{
            print("Insert failed - \(err.localizedDescription)")
            return nil
        }
        
    }
    

    
// #MARK: Get Data
    func getPets() -> [Pet] {
        var pets = [Pet]()
        do {
            for p in try db!.prepare(self.pets) {
                pets.append(Pet(id: p[id], name: p[name], dateOfBirth: p[dateOfBirtth]!))
            }
        } catch {
            print("Get failed")
        }
        return pets
    }
    
    func getImagePets(_ pid: Int64) -> [PetImage] {
        var petsImage = [PetImage]()
        do {
            for p in try db!.prepare(self.petImages.filter(id_pet == pid)) {
                petsImage.append(PetImage(id_image: p[id], id_pet: p[id_pet], image_path: p[imagePath]!))
            }
        } catch {
            print("Get failed")
        }
        return petsImage
    }
    
    func getMilestones(_ pid: Int64) -> [Milestone] {
        var milestones = [Milestone]()
        do {
            for p in try db!.prepare(self.milestone.filter(id_pet == pid)) {
                milestones.append(Milestone(id_milestone: p[id], id_pet: p[id_pet], title: p[title]!, note: p[note_milestone]!))
            }
        } catch {
            print("Get failed")
        }
        return milestones
    }
 
    func getVeterinary(_ pid: Int64) -> [Veterinary] {
        var veterinary = [Veterinary]()
        
        do {
            let tblDetail = detailVeterinary.filter(id_pet == pid)
            
            for p in try db!.prepare(self.veterinary.join(tblDetail, on: id_veterinary == self.veterinary[id])) {
                veterinary.append(Veterinary(id_veterinary: p[id], name: p[name_veterinary]!, phone: p[phone]!, address: p[address]!, note: p[note_veterinary]!))
            }
        } catch {
            print("Get failed")
        }
        return veterinary
    }
    
    func getMedication(_ pid: Int64) -> [Medication] {
        var medication = [Medication]()
        do {
            let tblDetail = detailMedicaton.filter(id_pet == pid)
            
            for p in try db!.prepare(self.medication.join(tblDetail, on: id_medication == self.medication[id])) {
                medication.append(Medication(id_medication: p[id], name: p[name_medication]!, dostage: p[dostage]!, frequency: p[frequency]!, side_effects: p[side_effects]!, note: p[note_medication]!))
            }
        } catch {
            print("Get failed")
        }
        return medication
    }
    
    func getAllergy(_ pid: Int64) -> [Allergy] {
        var allergy = [Allergy]()
        do {
            let tblDetail = detailAllergy.filter(id_pet == pid)
            
            for p in try db!.prepare(self.allergy.join(tblDetail, on: id_allergy == self.allergy[id])) {
                allergy.append(Allergy(id_allergy: p[id], name: p[name_allergy]!, reaction: p[reaction]!, severity: p[severity]!, note: p[note_allergy]!))
            }
        } catch {
            print("Get failed")
        }
        return allergy
    }
    
    func getVaccination(_ pid: Int64) -> [Vaccination] {
        var vaccination = [Vaccination]()
        do {
            let tblDetail = detailVaccination.filter(id_pet == pid)
            for p in try db!.prepare(self.vaccination.join(tblDetail, on: id_vaccination == self.vaccination[id])) {
                vaccination.append(Vaccination(id_vaccination: p[id], name: p[name_vaccination], received: p[received]!, remind: p[remind], note: p[note_vaccination]!))
            }
        } catch {
            print("Get failed")
        }
        return vaccination
    }
    
   
// MARK: DELETE Data
    func delete(_ nameTable: Table, ID: Int64)  {
        do {
            let tbl = nameTable.filter(id == ID)
            try db!.run(tbl.delete())
        } catch {
            print("Delete failed")
        }
    }
    
    
// MARK: UPDATE Data
    func update(_ nameTable: Table, _ pid: Int64, data: [Setter]) {
        let tbl = nameTable.filter(id == pid)
        do {
            let update = tbl.update(data)
            try db!.run(update)
        } catch let err as NSError {
            print("Update failed - \(err.localizedDescription)")
        }
    }
    
    
    
    
    
}
