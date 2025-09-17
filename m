Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4F1CAC5A9
	for <linux-i3c@archiver.kernel.org>; Thu, 18 Sep 2025 10:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NavwEAGbOdya2TqpGBsrpf1Jp0RIf4FnJE+EmG+Q5V8=; b=Zt0ZNKUvxa2SNV
	ROzleWYfiCW8QXMUtBPNqujTGASuK5+I8uybwRR4Ckixyrook6onkbC7xYFhH1w3xjCg8xdf3lHKC
	X3V03zMzqKfbqvz7d4jC7y6W4qk3Um1e1H4Rj7Qo3FVMXuGDAPQlAbBMdzc936UeopjApzn+9syZl
	5g406mqWih90uMszRXxnRMQqkZG4UokZk6BCVvDIve+vgX8jooJ3OQKgJ8LFMhEpPea9zWcdwLe3r
	LahLxwPQ1ebIEpHpeny5RM0JSgcwwNeTCKhuE4BIE+TEFDYSj/7qPUxeyB5zuJpyhkhCmt400B1Ru
	I1L7V2THOWgM8UAxWy9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBiY-0000000H16K-0YMI;
	Thu, 18 Sep 2025 10:18:22 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0GX-0000000F8Ip-1hFV
	for linux-i3c@lists.infradead.org;
	Wed, 17 Sep 2025 22:04:44 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b54c707374fso157034a12.1
        for <linux-i3c@lists.infradead.org>; Wed, 17 Sep 2025 15:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758146680; x=1758751480; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rKTYL9qZHCY6SX54g1CxCOHWNQkO0Dz6dIIx5JhUyuo=;
        b=fB0mX218uFlJvkCiOdBy6QZUKk1rXSASLERVuf2C1S7tZlD4RJstpxhd+zGFNzcs3J
         WAs4QrcyFCM+RPuFg+X/sddPNa7mJQbYcbTBd7yt0RGmp6ffsq0ER5vbAufsp6kg6ISG
         KdAmvw+ypl208DdlOTCSHd3GNE6K6nc3/HO13yfihK+f6pHz9MLZNtSwsJaXEgxVRGou
         ucr7W05H99+N0ilh2CvK2yZthlmdx4cNz4zS4jKVhAhC5B/YaNTHniDg6s2+ltXKzuOK
         WZWc7bP1DWJX0622S/bG0UK0xsmVoLnh3i8HbPSM8oM3NkLfDc8z0/LU53EUXtFN/GDK
         D/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146680; x=1758751480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKTYL9qZHCY6SX54g1CxCOHWNQkO0Dz6dIIx5JhUyuo=;
        b=tJBOye/9FMwxDoTHpkI6tCOpXx6Hv8uDasTUMFAb3VZzxCGWyL5LlFqYp3m83bnV5y
         SsxLqOOc3OpIA76yhp0NGefnOcf0W28kOID1BXR13EaN+OFTDm/MRxEuJS//Ir+5uXlZ
         SETqP+RPT40z/QTRkTBsRScNc4qK22rT+sBpriDRVt4a8AFmbS8IPkrHE97k418lPx1d
         gxnVy0jUrC7hhpLCq5v8IUZp7kJQBAbEGYlgHAOuxnXRy+FV7JKGTGwAnRmthdI8cfRV
         AngT5X9DvLWgkOvi3XjJODOms1ehiwyLk+yiMCREXKd219CPxKXvdSTTkRuU52nwOprs
         58vQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5t4vQiuMzv9Fdw+PsadFKKRwxF5iP5VyWY7l2s807h/+X/ezKeMYViqIXLmFs8TP+xQDRf4/c9vY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwEWpX7VC+WFdJ6lsJnZAqmoOiLTL5kfQwW2Jh6LB4Mr4eIFWWt
	chB1X4mwMEnBsYEq/1AtDxAt7qbcv39IIB0NaLYtqfMwB9+UuGtqDVs=
