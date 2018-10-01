const mydebug = require('../common/mydebug');
const jwt = require('jsonwebtoken');
process.env.JWTKEY = 'tmp';

module.exports = function auth(req, res, next) {
  const token = req.header('x-auth-token');
  if (!token) {
    mydebug('got req to protected endpoint without token');
    return res.status(401).send('you dont have enough privileges buddy......');
  }

  try {
    const jwtpayload = jwt.verify(token, process.env.JWTKEY);
    if (jwtpayload) {
      req.user = jwtpayload;
      mydebug('token succesful verified and loaded payload to req.user');
      next();
    } else {
      mydebug('hm....');
      return res.status(400).send('hm...');
    }
  } catch (ex) {
    mydebug('token could not be verified');
    return res.status(400).send(ex.message);
  }
};
