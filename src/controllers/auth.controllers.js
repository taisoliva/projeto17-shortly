import {db} from "../database/database.js"
import bcrypt from "bcrypt"
import {v4 as uuid} from "uuid"

export async function SignUp(req, res){

    const{name, email, password, confirmPassword} = req.body

    if(password !== confirmPassword) return res.status(422).send("Senhas não são iguais")

    try{

        const hash = bcrypt.hashSync(password, 10)

        await db.query(`INSERT INTO users (name, email, password)
                                VALUES ($1,$2,$3)`, [name, email, hash])
        res.sendStatus(201)
    }catch(err){
        if (err.code === '23505') {  // Código de erro específico para violação de chave única
            return res.status(409).send("Email já existente");
        }
        res.status(500).send(err.message)
    }
}