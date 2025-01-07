Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A23E77198
	for <linux-i3c@archiver.kernel.org>; Tue,  7 Jan 2025 09:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DELD9DmR4dY/brqPzh2tZnJZ/Fo8BssLFIOkpaEf1Pk=; b=RiR9vIJlRw1l5S
	mj0eAymkMkM0jkON+dPkafMjn4JLAgB19H4cb7xllwBGGSpBDSVi1GtE6qTBLVVLZQn/SgUnmCS/V
	EqQkb38IBIAbTioOLU1DvgIEetvrv0kaebVzS0eIdvfU7jjs3rOLIuQi3uuWnuz6S8bwCOg7rgtSY
	Zjez6+3e+DWZAgCAJ/7oehszuQ66HxfDukBLj0KrXqyFaWfRjRWPe1am17AxyNDYZCnhnQwpUmnoM
	Py7S59jXBNJBOncoapokRmXZMxCXt5RSc/nvVTlJum0aSQoXAgxFblBpyqliKAy6hSG/dgX6DL6/d
	JK6fNcRuwta1ubqXtk7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5Vw-0000000428w-2Stn;
	Tue, 07 Jan 2025 09:04:40 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5Tb-000000041Jb-1c52
	for linux-i3c@lists.infradead.org;
	Tue, 07 Jan 2025 09:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=ECaGPyPMzolXgm
	I8MfZTH06/mWak6x2fO5JL7V8cO5E=; b=RXulI486ZbrXu++bLN/AHyaIVY3fBU
	yV8I3974o+dsyRsLS89j5uSAP7Ey9xmxeoPnuqpD4Wv+r/JhjS/o/eK1ipsyrOGM
	YafK3TblyN8h039pYTiimxardNhG2cfmaNG2+6PUgzSCCQRAxN6zPpm4gFFKvVRS
	nACTMep8Tmt/DpejrMN2XLwEzmO4HMCXNCUuUxuuJUDzTWt37xs1Z2/guBEMqRll
	sp7SpRbXPALrLT0DM9ZXdZ1L6dVU25wR6rgmu1ThNJ8MxMVlT+d5ZHNvnz9w7UlJ
	RZ26Noh9RR+7BChq0xbaVAp5QeDGt8csAr8U/Hd1C6Zh48Ulp+pJYKFg==
Received: (qmail 2125166 invoked from network); 7 Jan 2025 10:02:06 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jan 2025 10:02:06 +0100
X-UD-Smtp-Session: l3s3148p1@fFDW/xkrRJMgAwDPXw20AOMQ2KO98fSH
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Yury Norov <yury.norov@gmail.com>
Subject: [PATCH v4 0/5] i3c: introduce and use generic parity helper
Date: Tue,  7 Jan 2025 10:01:58 +0100
Message-ID: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_010216_287081_C818F49F 
X-CRM114-Status: GOOD (  10.23  )
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

Changes since v3:

* updated commit message of patch 4 to state that a bug gets fixed.

All acks from bitmap.h and HWMON maintainers are already included.

Old coverletter follows:

I am currently working on upstreaming another I3C controller driver. As
many others, it needs to ensure odd parity for a dynamically assigned
address. The BSP version of the driver implemented a custom parity
algorithm. Wondering why we don't have a generic helper for this in the
kernel, I found that many I3C controller drivers all implement their
version of handling parity.

So, I sent out an RFC[1] moving the efficient implementation of the
SPD5118 driver to a generic location. The series was well received, but
the path for upstream was not clear. Because I need the implementation
for my I3C controller driver and I3C is a prominent user of this new
function, I got the idea of converting the existing I3C drivers and
resend the series, suggesting this all goes upstream via I3C.

A build-tested branch is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i3c/get_parity

Looking forward to comments...

[1] https://lore.kernel.org/all/20241214085833.8695-1-wsa+renesas@sang-engineering.com/



Wolfram Sang (5):
  bitops: add generic parity calculation for u8
  hwmon: (spd5118) Use generic parity calculation
  i3c: dw: use parity8 helper instead of open coding it
  i3c: mipi-i3c-hci: use parity8 helper instead of open coding it
  i3c: cdns: use parity8 helper instead of open coding it

 drivers/hwmon/spd5118.c                  |  8 +-----
 drivers/i3c/master/dw-i3c-master.c       | 14 +++--------
 drivers/i3c/master/i3c-master-cdns.c     |  3 +--
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 11 +--------
 include/linux/bitops.h                   | 31 ++++++++++++++++++++++++
 5 files changed, 37 insertions(+), 30 deletions(-)

-- 
2.45.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
