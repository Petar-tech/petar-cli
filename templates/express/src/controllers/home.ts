import { Request, Response } from "express";

class HomeController {
  public Index(request: Request, response: Response): void {
    response.send("Hello World!!!!!!!");
  }
}

export default () => new HomeController();
