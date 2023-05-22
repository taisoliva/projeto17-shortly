import { Router } from "express";
import { usersMe, ranking } from "../controllers/ranking.controllers.js";
import { authValidation } from "../middlewares/authValidation.middleware.js";

const rankingRouter = Router()

rankingRouter.get("/users/me", authValidation, usersMe)
rankingRouter.get("/ranking", ranking)

export default rankingRouter