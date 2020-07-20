/* user and group to drop privileges to */
static const char *user  = "cdk";
static const char *group = "cdk";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "black",     /* after initialization */
	[INPUT] =  "#005577",   /* during input */
	[FAILED] = "#CC3333",   /* wrong password */
	[TEXT] =   "#ffffff",   /* text  */
};

ResourcePref resources[] = {
		{ "color0",       STRING,  &colorname[INIT] },
		{ "color8",       STRING,  &colorname[INPUT] },
		{ "color1",       STRING,  &colorname[FAILED] },
		{ "foreground",   STRING,  &colorname[TEXT] },
};
/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;

/* default message */
static const char * message = "PLEASE AUTHENTICATE";

/* text size (must be a valid size) */
static const char * font_name = "10x20";

static const int hideScreen = 1;
