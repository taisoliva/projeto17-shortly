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

export async function signIn(req, res){

    const {email, password} = req.body

    try{
        const user = await db.query(`SELECT * FROM users WHERE email ='${email}'`)
        if(!user.rows[0]) return res.status(401).send("Email ou Senha Inválidos")

        const checkPassword = bcrypt.compareSync(password, user.rows[0].password)
        if(!checkPassword) return res.status(401).send("Email ou Senha errados")

        const token = uuid()
        await db.query(`INSERT INTO autorization (token, "userId")
                                VALUES ($1, $2)`, [token,user.rows[0].id ])
        res.status(200).send({token: token})
    }catch(err){
        return res.status(500).send(err.message)
    }
}