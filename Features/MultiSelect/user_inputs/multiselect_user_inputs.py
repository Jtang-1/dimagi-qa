""""Contains test data that are used as user inputs across various areass used in Case Serach"""


class MultiSelectUserInput:
    """User Test Data"""

    """App Names"""
    multiselect_app_name = "Multi-Select"

    """Menu Names"""
    Shadow_auto = "Shadow Menu (Auto-Proceed)"
    Display_only_forms_auto = "Display Only Forms plus Multi-Case Form"
    Songs_manual = "Songs (multi select, normal, manual w/max limit)"
    Songs_auto_max_limit = " Songs (multi select, normal,  auto, selected cases > max limit)"
    Songs_auto = "Songs (multi select, normal, auto w/max limit)"
    Songs_multi_normal = "Songs (multi select, normal, non-inline search)"
    Songs_multi_search_first = "Songs (multi select, search-first, inline search)"
    Songs_multi_skip_es = "Songs (multi select, skip-es, inline search)"
    Songs_multi_see_more = "Songs (multi select, see-more, inline search)"
    Songs_MS_SF_IS = "Songs (multi select, search-first, inline search)"
    Songs_MS_N_NIS = "Songs (multi select, normal, non-inline search)"
    Songs_Non_Multi = "Songs (non-multi, no inline search)"
    Shows_MS_SPFP = "Shows (multi, select-first: parent)"
    Shows_MS_SPFO = "Shows (multi, select-first: other)"
    Yet_Another_Show_NMS = "Yet Another Shows (non-multi)"
    Another_Shows_Non = "Another Shows (non)"
    Child_Shows_SF_MS = "Child Shows + Search First(multi)"
    Child_Shows_N_MS = "Child Shows + Normal (multi)"
    Another_Shows_MS = "Another Show (multi)"
    Another_Shows_Not_MS = "Another Show (non-multi)"
    Shadow_Menu_Multi = "Shadow Menu"
    Shadow_Menu_Non_Multi = "Shadow Menu (Non-Multi)"
    Display_Only_Forms = "Display Only Forms plus Multi-Case Form"

    """Form Names"""
    update_song_normal_form = "Update and add shows to the songs you picked out"
    update_song_back_to_menu_form = "Update and add shows to the songs you picked out --> Back to Menu"
    update_song_back_to_other_menu = "Update and add shows to the songs you picked out --> Link to other menu"
    update_song_back_to_other_form = "Update and add shows to the songs you picked out --> Link to other form"
    update_shows_multi_form = "Update child shows you picked out"
    update_show_normal_form = "Update Show"
    does_nothing_form = "This form does nothing"

    """Cases"""

