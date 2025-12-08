Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B80D1CDC6
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Dec 2025 02:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=crp0PPoEk2K32CuGflbk3J08SNEv2J8rhjZ9Sxnfivs=; b=a53cV1bPHoGAWS
	gl6JdKkOF4v9vX0AaVKj0Qb2Z3SSJ/d3OFqRs8Ntbit9Ut5dpovFJUBRs4XV7w5u8S8Q5DeWw/v0y
	8RwRvzrLq83ZghyuEZY1k8Y0fhOuzjXZTq9LpjUeICCnC72LE/s6XbpNamgnvWymDJ09UwjurM5xw
	YnnVAZQ4rgHyT1mKLvvBSsRm6mK36iLItvGxFA+1zW1Ca91+uwEBE/S3vBEqclX95RIpCbQFlhp7R
	sRWwJaXc4IOlPUDd8vRRPnr6q/eJnkU/F1hSZxPtsgcY4w6sUPyvJU5vjwMDlvxs3C/flKVfo8jTl
	kc3PbnOUm4jZj2Y+qxaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSQeQ-0000000CSDK-2Hcx;
	Mon, 08 Dec 2025 02:06:58 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSQeM-0000000CSCj-32lM
	for linux-i3c@lists.infradead.org;
	Mon, 08 Dec 2025 02:06:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D0E8F4E41AD7;
	Mon,  8 Dec 2025 02:06:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A589560707;
	Mon,  8 Dec 2025 02:06:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 765BF102F0A90;
	Mon,  8 Dec 2025 03:06:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765159609; h=from:subject:date:message-id:to:cc:mime-version:content-type;
	bh=P2NpOBKK/gDNS+gRE4wTWPFUdaDVu2K9SumlPuUMdFM=;
	b=fylhbAiz26CMrHf4gtEZhS2vhCuZwYpgirEjwM1c/FKtMKstXwS5wCBVqcyPXPDKi9XnSc
	AUUf43x+ll1JUOr2rrBNkdA0fSp9ksRCgU2yav3WN0yripnVZw1ElY4g9fJp3xdGAHcQvq
	olRM3g5hWv2MKS8R3iYmNVo0K63xjkRSdiFap/R8G1Bj50wV37rMUgKfECuA+se9/VAlFT
	+OWWZOupuKAcHEcJlCot7LORs9HtE+jxcnzV+rem4q4IaFUqacsANmzLf669Sojdgf1XHC
	9c7764Tvd5kVhwLQlklZkVIeAxRCubx5U1t7Kh58kUBKM8M3npED4lWXGB4AHA==
Date: Mon, 8 Dec 2025 03:06:46 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 6.19
Message-ID: <2025120802064664421bcd@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_180655_287285_BBA21C26 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

Here is the i3c subsystem pull request for 6.19. HDR support has finally
been added. mipi-i3c-hci has been reworked and Intel Nova Lake-S support
has been added.

There is a conflict in drivers/base/regmap/regmap-i3c.c that has been
solved properly in linux-next.

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.19

for you to fetch changes up to 79c3ae7ada0548d5097bdb65dde5d24a7d660fae:

  regmap: i3c: switch to use i3c_xfer from i3c_priv_xfer (2025-12-02 17:33:02 +0100)

----------------------------------------------------------------
I3C for 6.19

Subsystem:
 - Add HDR transfer support

Drivers:
 - dw: fix bus hang on Agilex5
 - mipi-i3c-hci: Intel Nova Lake-S support, IOMMU support
 - svc: HDR support

----------------------------------------------------------------
Adrian Hunter (12):
      i3c: mipi-i3c-hci-pci: Set 64-bit DMA mask for Intel controllers
      i3c: mipi-i3c-hci-pci: Move all Intel-related definitions together
      i3c: mipi-i3c-hci-pci: Rename some Intel-related identifiers
      i3c: mipi-i3c-hci-pci: Use readl_poll_timeout()
      i3c: mipi-i3c-hci-pci: Constify driver data
      i3c: mipi-i3c-hci-pci: Factor out private registers ioremapping
      i3c: mipi-i3c-hci-pci: Factor out intel_reset()
      i3c: mipi-i3c-hci-pci: Allocate a structure for mipi_i3c_hci_pci device information
      i3c: mipi-i3c-hci-pci: Change callback parameter
      i3c: mipi-i3c-hci-pci: Add exit callback
      i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers
      i3c: mipi-i3c-hci-pci: Set d3cold_delay to 0 for Intel controllers

Adrian Ng Ho Yin (2):
      dt-bindings: i3c: snps: Add Altera SoCFPGA compatible
      i3c: dw: Disable runtime PM on Agilex5 to avoid bus hang on IBI

Alexandre Belloni (2):
      i3c: fix I3C_SDR bit number
      i3c: document i3c_xfers

Frank Li (8):
      i3c: fix refcount inconsistency in i3c_master_register
      i3c: Add HDR API support
      i3c: Switch to use new i3c_xfer from i3c_priv_xfer
      i3c: master: svc: Replace bool rnw with union for HDR support
      i3c: master: svc: Add basic HDR mode support
      hwmon: (lm75): switch to use i3c_xfer from i3c_priv_xfer
      net: mctp i3c: switch to use i3c_xfer from i3c_priv_xfer
      regmap: i3c: switch to use i3c_xfer from i3c_priv_xfer

Jarkko Nikula (1):
      i3c: mipi-i3c-hci-pci: Add support for Intel Nova Lake-S I3C

Jorge Marques (1):
      i3c: master: Remove i3c_device_free_ibi from i3c_device_remove

Marco Crivellari (1):
      i3c: master: add WQ_PERCPU to alloc_workqueue users

Stanley Chu (1):
      i3c: master: svc: Prevent incomplete IBI transaction

 .../bindings/i3c/snps,dw-i3c-master.yaml           |   6 +-
 drivers/base/regmap/regmap-i3c.c                   |   8 +-
 drivers/hwmon/lm75.c                               |   8 +-
 drivers/i3c/device.c                               |  27 ++-
 drivers/i3c/internals.h                            |   6 +-
 drivers/i3c/master.c                               |  31 +--
 drivers/i3c/master/dw-i3c-master.c                 |  31 ++-
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 229 +++++++++++++++++----
 drivers/i3c/master/svc-i3c-master.c                | 137 +++++++++---
 drivers/net/mctp/mctp-i3c.c                        |   8 +-
 include/linux/i3c/device.h                         |  42 ++--
 include/linux/i3c/master.h                         |  10 +-
 12 files changed, 427 insertions(+), 116 deletions(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
