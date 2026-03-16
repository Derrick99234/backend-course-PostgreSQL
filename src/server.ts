import express from "express";
import movieRoutes from "./routes/movieRoutes.ts";
import authRoute from "./routes/authRoute.ts";
import dotenv from "dotenv";

dotenv.config();
const app = express();

const PORT = process.env.PORT || 3000;

app.use("/movies", movieRoutes);
app.use("/auth", authRoute);

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
