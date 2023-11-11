client/script = {"<style>
body					{font-family: Verdana, sans-serif;}

h1, h2, h3, h4, h5, h6	{color: #0059ea;font-family: Georgia, Verdana, sans-serif;}

em						{font-style: normal;font-weight: bold;}

.motd					{color: #638500;font-family: Verdana, sans-serif;}
.motd h1, .motd h2, .motd h3, .motd h4, .motd h5, .motd h6
						{color: #638500;text-decoration: underline;}
.motd a, .motd a:link, .motd a:visited, .motd a:active, .motd a:hover
						{color: #638500;}

.prefix					{font-weight: bold;}
.log_message			{color: #386aff;	font-weight: bold;}

/* OOC */
.ooc					{font-weight: bold;}
.ooc img.text_tag		{width: 32px; height: 10px;}

.ooc .everyone			{color: #AAAAAA;}
.ooc .looc				{color: #3a9696;}
.ooc .elevated			{color: #2e78d9;}
.ooc .moderator			{color: #184880;}
.ooc .developer			{color: #1b521f;}
.ooc .admin				{color: #ffffff;}

.graytextbold			{color: #909090; font-weight: bold; text-shadow: 0px 0px 2px rgba(255, 0, 0, 0.4);}

.badmood				{color: #fd5b5b; font-weight: bold; font-size: 101%;}

.goodmood 				{color: #635fcf; font-weight: bold; font-size: 101%;}

.ogrynconfused			{color: #fd5b5b; font-weight: bold; font-size: 111%; animation: confused 4500ms infinite; filter: blur(4px); }
@keyframes confused {
	0% { color: #fd5b5b; }
	25% { color: #f08080; }
	50% { color: #f09e9e; }
	75% { color: #f08080; }
	100% { color: #fd5b5b; }
}

.ogrynspeak		{color: #572525; font-weight: bold; font-size: 111%;}


@keyframes flickerAnimation {
  0%, 100% {
    opacity: 0.6;
    transform: translateY(0) translateX(0);
  }
  25% {
    opacity: 0.8;
    transform: translateY(-2px) translateX(2px);
  }
  50% {
    opacity: 0.5;
    transform: translateY(1px) translateX(-1px);
  }
  75% {
    opacity: 0.7;
    transform: translateY(0) translateX(0);
  }
}

.flick-holy {
  font-family: 'Courier New', monospace;
  font-size: 22px;
  color: white;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
  animation: flickerAnimation 2s linear infinite;
}

.horror-text {
  animation-duration: 1.5s;
  animation-iteration-count: infinite;
  animation-name: flickering;
  animation-timing-function: step-start;
  color: #912914;
  font-family: "monospace";
  font-size: 22px;
}

@keyframes flickering {
  0% {
    color: #912914;
    text-shadow: none;
    transform: skewX(0);
  }
  5% {
    color: #912914;
    text-shadow: none;
    transform: skewX(0);
  }
  10% {
    color: #912914;
    text-shadow: 1px 1px #eee;
    transform: skewX(-15deg);
  }
  15% {
    color: #ccc;
    text-shadow: none;
    transform: skewX(-15deg);
  }
  20% {
    color: #912914;
    text-shadow: none;
    transform: skewX(0);
  }
  25% {
    color: #ccc;
    text-shadow: 2px 2px #912914;
    transform: skewX(0);
  }
  30% {
    color: #ccc;
    text-shadow: 2px 2px #912914;
    transform: skewX(0);
  }
  35% {
    color: #ccc;
    text-shadow: 2px 2px #912914;
    transform: skewX(0);
  }
  37% {
    color: #ccc;
    text-shadow: 1px 1px #eee;
    transform: skewX(0);
  }
  40% {
    color: #912914;
    text-shadow: 1px 1px #eee;
    transform: skewX(0);
  }
  45% {
    color: #912914;
    text-shadow: 1px 1px #eee;
    transform: skewX(0);
  }
  50% {
    color: #912914;
    text-shadow: none;
    transform: skewX(0);
  }
  55% {
    color: #912914;
    text-shadow: none;
    transform: skewX(0);
  }
  60% {
    color: #912914;
    text-shadow: none;
    transform: skewX(0);
  }
  65% {
    color: #912914;
    text-shadow: none;
    transform: skewX(0);
  }
  68% {
    color: #912914;
    text-shadow: 1px 1px #eee;
    transform: skewX(0);
  }
  70% {
    color: #912914;
    text-shadow: 1px 1px #eee;
    transform: skewX(0);
  }
  75% {
    color: #912914;
    text-shadow: 1px 1px #eee;
    transform: skewX(10deg);
  }
  80% {
    color: #912914;
    text-shadow: 1px 1px #eee;
    transform: skewX(10deg);
  }
  85% {
    color: #912914;
    text-shadow: 1px 1px #eee;
    transform: skewX(10deg);
  }
  90% {
    color: #912914;
    text-shadow: none;
    transform: skewX(0);
  }
  95% {
    color: #912914;
    text-shadow: 1px 1px #eee;
    transform: skewX(0);
  }
  100% {
    color: #912914;
    text-shadow: none;
    transform: skewX(0);
  }
}





.staffwarn				{color: #ff0000; font-weight:bold; font-size: 150%;}
/* Admin: Private Messages */
.pm  .howto				{color: #ff0000;	font-weight: bold;		font-size: 200%;}
.pm  .in				{color: #ff0000;}
.pm  .out				{color: #ff0000;}
.pm  .other				{color: #0000ff;}

/* Admin: Channels */
.mod_channel			{color: #735638;	font-weight: bold;}
.mod_channel .admin		{color: #b82e00;	font-weight: bold;}
.admin_channel			{color: #9611d4;	font-weight: bold;}

/* Radio: Misc */
.deadsay				{color: #8337e8;}
.radio					{color: #008000;}
.deptradio				{color: #ff00ff;}	/* when all other department colors fail */
.newscaster				{color: #750000;}

/* Radio Channels */
.comradio				{color: #2251ad;}
.syndradio				{color: #8c3f40;}
.centradio				{color: #5c5c8a;}
.airadio				{color: #ff00ff;}
.entradio				{color: #339966;}

.secradio				{color: #e20000;}
.engradio				{color: #ce7b00;}
.medradio				{color: #00a87d;}
.sciradio				{color: #993399;}
.supradio				{color: #a07429;}
.srvradio				{color: #6eaa2c;}
.expradio				{color: #a3a332;}
.inqradio				{color: #707070;}

/* Miscellaneous */
.name					{font-weight: bold;}
.say					{}
.alert					{color: #ff0000;}
h1.alert, h2.alert		{color: #ffffff;}

.emote					{font-style: italic;}

/* Game Messages */

.attack					{color: #ff0000;}
.moderate				{color: #cc0000;}
.disarm					{color: #990000;}
.passive				{color: #660000;}

.danger					{color: #ff0000; font-weight: bold;}
.warning				{color: #ff0000; font-style: italic;}
.boldannounce			{color: #ff0000; font-weight: bold;}
.rose					{color: #ff5050;}
.info					{color: #0077cc;}
.binfo					{color: #0077cc; font-weight: bold;}
.notice					{color: #0059ea;}
.bnotice				{color: #0059ea; font-weight: bold;}
.alium					{color: #00ff00;}
.cult					{color: #800080; font-weight: bold; font-style: italic;}

.reflex_shoot			{color: #000099; font-style: italic;}

/* Languages */

.alien					{color: #543354;}
.tajaran				{color: #803b56;}
.tajaran_signlang		{color: #941c1c;}
.skrell					{color: #00ced1;}
.soghun					{color: #228b22;}
.nabber_lang			{color: #525252;}
.solcom					{color: #22228b;}
.changeling				{color: #800080;}
.vox					{color: #aa00aa;}
.rough					{font-family: "Trebuchet MS", cursive#386891, sans-serif;}
.say_quote				{font-family: Georgia, Verdana, sans-serif;}
.terran					{color: #9c250b;}
.moon					{color: #422863;}
.spacer					{color: #ff6600;}

.red_team				{color: #b27676;}
.blue_team				{color: #76abb2;}

.interface				{color: #bf00bf;}

.good                   {color: #4f7529; font-weight: bold;}
.bad                    {color: #ee0000; font-weight: bold;}

BIG IMG.icon 			{width: 32px; height: 32px;}

</style>"}
