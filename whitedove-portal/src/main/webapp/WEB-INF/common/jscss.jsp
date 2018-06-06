<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<head>
    <title>小白鸽</title>
    <!-- 不带 CSS 的库 -->
    <script src="js/polyfill.min.js"></script>
    <script src="js/manifest.js"></script>
    <script src="js/vendor.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/jquery.form.min.js"></script>
    <script src="js/jquery.qrcode.min.js"></script>
    <script src="js/html2canvas.min.js"></script>
    <script src="js/jspdf.min.js"></script>
    <script src="js/zeroclipboard.min.js"></script>
    <script src="js/aliyun-oss-sdk-4.3.0.min.js"></script>
    <script src="js/qiniu.js"></script>
    <script src="js/plupload.full.min.js"></script>
    <script src="js/echarts.min.js"></script>
    <script src="js/ajaxfileupload.js"></script>
    <!-- 不带 CSS 的库 end -->

    <!-- 带有 CSS 的库 -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-switch.min.js"></script>
    <script src="js/bootstrap-tour.min.js"></script>
    <script src="js/bootstrap-table.min.js"></script>
    <script src="js/bootstrap-table-zh-cn.min.js"></script>
    <script src="js/bootstrap-table-filter-control.min.js"></script>
    <script src="js/ace.js"></script>
    <script src="js/video.min.js"></script>
    <script src="js/jquery.cookie.js"></script>
    <script src="js/katex.min.js"></script>
    <script src="js/highlight.min.js"></script>
    <!-- 带有 CSS 的库 end -->

    <script src="js/raven.min.js"></script>
    <script>
        Raven
            .config(
                'https://bc3878b7ed0a4468a65390bd79e6e73f@sentry.shiyanlou.com/5',
                {
                    release : '3.12.13'
                }).install();
    </script>

    <link rel="shortcut icon" href="images/ico/favicon.png" type="image/x-icon" />
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-switch.min.css">
    <link rel="stylesheet" href="css/bootstrap-tour.min.css">
    <link rel="stylesheet" href="css/bootstrap-table.min.css">
    <link rel="stylesheet" href="css/katex.min.css">
    <link rel="stylesheet" href="css/video-js.min.css">
    <link rel="stylesheet" href="css/monokai-sublime.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/order-confirm.css">


    <style>
        @font-face {
            font-family: "lantingxihei";
            src: url("fonts/FZLTCXHJW.TTF");
        }

        /* modal 模态框*/
        #invite-user .modal-body {
            overflow: hidden;
        }

        #invite-user .modal-body .form-label {
            margin-bottom: 16px;
            font-size: 14px;
        }

        #invite-user .modal-body .form-invite {
            width: 80%;
            padding: 6px 12px;
            background-color: #eeeeee;
            border: 1px solid #cccccc;
            border-radius: 5px;
            float: left;
            margin-right: 10px;
        }

        #invite-user .modal-body .msg-modal-style {
            background-color: #7dd383;
            margin-top: 10px;
            padding: 6px 0;
            text-align: center;
            width: 100%;
        }

        #invite-user .modal-body .modal-flash {
            position: absolute;
            top: 53px;
            right: 74px;
            z-index: 999;
        }
        /* end modal */
        .en-footer {
            padding: 30px;
            text-align: center;
            font-size: 14px;
        }

        .sub-menu {
            padding: 20px 0 10px 4px;
        }
    </style>
</head>
