import { db } from "../database/database.js";
import { nanoid } from "nanoid"

export async function createShortly(req, res) {

    const { url } = req.body
    const session = res.locals.session
    console.log(session)
    try {

        const shortUrl = nanoid()
        await db.query(`INSERT INTO shorten ("shortUrl", "userId")
                                VALUES ($1,$2)`, [shortUrl, session.userId])
        const id = await insertUrl(url, shortUrl)
        console.log(id)

        res.status(201).send({
            id: id,
            shortUrl:shortUrl
        })
    } catch (err) {
        if (err.code === '23505') {  // Código de erro específico para violação de chave única
            return res.status(409).send("ShortUrl Adicionada");
        }
        return res.status(500).send(err.message)
    }
}

async function insertUrl(url, shortUrl) {

    try {
        const urlLocal = await db.query(`SELECT * FROM shorten WHERE "shortUrl"=$1`, [shortUrl])
        await db.query(`INSERT INTO links (url, "shortId")
                                    VALUES($1, $2)`, [url, urlLocal.rows[0].id])
        return urlLocal.rows[0].id

    } catch (err) {
        return (err.message)
    }
}

export async function getUrl(req, res) {

    const { id } = req.params
    try {
        const shorten = await db.query(`SELECT shorten.*, links.url FROM shorten
		JOIN links on shorten."id" = links."shortId" WHERE shorten."id" =$1;`, [id])
        if (!shorten.rows[0]) return res.sendStatus(404)

        res.status(200).send({
            id: id,
            shortUrl: shorten.rows[0].shortUrl,
            url: shorten.rows[0].url
        })
    } catch (err) {
        return res.status(500).send(err.message)
    }
}

export async function open(req, res){
    const {shortUrl} = req.params
    
    
    const short = await db.query(`SELECT * FROM shorten WHERE "shortUrl" = '${shortUrl}'`)
    console.log(short.rows[0])
    if(!short.rows[0]) return res.sendStatus(404)
    

    const url = await db.query(`SELECT * FROM links WHERE "shortId" = $1 `, [short.rows[0].id])
    const soma = short.rows[0].visitCount + 1;

    await db.query(`UPDATE shorten SET "visitCount" = '${soma}' WHERE id = '${short.rows[0].id}'`)

    res.redirect(url.rows[0].url)
}

export async function deleteUrl(req, res){

    const { id } = req.params
    const session = res.locals.session

    console.log(session.userId)

    const checkUrl = await db.query(`SELECT * FROM shorten WHERE id=$1`, [id])
    if(!checkUrl.rows[0]) return res.sendStatus(404)

    const shortUrl = await db.query(`SELECT * FROM shorten WHERE id=$1 AND "userId"=$2`, [id, session.userId])
    if(!shortUrl.rows[0]) return res.sendStatus(401)

    await db.query(`DELETE FROM links WHERE "shortId"=$1`,[id])
    await db.query(`DELETE FROM shorten WHERE id=$1`,[id])
    
    res.sendStatus(204)

}