const bcrypt = require('bcryptjs')
const asyncHanlder = require('express-async-handler')
const User = require('../models/user.model')
const i18n = require("i18n");
const logger = require('../utils/log4jsutil.js');
const AppError = require('../utils/app.error');
const moment = require('moment');
const config = require('config');
const basicUtil = require("../utils/basic.util");
const UserPasswordResetModel = require('../models/userPasswordReset.model');
const Status = require('../utils/status');
const mailUtil = require('../utils/mail.util');
const s3Util = require('../utils/s3.util.js');
const constants = require("./../utils/constants");
const Alluserpasswords = require('../models/alluserpasswords.model');


// @desc    Authenticate a user
// @route   POST /api/v1/auth
// @access  Public
const authenticate = asyncHanlder(async (req, res) => {
    logger.trace("[authController] :: authenticate() : Start");

    const { userName, password} = req.body
    //Checks for username
    let user = await User.findOne({ userName })
      
    if (user && (await bcrypt.compare(password, user.password))) {
            if (user.profileImage) {
                try {
                    user.profileImage = await s3Util.generateProfileImagePresignedURL(user.profileImage);
                }
                catch (err) {
                }
            }

            const authresponse = await User.findById(user._id).select('-password');
            res.status(200).json({
                user: authresponse,
                status: constants.USER_STATUS.ACTIVE
            })
        
    } else {
        logger.error("[authController] :: authenticate() : Unauthorized user");
        throw new AppError(401, i18n.__("UNAUTHORIZED"));
    }

    logger.trace("[authController] :: authenticate() : End");
})




const requestPasswordReset = asyncHanlder(async (req, res) => {
    logger.trace("[authController] :: requestPasswordReset() : Start");
    try{
        userName = req.body.userName;
    if (!userName) {
        logger.error("[authController] :: requestPasswordReset() : UserName is null");
        throw new AppError(400, i18n.__("BAD_REQUEST"))
    }

    const user = await User.findOne({ userName });

    if (!user) {
        logger.error("[authController] :: requestPasswordReset() : No users with the given userName");
        throw new AppError(404, i18n.__("USER_NOT_FOUND"))
    }

    let currentTime = moment();
    let passwordLinkValidTime = config.get('PasswordLinkValidPeriod').replace("h", "");
    const expiryTime = moment(currentTime).add(passwordLinkValidTime, 'hours').utc().format('YYYY-MM-DD HH:mm');
    const otp = basicUtil.generateOTP();
    
    const userPasswordResetModel = await UserPasswordResetModel.create({
        user: user._id,
        resetExpiryTime: expiryTime,
        otp: otp 
    });

    
    const mailOptions = {
        to: user.email,
        subject: "Sri Cuisine password reset",
        html: `
            <p>Hi ${user.userName}, </p>
            <p>You have requested to change your Sri Cuisine password. 
               Please enter the following OTP to reset your password:</p>
            <p>OTP: ${otp}</p> 
            <p>This OTP is valid for 24 hours.</p> 
            <p>Thank You,</p>
            <p>Sri Cuisine</p>`
    };

    const mailSent = await mailUtil.sendMail(mailOptions);
    logger.debug("[authController] :: requestPasswordReset() : mailSent : {" + mailSent + " }");

    if (!mailSent) {
        throw new AppError(500, i18n.__("EMAIL_SENDING_FAILED"));
    }

    res.status(200).json({ payload: null, status: Status.getSuccessStatus(i18n.__("SUCCESS")) });

    }catch{
        logger.error("[authController] :: requestPasswordReset() : error : " + error);
        res.status(error.statusCode || 500).json({ message: error.message });  
    }
    

    logger.trace("[authController] :: requestPasswordReset() : End");
})
// @desc    edit a user
// @route   PUT /api/v1/users/:id
// @access  Private
const editUser = asyncHandler(async (req, res) => {
    logger.trace("[projectController] :: editUser() : Start");

    const userId =req.body.userId
    
    if (!userId){
        logger.error("[userController] :: editUser() : user id is a must");
        throw new AppError(400, i18n.__("UNAUTHORIZED"));
    }

    let updates = {
        ...(req.body.userName !== null && req.body.userName != "" && { userName: req.body.userName }),
        ...(req.body.email !== null && req.body.email != "" && { email: req.body.email }),
        ...(req.body.allergens && Array.isArray(req.body.allergens) && { allergens: req.body.allergens }) 
    }

    updates.age = req.body.age;
    updates.weight = req.body.weight;
    updates.height = req.body.height;

    const userNameRegex = /^[^\s]{4,100}$/;
        if (!userNameRegex.test(updates.userName)) {
            logger.error("[userController] :: editUser() : Invalid username format");
            throw new AppError(400, i18n.__("ERROR_INVALID_USERNAME_FORMAT"));
        }


    if (updates.userName !== undefined) {
        const userNameExists = await User.find({
            userName: updates.userName,
            _id: { $ne: currentUser }
        });

        if (userNameExists.length > 0) {
            logger.error("[userController] :: editUser() : Username already exists");
            throw new AppError(400, i18n.__("ERROR_USER_ALREADY_EXISTS"));
        }
    }


    const emailRegex = /^([a-zA-Z0-9_\.-]+)@([a-zA-Z0-9_\.-]+)\.([a-zA-Z]{2,6})$/;
    if (!emailRegex.test(updates.email)) {
        logger.error("[userController] :: editUser() : Invalid email format");
        throw new AppError(400, i18n.__("ERROR_INVALID_EMAIL_FORMAT"));
    }

    const updatedUser = await User.findByIdAndUpdate(userId, updates, { new: true })

    if (!updatedUser) {
        logger.error("[userController] :: editUser() : No users with the given id");
        throw new AppError(404, i18n.__("USER_NOT_FOUND"))
    }

    res.status(200).json(updatedUser);
    logger.trace("[userController] :: editUser() : End");
})


