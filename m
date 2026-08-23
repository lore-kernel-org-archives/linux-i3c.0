Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFB9C5DF8C
	for <linux-i3c@archiver.kernel.org>; Sun, 23 Aug 2026 20:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YBavQgqLVH2a4O5UNkk+/ckMdXunFXd5jnyImgV2n4U=; b=toz3y/+fTwxxIB
	iBXS9Lm8J+IKgYd15O9TLlgV6kpuNwKhWW5LQaIHdxk+Wm9fXL/JMeX30DotJtwSoJJ9lE6zMynpH
	5XXtbOd+39rjDHeOK28F5wPw5diKkf0B6nbrhSGdODjVqmJDuTyvC1k4Kl/kMhjmHB9mbcRXHPsFG
	Cg3PQcLsUEwbj+7QmSOd2GeDQyQ9gXhfcgpJJ/DtKjFBHyw++8PbXITYPrsZekANzNQTgNM7ZBJMZ
	2//GcDJAz7GfVQvGHvGJ990ZqZFyOjo4hOictNAhlW0p2hMYkU5lOczOiXbFH+Q9ZS8aZkkQRv5f+
	aBt7qTHEnjURQzmG9Q1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyEgH-0000000Fatr-3KAT;
	Sun, 23 Aug 2026 20:20:37 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyEgE-0000000FatT-1MVV
	for linux-i3c@lists.infradead.org;
	Sun, 23 Aug 2026 20:20:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 92A224E41376
	for <linux-i3c@lists.infradead.org>; Sun, 23 Aug 2026 20:20:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 663B660378;
	Sun, 23 Aug 2026 20:20:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6045E11C7858C;
	Sun, 23 Aug 2026 22:20:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787516422; h=from:subject:date:message-id:to:cc:mime-version:content-type;
	bh=NMM73I1tYuErEU5lq0ag2W0RN6zGiwN9jG7+WW4pQs0=;
	b=rELPDv6fMg+clvoAJOj50sA35aFjICskpdCkCLMxiH2d3h64zcosbBhIZDobVcV605Bm0c
	CTGH4UtyjXYYDDAowdzxYXIhqpsvDrQ3M3SgktZWE321WaN76xwCK5gQ22WPbdm8Q11u/z
	ptEaINqF14S/8Iyhs8aOCFv1d5KT411lN6yhENG1rgher7cHOGDUq5XJcn6mpofKKbateq
	JjoqWd2mYh9e5zlKpn37LlYj/mXJCQHZLNlCI8JiGCSX7MxjydUfg3G0wYdlZXGh35MaV6
	AvvAOBpwawcwKfbQp8ZPXtTrrq9woL8zSJyUUS5qqYOmhkci5WZJSU+vfFN1ug==
Date: Sun, 23 Aug 2026 22:20:21 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 7.3
Message-ID: <20260823202021b159cfe8@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_132034_673086_1716C83B 
X-CRM114-Status: GOOD (  15.10  )
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

Hello Linus,

Here is the i3c subsystem pull request for 7.3. We get a new driver this
cycle, for the AMD AXI I3C controller. There are also new features such
as IBI wakeup support, SETAASA device discovery and ACPI support for the
the DAA methods, meaning we can now communicate with  the SPD devices on
DDR5 modules.

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-7.3

for you to fetch changes up to cab40cfc9e116acd4d60f95b4b1264cab78f3803:

  i3c: dw: reduce do_daa time if there's no client (2026-08-19 09:28:33 +0200)

----------------------------------------------------------------
I3C for 7.3

New driver:
 - AMD AXI I3C master controller

Subsystem:
 - I3C Common Command Code (CCC) handling improvements, especially around GET
   CCCs
 - SETAASA device discovery support
 - ACPI support for all existing DAA methods like SETDASA, SETNEWDA as well as
   I2C devices on I3C bus
 - IBI-based wakeup support

Drivers:
 - dw: SETAASA support
 - mipi-i3c-hci: advertise IBI wakeup capability, AMD_PT I3C controller support,
   PIO queue management support for HCI v1.2
 - renesas: improve suspend to RAM support, add runtime PM support

----------------------------------------------------------------
Adrian Hunter (16):
      i3c: master: Fix device_register() error path
      i3c: master: Fix info leak and UAF in device unregister path
      i3c: master: Fix recursive locking during device registration
      i3c: Fix unlocked dereference of dev->desc in i3c_device_get_supported_xfer_mode()
      i3c: master: Do not treat master device as a duplicate target
      i3c: master: Fix use-after-free of master->this
      i3c: Make dev->desc locking assumptions explicit
      i3c: master: Fix potential UAF in i3c_device_uevent()
      i3c: master: Fix potential UAF in i3c_device_match()
      i3c: master: Support IBI-based wakeup capability
      i3c: master: Report wakeup events for IBIs
      i3c: master: Add helper to query bus wakeup requirements
      i3c: master: Reject IBI requests from non-IBI-capable devices
      i3c: mipi-i3c-hci-pci: Propagate I3C wakeup requirements to PCI
      i3c: mipi-i3c-hci: Factor out i3c_hci_sysdev()
      i3c: mipi-i3c-hci: Advertise IBI wakeup capability

Adrian Ng Ho Yin (6):
      i3c: ccc: Add actual_len to struct i3c_ccc_cmd_payload
      i3c: master: Report actual GET CCC payload length on success
      i3c: master: dw: Map CCC hardware errors to I3C M0/M2
      i3c: master: Validate GET CCC payload length and retry Direct GET once
      i3c: master: Add optional_bytes for variable-length GET CCC validation
      i3c: master: require dests for read CCC commands

