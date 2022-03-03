const createError = require('http-errors');
const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const cors = require('cors')

require('dotenv').config()

const topicRouter = require('./routes/topic');
const statusRouter = require('./routes/status');
const topicCancelRouter = require('./routes/topicCancel');
const categoryRouter = require('./routes/category');

const app = express();

app.use(logger('dev'));
app.use(express.json());
app.use(cors());
app.use(express.urlencoded({ extended: true }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

const db = require("./models");
db.sequelize.sync();

// api router
app.use('/api/topics', topicRouter);
app.use('/api/statuses', statusRouter);
app.use('/api/topic-cancel', topicCancelRouter);
app.use('/api/categories', categoryRouter);

// use static
app.use('/', express.static(path.join(__dirname, 'dist/project')));
app.use('/metadata/:id', express.static(path.join(__dirname, 'dist/project')));

// catch 404 and forward to error handler
app.use(function (req, res, next) {
    next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
    // set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};

    // render the error page
    res.status(err.status || 500);
    res.json({
        message: err.message || "Đã xảy ra lỗi, vui lòng thử lại sau!"
    });
});

module.exports = app;
