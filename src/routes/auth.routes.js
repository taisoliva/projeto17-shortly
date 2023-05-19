import { Router } from "express";
import { SignUp, signIn } from "../controllers/auth.controllers.js";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";
import { userSchema, loginSchema } from "../schemas/auth.schemas.js";

const authRouter = Router()

authRouter.post("/signup", validateSchema(userSchema), SignUp)
authRouter.post("/signin", validateSchema(loginSchema),signIn)

export default authRouter