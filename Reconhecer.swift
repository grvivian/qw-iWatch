//
//  reconhecer.swift
//  HelloWatch
//
//  Created by glaucio on 5/8/16.
//  Copyright © 2016 glaucio. All rights reserved.
//

import UIKit

public class Reconhecer: NSObject {
    let P1: Int = 1
    let P2: Int = 2
    let P3: Int = 3
    let P4: Int = 4
    let P5: Int = 5
    let P6: Int = 6
    let P7: Int = 7
    let P8: Int = 8
    let P9: Int = 9
    
    let MA: [String] = ["k","s","m","q","a"," "," "," ","p","f","n","l","x","h","e","c","u","t","y","v","w","o","g","z"," "," ","","i","j","r","d","b"]
    
    let MB: [String] = ["K","S","M","Q","A"," "," "," ","P","F","N","L","X","H","E","C","U","T","Y","V","W","O","G","Z"," ","\n"," ","I","J","R","D","B"]
    
    let MC: [String] = ["`","{","/","\\","?"," "," "," ","^","}","!","*","%","'",";","_","\"",":","&","|","-",",","[","@"," "," "," ",".","$","+","]","#"]

    let MD: [String] = ["(","{","/","=","1"," "," "," ",")","}","2","*","%","3","5","7","4","6","8","<","9",",","[","-"," ","\n"," ",".",">","0","]","+"]

    var Fila = [Int](count:5, repeatedValue: 0)
    var Inicio = Bool(false)
    var PosFila = Int(0)
    var lastSensor = Int(255)
    var pos = Int(0)
    //var Sensor = Int(-1)
    var mapaAtual: String = "A"
    var mapaShift: String = "0"
    
    func reconhecer() -> Int{
        if (Fila[0] == P5){
            switch (Fila[1]) {
            case P1:
                if (Fila[2] == P2) {
                    if ((Fila[3] == P3) && (Fila[4] == P5)) {return 0}
                    else if  (Fila[3] == P5) {return 1}
                }
                else if (Fila[2] == P4) {
                    if  (Fila[3] == P5) {return 2}
                    else if ((Fila[3] == P7) && (Fila[4] == P5)) {return 3}
                }
                else if (Fila[2] == P5) {return 4}
            case P2:
                if ((Fila[2] == P1) && (Fila[3] == P5)) {
                    setMapaC()
                    return 255
                }
                else if ((Fila[2] == P3) && (Fila[3] == P5)) {
                    setMapaB()
                    return 255
                }
                else if  (Fila[2] == P5) {return 7}
            case P3:
                if (Fila[2] == P2) {
                    if ((Fila[3] == P1) && (Fila[4] == P5)) {return 8}
                    else if (Fila[3] == P5) {return 9}
                }
                else if (Fila[2] == P5) {return 10}
                else if (Fila[2] == P6) {
                    if (Fila[3] == P5) {return 11}
                    else if ((Fila[3] == P9) && (Fila[4] == P5)) {return 12}
                }
            case P4:
                if ((Fila[2] == P1) && (Fila[3] == P5)) {return 13}
                else if  (Fila[2] == P5) {return 14}
                else if ((Fila[2] == P7) && (Fila[3] == P5)) {return 15}
            case P6:
                if ((Fila[2] == P3) && (Fila[3] == P5)) {return 16}
                else if  (Fila[2] == P5) {return 17}
                else if ((Fila[2] == P9) && (Fila[3] == P5)) {return 18}
            case P7:
                if (Fila[2] == P4) {
                    if ((Fila[3] == P1) && (Fila[4] == P5)) {return 19}
                    else if (Fila[3] == P5) {return 20}
                }
                else if (Fila[2] == P5) {return 21}
                else if (Fila[2] == P8) {
                    if (Fila[3] == P5) {return 22}
                    else if ((Fila[3] == P9) && (Fila[4] == P5)) {return 23}
                }
            case P8:
                if  (Fila[2] == P5) {return 24}
                else if ((Fila[2] == P7) && (Fila[3] == P5)) {return 25}
                else if ((Fila[2] == P9) && (Fila[3] == P5)) {
                    setMapaD()
                    return 255
                }
            case P9:
                if  (Fila[2] == P5) {return 27}
                else if (Fila[2] == P6) {
                    if ((Fila[3] == P3) && (Fila[4] == P5)) {return 28}
                    else if (Fila[3] == P5) {return 29}
                }
                else if (Fila[2] == P8) {
                    if (Fila[3] == P5) {return 30}
                    else if ((Fila[3] == P7) && (Fila[4] == P5)) {return 31}
                }
            default:
                return 255
            }
        }
        return 255
    }
    
    func setMapaA(){
        mapaAtual = "A"
        mapaShift = "0"
    }
    
    func setMapaB(){
        //se shift ja tiver apontando para o mapa entao mudar o mapa
        if (mapaShift == "B" ){
            mapaAtual = "B"
            mapaShift = "A"
        } else if (mapaAtual == "B") {
            setMapaA()
        } else {
            mapaShift = "B"
        }
    }
    
    func setMapaC(){
        if (mapaShift == "C"){
            mapaAtual = "C"
            mapaShift = "A"
        } else if (mapaAtual == "C") {
            setMapaA()
        } else {
            mapaShift = "C"
        }
    }
    
    func setMapaD(){
        if (mapaShift == "D") {
            mapaAtual = "D"
            mapaShift = "A"
        } else if (mapaAtual == "D") {
            setMapaA()
        } else {
            mapaShift = "D"
        }
    }
    
    func getCharFromMapa(mapa: String, num: Int) -> String {
        if (mapa == "A") {
            return MA[num]
        }else if (mapa == "B") {
            return MB[num]
        }else if (mapa == "C") {
            return MC[num]
        }else if (mapa == "D") {
            return MD[num]
        }
        
        return " "
    }
    
    
    func getChar(num: Int) -> String{
        if (num > 31) {
            return "" //nao retornar caracter valido
        }
        
        if (mapaShift != "0") {
            let aux: String = getCharFromMapa(mapaShift, num: num)
            mapaShift = "0"
            return aux
        }
        
        return getCharFromMapa(mapaAtual, num: num)
    }
    

    func addSensor(numero: Int){
        //1. Verificar se esta em processo de reconhecimento de caractere atraves da variavel Inicio
        if (Inicio == false) {
            //1.1 Se nao estiver em processo de reconhecimento:
            //iniciar o processo quando receber o sinal do sensor 5, colocar o numero do sensor em uma fila
            if (numero == P5) {
                Inicio = true
                Fila[PosFila] = numero
                PosFila++
            }
        }
        else {
            //1.2
            Fila[PosFila] = numero
            PosFila++
            if (numero == P5) {
                let s: String = getChar(reconhecer())
                print(s)
                lastSensor = 255
                //numero = -1
                Inicio = false
                PosFila = 0
            }
        }
    }


}
