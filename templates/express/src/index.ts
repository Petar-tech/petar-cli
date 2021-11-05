import { config } from "dotenv";
import express from "express";

import routes from "src/routes";

config();

const application = express();
const port = process.env.PORT || 8081;

application.use(routes);

const server = application.listen(port);

server.on("listening", () => console.info(`Listening on PORT: ${port}`));
