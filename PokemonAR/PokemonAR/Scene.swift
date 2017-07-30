//
//  Scene.swift
//  PokemonAR
//
//  Created by Miguel Herrero on 28/7/17.
//  Copyright © 2017 Miguel Herrero. All rights reserved.
//

import SpriteKit
import ARKit
import GameplayKit

class Scene: SKScene {
    
    let remainingLabel = SKLabelNode()
    var timer: Timer?
    var targetsCreated = 0
    var targetCount = 0 {
        didSet{
            self.remainingLabel.text = "Faltan: \(targetCount)"
        }
    }
    let startTime = Date()
    let deathSound = SKAction.playSoundFileNamed("QuickDeath", waitForCompletion: false)
    
    var score = 0.0
    var bonus = 1.0
    var secondsFromLastHit = 0
    var lastHitTimer: Timer?
    
    override func didMove(to view: SKView) {
        
        // Configuración del HeadUp Display (HUD)
        remainingLabel.fontSize = 30
        remainingLabel.fontName = "Avenir Next"
        remainingLabel.color = .white
        remainingLabel.position = CGPoint(x: 0, y: view.frame.midY - 50)
        addChild(remainingLabel)
        targetCount = 0
        
        // Creación de enemigos cada 3 segundos
        timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true, block: { (timer) in
            self.createTarget()
        })
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //1. Localizar el primer toque del conjunto de toques y mirar si el toque cae dentro de nuestra vista de AR
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        // print("Toque en \(location.x), \(location.y)")

        //2. Buscar todos los nodos que han sido tocados por el usuario
        let hit = nodes(at: location)

        //3. Coger el primer Sprite del array que nos devuelve el paso 2 (si lo hay) y animar ese Pokemon hasta hacerlo desaparecer
        if let sprite = hit.first {
            let scaleOut = SKAction.scale(to: 2, duration: 0.4)
            let fadeOut = SKAction.fadeOut(withDuration: 0.4)
            let removeFromParent = SKAction.removeFromParent()
            let groupAction = SKAction.group([scaleOut, fadeOut, deathSound])
            let sequenceAction = SKAction.sequence([groupAction, removeFromParent])
            
            sprite.run(sequenceAction)
            
            //4. Actualizar que hay un pokemon menos con la variable targetCount
            targetCount -= 1
            
            //5. Actualizar la puntuación del jugador
            if self.secondsFromLastHit <= 5 {
                // Han pasado menos de 5 segundos desde que eliminó al último pokemon
                bonus = 1.5
                score += (10 * bonus)
                
                // Reseteamos el contador de última eliminación
                lastHitTimer?.invalidate()
                secondsFromLastHit = 0
                lastHitTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
                    self.secondsFromLastHit += 1
                })
            } else {
                // Han pasado más de 5 s desde que eliminó el último pokemon
                bonus = 1.0
                score += (10 * bonus)
                
                // Reseteamos el contador de la última eliminación
                lastHitTimer?.invalidate()
                secondsFromLastHit = 0
            }

            if targetsCreated == 10 && targetCount == 0 {
                gameOver()
            }
        }
    }
    
    func createTarget() {
        
        if targetsCreated == 10 {
            timer?.invalidate()
            timer = nil
            return
        }
        
        targetsCreated += 1
        targetCount += 1
        
        guard let sceneView = self.view as? ARSKView else {
            return
        }
        
        //1. Crear un generador de numeros aleatorios
        let random = GKRandomSource.sharedRandom()
        
        //2. Crear una matriz de rotación aleatoria en X
        let rotateX = simd_float4x4(SCNMatrix4MakeRotation(2.0 * Float.pi * random.nextUniform(), 1, 0, 0))
        
        //3. Crear una matriz de rotación aleatoria en Y
        let rotateY = simd_float4x4(SCNMatrix4MakeRotation(2.0 * Float.pi * random.nextUniform(), 0, 1, 0))
        
        //4. Combinar las dos rotaciones con un producto de matrices
        let rotation = simd_mul(rotateX, rotateY)
        
        //5. Crear una traslación de 1,5 m en la dirección de la pantalla
        var translation = matrix_identity_float4x4
        let translationDistance = random.nextUniform() * 1.5 + 1
        translation.columns.3.z = -translationDistance
        
        //6. Combinar la rotación del paso 4 con la traslacion del paso 5
        let transform = simd_mul(rotation, translation)
        
        //7. Crear un punto de ancla en el punto final determinado en el paso 6
        let anchor = ARAnchor(transform: transform)

        //8. Añadir esa ancla a la escena
        sceneView.session.add(anchor: anchor)
        
        //9. Eliminar el ancla (pokemon) de la pantalla tras 12 segundos
        /*_ = Timer.scheduledTimer(withTimeInterval: 12, repeats: false) { (timer) in
            sceneView.session.remove(anchor: anchor)
            self.targetCount -= 1
        }*/
    }
    
    func gameOver() {
        //1. Ocultar la remainign label
        remainingLabel.removeFromParent()

        //2. Crear una nueva imagen con el Game Over
        let gameOver = SKSpriteNode(imageNamed: "gameOver")
        gameOver.position = CGPoint(x: 0, y: -30)
        addChild(gameOver)

        //3. Calcular cuánto tiempo le ha llevado a lusuario cazar todos los pokemon
        let timeTaken = Date().timeIntervalSince(startTime)

        //4. Mostrar ese tiempo que le ha llevado en pantalla en una etiqueta nueva
        let timeTakenLabel = SKLabelNode(text: "Te ha llevado \(Int(timeTaken)) segundos")
        timeTakenLabel.fontSize = 40
        timeTakenLabel.fontName = "Avenir Next"
        timeTakenLabel.color = .white
        timeTakenLabel.position = CGPoint(x: 0, y: view!.frame.midY - 100)
        
        addChild(timeTakenLabel)
        
        print("Score: \(score)")
    }
}