X-Gm-Gg: ASbGncum9Pd39UPKPyaPnOtykA8pfFmAXKK5ku71IL5TDvt1bT9idptKp8IUDK+v9XB
	obSAVBAqTXqNwGZ/jKEYReMPBAmehfSiC9N64TjTtFFpiT+K+WAe0kHlQPnZHu0gDrMC3bh1pKJ
	U1Jjsph0I5SuAc/YwVlUpu+HuxBHj2erqOnY05PPo8EjUYU3+uYLb6cnnH8hkwCYdWPSxxv9ewl
	PGuMF66Zdz4LR/DaHHE7WHOgxOjnwJeIDjIWEUvki6kBnvwWHfh/ciNWfz509u0bx8YYbq1eYFR
	hE++8B+BDoKoTevXKPP09nnhsow7dZ/qP8DBcJLdk4mYEs/YplCespC3UwVMYKaXstpCWYZqbX3
	8Krnxuak0qgabV3SbpOFLi3eqwnFKrMKLMqEoUKvrTOKjkC+R0ZDvDqmLnKQdefzjDePCe5tRFx
	qI6GQ=
X-Google-Smtp-Source: AGHT+IGDFPDGX4rb+kiQg3X4yL7z83rrDxrOSR5UfT6oA70G3VDh5bLbnnVZBylxLLb/1kX5EJEZLg==
X-Received: by 2002:a17:903:283:b0:267:f121:6a88 with SMTP id d9443c01a7336-268138fe811mr54249485ad.42.1758146679810;
        Wed, 17 Sep 2025 15:04:39 -0700 (PDT)
