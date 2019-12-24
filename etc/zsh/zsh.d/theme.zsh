##### Customize prompt #####

# https://github.com/bhilburn/powerlevel9k/wiki/Stylizing-Your-Prompt#adding-newline-before-each-prompt
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳  "

# https://github.com/bhilburn/powerlevel9k/tree/next#customizing-prompt-segments
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs virtualenv time)

# Set 'dir' segment colors
# https://github.com/bhilburn/powerlevel9k/blob/next/segments/dir/README.md
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_PATH_SEPARATOR=" $(print_icon "LEFT_SUBSEGMENT_SEPARATOR") "
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
# Icon stick to the tilde character (ugly) so add a space char to the icon
POWERLEVEL9K_HOME_ICON='\uF015 '
POWERLEVEL9K_HOME_SUB_ICON='\uF07C '
POWERLEVEL9K_FOLDER_ICON='\uF115 '
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

# Set 'status' segment colors
# https://github.com/bhilburn/powerlevel9k/blob/next/segments/status/README.md
POWERLEVEL9K_STATUS_OK_BACKGROUND="black"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="black"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
