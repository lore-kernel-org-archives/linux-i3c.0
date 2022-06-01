Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C868C43334
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jun 2022 21:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WL18Mvj3p4IkNTsCIX1sC7oYiShcDeMPcXRa7jTt5g0=; b=L3eOt75b/u7LaQ
	Z3VIRRQazQjf4X1/db2zaZZncDHedb7MRxT4o8ed9eBe5vtUjo1M1i8O80dpw6rh+ywA2CxMxYZiP
	/x6FwjiT4wAxLW+2emAA4SgpL3IGnThlg+1g3rps443ZNJaNbU0NrXR3rSLMaB5LNEiVVaKNUKITX
	Sy2S/zItnjF1HWAUOivmUXWW+5uQscUkQYzfVjCH6b/XcJ8LzF8uE43Z4ongxlsfz0HLxMAseng5d
	SLJ2zRphlh1VYN8VaBKbdSQ59Sc3FOZwp/4fCI2wN6ogZ01iP2Or8MPyqTZyFBeitAtQor6IVvuKx
	N5rYM2qD0d+qtmfKzQ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwVj6-000RgH-BA; Wed, 01 Jun 2022 21:18:00 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwVj2-000Rd4-HS
	for linux-i3c@lists.infradead.org; Wed, 01 Jun 2022 21:17:58 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CCCCD1BF204;
	Wed,  1 Jun 2022 21:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654118272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=yDUhBv6XHVz7aAD1gbDoff/7ZzVY1tgq3gAseNLUe94=;
	b=cfJTjSQnibUPOy+Jo5Lb1kxrzIWavxaygTiwI6e6wMGZFBVDEHdUgpVRy23KU2hZtq/Tng
	8YwRpNPDVwH6UMe9XRFyKvyy2ih+uWYo/qlrh5pEa0zTPNphrh+Iqk2lovSf9T1cso6zIn
	7Eh4iMVRnJ7QbXxHEDFO3VVbtn6Pm85itJFkGX8atoQjWW6y0VwXCyZNGkDVtm5ZhaeZHG
	m9VGbX78KuuRWfmLK67dw6G4ShjsQQub0TZZXxeD+Q4PNrpa57LeS8bkgJ++Uob3lrukQ7
	/Rk9boN2O0+XW17Sti1ssucCjXch7OmwL0Cmn/S6nOdIBsgUb7tGubcTrNc95g==
Date: Wed, 1 Jun 2022 23:17:51 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 5.19
Message-ID: <YpfXf/unhrWZkE3j@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_141756_768859_597F6BFE 
X-CRM114-Status: GOOD (  10.30  )
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

Here is the pull request for the i3c subsystem. Only clean ups and no
functional change this cycle.

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.19

for you to fetch changes up to 66ed42caf286a7aaeb6f1db4b2995dd9416226c2:

  MAINTAINERS: rectify entries for some i3c drivers after dt conversion (2022-06-01 22:46:58 +0200)

----------------------------------------------------------------
I3C for 5.19

Subsystem:
 - yaml conversion of the DT bindings

----------------------------------------------------------------
Guo Zhengkui (1):
      i3c: master: svc: fix returnvar.cocci warning

Lukas Bulwahn (1):
      MAINTAINERS: rectify entries for some i3c drivers after dt conversion

Minghao Chi (1):
      i3c/master: simplify the return expression of i3c_hci_remove()

Rob Herring (2):
      dt-bindings: i3c: Convert cdns,i3c-master to DT schema
      dt-bindings: i3c: Convert snps,dw-i3c-master to DT schema

 .../devicetree/bindings/i3c/cdns,i3c-master.txt    | 43 ----------------
 .../devicetree/bindings/i3c/cdns,i3c-master.yaml   | 60 ++++++++++++++++++++++
 .../devicetree/bindings/i3c/snps,dw-i3c-master.txt | 41 ---------------
 .../bindings/i3c/snps,dw-i3c-master.yaml           | 52 +++++++++++++++++++
 MAINTAINERS                                        |  4 +-
 drivers/i3c/master/mipi-i3c-hci/core.c             |  7 +--
 drivers/i3c/master/svc-i3c-master.c                |  3 +-
 7 files changed, 116 insertions(+), 94 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
 create mode 100644 Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
 delete mode 100644 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
 create mode 100644 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
