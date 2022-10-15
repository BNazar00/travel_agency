<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Travel agency</title>

    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        *:before,
        *:after {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        body {
            background-color: #e8f4ea;
        }

        .background {
            width: 28vw;
            height: 70vh;
            position: absolute;
            transform: translate(-50%, -50%);
            left: 50%;
            top: 50%;
        }

        .background .shape {
            height: 13vw;
            width: 13vw;
            position: absolute;
            border-radius: 50%;
        }

        .shape:first-child {
            background: linear-gradient(to top left, rgba(180, 225, 151, 0.9), #27b81d);
            left: -80px;
            top: -80px;
        }

        .shape:last-child {
            background: linear-gradient(to right, #4E944F, #83BD75);
            right: -30px;
            bottom: -80px;
        }

        .login-form {
            height: 75vh;
            width: 400px;
            background-color: rgba(255, 255, 255, 0.13);
            position: absolute;
            transform: translate(-50%, -50%);
            top: 50%;
            left: 50%;
            border-radius: 10px;
            backdrop-filter: blur(10px);
            border: 2px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 0 40px rgba(8, 7, 16, 0.6);
            padding: 50px 35px;
        }

        .login-form * {
            font-family: 'Poppins', sans-serif;
            color: #003000;
            letter-spacing: 0.5px;
            outline: none;
            border: none;
        }

        .login-form h3 {
            padding-bottom: 50px;
            font-size: 32px;
            font-weight: 500;
            line-height: 42px;
            text-align: center;
            padding-top: 15px;
        }

        .login-form input[type="submit"] {
            margin: 15px 0;
            width: 100%;
            background-color: #ffffff;
            color: #080710;
            padding: 15px 0;
            font-size: 1.5em;
            font-weight: 600;
            border-radius: 5px;
            cursor: pointer;
            transition: box-shadow .3s ease-in-out;
        }

        .login-form input[type="submit"]:hover {
            box-shadow: 0px 6px 15px #BCFFB9;
        }

        .login-form label {
            position: absolute;
            user-select: none;
            top: 0;
            left: 0;
            height: 30px;
            line-height: 30px;
            color: rgba(0, 0, 0, 0.65);
            cursor: text;
            transition: all 200ms ease-out;
            z-index: 10;
        }

        .login-form .input-wrapper {
            margin-bottom: 60px;
        }

        .login-form input {
            width: 100%;
            box-sizing: border-box;
            line-height: 30px;
            font-size: 14px;
            border: 0;
            background: none;
            border-bottom: 1px solid #ccc;
            outline: none;
            border-radius: 0;
        }

        .login-form input:focus ~ label,
        .login-form input:valid ~ label {
            color: green;
            transform: translateY(-20px);
            font-size: 0.825em;
            cursor: default;
        }

        .login-form input:focus ~ .underline {
            width: 100%;
        }

        .register-form {
            height: 90vh;
            padding: 10px 35px;
        }

        .register-form .input-wrapper {
            margin-bottom: 40px;
        }

        .input-error {
            font-size: 0.6em;
            opacity: 0.75;
            position: absolute;
            bottom: -15px;
            left: 0;
            user-select: none;
        }

        .required {
            bottom: -23px;
        }

        @media screen and (max-width: 1000px) {
            .login-form {
                height: 85vh;
                width: 90vw;
                padding: 50px 35px;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .login-form .input_container {
                display: flex;
                flex-direction: column;
                justify-content: space-evenly;
                width: 70%;
                height: 50%;
            }

            .login-form * {
                letter-spacing: 0.5px;
            }

            .login-form h3 {
                padding-bottom: 25px;
                font-size: 40px;
                line-height: 42px;
            }

            .login-form input[type="submit"] {
                margin: 15px 0;
                padding: 15px 0;
                font-size: 2.5em;
                font-weight: 600;
                width: 50%;
                height: 5vh;
                border-radius: 10px;
            }

            .login-form input[type="text"],
            .login-form input[type="password"] {
                height: 5vh;
                font-size: 2.5em;
            }

            .login-form label {
                position: absolute;
                top: 0;
                left: 0;
                font-size: 2em;
                line-height: 30px;
            }

            .login-form input {
                box-sizing: border-box;
                line-height: 30px;
            }

            .login-form input:focus ~ label,
            .login-form input:valid ~ label {
                color: green;
                transform: translateY(-20px);
                font-size: 1.825em;
                cursor: default;
            }

            .error {
                font-size: 2em;
                padding-bottom: 50px;
            }

            .input-error {
                font-size: 1.3em;
                bottom: -35px;
            }
        }

        .underline {
            content: '';
            display: block;
            position: absolute;
            bottom: -1px;
            left: 0;
            width: 0;
            height: 2px;
            background: green;
            transition: all 200ms ease-out;
        }

        .other-btn {
            margin-top: 30px;
            display: flex;
            justify-content: space-around;
        }

        .input-wrapper {
            position: relative;
        }

        .sign-up {
            position: relative;
            display: inline-flex;
            width: 180px;
            height: 55px;
            margin: 0 15px;
            perspective: 1000px;
        }

        .sign-up a {
            font-size: 19px;
            letter-spacing: 1px;
            transform-style: preserve-3d;
            transform: translateZ(-25px);
            transition: transform .25s;
        }

        .sign-up a:before,
        .sign-up a:after {
            position: absolute;
            content: "Sign up";
            height: 55px;
            width: 180px;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 5px solid rgba(0, 48, 0, 0.8);
            box-sizing: border-box;
            border-radius: 5px;
        }

        .sign-up a:before {
            color: #fff;
            background: rgba(0, 48, 0, 0.8);
            transform: rotateY(0deg) translateZ(25px);
        }

        .sign-up a:after {
            color: rgba(0, 48, 0, 0.8);
            transform: rotateX(90deg) translateZ(25px);
        }

        .sign-up a:hover {
            transform: translateZ(-25px) rotateX(-90deg);
        }

        .sign-in a:before,
        .sign-in a:after {
            content: "Sign in";
        }

        .error {
            text-align: center;
            margin: 15px;
            margin-top: -15px;
        }
    </style>

</head>

<body>
<div class="background">
    <div class="shape"></div>
    <div class="shape"></div>
</div>

<form:form class="login-form register-form" method="POST" modelAttribute="userForm">
    <h3>Registration</h3>
    <div class="input_container">

        <spring:bind path="username">
            <div class="input-wrapper">
                <dd class="inputbox-content">
                    <form:input id="username" path="username" name="username" type="text"></form:input>
                    <label for="username">Username</label>
                    <span class="underline"></span>
                    <form:errors path="username" class="input-error required" style="color:red"></form:errors>
                </dd>
            </div>
        </spring:bind>

        <spring:bind path="firstName">
            <div class="input-wrapper">
                <dd class="inputbox-content">
                    <form:input id="firstName" path="firstName" name="firstName" type="text"></form:input>
                    <label for="firstName">First name</label>
                    <span class="underline"></span>
                    <form:errors class="input-error" style="color:red" path="firstName"></form:errors>
                </dd>
            </div>
        </spring:bind>

        <spring:bind path="lastName">
            <div class="input-wrapper">
                <dd class="inputbox-content">
                    <form:input id="lastName" path="lastName" name="lastName" type="text"></form:input>
                    <label for="lastName">Last name:</label>
                    <span class="underline"></span>
                    <form:errors class="input-error" style="color:red" path="lastName"></form:errors>
                </dd>
            </div>
        </spring:bind>

        <spring:bind path="password">
            <div class="input-wrapper">
                <dd class="inputbox-content">
                    <form:input id="password" path="password" name="password" type="password"></form:input>
                    <label for="password">Password</label>
                    <span class="underline"></span>
                    <form:errors class="input-error required" style="color:red" path="password"></form:errors>
                </dd>
            </div>
        </spring:bind>

        <spring:bind path="confirmPassword">
            <div class="input-wrapper">
                <dd class="inputbox-content">
                    <form:input id="password" path="confirmPassword" name="password" type="password"></form:input>
                    <label for="password">Confirm your password</label>
                    <span class="underline"></span>
                    <form:errors path="confirmPassword" class="input-error" style="color:red"></form:errors>
                </dd>
            </div>
        </spring:bind>
    </div>
    <input type="submit" value="Sign up"/>

    <div class="other-btn">
        <span class="sign-up sign-in"><a href="${contextPath}/login"></a></span>
    </div>
</form:form>

</body>
</html>