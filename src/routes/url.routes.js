import { Router } from "express";
import { createShortly, getUrl} from "../controllers/urls.controllers.js";
import { authValidation } from "../middlewares/authValidation.middleware.js";
import { urlSchema } from "../schemas/url.schema.js";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";

const urlRouter = Router()

urlRouter.post("/urls/shorten", validateSchema(urlSchema), authValidation ,createShortly)
urlRouter.get("/urls/:id", getUrl)

export default urlRouter