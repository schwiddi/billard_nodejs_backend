const jwt = require('jsonwebtoken');
process.env.JWTKEY = 'tmp';

module.exports = function auth(req, res, next) {
  const token = req.header('x-auth-token');
  if (!token)
    return res.status(401).send('you dont have enough privileges buddy......');

  try {
    const jwtpayload = jwt.verify(token, process.env.JWTKEY);
    if (jwtpayload) {
      req.user = jwtpayload;
      next();
    } else {
      res.status(400).send('hm...');
    }
  } catch (ex) {
    res.status(400).send('invalid token...');
  }
};
