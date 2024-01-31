const express = require('express');
const app = express();
const path = require('path');
const fileUpload = require('express-fileupload');
const cors = require('cors');
const rootdir = require('path').resolve('./');
var fs = require('fs');
const url = 'http://localhost:3001/uploads/';
require('dotenv/config');
app.use(cors());
app.use(express.json({ limit: '50mb' }));
app.use(express.urlencoded({ limit: '50mb' }));
app.use('/uploads', express.static('uploads'));
app.use(express.static(path.join(__dirname, 'public')));
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.post('/upload',fileUpload({ createParentPath: true }), async (req, res) => {

try{
  console.log(req.files)
  res.jsn({paht: url})
}catch(err){
res.json({tetx:  'sdsds'})
}

});


app.listen(3001, () => {
    console.log('Server started');
});
