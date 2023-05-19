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