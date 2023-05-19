import { db } from "../database/database.js";

export async function authValidation(req, res, next){
    const {authorization} = req.headers
    const token = authorization?.replace("Bearer ", "")
    console.log(token)
    if (!token) return res.sendStatus(401)

    try{
        const session = await db.query(`SELECT * FROM autorization WHERE token=$1`, [token])
        if(!session.rows[0]) return res.sendStatus(401)

        res.locals.session = session.rows[0]

        next()
    } catch(err){
        return res.status(500).send(err.message)
    }
}