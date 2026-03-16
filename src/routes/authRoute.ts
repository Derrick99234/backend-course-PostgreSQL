import express from "express";
import { register } from "../controller/authController.ts";

const router: express.Router = express.Router();

router.post("/register", register);

export default router;
