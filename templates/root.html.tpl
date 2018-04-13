<!DOCTYPE html>
<html lang="ja" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>Ask Kaito - Kaitoに質問 -</title>
    <meta content="Ask Kaito - Kaitoに質問 -" property="og:title">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }
        body {
            background: repeating-linear-gradient(135deg,transparent,transparent 5px,hsla(0,0%,70%,.08) 0,hsla(0,0%,70%,.08) 10px) hsla(0,0%,70%,.08);
            min-height: 100vh;
            font-family: fa5-proxima-nova,Helvetica Neue,Helvetica,Arial,sans-serif;
            color: #495057;
        }
        .container {
            max-width: 640px;
            margin: 0 auto;
            padding: 0 30px;
        }
        /* header */
        header {
            background: #fff;
            box-shadow: 0 0.25rem 0.125rem 0 rgba(0,0,0,.05);
            height: 64px;
            font-size: 25px;
            /* text-align: center; */
            line-height: 64px;
            /* position: fixed; */
            /* width: 100%; */
        }
        .header-inner {
            max-width: 640px;
            margin: 0 auto;
            padding: 0 30px;
        }
        a {
            text-decoration: none;
            color: #495057;
        }
        .fa-bomb {
            color: #4474a9;
            margin-right: 4px;
        }
        .header-left {
            display: inline-block;
        }
        .header-right {
            float: right;
        }
        .fa-twitter {
            color: #00aced;
            margin-right: 8px;
        }
        .fa-github {
            color: #222;
        }
        /* main */
        .main {
            padding: 40px 0;
        }
        .main-top {
            text-align: center;
            margin-bottom: 28px;
            line-height: 2;
        }
        .main-top a {
            text-decoration: underline;
        }
        ul, li {
            list-style: none;
        }
        .main ul {
            margin-bottom: 40px;
        }
        .main li {
            background: #fff;
            box-shadow: 0 0.25rem 0.125rem 0 rgba(0,0,0,.05);
            padding: 34px 40px;
            border-radius: 2px;
            font-size: 18px;
            margin-bottom: 24px;
        }
        .q-top {
            font-size: 17px;
            margin-bottom: 16px;
            opacity: .8;
        }
        .q-name {
            display: inline-block;
        }
        .q-time {
            float: right;
        }
        .q-text {
            font-size: 20px;
            font-weight: 700;
            opacity: .9;
        }
    </style>
    <script defer src="https://use.fontawesome.com/releases/v5.0.10/js/all.js" integrity="sha384-slN8GvtUJGnv6ca26v8EzVaR9DC58QEwsIk9q1QXdCU8Yu8ck/tL/5szYlBbqmS+" crossorigin="anonymous"></script>
</head>
<body>
    <header>
        <div class="header-inner">
            <div class="header-left">
                <a href='/'>
                    <i class="fas fa-bomb"></i>
                    Ask Kaito
                </a>
            </div>
            <div class="header-right">
                <a href='https://twitter.com/k_tooooooooooo' target="_blank">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href='https://github.com/Kite0301' target="_blank">
                    <i class="fab fa-github"></i>
                </a>
            </div>
        </div>
    </header>
    <section class="main">
        <div class="container">
            <div class="main-top">
                <h2>Kaitoへの質問</h2>
                <a href='/ask'>質問する</a>
            </div>
            <ul>
                {{range .}}
                    <li>
                        <div class="q-top">
                            <div class="q-name">{{.Name}}</div>
                            <div class="q-time">{{.CreatedAt}}</div>
                        </div>
                        <div class="q-text">{{.Text}}</div>
                    </li>
                {{end}}
            </ul>
        </div>
    </section>
    <script>
        history.replaceState('','','/');
    </script>
</body>
</html>
