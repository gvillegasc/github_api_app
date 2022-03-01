import { Router } from "express";
import { commits } from "../controllers/commit.controller";

const router = Router();

router.get("/", commits);

export default router;
