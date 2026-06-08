---
date: 2026-05-15
tags: [ glossary, usb, todo ]
aliases: ["universal serial bus", "usb", "USB"]
---

# Universal Serial bus (USB)

Transfer- and connection protocol for external devices and PCs.

Most devices are [human interface devices.](human-interface-devices).

## USB details

To summarize the summary, a USB device can have multiple configurations, which usually explain the power requirements for the device. Most devices will have just one.

Each of those configurations can have multiple interfaces. So for example, a camera might serve as a file storage device as well as a webcam.

Finally, each interface can have multiple endpoints, which describe how the data is transferred. Perhaps the camera has an “isochronous” (continuous) transfer for a webcam feed, and a “bulk” transfer for moving image files over.

### [human interface devices (HID)](human-interface-devices) sub-classes

There are various sub-classes of HIDs, and there is a [long document describing which class to use and when](https://www.usb.org/sites/default/files/hut1_7.pdf).

## References

- <https://de.wikipedia.org/wiki/Universal_Serial_Bus>
- <https://www.beyondlogic.org/usbnutshell/usb1.shtml>
- <https://www.usb.org/sites/default/files/hut1_7.pdf>
