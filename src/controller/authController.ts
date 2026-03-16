import express from "express";
import { prisma } from "../config/db.ts";

const register = async (req: express.Request, res: express.Response) => {
  const { name, email, password } = req.body;

  const user = await prisma.user.findUnique({
    where: {
      email,
    },
  });

  if (user) {
    return res.status(400).json({ message: "User already exists" });
  }
};

export { register };
