Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFF0E77188
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Dec 2024 11:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1B5LUYo/M1knU5O6qJNVMhmDc2T5QWMIBZ6WTnaA/kE=; b=BhTdXU/Eauy/I8
	49ujAldc0XxnrQC4rrH0cukY+g47WxU7/kpRmosWF0G0ZLnlvLhNAPhrSO1A3JO85VTXsD9kWvRcw
	HYWSAyYJyXggdWC1U5PT6N/HnrtgFUQYlKf/nhWSzS4OilyS1aOw5sz9xkbq/lIWlwYWJLX4e4wQB
	vJSn/nXQyVLUPuPDYwDOFocBBmmULJlb+arKJyMjv/4FJKDMCwe1On3CFAb/z5Ak288FT0p+nzN73
	+SuBUIqyy4l+GxqIgvjmhl9lLsIxohFyXZRJfqwsYXBbNs1XqZCkYtLMTXG++kij3wNoOImCKbGLd
	Cu2BRuq6O54XTkT6EBTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObGF-00000004mvl-2zW2;
	Fri, 20 Dec 2024 11:33:39 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tObGD-00000004muZ-23jX
	for linux-i3c@lists.infradead.org;
	Fri, 20 Dec 2024 11:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=iDrd0KAldwsOGF
	ZG14RvkZSAD3d9IP9pPolACARu4Z8=; b=I2vJXMSNopplmpeP5gNHe6J63hrXKl
	23aq7PLtGJymsHcrWeqxtlHgyTN2YDHz6PD+KyuAqscstZC42lsaW82Ej2hVL4Sk
	tKzNbxSKAYdh0+I7dybJFcRD/peS0Wn64S998AXwSLpClNiLAp3Pdpl3EflP+3kT
	iclejiGi4NVgDUYqHSj1jKTTJt3H9/xP+j1dwgL3D27K7vl5AfzWIus/B6J0JlzL
	9EslcYOL07WKFlk+mMq643HAlqt2H6D7sw80Zyujvs2di54EAKWnAPAJwSSoalbn
	sHf4+0MYC/GQGjPykTWbMUn4njJwKcg7LK31hR42sCQZJENodi6PmFQw==
Received: (qmail 990839 invoked from network); 20 Dec 2024 12:33:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 12:33:35 +0100
X-UD-Smtp-Session: l3s3148p1@sClvBLIpquIujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	linux-i3c@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>
Subject: [PATCH RFT RESEND 0/5] i3c: introduce and use generic parity helper
Date: Fri, 20 Dec 2024 12:33:28 +0100
Message-Id: <20241220113335.17937-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_033337_804636_0D4680CD 
X-CRM114-Status: UNSURE (   9.81  )
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

[Resending because I3C list was not added on all patches. Sorry!]

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

Is this acceptable? The non-I3C patches have all the tags they need,
only the I3C patches would need testing on hardware.

A locally build-tested branch is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i3c/get_parity

Looking forward to comments...

[1] https://lore.kernel.org/all/20241214085833.8695-1-wsa+renesas@sang-engineering.com/


Wolfram Sang (5):
  bitops: add generic parity calculation for u8
  hwmon: (spd5118) Use generic parity calculation
  i3c: dw: use get_parity8 helper instead of open coding it
  i3c: mipi-i3c-hci: use get_parity8 helper instead of open coding it
  i3c: cdns: use get_parity8 helper instead of open coding it

 drivers/hwmon/spd5118.c                  |  8 +-----
 drivers/i3c/master/dw-i3c-master.c       | 14 +++--------
 drivers/i3c/master/i3c-master-cdns.c     |  3 +--
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 11 +--------
 include/linux/bitops.h                   | 31 ++++++++++++++++++++++++
 5 files changed, 37 insertions(+), 30 deletions(-)

-- 
2.39.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
