/* Copyright 2015-2017 Jack Humbert
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
#include QMK_KEYBOARD_H
#include "muse.h"

enum preonic_layers {
  _QWERTY,
  _LOWER,
  _RAISE,
  _ADJUST
};

enum preonic_keycodes {
  BACKLIT = SAFE_RANGE,
  RGB_COF,
  RGB_CON
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

[_QWERTY] = LAYOUT_preonic_grid( \
  KC_ESC,  KC_1,    KC_2,    KC_3,    KC_4,         KC_5,    KC_6,    KC_7,         KC_8,    KC_9,    KC_0,    KC_DEL,     \
  KC_TAB,  KC_Q,    KC_W,    KC_E,    KC_R,         KC_T,    KC_Y,    KC_U,         KC_I,    KC_O,    KC_P,    KC_BSPC,    \
  KC_CAPS, KC_A,    KC_S,    KC_D,    KC_F,         KC_G,    KC_H,    KC_J,         KC_K,    KC_L,    KC_SCLN, KC_ENT,     \
  KC_LSFT, KC_Z,    KC_X,    KC_C,    KC_V,         KC_B,    KC_N,    KC_M,         KC_COMM, KC_DOT,  KC_SLSH, KC_QUOT,    \
  KC_LCTL, BACKLIT, KC_LALT, KC_LGUI, TT(_LOWER),   KC_SPC,  KC_SPC,  TT(_RAISE),   KC_LALT, KC_RALT, KC_RALT, MO(_ADJUST) \
),


# define KC_AA RALT(KC_W)
# define KC_AE RALT(KC_Z)
# define KC_OE RALT(KC_L)
[_LOWER] = LAYOUT_preonic_grid( \
  KC_TILD, KC_EXLM, KC_AT,   KC_HASH, KC_DLR,      KC_AMPR, KC_PERC,  KC_CIRC,     KC_ASTR,   _______,  KC_EQUAL, _______, \
  KC_GRV,  _______, _______, KC_AE,   _______,     _______, _______,  _______,     _______,   KC_OE,    _______,  _______, \
  _______, KC_AA,   KC_LPRN, KC_RPRN, KC_LCBR,     KC_RCBR, KC_EQUAL, KC_UNDS,     KC_PLUS,   KC_MINUS, KC_COLN,  _______, \
  _______, KC_BSLS, KC_LABK, KC_RABK, KC_LBRC,     KC_RBRC, KC_PERC,  KC_CIRC,     KC_ASTR,   KC_AMPR,  KC_PIPE,  KC_GRV,  \
  _______, _______, _______, _______, TO(_QWERTY), _______, _______,  TO(_QWERTY), _______,   _______,  _______,  _______  \
),


# define ZM_IN  C(KC_EQUAL)
# define ZM_OUT C(KC_MINUS)

[_RAISE] = LAYOUT_preonic_grid( \
  KC_GRV,  KC_1,    KC_2,    KC_3,    KC_4,        KC_5,    KC_6,    KC_7,        KC_8,    KC_9,    KC_0,    _______, \
  KC_GRV,  _______, _______, _______, _______,     _______, _______, ZM_OUT,      ZM_IN,   _______, _______, _______, \
  _______, KC_MS_L, KC_MS_D, KC_MS_U, KC_MS_R,     KC_BTN1, KC_LEFT, KC_DOWN,     KC_UP,   KC_RGHT, KC_RBRC, _______, \
  _______, KC_WH_L, KC_WH_D, KC_WH_U, KC_WH_R,     KC_BTN2, _______, KC_NUHS,     KC_NUBS, KC_PGUP, KC_PGDN, _______, \
  _______, _______, _______, _______, TO(_QWERTY), _______, _______, TO(_QWERTY), _______, _______, _______, _______  \
),

[_ADJUST] = LAYOUT_preonic_grid( \
  KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,       KC_F6,   KC_F7,   KC_F8,       KC_F9,    KC_F10,  KC_F11,  KC_F12,  \
  _______, RESET,   DEBUG,   _______, _______,     _______, _______, TERM_ON,     TERM_OFF, _______, _______, KC_DEL,  \
  _______, _______, MU_MOD,  AU_ON,   AU_OFF,      AG_NORM, AG_SWAP, _______,     _______,  _______, RGB_COF, _______, \
  _______, MUV_DE,  MUV_IN,  MU_ON,   MU_OFF,      MI_ON,   MI_OFF,  RGB_TOG,     RGB_MOD,  RGB_M_P, RGB_CON, _______, \
  _______, _______, AG_SWAP, AG_NORM, TO(_QWERTY), _______, _______, TO(_QWERTY), _______,  _______, _______, _______  \
)


};


bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {
        case BACKLIT:
          if (record->event.pressed) {
            register_code(KC_RSFT);
            #ifdef BACKLIGHT_ENABLE
              backlight_step();
            #endif
            #ifdef __AVR__
            writePinLow(E6);
            #endif
          } else {
            unregister_code(KC_RSFT);
            #ifdef __AVR__
            writePinHigh(E6);
            #endif
          }
          return false;
          break;
        case RGB_CON:
          rgblight_set_layer_state(0, true);
          return false;
          break;
        case RGB_COF:
          rgblight_set_layer_state(0, false);
          return false;
          break;
      }
    return true;
};

bool muse_mode = false;
uint8_t last_muse_note = 0;
uint16_t muse_counter = 0;
uint8_t muse_offset = 70;
uint16_t muse_tempo = 50;

void encoder_update_user(uint8_t index, bool clockwise) {
  if (muse_mode) {
    if (IS_LAYER_ON(_RAISE)) {
      if (clockwise) {
        muse_offset++;
      } else {
        muse_offset--;
      }
    } else {
      if (clockwise) {
        muse_tempo+=1;
      } else {
        muse_tempo-=1;
      }
    }
  } else {
    if (clockwise) {
      register_code(KC_PGDN);
      unregister_code(KC_PGDN);
    } else {
      register_code(KC_PGUP);
      unregister_code(KC_PGUP);
    }
  }
}

void dip_switch_update_user(uint8_t index, bool active) {
    switch (index) {
        case 0:
            if (active) {
                layer_on(_ADJUST);
            } else {
                layer_off(_ADJUST);
            }
            break;
        case 1:
            if (active) {
                muse_mode = true;
            } else {
                muse_mode = false;
            }
    }
}


void matrix_scan_user(void) {
#ifdef AUDIO_ENABLE
    if (muse_mode) {
        if (muse_counter == 0) {
            uint8_t muse_note = muse_offset + SCALE[muse_clock_pulse()];
            if (muse_note != last_muse_note) {
                stop_note(compute_freq_for_midi_note(last_muse_note));
                play_note(compute_freq_for_midi_note(muse_note), 0xF);
                last_muse_note = muse_note;
            }
        }
        muse_counter = (muse_counter + 1) % muse_tempo;
    } else {
        if (muse_counter) {
            stop_all_notes();
            muse_counter = 0;
        }
    }
#endif
}

bool music_mask_user(uint16_t keycode) {
  switch (keycode) {
    default:
      return true;
  }
}

/* LIGHTS AND SHIT */
//*
// Light LED under raise key upon pressing it (LED 6)
const rgblight_segment_t PROGMEM my_blank_layer[] = RGBLIGHT_LAYER_SEGMENTS(
	{0, 9, RGB_NO}
);
const rgblight_segment_t PROGMEM my_raise_layer[] = RGBLIGHT_LAYER_SEGMENTS(
	{0, 9, RGB_NO},
	{8, 1, HSV_ATT}
);
const rgblight_segment_t PROGMEM my_lower_layer[] = RGBLIGHT_LAYER_SEGMENTS(
	{0, 9, RGB_NO},
	{1, 1, HSV_ATT}
);
// Light all LED's in red when keyboard layer 2 is active (LED 9)
const rgblight_segment_t PROGMEM my_adjust_layer[] = RGBLIGHT_LAYER_SEGMENTS(
	{0, 9, RGB_NO},
	{2, 1, HSV_ATT}
);
const rgblight_segment_t PROGMEM my_caps_layer[] = RGBLIGHT_LAYER_SEGMENTS(
	{0, 9, RGB_NO},
	{3, 4, HSV_ATT}
);
// Now define the array of layers. Later layers take precedence
const rgblight_segment_t* const PROGMEM my_rgb_layers[] = RGBLIGHT_LAYERS_LIST(
	my_blank_layer,
	my_raise_layer,
	my_lower_layer,    // Overrides caps lock layer
	my_adjust_layer,     // Overrides other layers
	my_caps_layer
);

void keyboard_post_init_user(void) {
	// Enable the LED layers
	rgblight_layers = my_rgb_layers;
}
layer_state_t layer_state_set_user(layer_state_t state) {
	// Both layers will light up if both kb layers are active
	rgblight_set_layer_state(1, layer_state_cmp(state, 1));
	rgblight_set_layer_state(2, layer_state_cmp(state, 2));
	rgblight_set_layer_state(3, layer_state_cmp(state, 3));
	return state;
}
bool led_update_user(led_t led_state) {

    rgblight_set_layer_state(4, led_state.caps_lock);
    return true;
}
//*/
