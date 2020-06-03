/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Hyejin
 * Created: May 31, 2020
 */

CREATE TABLE USERS
("NAME" VARCHAR(50),
EMAIL VARCHAR(50) NOT NULL,
PASSWORD VARCHAR(20),
GENDER VARCHAR(10),
FAVORITECOLOR VARCHAR(50),
PRIMARY KEY(EMAIL));
