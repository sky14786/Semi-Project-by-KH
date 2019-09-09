<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>chat</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
    <link href="<%=request.getContextPath() %>/css/conversation.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/css/chat.css" rel="stylesheet">
</head>

<header>
    <div id="chat-container" class="container-fluid ">
        <br>
        <div class="navbar">
            <a href="./chat.html" class="p-2 "> <i class="fas fa-chevron-left fa-3x"></i></a>
            <div class="p-2 chat-container-title "><i class="far fa-envelope-open fa-2x"></i></div>
            <div></div>
        </div>
        <br><br>
</header>


<body>
    <div class="message-feed media">
        <div class="pull-left">
            <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="img-avatar">
        </div>
        <div class="media-body">
            <div class="mf-content">
                Quisque consequat arcu eget odio cursus, ut tempor arcu vestibulum. Etiam ex arcu, porta a urna non,
                lacinia pellentesque orci. Proin semper sagittis erat, eget condimentum sapien viverra et. Mauris
                volutpat magna nibh, et condimentum est rutrum a. Nunc sed turpis mi. In eu massa a sem pulvinar
                lobortis.
            </div>
            <small class="mf-date"><i class="fa fa-clock-o"></i> 20/02/2015 at 09:00</small>
        </div>
    </div>

    <div class="message-feed right">
        <div class="pull-right">
            <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="" class="img-avatar">
        </div>
        <div class="media-body">
            <div class="mf-content">
                Mauris volutpat magna nibh, et condimentum est rutrum a. Nunc sed turpis mi. In eu massa a sem
                pulvinar
                lobortis.
            </div>
            <small class="mf-date"><i class="fa fa-clock-o"></i> 20/02/2015 at 09:30</small>
        </div>
    </div>

    <div class="message-feed media">
        <div class="pull-left">
            <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="img-avatar">
        </div>
        <div class="media-body">
            <div class="mf-content">
                Etiam ex arcumentum
            </div>
            <small class="mf-date"><i class="fa fa-clock-o"></i> 20/02/2015 at 09:33</small>
        </div>
    </div>

    <div class="message-feed right">
        <div class="pull-right">
            <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="" class="img-avatar">
        </div>
        <div class="media-body">
            <div class="mf-content">
                Etiam nec facilisis lacus. Nulla imperdiet augue ullamcorper dui ullamcorper, eu laoreet sem
                consectetur. Aenean et ligula risus. Praesent sed posuere sem. Cum sociis natoque penatibus et
                magnis
                dis parturient montes,
            </div>
            <small class="mf-date"><i class="fa fa-clock-o"></i> 20/02/2015 at 10:10</small>
        </div>
    </div>

    <div class="message-feed media">
        <div class="pull-left">
            <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="img-avatar">
        </div>
        <div class="media-body">
            <div class="mf-content">
                Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam ac
                tortor ut
                elit sodales varius. Mauris id ipsum id mauris malesuada tincidunt. Vestibulum elit massa, pulvinar
                at
                sapien sed, luctus vestibulum eros. Etiam finibus tristique ante, vitae rhoncus sapien volutpat
                ㅇㅇㅇㅇeget
            </div>
            <small class="mf-date"><i class="fa fa-clock-o"></i> 20/02/2015 at 10:24</small>
        </div>
    </div>
    <br> <br> <br>


    <!-- <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script> -->
    <script type="text/javascript">
        $(function () {
            if ($('#ms-menu-trigger')[0]) {
                $('body').on('click', '#ms-menu-trigger', function () {
                    $('.ms-menu').toggleClass('toggled');
                });
            }
        });


        var height = 0;
        $('div div').each(function (i, value) {
            height += parseInt($(this).height());
        });

        height += '';

        $('div').animate({ scrollTop: height });
    </script>

</body>


<footer>
    <div class="fixed-bottom msb-reply">
        <textarea placeholder="What's on your mind..."></textarea>
        <button><i class="far fa-paper-plane"></i></button>
    </div>
</footer>

</html>