import { db } from "../database/database.js";
import { nanoid } from "nanoid"

export async function createShortly(req, res) {

    const { url } = req.body
    const session = res.locals.session
    try {

        const shortUrl = nanoid()
        await db.query(`INSERT INTO shorten ("shortUrl", "userId")
                                VALUES ($1,$2)`, [shortUrl, session.id])
        await insertUrl(url, session)

        res.sendStatus(201)
    } catch (err) {
        if (err.code === '23505') {  // Código de erro específico para violação de chave única
            return res.status(409).send("ShortUrl Adicionada");
        }
        return res.status(500).send(err.message)
    }
}

async function insertUrl(url,session){

   try{
        const urlLocal = await db.query(`SELECT * FROM shorten WHERE "userId"=$1`, [session.id])
        await db.query(`INSERT INTO links (url, "shortId")
                                    VALUES($1, $2)`, [url, urlLocal.rows[0].id])
                               
   }catch(err){
    return (err.message)
   }
}