import { config } from "dotenv";
import express from "express";

config()

const application = express();
const port = process.env.PORT || 8081

application.get("/",(_,resp) => resp.send("<h1>Hello</h1>"))


const server = application.listen(port)
server.on("listening",() => console.info(`Listening on PORT: ${port}`))