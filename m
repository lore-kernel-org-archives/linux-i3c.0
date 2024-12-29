Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A6FE77192
	for <linux-i3c@archiver.kernel.org>; Sun, 29 Dec 2024 10:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uC2EDTrhcHxMftsqum+ck6g0+xHv3C/Vlgh9HzNMlng=; b=JjVML/SOdoWyJj
	Jl64LYoX1kCC1HxpTJ8Tl76CVjbhPY03htZT7vfye/L1KzvuZmUc4yQbVHM5sr4y80q/5BNLjtIRu
	Zh/dB76dgGHx/nu8DFpJbxHf2d7x6EKVHlpwKWPfwEW6Tnnx0zW4ZKvXDaYdtPplLJWZOUDavQXNw
	QRo6oSEYr0YgMQNTd0k5Ct+uhHBeH57YL9Ke9J4BrZF3yqCS00D7nYYmce1V6/08d6nkRVNeNHl4P
	1H41YMzWP8BnaYlJ8olNq0y/QgNp0DcAw6GExNNKngUT2AqpKF3FRLwF0Gwxw/Qlr6h6id/NEKzVI
	LbrfoVFtB45jrQ6vt+mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRqKv-00000003FQb-1D7K;
	Sun, 29 Dec 2024 10:15:53 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRqHq-00000003EoC-31us
	for linux-i3c@lists.infradead.org;
	Sun, 29 Dec 2024 10:12:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=gy3C2fetuKlo5H
	/lwbCNlSgRf4N0PX6S0u3SIFUvYm8=; b=AGqF9IxkYUIa3U7khz7CK/1BrDnd16
	zy5R5QXhSw2Njw8lf59KUB6rlyl9mQE83CWKoG1BhVuJE0et8ydZVxiJnWXDZfVq
	63cgjMCaERYlb3xbHQU2EWa2tF7/c6Z8SVoEpB5puHH4fvcEx71taCDHRVRvuhE8
	LM82bI3mK7HieImzZu1TcxsURBi8sE3Nflz8EP7h7y5V9fS90Gx+ZH7H+YWrChxD
	3lsUeM3SVtrCrRh6bqBsewRkLhq6+3doMbTii33vam4nUZVc6UUMZwbZ3MEX7ggh
	x1vjvq2uci2ragT/NkkzuMcq80e9X7pay3OKyhSbV7QARGK4VfWdAlBw==
Received: (qmail 3656572 invoked from network); 29 Dec 2024 11:12:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Dec 2024 11:12:35 +0100
X-UD-Smtp-Session: l3s3148p1@woFT72UqgLEujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Yury Norov <yury.norov@gmail.com>
Subject: [PATCH RFT v2 0/5] i3c: introduce and use generic parity helper
Date: Sun, 29 Dec 2024 11:12:28 +0100
Message-Id: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_021243_713256_9B2BC6AC 
X-CRM114-Status: GOOD (  11.05  )
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

Changes since v1:

* renamed from 'get_parity8' to 'parity8'
* use XOR instead of OR in the kdoc example (Thanks, Rasmus, for both)
* added tag from Guenter (thanks!)
* rebased to 6.13-rc4

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

Is this acceptable? The non-I3C patches have all the tags they need,
only the I3C patches would need testing on hardware.

A build-tested (incl. build-bots) branch is here:

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