Akhil R (11):
      dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA
      i3c: master: Use unified device property interface
      i3c: master: Support ACPI enumeration of child devices
      i3c: master: Add support for devices using SETAASA
      i3c: master: Add support for devices without PID
      i3c: master: match I3C device through DT and ACPI
      i3c: dw-i3c-master: Add SETAASA as supported CCC
      i3c: dw-i3c-master: Add ACPI core clock frequency quirk
      i3c: dw-i3c-master: Add ACPI ID for Tegra410
      hwmon: spd5118: Remove 16-bit addressing
      hwmon: spd5118: Add I3C support

Can Peng (1):
      i3c: master: adi: add OF module alias for autoloading

Claudiu Beznea (18):
      i3c: renesas: Check that the transfer is valid before accessing it
      i3c: renesas: Restore STDBR and EXTBR registers on resume
      i3c: renesas: Follow the reset deassert order used in probe
      i3c: renesas: Reconfigure the DATBAS register on re-attach
      i3c: renesas: Reset the controller on resume
      i3c: renesas: Perform Dynamic Address Assignment on resume
      i3c: renesas: Clean DATBAS register on detach
      i3c: renesas: Fix out-of-bounds access for newdevs mask
      i3c: renesas: Use reset_control_bulk_{assert, deassert}()
      i3c: renesas: Return immediately if there is no transfer
      i3c: renesas: Follow a unified pattern for transfer and command initialization
      i3c: renesas: Drop the explicit memset() call
      i3c: renesas: Update HW registers after SW computations are done
      i3c: renesas: Organize structures to avoid unnecessary padding
      i3c: renesas: Use the "dev_name:irq_name" format for the interrupt name
      i3c: renesas: Drop unnecessary tab
      i3c: renesas: Add runtime PM support
      i3c: renesas: Drop unused structure member 'resuming'

Jakub Kicinski (1):
      i3c: dw: avoid shift-out-of-bounds when DAA assigns no devices

Jian-Ming Liao (3):
      i3c: mipi-i3c-hci: Fix missing STAT_IBI_STATUS_THLD in PIO mode
      i3c: mipi-i3c-hci: Add PIO queue management support for HCI v1.2
      i3c: mipi-i3c-hci: Add support for AMD_PT I3C controller

Jisheng Zhang (4):
      i3c: dw: use COMMAND_PORT_TRANSFER_ARG instead of hardcoding
      i3c: dw: make struct dw_i3c_cmd smaller
      i3c: dw: rename "pclk" to "apb" to match dt-binding
      i3c: dw: reduce do_daa time if there's no client

Manikanta Guntupalli (2):
      dt-bindings: i3c: Add AMD I3C master controller support
      i3c: master: Add driver for AMD AXI I3C master controller

Maoyi Xie (1):
      i3c: master: svc: bound IBI payload to the requested max_payload_len

Pengpeng Hou (1):
      i3c: master: svc: report timeout waiting for STOP idle

Runyu Xiao (1):
      i3c: master: adi: initialize the lock before enabling interrupts

Shubham Patil (2):
      dt-bindings: i3c: dw: Document missing optional core reset
      i3c: master: dw: Drop redundant core reset name

Swark Yang (1):
      dt-bindings: i3c: cdns: add Axiado AX3005 I3C variant

Tommaso Merciai (1):
      i3c: renesas: Don't register devices when ENTDAA times out

Tze Yee Ng (1):
      i3c: master: dw-i3c-master: fix OD timing for first broadcast

 .../devicetree/bindings/i3c/cdns,i3c-master.yaml   |    1 +
 Documentation/devicetree/bindings/i3c/i3c.yaml     |   36 +-
 .../bindings/i3c/snps,dw-i3c-master.yaml           |    3 +
 .../devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml  |   58 +
 MAINTAINERS                                        |    8 +
 drivers/hwmon/Kconfig                              |    9 +-
 drivers/hwmon/spd5118.c                            |  119 +--
 drivers/i3c/device.c                               |   13 +-
 drivers/i3c/internals.h                            |    5 +
 drivers/i3c/master.c                               |  632 +++++++++--
 drivers/i3c/master/Kconfig                         |   15 +
 drivers/i3c/master/Makefile                        |    1 +
 drivers/i3c/master/adi-i3c-master.c                |   19 +-
 drivers/i3c/master/amd-i3c-master.c                | 1124 ++++++++++++++++++++
 drivers/i3c/master/dw-i3c-master.c                 |  188 +++-
 drivers/i3c/master/dw-i3c-master.h                 |    1 +
 drivers/i3c/master/i3c-master-cdns.c               |    3 +
 drivers/i3c/master/mipi-i3c-hci/core.c             |   30 +-
 drivers/i3c/master/mipi-i3c-hci/dma.c              |   15 +-
 drivers/i3c/master/mipi-i3c-hci/hci.h              |    7 +
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c |   32 +-
 drivers/i3c/master/mipi-i3c-hci/pio.c              |   74 +-
 drivers/i3c/master/renesas-i3c.c                   |  390 +++++--
 drivers/i3c/master/svc-i3c-master.c                |   22 +-
 include/dt-bindings/i3c/i3c.h                      |    4 +
 include/linux/i3c/ccc.h                            |   12 +-
 include/linux/i3c/master.h                         |   27 +-
 27 files changed, 2470 insertions(+), 378 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
 create mode 100644 drivers/i3c/master/amd-i3c-master.c

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
