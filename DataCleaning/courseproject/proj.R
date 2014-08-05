## load data
basedir = "D:\\UCI HAR Dataset\\"

loadInertialSig <- function(basedir, type="test", scope="body", asp ="acc", dim="x" ){
    dir = paste0(basedir, type, "\\Inertial Signals\\", scope, "_", asp, "_", dim, "_", type, ".txt")
    read.table( file = dir, header = FALSE,  nrows = 100)
}

body_acc_x_test <- loadInertialSig( basedir, "test", "body", "acc", "x" )
body_acc_y_test <- loadInertialSig( basedir, "test", "body", "acc", "y" )
body_acc_z_test <- loadInertialSig( basedir, "test", "body", "acc", "z" )
body_gyro_x_test <- loadInertialSig( basedir, "test", "body", "gyro", "x" )
body_gyro_y_test <- loadInertialSig( basedir, "test", "body", "gyro", "y" )
body_gyro_z_test <- loadInertialSig( basedir, "test", "body", "gyro", "z" )
total_acc_x_test <- loadInertialSig( basedir, "test", "total", "acc", "x" )
total_acc_y_test <- loadInertialSig( basedir, "test", "total", "acc", "y" )
total_acc_z_test <- loadInertialSig( basedir, "test", "total", "acc", "z" )

body_acc_x_train <- loadInertialSig( basedir, "train", "body", "acc", "x" )
body_acc_y_train <- loadInertialSig( basedir, "train", "body", "acc", "y" )
body_acc_z_train <- loadInertialSig( basedir, "train", "body", "acc", "z" )
body_gyro_x_train <- loadInertialSig( basedir, "train", "body", "gyro", "x" )
body_gyro_y_train <- loadInertialSig( basedir, "train", "body", "gyro", "y" )
body_gyro_z_train <- loadInertialSig( basedir, "train", "body", "gyro", "z" )
total_acc_x_train <- loadInertialSig( basedir, "train", "total", "acc", "x" )
total_acc_y_train <- loadInertialSig( basedir, "train", "total", "acc", "y" )
total_acc_z_train <- loadInertialSig( basedir, "train", "total", "acc", "z" )