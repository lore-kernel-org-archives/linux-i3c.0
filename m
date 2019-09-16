Return-Path: <SRS0=l0fV=XL=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3838C49ED7
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Sep 2019 07:40:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E4692067B
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Sep 2019 07:40:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r+pGEZPd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E4692067B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LYjrLF1Pmfz+EfwpFq4hVwJltkl0KbXKRbBgzIHiTRc=; b=r+pGEZPdrxN4Nb
	yZzgL70MipcalkV4WdZEB3Nff7B2+fwE/Na4YpdnBotnFU+ehvEuL9HKBM6zBrQ6ykqEVmr3mOT1h
	cVzVnAiqUtbCithu/UyWX85MUNEhyJTd/Eai0GNdnl9FWO4231IYinGbV8qPlJUHQ/ilgNTxdhl7J
	glW30EDMXggGLon0AmaujiDJ+aVbiBwpGN3EXUs3tgE+eNBkCsroUBBzft7zv3PfxVHwpkzsR5SO4
	kddtJxvEqKjUHevuk03vSbs9XM18psCQ0fCp4NSCXWFKlw2sCID3g4BNIuLp5LLnxOo+LBAO3PI9Q
	WqLzE5Qwc0EybzPfMp0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9lcB-0003Ak-VW; Mon, 16 Sep 2019 07:40:03 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9lc9-0002om-FK
 for linux-i3c@lists.infradead.org; Mon, 16 Sep 2019 07:40:03 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C248F28C721;
 Mon, 16 Sep 2019 08:39:56 +0100 (BST)
Date: Mon, 16 Sep 2019 09:39:53 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] i3c: Changes for 5.4
Message-ID: <20190916093953.05c99b3e@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190916_004001_643971_BE91F720 
X-CRM114-Status: GOOD (  10.35  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c <linux-i3c@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello Linus,

Here is the I3C PR for 5.4.

Regards,

Boris

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-5.4

for you to fetch changes up to 6030f42d20cedc04df019891851320f3e257038b:

  i3c: master: Use dev_to_i3cmaster() (2019-08-27 09:43:59 +0200)

----------------------------------------------------------------
Core changes:
* Export i3c_device_match_id() so driver can get per-device data
* Add addr and lvr fields to i2c_dev_desc so we can attach I2C devices
  that are not described in the DT
* Add a missing of_node_put()
* Fix a memory leak
* Use dev_to_i3cmaster() instead of open-coding it

Driver changes:
* Use for_each_set_bit() in the Cadence driver

----------------------------------------------------------------
Andy Shevchenko (1):
      i3c: master: cdns: Use for_each_set_bit()

Axel Lin (1):
      i3c: master: Use dev_to_i3cmaster()

Nishka Dasgupta (1):
      i3c: master: Add of_node_put() before return

Przemyslaw Gaj (1):
      i3c: add addr and lvr to i2c_dev_desc structure

Vitor Soares (1):
      i3c: move i3c_device_match_id to device.c and export it

Wenwen Wang (1):
      i3c: master: fix a memory leak bug

 drivers/i3c/device.c                 | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/i3c/master.c                 | 67 ++++++++++++++-----------------------------------------------------
 drivers/i3c/master/dw-i3c-master.c   |  4 ++--
 drivers/i3c/master/i3c-master-cdns.c | 30 ++++++++++++------------------
 include/linux/i3c/device.h           |  4 ++++
 include/linux/i3c/master.h           |  5 +++++
 6 files changed, 90 insertions(+), 73 deletions(-)

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
