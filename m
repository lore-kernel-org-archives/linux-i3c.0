Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E103E7718B
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Dec 2024 11:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SxHpAPYyjQ8REbmK/2q3P9P/xwgyj+S5H+HAq9cvRco=; b=mvdoV+aYpPT3ta
	iQuYLkTBJyCld493/SjVzdJ0R7ejPZ3BXF3DFxFOg3HHq7LkNLkg4KgK+/FCcoJL6FUBIZIDZjSRx
	+ipNLDLT1Zjk0b7BI44N5W3TRARSshVhN6cvQN0QOE0Dhd5+OSlXankij3PX28xVSGsoo6fOq3ZNJ
	rwlRaAaKvMBDU10wWWICz5dlRhyMreeEcZW7lvgPb8MTfAcum7cuml4XhDlLI69U67joZzXYCy57p
	DJ+G+SjeCzo6FiPAB3rVXqEoW+V0iq8I8xRrKymmrpHqJ2j4krFQIjnsq7uHQXpraDhCbbZU/1drg
	IXVHNhHhAZ++dLxJBgNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObFg-00000004mm2-04cm;
	Fri, 20 Dec 2024 11:33:04 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tObD5-00000004mBV-0PhV
	for linux-i3c@lists.infradead.org;
	Fri, 20 Dec 2024 11:30:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Xle8vB4tioG0noyMlph488LEaOgkNcMUcx711tLKtDQ=; b=JOr2yz
	Bexm47v5wzeQCPJkhwFqqlSDLpwbGjsiluD1HliWQfq2s3ASnD3OrtYNFs9TYOfK
	1AbIdgV7i7LYE1beaRVYp01FMENsAoub5s3Ra5NY5uvqSt1cGKxAougsbP3imU4W
	7SIvCceCuOixvH/Iq8i3rnzoe3gMdHdQI6ScogMnh29/7pQ4aPvtOab/LtnrT7eN
	6i1p5ZoZGgbNoGNSg3xEOy2OXsfr1V+/jHjgcc7QVXOvDO6RREIphnOaljWOA+SI
	eheErQwvQ2M853ESFoJcU72+OuJnMsTJw0tz1IIpS4RXoPiAt2nkIyfxUl9SXeC+
	FxtEtIqFhfIwUNLA==
Received: (qmail 989787 invoked from network); 20 Dec 2024 12:30:21 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 12:30:21 +0100
X-UD-Smtp-Session: l3s3148p1@cA/Z+LEpEJ8ujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH RFT 4/5] i3c: mipi-i3c-hci: use get_parity8 helper instead of open coding it
Date: Fri, 20 Dec 2024 12:29:58 +0100
Message-Id: <20241220113000.17537-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241220113000.17537-1-wsa+renesas@sang-engineering.com>
References: <20241220113000.17537-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_033023_522834_16BF2531 
X-CRM114-Status: UNSURE (   7.25  )
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

The kernel has now a generic helper for getting parity with easier to
understand semantics. Make use of it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
index 47b9b4d4ed3f..ac67016932b0 100644
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
+		  (get_parity8(address) ? 0 : DAT_0_DYNADDR_PARITY);
 	dat_w0_write(dat_idx, dat_w0);
 }
 
-- 
2.39.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
