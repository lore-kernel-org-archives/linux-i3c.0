Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63869C77B73
	for <linux-i3c@archiver.kernel.org>; Sun, 30 Apr 2023 22:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O30vYOpZTDCPnkPQrH9TVRYXpqKbM2t4aERNDx75ljU=; b=hJLyvzGIoM2HI9
	yxiZsOiKzD7zPAhDwBgWXt4ea491CsWTSyOLuybdAAKCKwLfjRSFf6yOBDTQa3/Y3Nn+GAabJ4BHC
	N9v84gj0/oFfHyFojqlzxvq3xIuiWdY+zkX+WlOa2EKIOJglM57pmeqfmoY7R86iWflb2rAWoEgTe
	0Omk6nJQUvK+etVCpSr/9XdixL3NMs77UQyVIpDlLzuzijoZkjOAMsVVqjeBpwZUyPO+fpgtkW352
	a3b8hSTtMXK8utm4D/cHZ4Hv03+k/BDSWdCPOmxfNSZFnVJBFvnrNqn6yUGalXtJk1EK7JARoKoaO
	vFXcqSmdQcVwAcTQFnuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptFH1-00ErRS-2F;
	Sun, 30 Apr 2023 22:12:03 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptFGx-00ErQg-2h
	for linux-i3c@lists.infradead.org;
	Sun, 30 Apr 2023 22:12:01 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6A07420002;
	Sun, 30 Apr 2023 22:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682892712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=S0PUlY9cWCsgaEVIJLp36/CNwq+4HYBHE9hsb/7K+jY=;
	b=JKFHbnn0HjZJRK5DbCHEELOHeT8yAPecugKohzLt2cxZdE7/A6S04KtQ4vUbzaZvCuB4WU
	r8PwFwH8kQdT4Ypkg/WK8UEyjAzU2i0gu0X1X8lyGm4qYWlogaWFqurt9UX59XIEEyiv9X
	kOW9LgJgplF9x4p5bckpbIfne/fpzk3fQ7TY7pMzoYE0MmAnk0o6mndJb5gTbmGgqyUC3/
	z8KF67FHMZdkBdOz/6klOdqzKFN0ynhz14uf9nEEPE4sc5Iq9eBUjiFJPCGe8pmcCKJQ5m
	4LRfFDBhqKXuEGJf8ac/EaY0/yiWs/eCr/oONTNoOtYYQ+LxQyCO2UbkrT+fXw==
Date: Mon, 1 May 2023 00:11:51 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 6.4
Message-ID: <20230430221151c27da7d9@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230430_151200_173194_FB909650 
X-CRM114-Status: GOOD (  11.03  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello Linus,

Here is the i3c subsytem pull request for 6.4. Most of the changes are
there to support a new driver, mostly reusing the existing DW driver.

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-=
6.4

for you to fetch changes up to 6b496a94c5905fca7879bc0dc438a47de40b7d4f:

  i3c: ast2600: set variable ast2600_i3c_ops storage-class-specifier to sta=
tic (2023-04-30 23:50:26 +0200)

----------------------------------------------------------------
I3C for 6.4

Subsystem:
 - OF alias bus numbering
 - convert to platform remove callback returning void

New driver: AST2600 controller, based on Synopsys DesignWare IP

Drivers:
 - dw: add infrastructure to support different platform integrations

----------------------------------------------------------------
Andy Shevchenko (1):
      i3c: Correct reference to the I=B2C device data type

Jeremy Kerr (11):
      i3c: dw: use bus mode rather than device reg for conditional tCAS set=
ting
      i3c: dw: Add infrastructure for platform-specific implementations
      dt-bindings: i3c: Add AST2600 i3c controller
      i3c: ast2600: Add AST2600 platform-specific driver
      i3c: Allow OF-alias-based persistent bus numbering
      i3c: dw: Create a generic fifo read function
      i3c: dw: Turn DAT array entry into a struct
      i3c: dw: Add support for in-band interrupts
      i3c: dw: Add a platform facility for IBI PEC workarounds
      i3c: ast2600: enable IBI support
      i3c: ast2600: fix register setting for 545 ohm pullups

Krzysztof Kozlowski (1):
      i3c: dw: drop of_match_ptr for ID table

Matt Johnston (1):
      i3c: dw: Return the length from a read priv_xfer

Tom Rix (1):
      i3c: ast2600: set variable ast2600_i3c_ops storage-class-specifier to=
 static

Uwe Kleine-K=F6nig (5):
      i3c: Make i3c_master_unregister() return void
      i3c: dw: Convert to platform remove callback returning void
      i3c: cdns: Convert to platform remove callback returning void
      i3c: mipi-i3c-hci: Convert to platform remove callback returning void
      i3c: svc: Convert to platform remove callback returning void

 .../bindings/i3c/aspeed,ast2600-i3c.yaml           |  72 ++++
 MAINTAINERS                                        |   6 +
 drivers/i3c/master.c                               |  36 +-
 drivers/i3c/master/Kconfig                         |  14 +
 drivers/i3c/master/Makefile                        |   1 +
 drivers/i3c/master/ast2600-i3c-master.c            | 189 +++++++++
 drivers/i3c/master/dw-i3c-master.c                 | 435 +++++++++++++++++=
+---
 drivers/i3c/master/dw-i3c-master.h                 |  84 ++++
 drivers/i3c/master/i3c-master-cdns.c               |  11 +-
 drivers/i3c/master/mipi-i3c-hci/core.c             |   6 +-
 drivers/i3c/master/svc-i3c-master.c                |  11 +-
 include/linux/i3c/master.h                         |   5 +-
 12 files changed, 779 insertions(+), 91 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3=
c.yaml
 create mode 100644 drivers/i3c/master/ast2600-i3c-master.c
 create mode 100644 drivers/i3c/master/dw-i3c-master.h

-- =

Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