// @desc Delete user
// @route DELETE /api/v1/users/:id
// @access Private
const deleteUser = asyncHandler(async (req, res) => {
    logger.trace("[userController] :: deleteUser() : Start");

    const userId = req.params.id;

    const result = await User.deleteOne({ _id: userId })

    if (!result.deletedCount) {
        logger.error("[userController] :: deleteUser() : No users with the given id");
        throw new AppError(404, i18n.__("USER_NOT_FOUND"))
    }
    res.status(200).json({ payload: null, status: Status.getSuccessStatus(i18n.__("DELETE_SUCCESS")) });
    logger.trace("[userController] :: deleteUser() : End");
})


// const resetPassword = asyncHandler(async (req, res) => {
//     const { resetPasswordToken, newPassword } = req.body;
  
//     const user = await User.findOne({
//       resetPasswordToken,
//       resetPasswordExpires: { $gt: Date.now() },
//     });
  
//     if (!user) {
//       throw new AppError('Invalid or expired password reset token', 400);
//     }
  
//     user.password = await bcrypt.hash(newPassword, 10);
//     user.resetPasswordToken = undefined;
//     user.resetPasswordExpires = undefined;
  
//     await user.save();
  
//     res.status(200).json({ message: 'Password reset successful' });
//   });

  
// const requestPasswordReset = asyncHandler(async (req, res) => {
//     const { userName } = req.body; 
//     const user = await User.findOne({ userName }); 
//     if (!user) {
//       throw new AppError('User not found', 404);
//     }
  
//     const resetToken = basicUtil.generateResetPasswordToken();
//     user.resetPasswordToken = resetToken;
//     user.resetPasswordExpires = Date.now() + 3600000; 
  
//     await user.save();

  
//     await basicUtil.sendPasswordResetEmail(user.email, resetToken); 
//     res.status(200).json({ message: 'Password reset email sent' });
    
// });

module.exports = {
    createUser,
    editUser,
    deleteUser,
    getUsers,
    getUserById
    // loginUser,
    // resetPassword,
    // requestPasswordReset
}