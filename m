Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3620FE77188
	for <linux-i3c@archiver.kernel.org>; Mon,  6 Jan 2025 09:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CJG2hTmiJ+2Pgfm6lvsd3IsGJR/Hoi865Ev/nMDa6Gw=; b=FFlgSrUL/ejuit
	J3dHTbKPZPSAs7iu95A8/QLMCWMyNEveM/J69VBCo+QdbSbgjCNylZefDXKZ6st5kvMlt9tTT31MO
	MCfSYrJOP1AiPRD68nW2AZ2VJIMOOW7ElR/tA7ZcZNaBq6MvmtKkKBEz+JhNUP2LQKUsTnNBNBBR+
	fQXeW9A8WI9I4JrshBWuJIfpksEjkNWW3+tM0JfN+AK2PEqfyRLVdl/mHxBxm3LdXpPxCElMKaSI0
	LwXwtFnJu1Gu/5QvpSntCsC7p++Z2HhRAnO/TnfezDQ/VFdlPu8jKuDEfZLOsABo5Ivhr7RiBlvfP
	FxHN9bd8QJswLs3YaubA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjOf-00000000gMK-41a1;
	Mon, 06 Jan 2025 09:27:41 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjOZ-00000000gIk-0JL5
	for linux-i3c@lists.infradead.org;
	Mon, 06 Jan 2025 09:27:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=4Ve5hf8pI9HFM2zjnWzNNrBkEoJuyyCP7A1G3jT4K4o=; b=RNPmz+
	s1OJyMvaf2h72opfmkKaB+XXlnlb0Cj8eqFQOXvJKA+nDFa4XlMUNHUziAmhuZJ2
	adB9bZOOBaxcNwXRNYPMdgOfMdFPcvRRv4tHjdxH2ThdeUXtkosq5Ttz6WWOK4RB
	rtFCCfPICOdxKJDPdMJfEm5+Yyds3UcHnq+wF3L4hZfQMc8G5fFeMOARvFJthgvX
	QM+V6BrfEmBzZ6iBcR3DnscecEV5X8MmIPx0iAC8RjIxuoHEthQW5SVPZeDdKsK7
	1wV9zAMPjYt9UV82van6NqoDDe/p7azNjlV2Es1B7A9kaTlf9fakZSbTXAJdw+MW
	kMDM2it+fZoy13Qg==
Received: (qmail 1727987 invoked from network); 6 Jan 2025 10:27:30 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jan 2025 10:27:30 +0100
X-UD-Smtp-Session: l3s3148p1@1QbHPAYrCJwgAwDPXw20AOMQ2KO98fSH
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v3 5/5] i3c: cdns: use parity8 helper instead of open coding it
Date: Mon,  6 Jan 2025 10:27:23 +0100
Message-ID: <20250106092725.22869-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250106092725.22869-1-wsa+renesas@sang-engineering.com>
References: <20250106092725.22869-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_012735_404442_FB642453 
X-CRM114-Status: UNSURE (   9.60  )
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
 drivers/i3c/master/i3c-master-cdns.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 06c0592487d3..fedbe6624a1c 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -889,8 +889,7 @@ static u32 prepare_rr0_dev_address(u32 addr)
 	ret |= (addr & GENMASK(9, 7)) << 6;
 
 	/* RR0[0] = ~XOR(addr[6:0]) */
-	if (!(hweight8(addr & 0x7f) & 1))
-		ret |= 1;
+	ret |= parity8(addr & 0x7f) ? 0 : BIT(0);
 
 	return ret;
 }
-- 
2.45.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
