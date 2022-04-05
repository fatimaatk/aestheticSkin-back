//on crée notre middleware
const verifyJWT = (req, res, next) => {
  const token = req.headers["x-access-token"];
  if (!token) return res.status(401).json({ error: "No token provided" })
  jwt.verify(token, process.env.SERVER_SECRET, (err, decoded) => {
    if (err) return res.json({ error: 'Invalid Token' }).status(401);
    next();
  })
}

export default verifyJWT;