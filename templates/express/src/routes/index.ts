import { Router } from "express";

import homeControllerFactory from "controllers/home";

const router = Router();

const HomeController = homeControllerFactory();

router.get("/", HomeController.Index);

export default router;
