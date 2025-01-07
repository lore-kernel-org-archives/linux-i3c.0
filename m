Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C21E7719C
	for <linux-i3c@archiver.kernel.org>; Tue,  7 Jan 2025 09:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2vuS+jcgcukkjO2Cf9bXyVqn5ppidpZ4JZOTOmWzA2g=; b=d29OWpZ5I5flsH
	wlPyL9vdWq1muhTpshWttNSUmSLzeL2FSgRXyUw0/XOKQNWGqDTy39skKE2j3YhhjBQQXN4hbo08Q
	mtfQmExf7NprkHcjVppTidP5LQzFKGsW5DBLClcH/Zkrs5F5rXO7PIhscpEpM1XkdmPNQYIi8apoE
	WPFb9XUnQg4yfu3qg4xg2ENJ99/f6NM8P3LpsF8/RUtU54Jpwu77dN1Fhzpwjc5LPOroK6JLEhRRc
	a2Tic7TUgjn2Dx34+qLkWWDr6VItVyzstQZrDxa62GoRdszIY1FhAwQzq12+9bPL19EHRc7m8Mp1y
	Ra+8yMMe6edOZogr/OUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5Vx-000000042AN-24VY;
	Tue, 07 Jan 2025 09:04:41 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5Tg-000000041K2-3TxU
	for linux-i3c@lists.infradead.org;
	Tue, 07 Jan 2025 09:02:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=VK7WWM9T+jjQMMEJxB7ZW7cFigQlqgODHUPmKzMbE/g=; b=RbIUaH
	0XwejCD8WqjEc6SDRvifpswXcjkZYtVds+fIXmMydw3hvyYgbeGNykY8yZbiogZd
	UQQs6CgUu6V979w5obR/HoZG4SoxUUMv5VvoWenv4pKj6Rdob/BLaIuO8gr3wvNI
	p8wS0aGQYm9m5cnXu+miiGtGCSR4KyciFx7dpyUhqKwcewneUdsEqhAz9Nmo3Msw
	QDCJ+319Ab3b+1O7PhvjE01N9LWLJyudwjdaMZItIhrGzca5H5BzwAl7p+Xc/Aj6
	B8xIRXhzmtS0DDGYbNH4gVJGME9lZIucOYkNbjRob1HTTziYTZDB/dGOVHwOpK3x
	XB7YiretpcoD2m+Q==
Received: (qmail 2125365 invoked from network); 7 Jan 2025 10:02:10 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jan 2025 10:02:10 +0100
X-UD-Smtp-Session: l3s3148p1@z1AGABorapMgAwDPXw20AOMQ2KO98fSH
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v4 4/5] i3c: mipi-i3c-hci: use parity8 helper instead of open coding it
Date: Tue,  7 Jan 2025 10:02:02 +0100
Message-ID: <20250107090204.6593-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>
References: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_010221_156284_0A8F0835 
X-CRM114-Status: GOOD (  10.03  )
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

The kernel has now a generic helper for getting parity with easier to
understand semantics. Make use of it. Here, it also fixes a bug because
the correct algorithm is using XOR ('^=') instead of ADD ('+=').

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---

Change since v3:

* updated commit message to mention the bugfix

I intentionally did not add a Fixes tag because this fix depends on
patch 1. The proper fix for backporting would change this to XOR, I'd
think.

 drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
index 47b9b4d4ed3f..85c4916972e4 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
@@ -40,15 +40,6 @@
 #define dat_w0_write(i, v)	writel(v, hci->DAT_regs + (i) * 8)
 #define dat_w1_write(i, v)	writel(v, hci->DAT_regs + (i) * 8 + 4)
 
-static inline bool dynaddr_parity(unsigned int addr)
-{
-	addr |= 1 << 7;
-	addr += addr >> 4;
-	addr += addr >> 2;
-	addr += addr >> 1;
-	return (addr & 1);
-}
-
 static int hci_dat_v1_init(struct i3c_hci *hci)
 {
 	unsigned int dat_idx;
@@ -123,7 +114,7 @@ static void hci_dat_v1_set_dynamic_addr(struct i3c_hci *hci,
 	dat_w0 = dat_w0_read(dat_idx);
 	dat_w0 &= ~(DAT_0_DYNAMIC_ADDRESS | DAT_0_DYNADDR_PARITY);
 	dat_w0 |= FIELD_PREP(DAT_0_DYNAMIC_ADDRESS, address) |
-		  (dynaddr_parity(address) ? DAT_0_DYNADDR_PARITY : 0);
+		  (parity8(address) ? 0 : DAT_0_DYNADDR_PARITY);
 	dat_w0_write(dat_idx, dat_w0);
 }
 
-- 
2.45.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
