Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0915F99C95
	for <linux-i3c@archiver.kernel.org>; Sat, 18 Apr 2026 22:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B3UTz0WpnFiNMsgaZ9MyrqYZWpDBrOPzIMaCVsrUtKU=; b=OZ86MF2JibGBCe
	3K1BomxyqieA5E1TwEf4xPx3NDavY4EQ3kJKQGMfQhl6bJ0w0rFJct3dFlIPgJQvNmWdmbNvu84w0
	d3bb2rrSjw+8CiLd8ctgoamfksyc4wDE3kSgXacG0lsO8DlWVxqpMTkSim06rhGoicXMTrT1fR4lS
	k0feOxfPe0ei29vPDjs+pdWUwRG1ee0aQwOrwws4ASfgg2zNQJ476lAAYKUmJO9mJE72p3PJP1qq8
	9Ji4cmE5QIcC+K8w7eto48ozg7fapXouUKxmvvUjKM5Pusn63MM/6q2v07IU6T74o7nnogB07WwyQ
	fQGyH6ihVafurUkM0SbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEE14-00000005FH1-2BeM;
	Sat, 18 Apr 2026 22:19:54 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEE0z-00000005FGf-34zI
	for linux-i3c@lists.infradead.org;
	Sat, 18 Apr 2026 22:19:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2891CC5C3F9
	for <linux-i3c@lists.infradead.org>; Sat, 18 Apr 2026 22:20:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B826A5FA28;
	Sat, 18 Apr 2026 22:19:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C30B710460861;
	Sun, 19 Apr 2026 00:19:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776550782; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=aFK5VQkqMAclyP2b3B1bst2L8U21N0EkZ/WUD3vATq4=;
	b=BZK6QheWjJztD1Q31uuLhget0aaUwzVSoT1/akVMXz3eV/B61uvetK7D6xHWayGCYXNjPs
	A3PCMyq+Zj9WFMOO8aKARAFexBHmCbaeaSJ5cj8ErHdbZQr7snSlPUXsrRMWolRV6OsVp+
	xVpBxFzApFSQ9V9Q9V3u95tDh9Jen36V/5JKCNIZuHKuo5mu8pm3LWLSUUlXjh9H6OeFxb
	1CdpnGpr07+QS0G4z1f5JNgLNzEL2jKvhoW+Q1CJ//3a9w3NkVg3BdgU6SLp2Wk0EfgLT1
	S1Oy31WjYwweE0RkhX70i8cp6Whd97lwJDHMWL5HPj6fvr5DWH0AvOZg8rzdjw==
Date: Sun, 19 Apr 2026 00:19:40 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 7.1
Message-ID: <2026041822194034ab56dc@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260418_151950_928263_D7A64C99 
X-CRM114-Status: UNSURE (   9.12  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello Linus,

Here is the i3c subsystem pull request for 7.1. This time, we get
support for Intel Nova Lake-H and a way to enforce rescanning the bus.
Small issues have been fixed in many drivers and the error code hanlding
for CCC commands have been reworked.

The following changes since commit f311a05784634febd299f03476b80f3f18489767:

  i3c: dw-i3c-master: Set SIR_REJECT in DAT on device attach and reattach (=
2026-03-11 22:50:29 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-=
7.1

for you to fetch changes up to d35a6db887eeae7c57b719521e39d64f929c6dc3:

  i3c: mipi-i3c-hci: fix IBI payload length calculation for final status (2=
026-04-12 22:06:02 +0200)

----------------------------------------------------------------
I3C for 7.1

Subsystem:
 - add sysfs option to rescan bus via entdaa
 - fix error code handling for send_ccc_cmd

Drivers:
 - mipi-i3c-hci-pci: Intel Nova Lake-H I3C support

----------------------------------------------------------------
Adrian Hunter (6):
      i3c: mipi-i3c-hci-pci: Add support for Intel Nova Lake-H I3C
      i3c: mipi-i3c-hci-pci: Set d3hot_delay to 0 for Intel controllers
      i3c: mipi-i3c-hci: Add quirk to allow IBI while runtime suspended
      i3c: mipi-i3c-hci: Allow parent to manage runtime PM
      i3c: mipi-i3c-hci-pci: Add optional ability to manage child runtime PM
      i3c: mipi-i3c-hci-pci: Enable IBI while runtime suspended for Intel c=
ontrollers

Billy Tsai (1):
      i3c: mipi-i3c-hci: fix IBI payload length calculation for final status

David Nystr=F6m (1):
      i3c: master: Add sysfs option to rescan bus via entdaa

Felix Gu (6):
      i3c: master: dw-i3c: Fix missing reset assertion in remove() callback
      i3c: master: dw-i3c: Balance PM runtime usage count on probe failure
      i3c: master: renesas: Fix memory leak in renesas_i3c_i3c_xfers()
      i3c: master: renesas: Use __free(kfree) for xfer cleanup in renesas_i=
3c_send_ccc_cmd()
      i3c: dw: Fix memory leak in dw_i3c_master_i3c_xfers()
      i3c: dw: Simplify xfer cleanup with __free(kfree)

Jorge Marques (5):
      i3c: master: Move rstdaa error suppression
      i3c: master: Move entdaa error suppression
      i3c: master: Move bus_init error suppression
      i3c: master: Fix error codes at send_ccc_cmd
      i3c: master: adi: Fix error propagation for CCCs

Randy Dunlap (1):
      i3c: master: svc: spelling corrections

Rosen Penev (1):
      i3c: master: use kzalloc_flex

haoyu.lu (1):
      i3c: fix missing newline in dev_err messages

 Documentation/ABI/testing/sysfs-bus-i3c            |  20 +++
 drivers/i3c/master.c                               | 113 ++++++++++-------
 drivers/i3c/master/adi-i3c-master.c                |   5 +-
 drivers/i3c/master/dw-i3c-master.c                 |  51 +++-----
 drivers/i3c/master/i3c-master-cdns.c               |   2 +-
 drivers/i3c/master/mipi-i3c-hci/core.c             |  35 +++++-
 drivers/i3c/master/mipi-i3c-hci/dma.c              |   5 +-
 drivers/i3c/master/mipi-i3c-hci/hci.h              |   7 ++
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 138 +++++++++++++++++=
++++
 drivers/i3c/master/renesas-i3c.c                   |   9 +-
 drivers/i3c/master/svc-i3c-master.c                |   8 +-
 11 files changed, 293 insertions(+), 100 deletions(-)

-- =

Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