Received: from Ubuntuv2.domain.name ([122.172.86.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016bf96sm5505275ad.38.2025.09.17.15.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 15:04:39 -0700 (PDT)
From: Marneni PoornaChandu <poornachandumarneni@gmail.com>
X-Google-Original-From: Marneni PoornaChandu <Poornachandumarneni@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alexandre.belloni@bootlin.com,
	corey@minyard.net,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	linux-i3c@lists.infradead.org,
	openipmi-developer@lists.sourceforge.net,
	linux-media@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Marneni PoornaChandu <Poornachandumarneni@gmail.com>
Subject: [PATCH] docs: driver-api: fix spelling of "buses".
Date: Thu, 18 Sep 2025 06:04:30 +0800
Message-Id: <20250917220430.5815-1-Poornachandumarneni@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_150441_462880_9932F232 
X-CRM114-Status: GOOD (  25.37  )
X-Mailman-Approved-At: Thu, 18 Sep 2025 03:18:20 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Replace incorrect plural form "busses" with "buses" in
multiple documentation files under "Documentation/driver-api".

Signed-off-by: Marneni PoornaChandu <Poornachandumarneni@gmail.com>
---
 Documentation/driver-api/device-io.rst             | 4 ++--
 Documentation/driver-api/driver-model/overview.rst | 2 +-
 Documentation/driver-api/driver-model/platform.rst | 2 +-
 Documentation/driver-api/eisa.rst                  | 6 +++---
 Documentation/driver-api/i3c/protocol.rst          | 4 ++--
 Documentation/driver-api/ipmi.rst                  | 4 ++--
 Documentation/driver-api/media/tx-rx.rst           | 4 ++--
 Documentation/driver-api/nvdimm/nvdimm.rst         | 2 +-
 Documentation/driver-api/pm/devices.rst            | 4 ++--
 Documentation/driver-api/scsi.rst                  | 4 ++--
 Documentation/driver-api/spi.rst                   | 2 +-
 Documentation/driver-api/usb/hotplug.rst           | 2 +-
 Documentation/driver-api/usb/usb.rst               | 4 ++--
 13 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/Documentation/driver-api/device-io.rst b/Documentation/driver-api/device-io.rst
index 5c7e8194bef9..d1aaa961cac4 100644
--- a/Documentation/driver-api/device-io.rst
+++ b/Documentation/driver-api/device-io.rst
@@ -16,7 +16,7 @@ Bus-Independent Device Accesses
 Introduction
 ============
 
-Linux provides an API which abstracts performing IO across all busses
+Linux provides an API which abstracts performing IO across all buses
 and devices, allowing device drivers to be written independently of bus
 type.
 
@@ -71,7 +71,7 @@ can be compiler optimised, you can use __readb() and friends to
 indicate the relaxed ordering. Use this with care.
 
 While the basic functions are defined to be synchronous with respect to
-each other and ordered with respect to each other the busses the devices
+each other and ordered with respect to each other the buses the devices
 sit on may themselves have asynchronicity. In particular many authors
 are burned by the fact that PCI bus writes are posted asynchronously. A
 driver author must issue a read from the same device to ensure that
diff --git a/Documentation/driver-api/driver-model/overview.rst b/Documentation/driver-api/driver-model/overview.rst
index e98d0ab4a9b6..b3f447bf9f07 100644
--- a/Documentation/driver-api/driver-model/overview.rst
+++ b/Documentation/driver-api/driver-model/overview.rst
@@ -22,7 +22,7 @@ uniformity across the different bus types.
 
 The current driver model provides a common, uniform data model for describing
 a bus and the devices that can appear under the bus. The unified bus
-model includes a set of common attributes which all busses carry, and a set
+model includes a set of common attributes which all buses carry, and a set
 of common callbacks, such as device discovery during bus probing, bus
 shutdown, bus power management, etc.
 
diff --git a/Documentation/driver-api/driver-model/platform.rst b/Documentation/driver-api/driver-model/platform.rst
index 7beb8a9648c5..cf5ff48d3115 100644
--- a/Documentation/driver-api/driver-model/platform.rst
+++ b/Documentation/driver-api/driver-model/platform.rst
@@ -4,7 +4,7 @@ Platform Devices and Drivers
 
 See <linux/platform_device.h> for the driver model interface to the
 platform bus:  platform_device, and platform_driver.  This pseudo-bus
-is used to connect devices on busses with minimal infrastructure,
+is used to connect devices on buses with minimal infrastructure,
 like those used to integrate peripherals on many system-on-chip
 processors, or some "legacy" PC interconnects; as opposed to large
 formally specified ones like PCI or USB.
diff --git a/Documentation/driver-api/eisa.rst b/Documentation/driver-api/eisa.rst
index b33ebe1ec9ed..3563e5f7e98d 100644
--- a/Documentation/driver-api/eisa.rst
+++ b/Documentation/driver-api/eisa.rst
@@ -8,9 +8,9 @@ This document groups random notes about porting EISA drivers to the
 new EISA/sysfs API.
 
 Starting from version 2.5.59, the EISA bus is almost given the same
-status as other much more mainstream busses such as PCI or USB. This
+status as other much more mainstream buses such as PCI or USB. This
 has been possible through sysfs, which defines a nice enough set of
-abstractions to manage busses, devices and drivers.
+abstractions to manage buses, devices and drivers.
 
 Although the new API is quite simple to use, converting existing
 drivers to the new infrastructure is not an easy task (mostly because
@@ -205,7 +205,7 @@ Random notes
 Converting an EISA driver to the new API mostly involves *deleting*
 code (since probing is now in the core EISA code). Unfortunately, most
 drivers share their probing routine between ISA, and EISA. Special
-care must be taken when ripping out the EISA code, so other busses
+care must be taken when ripping out the EISA code, so other buses
 won't suffer from these surgical strikes...
 
 You *must not* expect any EISA device to be detected when returning
diff --git a/Documentation/driver-api/i3c/protocol.rst b/Documentation/driver-api/i3c/protocol.rst
index 23a0b93c62b1..fe338f8085db 100644
--- a/Documentation/driver-api/i3c/protocol.rst
+++ b/Documentation/driver-api/i3c/protocol.rst
@@ -165,8 +165,8 @@ The first thing attached to an HDR command is the HDR mode. There are currently
 for more details):
 
 * HDR-DDR: Double Data Rate mode
-* HDR-TSP: Ternary Symbol Pure. Only usable on busses with no I2C devices
-* HDR-TSL: Ternary Symbol Legacy. Usable on busses with I2C devices
+* HDR-TSP: Ternary Symbol Pure. Only usable on buses with no I2C devices
+* HDR-TSL: Ternary Symbol Legacy. Usable on buses with I2C devices
 
 When sending an HDR command, the whole bus has to enter HDR mode, which is done
 using a broadcast CCC command.
diff --git a/Documentation/driver-api/ipmi.rst b/Documentation/driver-api/ipmi.rst
index 2cc6c898ab90..f52ab2df2569 100644
--- a/Documentation/driver-api/ipmi.rst
+++ b/Documentation/driver-api/ipmi.rst
@@ -617,12 +617,12 @@ Note that the address you give here is the I2C address, not the IPMI
 address.  So if you want your MC address to be 0x60, you put 0x30
 here.  See the I2C driver info for more details.
 
-Command bridging to other IPMB busses through this interface does not
+Command bridging to other IPMB buses through this interface does not
 work.  The receive message queue is not implemented, by design.  There
 is only one receive message queue on a BMC, and that is meant for the
 host drivers, not something on the IPMB bus.
 
-A BMC may have multiple IPMB busses, which bus your device sits on
+A BMC may have multiple IPMB buses, which bus your device sits on
 depends on how the system is wired.  You can fetch the channels with
 "ipmitool channel info <n>" where <n> is the channel, with the
 channels being 0-7 and try the IPMB channels.
diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
index 0b8c9cde8ee4..22e1b13ecde9 100644
--- a/Documentation/driver-api/media/tx-rx.rst
+++ b/Documentation/driver-api/media/tx-rx.rst
@@ -12,7 +12,7 @@ CSI-2 receiver in an SoC.
 Bus types
 ---------
 
-The following busses are the most common. This section discusses these two only.
+The following buses are the most common. This section discusses these two only.
 
 MIPI CSI-2
 ^^^^^^^^^^
@@ -36,7 +36,7 @@ Transmitter drivers
 
 Transmitter drivers generally need to provide the receiver drivers with the
 configuration of the transmitter. What is required depends on the type of the
-bus. These are common for both busses.
+bus. These are common for both buses.
 
 Media bus pixel code
 ^^^^^^^^^^^^^^^^^^^^
diff --git a/Documentation/driver-api/nvdimm/nvdimm.rst b/Documentation/driver-api/nvdimm/nvdimm.rst
index c205efa4d45b..959ba1cc0263 100644
--- a/Documentation/driver-api/nvdimm/nvdimm.rst
+++ b/Documentation/driver-api/nvdimm/nvdimm.rst
@@ -230,7 +230,7 @@ LIBNVDIMM/LIBNDCTL: Bus
 A bus has a 1:1 relationship with an NFIT.  The current expectation for
 ACPI based systems is that there is only ever one platform-global NFIT.
 That said, it is trivial to register multiple NFITs, the specification
-does not preclude it.  The infrastructure supports multiple busses and
+does not preclude it.  The infrastructure supports multiple buses and
 we use this capability to test multiple NFIT configurations in the unit
 test.
 
diff --git a/Documentation/driver-api/pm/devices.rst b/Documentation/driver-api/pm/devices.rst
index 8d86d5da4023..36d5c9c9fd11 100644
--- a/Documentation/driver-api/pm/devices.rst
+++ b/Documentation/driver-api/pm/devices.rst
@@ -255,7 +255,7 @@ get registered:  a child can never be registered, probed or resumed before
 its parent; and can't be removed or suspended after that parent.
 
 The policy is that the device hierarchy should match hardware bus topology.
-[Or at least the control bus, for devices which use multiple busses.]
+[Or at least the control bus, for devices which use multiple buses.]
 In particular, this means that a device registration may fail if the parent of
 the device is suspending (i.e. has been chosen by the PM core as the next
 device to suspend) or has already suspended, as well as after all of the other
@@ -493,7 +493,7 @@ states, like S3).
 
 Drivers must also be prepared to notice that the device has been removed
 while the system was powered down, whenever that's physically possible.
-PCMCIA, MMC, USB, Firewire, SCSI, and even IDE are common examples of busses
+PCMCIA, MMC, USB, Firewire, SCSI, and even IDE are common examples of buses
 where common Linux platforms will see such removal.  Details of how drivers
 will notice and handle such removals are currently bus-specific, and often
 involve a separate thread.
diff --git a/Documentation/driver-api/scsi.rst b/Documentation/driver-api/scsi.rst
index bf2be96cc2d6..8bbdfb018c53 100644
--- a/Documentation/driver-api/scsi.rst
+++ b/Documentation/driver-api/scsi.rst
@@ -18,7 +18,7 @@ optical drives, test equipment, and medical devices) to a host computer.
 
 Although the old parallel (fast/wide/ultra) SCSI bus has largely fallen
 out of use, the SCSI command set is more widely used than ever to
