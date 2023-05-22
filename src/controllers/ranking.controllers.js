import { db } from "../database/database.js"

export async function usersMe(req, res) {

    const session = res.locals.session
    const shortens = await db.query(`SELECT shorten.*, links.url, users.name FROM shorten
                                     JOIN links ON shorten."id" = links."shortId" 
                                     JOIN users ON shorten."userId" = users."id" 
                                     WHERE shorten."userId"=$1`, [session.userId])

    const visitTotal = await db.query(`SELECT SUM("visitCount") AS "visitCount", 
                                       "userId" FROM shorten 
                                       WHERE "userId"=$1 
                                       GROUP BY "userId"`, [session.userId])

    const objetc = {
        id: session.userId,
        name: shortens.rows[0].name,
        visitCount: visitTotal.rows[0].visitCount,
        shorteneUrls: shortens.rows.map(item => ({
            id: item.id,
            shortUrl: item.shortUrl,
            url: item.url,
            visitCount: item.visitCount
        }))
    }

    res.status(200).send(objetc)
}

export async function ranking(req, res) {

    const shortens = await db.query(`SELECT SUM("visitCount") AS "visitCount", 
                                     COUNT("userId") AS "linksCount", "userId",
                                     users.name
                                     FROM shorten 
                                     JOIN users ON shorten."userId" = users."id"
                                     GROUP BY "userId", users.name 
                                     ORDER BY "visitCount" DESC
                                     LIMIT 10`)

    console.log(shortens.rows)
    const object = shortens.rows.map(item => ({
        id:item.userId,
        name:item.name,
        linksCount:item.linksCount,
        visitCount:item.visitCount
    }))

    res.status(200).send(object)
}