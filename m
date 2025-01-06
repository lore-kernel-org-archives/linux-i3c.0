Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32945E7719A
	for <linux-i3c@archiver.kernel.org>; Mon,  6 Jan 2025 09:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lle5IC6vl9DEsP60jVOc7GBKKckn+fcXAEXJxEw2yGU=; b=P/ttZtg396f54D
	Cq46778Ykca3S3A4gyLY5/i3T3PDzQiFlDSQErAV3V0LWq5YUe1NtAwcAJ/OTxHKhvV4j27rfEXVv
	sAuirtTzNrv5F6XsTo1UXZFneuFK50FZSkLmawxA1EhcoEXPmmjq1bKgf8lvKMkWZ2pSU2cenoyD+
	LnykJRAMKvJM1iWO42/oCPM2ZRVWALelvxUDxErnH2ty++BvVHll+e2wVgPw8BzYkqM8RkIvBYKlG
	Shyp5eiZDIUpLvi3zYZ+cDX09qLvsFCzyIpbAZocXfiBArNqIMIJT4dRT9PVgO1DvGIwllP0N3nKa
	bxfovxg6AUHB0vo+C8Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjOd-00000000gKC-3Nkc;
	Mon, 06 Jan 2025 09:27:39 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjOT-00000000gGl-3h5G
	for linux-i3c@lists.infradead.org;
	Mon, 06 Jan 2025 09:27:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=aGWd2BQY7AIqRD
	QgZzEn8Ps7vMIe6tCz1E86UjvA7+Y=; b=NPKmm3zpgiWmosqxEwjyz6ZjhJLOCy
	Yc2ZZeW8CcITXry4Jf0vs0kPDgBRNX4Eyt4QWruJt6TPMoaMLP0i12R1AOs7BxIJ
	n6YgxbZda3xnN1bo+5kp9CUOMmxdCPA2bb4oH+APlF4kSTzUInfubk8lNpz+7CH+
	KOvXu4YFlx3wbHcjgatRexGESVqTmLoeo3L9tJsWfdIP+IHXnehlVJ6JNMxW0Xc+
	rZTDjXtvEHUnXc/Ygml3nW/0+Y9tOTagfjtEROkdBmKi6x6de27txJMZtJca5+oR
	fWdqhUpkieLMwVwspdzhPBEPOvuRwdsWORh+mR7nOTlMblzSvsffu2Iw==
Received: (qmail 1727747 invoked from network); 6 Jan 2025 10:27:26 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jan 2025 10:27:26 +0100
X-UD-Smtp-Session: l3s3148p1@Tn2LPAYr1psgAwDPXw20AOMQ2KO98fSH
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
Subject: [PATCH v3 0/5] i3c: introduce and use generic parity helper
Date: Mon,  6 Jan 2025 10:27:18 +0100
Message-ID: <20250106092725.22869-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_012730_793764_5DC396B2 
X-CRM114-Status: GOOD (  10.75  )
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

Changes since v2:

* fixed commit messages from 'get_parity8' to 'parity8'
* added tag from Jarkko (thanks!)
* rebased to 6.13-rc6

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
