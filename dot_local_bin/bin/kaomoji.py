from evdev.device import InputDevice, ecodes

device = InputDevice('/dev/input/event2')  # Укажите свой device

for event in device.read_loop():
    if event.type == ecodes.EV_KEY:
        key_event = categorize(event)
        print(f"Клавиша: {key_event.keycode}, Состояние: {'Нажата' if key_event.keystate == 1 else 'Отпущена'}")