-communicate with devices over a number of different busses.
+communicate with devices over a number of different buses.
 
 The `SCSI protocol <https://www.t10.org/scsi-3.htm>`__ is a big-endian
 peer-to-peer packet based protocol. SCSI commands are 6, 10, 12, or 16
@@ -286,7 +286,7 @@ Parallel SCSI (SPI) transport class
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 The file drivers/scsi/scsi_transport_spi.c defines transport
-attributes for traditional (fast/wide/ultra) SCSI busses.
+attributes for traditional (fast/wide/ultra) SCSI buses.
 
 .. kernel-doc:: drivers/scsi/scsi_transport_spi.c
    :export:
diff --git a/Documentation/driver-api/spi.rst b/Documentation/driver-api/spi.rst
index f28887045049..74eca6735042 100644
--- a/Documentation/driver-api/spi.rst
+++ b/Documentation/driver-api/spi.rst
@@ -13,7 +13,7 @@ additional chipselect line is usually active-low (nCS); four signals are
 normally used for each peripheral, plus sometimes an interrupt.
 
 The SPI bus facilities listed here provide a generalized interface to
-declare SPI busses and devices, manage them according to the standard
+declare SPI buses and devices, manage them according to the standard
 Linux driver model, and perform input/output operations. At this time,
 only "master" side interfaces are supported, where Linux talks to SPI
 peripherals and does not implement such a peripheral itself. (Interfaces
diff --git a/Documentation/driver-api/usb/hotplug.rst b/Documentation/driver-api/usb/hotplug.rst
index c1e13107c50e..12260f704a01 100644
--- a/Documentation/driver-api/usb/hotplug.rst
+++ b/Documentation/driver-api/usb/hotplug.rst
@@ -5,7 +5,7 @@ Linux Hotplugging
 =================
 
 
-In hotpluggable busses like USB (and Cardbus PCI), end-users plug devices
+In hotpluggable buses like USB (and Cardbus PCI), end-users plug devices
 into the bus with power on.  In most cases, users expect the devices to become
 immediately usable.  That means the system must do many things, including:
 
diff --git a/Documentation/driver-api/usb/usb.rst b/Documentation/driver-api/usb/usb.rst
index 976fb4221062..7f2f41e80c1c 100644
--- a/Documentation/driver-api/usb/usb.rst
+++ b/Documentation/driver-api/usb/usb.rst
@@ -13,7 +13,7 @@ structure, with the host as the root (the system's master), hubs as
 interior nodes, and peripherals as leaves (and slaves). Modern PCs
 support several such trees of USB devices, usually
 a few USB 3.0 (5 GBit/s) or USB 3.1 (10 GBit/s) and some legacy
-USB 2.0 (480 MBit/s) busses just in case.
+USB 2.0 (480 MBit/s) buses just in case.
 
 That master/slave asymmetry was designed-in for a number of reasons, one
 being ease of use. It is not physically possible to mistake upstream and
@@ -42,7 +42,7 @@ two. One is intended for *general-purpose* drivers (exposed through
 driver frameworks), and the other is for drivers that are *part of the
 core*. Such core drivers include the *hub* driver (which manages trees
 of USB devices) and several different kinds of *host controller
-drivers*, which control individual busses.
+drivers*, which control individual buses.
 
 The device model seen by USB drivers is relatively complex.
 
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
