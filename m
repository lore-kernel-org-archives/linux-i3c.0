Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CB3CC6B38
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Oct 2026 16:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AGFbKlhcKTMS9jcSJZu05Qiiw16n/fQSGuUi8j63Ti0=; b=tNZ/nkO0oMcZMe
	50Rt8gH4diVjEK9nvT0S94YPlBOwQQ98J4C15AF8apJ1qESrHgQq9XUBMd6RvJjZm5TWTko4Rmdvk
	zVhdJ+wO3v7QddkTYWajW14WNpeUohxpCHMqMw9GbyhH07U6ecEX42qyYGP/1/1CtiAWlpbT5tGkK
	LAuoW//eUJxUXoQpkDnp9dGnccyb42kGMINuOUIHLty8WfvafXiHKKHb9icLzNPwTFBCQT0T2dbOU
	jhfNN1PPTW8LLQyatmupeL/VOfAVqfwWPgIwDqk/PCk5N2RxIghqFD/xHEsoqZughpiWNM+HklBOC
	6WkLevi/hpOS7ykrbeDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHl4r-00000003RvR-1fWO;
	Fri, 16 Oct 2026 16:46:41 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHl4o-00000003RuP-2x2I
	for linux-i3c@lists.infradead.org;
	Fri, 16 Oct 2026 16:46:40 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 94E031A0223;
	Fri, 16 Oct 2026 18:46:34 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2C8AE1A006F;
	Fri, 16 Oct 2026 18:46:34 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 57FD118000B1;
	Sat, 17 Oct 2026 00:46:30 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	broonie@kernel.org,
	mfd@lists.linux.dev,
	lee@kernel.org,
	Frank.Li@nxp.com,
	lgirdwood@gmail.com,
	linux-gpio@vger.kernel.org,
	linusw@kernel.org,
	brgl@kernel.org
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [RFC PATCH 0/7] i3c: hub: p3h2x4x: add debugfs, i2c-tools, bus rate and GPIO mode support
Date: Fri, 16 Oct 2026 22:16:18 +0530
Message-Id: <20261016164625.3166779-1-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_094639_015643_FED1B8E3 
X-CRM114-Status: GOOD (  12.52  )
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

This patchset adds a debugfs interface for hub inspection and register
access, SMBus transfer support enabling standard i2c-tools on SMBus target
ports, per-port bus rate configuration through the standard
'clock-frequency' property for ports operating in SMBus mode, and GPIO mode
support for target ports whose pins are used as general-purpose I/O.

This RFC is being posted for early feedback, particularly on the DT
representation and GPIO interface. It is not standalone and is not
intended to be applied before its base-series dependencies are available.

This series was developed on top of the complete v20 P3H2x4x I3C hub
series:

https://lore.kernel.org/linux-i3c/20260922103551.2754613-1-lakshay.piplani@nxp.com/T/#u

At the time of posting, v20 patches 1/8, 2/8, 3/8 and 6/8 have been applied
to the I3C maintainer tree. The remaining device-specific patches 4/8, 5/8,
7/8 and 8/8 are still pending.

The implementation in this series builds on the MFD core from v20 patch
4/8 and the target-port and SMBus support from v20 patches 7/8 and 8/8.
The binding extensions build on v20 patch 3/8.

The series should therefore be reviewed against the complete v20 series.
A subsequent non-RFC version will be rebased onto the upstream base once
the remaining dependencies have landed.

The dependency order within this patchset is:

- Patch 1 adds a debugfs interface exposing the hub, control port and
  target port configuration, and raw register read/write access
- Patch 2 implements .smbus_xfer for the I2C adapters created for the SMBus
  target ports, so i2cdetect, i2cget and i2cset can be used
- Patch 3 describes the standard 'clock-frequency' property for the smbus@
  target port nodes, restricted to the four rates the hardware implements
- Patch 4 programs the port rate from that property and derives the status
  poll interval from it, and depends on patch 3
- Patch 5 describes the new "gpio@N" target port node and marks the hub as
  a gpio-controller
- Patch 6 programs the target port GPIO mode register from that node and
  depends on patch 5
- Patch 7 exposes the pins of those ports as a gpio_chip and depends on
  patch 6

Lakshay Piplani (7):
  i3c: hub: p3h2x4x: Add support for debugfs
  i3c: hub: add i2c-tools support for SMBus-configured target ports
  dt-bindings: i3c: nxp,p3h2840: add clock-frequency for SMBus target
    ports
  i3c: hub: p3h2x4x: add clock-frequency DTS support
  dt-bindings: i3c: nxp,p3h2840: add GPIO mode target ports
  i3c: hub: p3h2x4x: configure target ports placed in GPIO mode
  gpio: p3h2x4x: add GPIO expander for the NXP P3H2x4x I3C hub

 .../devicetree/bindings/i3c/nxp,p3h2840.yaml  |  72 +++++
 MAINTAINERS                                   |   1 +
 drivers/gpio/Kconfig                          |  11 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-p3h2x4x.c                   | 294 ++++++++++++++++++
 drivers/i3c/hub/p3h2840_i3c_hub.h             |  48 ++-
 drivers/i3c/hub/p3h2840_i3c_hub_common.c      | 218 ++++++++++++-
 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c       | 272 +++++++++++++++-
 drivers/mfd/p3h2840.c                         |   5 +
 include/linux/mfd/p3h2840.h                   |   8 +
 10 files changed, 905 insertions(+), 25 deletions(-)
 create mode 100644 drivers/gpio/gpio-p3h2x4x.c

-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
