Return-Path: <SRS0=nbq2=HY=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C16EC433E0
	for <linux-i3c@archiver.kernel.org>; Mon, 22 Feb 2021 00:41:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C50D64EB2
	for <linux-i3c@archiver.kernel.org>; Mon, 22 Feb 2021 00:41:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C50D64EB2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5uxNf6cdj3YP5CvxGG0NwkYAlhoEKrZlcMHAx4KTAbA=; b=Tr9VtYGC+ps9cFQ518Fg8II55D
	p+zMrvNSoCcCZ6iav5htyyHM5G6MnUiawbJ8Sg8mpHn+SEcgbg45R3ZM50k6uKBx0QqRqtbb7Xy3c
	aLe3k8E5joYpIWC7nyUf7On2yZyRNeKoDNuSzGwgQCD2uDCSToGvXhcttm8gmec9EJt4RL7+yKGKt
	QF/YAKeE/eY8ENvPHAYLcPgHMcyquVJNvAqR6zdb/oe1D/qbBvc2+89feU8wpehGIhHKLRmOe/359
	Hq+HI8ArDpNeDaoU6ItQw1m1VVtdndUzP+W3Kq8MIsSj5Lu+Az4C64//A/jTpNblwqgl5ZvCWn0pY
	RNydYzQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lDzI4-0003du-Tm; Mon, 22 Feb 2021 00:41:32 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lDzI2-0003dN-Ka
 for linux-i3c@lists.infradead.org; Mon, 22 Feb 2021 00:41:32 +0000
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr
 [90.65.108.55]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id CA25920004;
 Mon, 22 Feb 2021 00:41:22 +0000 (UTC)
Date: Mon, 22 Feb 2021 01:41:22 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] I3C changes for 5.12
Message-ID: <YDL9slBuOqU83/RK@piout.net>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210221_194130_789343_06A92D27 
X-CRM114-Status: GOOD (  11.70  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello Linus,

Here is the I3C pull request for v5.12 with a few improvements for the
core and a new driver.

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-=
5.12

for you to fetch changes up to 5c34b8e7e8bb605925b33e1aa7dc17966811219a:

  i3c: master: dw: Drop redundant disec call (2021-02-06 00:44:15 +0100)

----------------------------------------------------------------
I3C for 5.12

Subsystem:
 - Handle drivers without probe or remove callback
 - Remove callback now returns void
 - DT documentation is now in yaml

New driver:
 - Silvaco I3C master

----------------------------------------------------------------
David Gow (1):
      i3c/master/mipi-i3c-hci: Specify HAS_IOMEM dependency

Miquel Raynal (7):
      dt-bindings: i3c: Convert the bus description to yaml
      dt-bindings: i3c: mipi-hci: Include the bus binding
      dt-bindings: Add vendor prefix for Silvaco
      dt-bindings: i3c: Describe Silvaco master binding
      i3c: master: svc: Add Silvaco I3C master driver
      MAINTAINERS: Add Silvaco I3C master
      i3c: master: dw: Drop redundant disec call

Uwe Kleine-K=F6nig (2):
      i3c: Handle drivers without probe or remove callback
      i3c: Make remove callback return void

 Documentation/devicetree/bindings/i3c/i3c.txt      |  140 --
 Documentation/devicetree/bindings/i3c/i3c.yaml     |  179 +++
 .../devicetree/bindings/i3c/mipi-i3c-hci.yaml      |    9 +-
 .../bindings/i3c/silvaco,i3c-master.yaml           |   60 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 MAINTAINERS                                        |    8 +
 drivers/i3c/device.c                               |    5 +
 drivers/i3c/master.c                               |    8 +-
 drivers/i3c/master/Kconfig                         |    9 +
 drivers/i3c/master/Makefile                        |    1 +
 drivers/i3c/master/dw-i3c-master.c                 |    5 -
 drivers/i3c/master/svc-i3c-master.c                | 1478 ++++++++++++++++=
++++
 include/linux/i3c/device.h                         |    2 +-
 13 files changed, 1753 insertions(+), 153 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i3c/i3c.txt
 create mode 100644 Documentation/devicetree/bindings/i3c/i3c.yaml
 create mode 100644 Documentation/devicetree/bindings/i3c/silvaco,i3c-maste=
r.yaml
 create mode 100644 drivers/i3c/master/svc-i3c-master.c

-- =

Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
