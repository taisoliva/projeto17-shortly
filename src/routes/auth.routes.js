import { Router } from "express";
import { SignUp } from "../controllers/auth.controllers.js";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";
import { userSchema } from "../schemas/auth.schemas.js";

const authRouter = Router()

authRouter.post("/signup", validateSchema(userSchema), SignUp)

export default authRouter