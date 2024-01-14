Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FD5C47077
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Jan 2024 23:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QU6w8lOqa8neaQq2DCODWtoXvWn1V7gF0f32l+mNFck=; b=k6/LvQQgcA93Mf
	EMBs2nAhjhO/eNl4oIMPn0pB7iNlMOwaStCUbf5VOSkXkLhbb+eKGMKqjG6sKtKFZKAVxJe8urQ4U
	+l9HaaPQYuWUXfckXqjG/egXNJG4DTakhmdTIUS3qlhZtS7oAlXj+LtHGUOUeesPGydNi0oNKsQtr
	N4AjhUjew77xRP0tiBfT/K+M22Gmkashk1bj5q8AHCSMO5HE+FXyu959uJSc5z79vhfDAPFm+R1Uf
	zbhR++aIZDCnbr2IMJ0COLDsOK3EwOS8RLpLMtR5MdaOYYaToNlc0QV9yDDXo67EkmtlR81E2klRx
	zVKICQuOLmXDNy2MgkKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rP9ua-007VNq-0X;
	Sun, 14 Jan 2024 23:29:04 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rP9uW-007VMS-0r
	for linux-i3c@lists.infradead.org;
	Sun, 14 Jan 2024 23:29:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32DA320002;
	Sun, 14 Jan 2024 23:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705274935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=Ekj1BIKc/p7PMvxdbAIJtXPBTFLeIHgU2AxKmlazIDg=;
	b=MiMDevn8ZcZvevdrLRQVM9K5HqIy8Xu1qveVBRn0BxKzb2sUfB7EabEPjzzbzbl/EvCs74
	dFvia3LBGA35jGYC2UGvTaJHh2Csnz94bRzKvg4iEM9RiTTgnTxbvH3gQWTSENw3ks5gDH
	IEXzAt7aCkaT28criefjGd7NWiWA9JQpIslwcuMrheIbycvlc1CKZNUK/eXh8lFsJ2GS7S
	sdtPqJUqvFi560S612Z7LL+i5WAPvnpaYY3KuCSbeXrOAVAnT4irOjgCqy5A7iakex+t8H
	XTVhudIHEAsqmh1MQkJT5V7OOgTMNOPrmiW3twpSC34lQd4sSmZnBoo7AeMuZQ==
Date: Mon, 15 Jan 2024 00:28:54 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 6.8
Message-ID: <2024011423285495e8345d@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240114_152900_503244_C9A2B738 
X-CRM114-Status: UNSURE (   9.38  )
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

Here is the i3c subsytem pull request for 6.8. We are continuing to see
more fixes as hardware is available and code is actually getting tested.

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.8

for you to fetch changes up to 4fa0888f6f3e6a67cac5afafb23e33f8222cfdd0:

  i3c: document hotjoin sysfs entry (2024-01-15 00:21:14 +0100)

----------------------------------------------------------------
I3C for 6.7

Core:
 - Add a sysfs control for hotjoin
 - Add fallback method for GETMXDS CCC

Drivers:
 - cdns: fix prescale for i2c clock
 - mipi-i3c-hci: more fixes now that the driver is used
 - svc: hotjoin enabling/disabling support

----------------------------------------------------------------
Alexandre Belloni (1):
      i3c: document hotjoin sysfs entry

Frank Li (6):
      i3c: master: add enable(disable) hot join in sys entry
      i3c: master: svc: add hot join support
      i3c: add actual_len in i3c_priv_xfer
      i3c: master: svc: rename read_len as actual_len
      i3c: master: svc: return actual transfer data len
      i3c: master: fix kernel-doc check warning

Harshit Shah (1):
      i3c: master: cdns: Update maximum prescaler value for i2c clock

Jarkko Nikula (5):
      i3c: mipi-i3c-hci: Report NACK response from CCC command to core
      i3c: mipi-i3c-hci: Do not overallocate transfers in hci_cmd_v1_daa()
      i3c: mipi-i3c-hci: Handle I3C address header error in hci_cmd_v1_daa()
      i3c: mipi-i3c-hci: Add DMA bounce buffer for private transfers
      i3c: master: Fix build error

Joshua Yeong (1):
      i3c: Add fallback method for GETMXDS CCC

Randy Dunlap (1):
      i3c: master: fix Excess kernel-doc description warning

 Documentation/ABI/testing/sysfs-bus-i3c  | 15 +++++
 drivers/i3c/master.c                     | 95 +++++++++++++++++++++++++++++++-
 drivers/i3c/master/i3c-master-cdns.c     |  7 ++-
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c |  7 ++-
 drivers/i3c/master/mipi-i3c-hci/core.c   | 49 +++++++++++++++-
 drivers/i3c/master/mipi-i3c-hci/dma.c    |  4 +-
 drivers/i3c/master/mipi-i3c-hci/hci.h    |  1 +
 drivers/i3c/master/svc-i3c-master.c      | 95 ++++++++++++++++++++++++++------
 include/linux/i3c/device.h               |  2 +
 include/linux/i3c/master.h               |  9 ++-
 10 files changed, 256 insertions(+), 28 deletions(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
