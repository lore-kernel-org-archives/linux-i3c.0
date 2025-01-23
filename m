Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D75C02182
	for <linux-i3c@archiver.kernel.org>; Thu, 23 Jan 2025 22:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=husE3wpyq6deGK7F9UPZ8+yfE/AnD5sL6X0DKo+WkRI=; b=yKCnK2LdLMshtS
	NHOMD86mvwd7WJn05IEXeR3tTgs7oGA+/ukeuZudwnvglpwvc7YaYCpvpE1f28ijKNEe50UT+bE/f
	BOPcpWfmRKTDWP63euKJowilAjkZuawp4Uhs/m1y7ZKcRsM17AEQySuEQLFhMLxpxfdc4DALKqkEy
	m+cXS4VBheDUjGr6w961SoXXNWpOhfQLVdXTy63uQDn3iQ+i3ZWMLegUX4veTum/XZdBN+j8nuQq3
	sAAq7Vc++dlk4EZ+q299memFVDCt5fQJd83OYrGBSOKEWUpNiBE1BP+ZY/qeK/jZc726Dxc/xq74W
	82ID/lWLh4Hwq79wZ6nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb5qt-0000000DQd3-255U;
	Thu, 23 Jan 2025 22:39:07 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb5qq-0000000DQbu-21Bz
	for linux-i3c@lists.infradead.org;
	Thu, 23 Jan 2025 22:39:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32A95240002;
	Thu, 23 Jan 2025 22:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737671939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=Wh1jiBwECv+j4B30ZYSsoGYcPV4LHDR6Z0f1Eq6qFFI=;
	b=Jh6TGe7liZooCenWO1grOBMvYzxQP9l8QdNPiNQbyl3mngQ75E/lBVirukE/OT97ELzDgb
	Og5vgzNSmvUe0olfWqTuwq6bTiXB1r0H0EcBHC37mmHwwbcLvDd+aGF8uwz7HzDx7SWIER
	HBXkl/Hm8KhwANp5j5WYg6JoQAjEQSsUUIu8rYY8awZ4em4L3Tpyf9/aLFQ1hox7iyl/YW
	9mS6LxNnFf3ujnwRGSYryCajbaaLzT9efIQCOeDde7pu5LSljPB4EOhNvN1vt0ViBDyhXC
	NhVWQpnM5ey73Snnn6/NL7aQXcAK0BSVVZ+hda23s7gbvLTk/rlZwoZPSVAKWg==
Date: Thu, 23 Jan 2025 23:38:56 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 6.14
Message-ID: <2025012322385618081415@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_143904_671303_11A32F98 
X-CRM114-Status: GOOD (  12.39  )
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

Here is the i3c subsystem pull request for 6.14. The main change is the
addition of PCI bus support for mipi-i3c-hci. I'm also carrying an hwmon
patch as it makes use of the bitops addition that is then mainly used by
i3c drivers.

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.14

for you to fetch changes up to 5eb6d3561f6cb6d59887be6da764417e437f6afa:

  i3c: master: Improve initialization of numbered I2C adapters (2025-01-13 00:01:42 +0100)

----------------------------------------------------------------
I3C for 6.14

Core:
 - Improve initialization of numbered I2C adapters

Drivers:
 - use parity8 helper
 - dw: fix possible use-after-free
 - mipi-i3c-hci: add support for PCI bus host
 - svc: many fixes for IBI and hotjoin

----------------------------------------------------------------
Defa Li (1):
      i3c: master: Improve initialization of numbered I2C adapters

Frank Li (1):
      i3c: master: Fix missing 'ret' assignment in set_speed()

Jarkko Nikula (2):
      i3c: mipi-i3c-hci: Add Intel specific quirk to ring resuming
      i3c: mipi-i3c-hci: Add support for MIPI I3C HCI on PCI bus

Pei Xiao (1):
      i3c: dw: Fix use-after-free in dw_i3c_master driver due to race condition

Wolfram Sang (6):
      i3c: fix kdoc parameter description for module_i3c_i2c_driver()
      bitops: add generic parity calculation for u8
      hwmon: (spd5118) Use generic parity calculation
      i3c: dw: use parity8 helper instead of open coding it
      i3c: mipi-i3c-hci: use parity8 helper instead of open coding it
      i3c: cdns: use parity8 helper instead of open coding it

 drivers/hwmon/spd5118.c                            |   8 +-
 drivers/i3c/master.c                               |  14 +-
 drivers/i3c/master/Kconfig                         |  11 ++
 drivers/i3c/master/dw-i3c-master.c                 |  15 +--
 drivers/i3c/master/i3c-master-cdns.c               |   3 +-
 drivers/i3c/master/mipi-i3c-hci/Makefile           |   1 +
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c           |  11 +-
 drivers/i3c/master/mipi-i3c-hci/dma.c              |  17 +++
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 148 +++++++++++++++++++++
 include/linux/bitops.h                             |  31 +++++
 include/linux/i3c/device.h                         |   2 +-
 11 files changed, 227 insertions(+), 34 deletions(-)
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
