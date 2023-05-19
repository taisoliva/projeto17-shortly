import joi from "joi"

export const userSchema = joi.object({
    name: joi.string().required(),
    email:joi.string().email().required(),
    password: joi.string().min(3).required(),
    confirmPassword: joi.string().min(3).required()
})

export const loginSchema = joi.object({
    name:joi.string().required(),
    password: joi.string().min(3).required()
})